DROP TABLE IF EXISTS public.event RESTRICT;

CREATE TABLE public.event (
  -- The event's sequential identifier.
  id        bigserial NOT NULL PRIMARY KEY,
  -- The event's timestamp (in Zulu time).
  timestamp timestamp WITHOUT TIME ZONE NOT NULL DEFAULT (now() AT TIME ZONE 'UTC'),
  -- The subject of the predicate.
  subject   uuid NOT NULL,
  -- The event's predicate (an action or verb).
  predicate varchar(63) NOT NULL CHECK (predicate <> ''),
  -- The object of the predicate.
  object    uuid NULL
);
