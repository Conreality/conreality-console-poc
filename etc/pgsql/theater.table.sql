DROP TABLE IF EXISTS public.theater CASCADE;

CREATE TABLE public.theater (
  -- The theater's unique identifier.
  uuid     uuid NOT NULL PRIMARY KEY,
  -- The theater's designated label.
  label    varchar(31) NULL CHECK (label <> ''),
  -- The theater's origin location (as GPS coordinates).
  location geography(POINT,4326) NULL
);
