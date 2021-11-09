ALTER TABLE bus_intersection
add category text;

ALTER TABLE bus_neighborhood
add category text; 

UPDATE bus_intersection
set category = 'intersection';

UPDATE bus_neighborhood
set category = 'neighborhood';


with alltab as (
SELECT * FROM bus_intersection
UNION ALL
SELECT * FROM bus_neighborhood
ORDER BY dist
	)
SELECT *
INTO BGE_BUS_STOPS
FROM alltab