DROP TABLE IF EXISTS public.camera CASCADE;

CREATE TABLE public.camera (
  -- The camera's unique identifier.
  uuid       uuid NOT NULL PRIMARY KEY REFERENCES public.object ON DELETE CASCADE,
  -- The camera's resolution (in 2D pixels).
  resolution point NULL,
  -- The camera's image format.
  format     varchar(15) NULL,
  -- The camera's frame rate (per second).
  fps        int2 NULL,
  -- The camera's f-number (the f/N focal ratio).
  fnumber    int2 NULL
);
