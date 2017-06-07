-- Enable UUID generation
-- See: https://www.postgresql.org/docs/current/static/uuid-ossp.html
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- Enable PL/Lua
-- See: http://pllua.projects.pgfoundry.org/
CREATE EXTENSION IF NOT EXISTS pllua;

-- Enable PostGIS (includes raster)
-- See: http://postgis.net/
CREATE EXTENSION IF NOT EXISTS postgis;
CREATE EXTENSION IF NOT EXISTS postgis_topology;
-- CREATE EXTENSION IF NOT EXISTS postgis_sfcgal;
