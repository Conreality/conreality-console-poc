DROP TABLE IF EXISTS public.asset RESTRICT;

CREATE TABLE public.asset (
  -- The asset's unique identifier.
  uuid     uuid NOT NULL PRIMARY KEY REFERENCES public.object ON DELETE CASCADE,
  -- The asset's nickname.
  nick     varchar(31) NOT NULL CHECK (nick <> '') UNIQUE,
  -- The asset's full name.
  name     varchar(63) NULL,
  -- The asset's IPv4/IPv6 address.
  ip_addr  inet NULL CHECK (masklen(ip_addr) = 32),
  -- The asset's avatar image.
  avatar   bytea NULL,
  -- The asset's deployed software version.
  version  varchar(5) NULL
);
