-- This query extracts dose+durations of epinephrine administration
DROP MATERIALIZED VIEW IF EXISTS epinephrine; 
CREATE MATERIALIZED VIEW epinephrine AS
select
stay_id, linkorderid
, rate as vaso_rate
, amount as vaso_amount
, starttime
, endtime
,date_part('epoch'::text, endtime - starttime) / 60::double precision / 60::double precision AS duration_hours
from inputevents
where itemid = 221289 -- epinephrine
ORDER BY stay_id,starttime
