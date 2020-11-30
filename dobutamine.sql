-- This query extracts dose+durations of dobutamine administration
DROP MATERIALIZED VIEW IF EXISTS dobutamine; 
CREATE MATERIALIZED VIEW dobutamine AS
select
stay_id, linkorderid
, rate as vaso_rate
, amount as vaso_amount
, starttime
, endtime
,date_part('epoch'::text, endtime - starttime) / 60::double precision / 60::double precision AS duration_hours
from inputevents
where itemid = 221653 -- dobutamine
ORDER BY stay_id,starttime
