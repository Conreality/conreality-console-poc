DROP FUNCTION IF EXISTS public.point_2d(float, float) RESTRICT;
DROP FUNCTION IF EXISTS public.point_3d(float, float, float) RESTRICT;
DROP FUNCTION IF EXISTS public.point_gps(float, float) RESTRICT;

CREATE FUNCTION public.point_2d(x float, y float) RETURNS geometry AS $$
  SELECT ST_MakePoint(x, y);
$$ LANGUAGE sql STABLE PARALLEL SAFE;

CREATE FUNCTION public.point_3d(x float, y float, z float) RETURNS geometry AS $$
  SELECT ST_MakePoint(x, y, z);
$$ LANGUAGE sql STABLE PARALLEL SAFE;

CREATE FUNCTION public.point_gps(lon float, lat float) RETURNS geography AS $$
  SELECT ST_SetSRID(ST_MakePoint(lon, lat), 4326)::geography;
$$ LANGUAGE sql STABLE PARALLEL SAFE;
