DROP FUNCTION IF EXISTS public.send_message(text, text) RESTRICT;

CREATE FUNCTION public.send_message(sender text, text text) RETURNS bigint AS $$
  local query  = "INSERT INTO public.message (sender, text) VALUES ($1::uuid, $2) RETURNING id";
  local insert = server.prepare(query, {"text", "text"});
  local result = insert:execute({sender, text}, false, 1);
  local id = result[1].id -- an int64
  server.execute("NOTIFY message, '" .. tostring(id) .. "'", false);
  return id;
$$ LANGUAGE pllua;
