DROP TABLE IF EXISTS public.object CASCADE;

DROP TYPE IF EXISTS public.object_type RESTRICT;

CREATE TYPE public.object_type AS ENUM (
  'asset',
  'camera',
  'player',
  'target'
);

CREATE TABLE public.object (
  -- The object's unique identifier.
  uuid        uuid NOT NULL PRIMARY KEY,
  -- The object's type.
  type        object_type NULL,
  -- The theater that the object is located in.
  theater     uuid NULL REFERENCES public.theater ON DELETE SET NULL,
  -- The group, if any, that the object belongs to.
  "group"     uuid NULL REFERENCES public.group ON DELETE SET NULL,
  -- The object's designated label.
  label       varchar(31) NULL CHECK (label <> ''),
  -- The object's current position (as 3D coordinates relative to its theater).
  position    geometry(POINTZ,4326) NULL,
  -- The object's current orientation (in radians relative to north).
  orientation real NULL,
  -- The object's estimated mass (in kilograms).
  mass        real NULL,
  -- The object's determined radius (in meters).
  radius      real NULL,
  -- The object's estimated color (as a 24-bit RGB value).
  color       int4 NULL
);
