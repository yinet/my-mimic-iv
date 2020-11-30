-- This query extracts dose+durations of dopamine administration
DROP MATERIALIZED VIEW IF EXISTS dopamine; 
CREATE MATERIALIZED VIEW dopamine AS
select
stay_id, linkorderid
, rate as vaso_rate
, amount as vaso_amount
, starttime
, endtime
,date_part('epoch'::text, endtime - starttime) / 60::double precision / 60::double precision AS duration_hours
from inputevents
where itemid = 221662 -- dopamine
ORDER BY stay_id,starttime
