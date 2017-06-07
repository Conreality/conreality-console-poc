DROP TABLE IF EXISTS public.target RESTRICT;

CREATE TABLE public.target (
  -- The target's unique identifier.
  uuid uuid NOT NULL PRIMARY KEY REFERENCES public.object ON DELETE CASCADE
);
