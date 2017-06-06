DROP VIEW IF EXISTS public.object_asset RESTRICT;

CREATE VIEW public.object_asset AS
  SELECT * FROM public.asset INNER JOIN public.object USING (uuid);

DROP VIEW IF EXISTS public.object_camera RESTRICT;

CREATE VIEW public.object_camera AS
  SELECT * FROM public.camera INNER JOIN public.object USING (uuid);

DROP VIEW IF EXISTS public.object_player RESTRICT;

CREATE VIEW public.object_player AS
  SELECT * FROM public.player INNER JOIN public.object USING (uuid);

DROP VIEW IF EXISTS public.object_target RESTRICT;

CREATE VIEW public.object_target AS
  SELECT * FROM public.target INNER JOIN public.object USING (uuid);
