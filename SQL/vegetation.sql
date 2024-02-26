----------------------------------
----Table for street furniture----
----------------------------------
--Lines
DROP TABLE IF EXISTS augsburg.vegetation_lines;

CREATE TABLE augsburg.vegetation_lines AS
SELECT p.*
FROM augsburg.planet_osm_line p, bbox b
WHERE ST_Intersects(p.geom, b.geom)
AND p.natural IN ('tree_row');

CREATE INDEX ON augsburg.vegetation_lines USING GIST (geom);

insert into augsburg.vegetation_lines
SELECT p.*
FROM augsburg.planet_osm_line p, bbox b
WHERE ST_Intersects(p.geom, b.geom)
AND p.barrier  IN ('hedge');


--Points
DROP TABLE IF EXISTS augsburg.vegetation_points;

CREATE TABLE augsburg.vegetation_points AS
SELECT p.*
FROM planet_osm_point p, bbox b
WHERE st_intersects(p.geom,b.geom) 
AND p.natural IN ('tree');

CREATE INDEX ON augsburg.vegetation_points USING GIST (geom);








