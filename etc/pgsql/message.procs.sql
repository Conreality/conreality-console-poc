DROP FUNCTION IF EXISTS public.message_send(text, text) RESTRICT;

CREATE FUNCTION public.message_send(message_sender text,
                                    message_text text) RETURNS bigint AS $$
  local query  = "INSERT INTO public.message (sender, text) VALUES ($1::uuid, $2) RETURNING id";
  local insert = server.prepare(query, {"text", "text"});
  local result = insert:execute({message_sender, message_text}, false, 1);
  local message_id = result[1].id -- an int64
  server.execute("NOTIFY message, '" .. tostring(message_id) .. "'", false);
  return message_id;
$$ LANGUAGE pllua VOLATILE PARALLEL UNSAFE;
