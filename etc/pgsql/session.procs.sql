DROP FUNCTION IF EXISTS public.session_start() RESTRICT;
DROP FUNCTION IF EXISTS public.session_terminate() RESTRICT;

CREATE FUNCTION public.session_start() RETURNS void AS $$
  UPDATE public.player
    SET ip_addr = inet_client_addr()
    WHERE uuid = session_user::uuid;
  SELECT pg_notify('session.start', session_user);
$$ LANGUAGE sql VOLATILE PARALLEL UNSAFE;

CREATE FUNCTION public.session_terminate() RETURNS void AS $$
  UPDATE public.player
    SET ip_addr = NULL
    WHERE uuid = session_user::uuid;
  SELECT pg_notify('session.terminate', session_user);
$$ LANGUAGE sql VOLATILE PARALLEL UNSAFE;
