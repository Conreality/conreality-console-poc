DROP TABLE IF EXISTS public.message RESTRICT;

CREATE TABLE public.message (
  -- The message's sequential identifier.
  id        bigserial NOT NULL PRIMARY KEY,
  -- The message's timestamp (in Zulu time).
  timestamp timestamp WITHOUT TIME ZONE NOT NULL DEFAULT (now() AT TIME ZONE 'UTC'),
  -- The sender of the message (a player or asset; a zero UUID indicates the system).
  sender    uuid NOT NULL,
  -- The message's contents as text.
  text      text NULL,
  -- The message's contents as audio.
  audio     bytea NULL
);
