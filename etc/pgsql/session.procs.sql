DROP FUNCTION IF EXISTS public.session_start() RESTRICT;
DROP FUNCTION IF EXISTS public.session_terminate() RESTRICT;

CREATE FUNCTION public.session_start() RETURNS bigint AS $$
  -- TODO: session_user
  -- TODO: inet_client_addr()
  return 0
$$ LANGUAGE pllua VOLATILE PARALLEL UNSAFE;

CREATE FUNCTION public.session_terminate() RETURNS void AS $$
  -- TODO
  return nil
$$ LANGUAGE pllua VOLATILE PARALLEL UNSAFE;
