DROP TABLE IF EXISTS public.group CASCADE;

CREATE TABLE public.group (
  -- The group's unique identifier.
  uuid        uuid NOT NULL PRIMARY KEY,
  -- The group's designated label.
  label       varchar(31) NULL CHECK (label <> '')
);
