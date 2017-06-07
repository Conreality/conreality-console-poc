DROP FUNCTION IF EXISTS public.event_send(text, text, text) RESTRICT;

CREATE FUNCTION public.event_send(event_subject text,
                                  event_predicate text,
                                  event_object text) RETURNS bigint AS $$
  local query  = "INSERT INTO public.event (subject, predicate, object) VALUES ($1::uuid, $2, $3::uuid) RETURNING id";
  local insert = server.prepare(query, {"text", "text", "text"});
  local result = insert:execute({event_subject, event_predicate, event_object}, false, 1);
  local event_id = result[1].id -- an int64
  server.execute("NOTIFY event, '" .. tostring(event_id) .. "'", false);
  return event_id;
$$ LANGUAGE pllua;
