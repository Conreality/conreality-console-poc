DROP FUNCTION IF EXISTS public.player_register() RESTRICT;
DROP FUNCTION IF EXISTS public.player_register(uuid, text) RESTRICT;
DROP FUNCTION IF EXISTS public.player_deregister(uuid) RESTRICT;

CREATE FUNCTION public.player_register() RETURNS uuid AS $$
DECLARE
  player_uuid uuid;
  player_nick text;
BEGIN
  SELECT uuid_generate_v4() INTO STRICT player_uuid;
  SELECT 'Player #' || (SELECT COUNT(uuid) + 1 FROM public.player) INTO STRICT player_nick;
  PERFORM public.player_register(player_uuid, player_nick);
  RETURN player_uuid;
END;
$$ LANGUAGE plpgsql VOLATILE PARALLEL UNSAFE;

CREATE FUNCTION public.player_register(player_uuid uuid,
                                       player_nick text) RETURNS void AS $$
BEGIN
  EXECUTE format('CREATE USER %I WITH PASSWORD NULL', player_uuid);
  EXECUTE format('GRANT CONNECT ON DATABASE %I TO %I', current_database(), player_uuid);
  EXECUTE format('GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA %I TO %I', current_schema, player_uuid);
  EXECUTE format('GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA %I TO %I', current_schema, player_uuid);
  EXECUTE format('GRANT EXECUTE ON ALL FUNCTIONS IN SCHEMA %I TO %I', current_schema, player_uuid);
  EXECUTE format('GRANT USAGE ON SCHEMA %I TO %I', 'pllua', player_uuid);
  EXECUTE format('GRANT SELECT ON TABLE %I.%I TO %I', 'pllua', 'init', player_uuid);
  INSERT INTO public.object (uuid, type, label) VALUES (player_uuid, 'player', player_nick);
  INSERT INTO public.player (uuid, nick) VALUES (player_uuid, player_nick);
END;
$$ LANGUAGE plpgsql VOLATILE PARALLEL UNSAFE;

CREATE FUNCTION public.player_deregister(player_uuid uuid) RETURNS void AS $$
BEGIN
  DELETE FROM public.player p WHERE p.uuid = player_uuid;
  DELETE FROM public.object o WHERE o.uuid = player_uuid;
  EXECUTE format('REVOKE SELECT ON TABLE %I.%I FROM %I', 'pllua', 'init', player_uuid);
  EXECUTE format('REVOKE USAGE ON SCHEMA %I FROM %I', 'pllua', player_uuid);
  EXECUTE format('REVOKE EXECUTE ON ALL FUNCTIONS IN SCHEMA %I FROM %I', current_schema, player_uuid);
  EXECUTE format('REVOKE USAGE, SELECT ON ALL SEQUENCES IN SCHEMA %I FROM %I', current_schema, player_uuid);
  EXECUTE format('REVOKE SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA %I FROM %I', current_schema, player_uuid);
  EXECUTE format('REVOKE CONNECT ON DATABASE %I FROM %I', current_database(), player_uuid);
  EXECUTE format('DROP USER %I', player_uuid);
END;
$$ LANGUAGE plpgsql VOLATILE PARALLEL UNSAFE;
