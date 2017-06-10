DROP TABLE IF EXISTS public.player RESTRICT;

CREATE TABLE public.player (
  -- The player's unique identifier.
  uuid     uuid NOT NULL PRIMARY KEY REFERENCES public.object ON DELETE CASCADE,
  -- The player's nickname.
  nick     varchar(31) NOT NULL CHECK (nick <> '') UNIQUE,
  -- The player's full name.
  name     varchar(63) NULL,
  -- The player's IPv4/IPv6 address.
  ip_addr  inet NULL CHECK ((family(ip_addr) = 4 AND masklen(ip_addr) = 32) OR (family(ip_addr) = 6 AND masklen(ip_addr) = 128)),
  -- The player's avatar image.
  avatar   bigint NULL REFERENCES public.binary ON DELETE SET NULL,
  -- The player's primary language.
  language varchar(5) NULL
);
