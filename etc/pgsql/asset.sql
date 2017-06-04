DROP TABLE IF EXISTS public.asset RESTRICT;

CREATE TABLE public.asset (
  uuid   uuid NOT NULL PRIMARY KEY,
  nick   varchar(31) NOT NULL CHECK (nick <> '') UNIQUE,
  name   varchar(63) NULL,
  addr   inet NULL CHECK (masklen(addr) = 32),
  avatar bytea NULL
);
