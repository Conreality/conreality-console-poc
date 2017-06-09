DROP TABLE IF EXISTS public.message RESTRICT;

CREATE TABLE public.message (
  -- The message's sequential identifier.
  id        bigserial NOT NULL PRIMARY KEY,
  -- The message's timestamp (in Zulu time).
  timestamp timestamp WITH TIME ZONE NOT NULL DEFAULT now(),
  -- The sender of the message (a player or asset; a zero UUID indicates the system).
  sender    uuid NOT NULL REFERENCES public.object ON DELETE CASCADE,
  -- The message's contents as text.
  text      text NULL,
  -- The message's contents as audio.
  audio     bytea NULL
);
