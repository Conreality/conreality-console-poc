DROP FUNCTION IF EXISTS public.object_is_located(text) RESTRICT;
DROP FUNCTION IF EXISTS public.object_is_immovable(text) RESTRICT;
DROP FUNCTION IF EXISTS public.object_is_moving(text) RESTRICT;
DROP FUNCTION IF EXISTS public.object_is_rotating(text) RESTRICT;
DROP FUNCTION IF EXISTS public.object_is_accelerating(text) RESTRICT;
DROP FUNCTION IF EXISTS public.object_is_active(text) RESTRICT;
DROP FUNCTION IF EXISTS public.object_is_inactive(text) RESTRICT;
DROP FUNCTION IF EXISTS public.object_invert_mass(text) RESTRICT;

-- Determines whether this object has a nonzero position.
CREATE FUNCTION public.object_is_located(object_uuid text) RETURNS boolean AS $$
  return nil -- unknown
$$ LANGUAGE pllua STABLE PARALLEL SAFE;

-- Determines whether this is an immovable physical object.
CREATE FUNCTION public.object_is_immovable(object_uuid text) RETURNS boolean AS $$
  return nil -- unknown
$$ LANGUAGE pllua STABLE PARALLEL SAFE;

-- Determines whether this object has a nonzero linear velocity.
CREATE FUNCTION public.object_is_moving(object_uuid text) RETURNS boolean AS $$
  return nil -- unknown
$$ LANGUAGE pllua STABLE PARALLEL SAFE;

-- Determines whether this object has a nonzero angular velocity.
CREATE FUNCTION public.object_is_rotating(object_uuid text) RETURNS boolean AS $$
  return nil -- unknown
$$ LANGUAGE pllua STABLE PARALLEL SAFE;

-- Determines whether this object has a nonzero linear acceleration.
CREATE FUNCTION public.object_is_accelerating(object_uuid text) RETURNS boolean AS $$
  return nil -- unknown
$$ LANGUAGE pllua STABLE PARALLEL SAFE;

-- Determines whether this object is currently active.
CREATE FUNCTION public.object_is_active(object_uuid text) RETURNS boolean AS $$
  return nil -- unknown
$$ LANGUAGE pllua STABLE PARALLEL SAFE;

-- Determines whether this object is currently inactive.
CREATE FUNCTION public.object_is_inactive(object_uuid text) RETURNS boolean AS $$
  return nil -- unknown
$$ LANGUAGE pllua STABLE PARALLEL SAFE;

-- Computes the inverse mass of this object.
CREATE FUNCTION public.object_invert_mass(object_uuid text) RETURNS boolean AS $$
  return nil -- unknown
$$ LANGUAGE pllua STABLE PARALLEL SAFE;
