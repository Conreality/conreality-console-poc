DROP TABLE IF EXISTS public.event RESTRICT;

CREATE TABLE public.event (
  id        bigserial NOT NULL PRIMARY KEY,
  timestamp timestamp WITHOUT TIME ZONE NOT NULL DEFAULT (now() AT TIME ZONE 'UTC')
);
