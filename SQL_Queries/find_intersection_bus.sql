
/*
Alter table septa_bus_og
Add the_geom geometry(Point, 4326);

UPDATE septa_bus_og 
SET the_geom = ST_SetSRID(ST_MakePoint(stop_lon, stop_lat), 4326); */

/* option 2 */
with disttable as (
Select *, ST_Distance(st_transform(the_geom,2272), 
									   St_transform(st_setSRID(st_makepoint(-75.1508500656925, 40.00929199477031),4326),2272)) as dist 
from septa_bus_og
)
Select * 
into bus_intersection
from disttable
where dist<500
order by dist DESC

