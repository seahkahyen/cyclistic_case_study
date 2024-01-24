#combining november and december dataset
CREATE TABLE `scenic-patrol-411316.bicycle.novdec_trips` AS
SELECT *


FROM (
SELECT * FROM `scenic-patrol-411316.bicycle.datanov`
UNION ALL
SELECT * FROM `scenic-patrol-411316.bicycle.datadec`
)


WHERE
start_station_name IS NOT NULL AND
end_station_name IS NOT NULL AND
end_station_id IS NOT NULL AND
end_lng IS NOT NULL AND
start_station_id IS NOT NULL;

#creating a new cleaned dataset for analysis
CREATE TABLE `scenic-patrol-411316.bicycle.data` AS
SELECT
  ride_id,rideable_type,started_at, ended_at, start_station_name, end_station_name, start_lat, start_lng,end_lat, end_lng, member_casual,


  EXTRACT (DAY FROM started_at) AS day,
  EXTRACT (YEAR FROM started_at) AS year,  
  CASE
    WHEN EXTRACT (DAYOFWEEK FROM started_at) = 2 THEN 'MON'
    WHEN EXTRACT (DAYOFWEEK FROM started_at) = 3 THEN 'TUE'
    WHEN EXTRACT (DAYOFWEEK FROM started_at) = 4 THEN 'WED'
    WHEN EXTRACT (DAYOFWEEK FROM started_at) = 5 THEN 'THU'
    WHEN EXTRACT (DAYOFWEEK FROM started_at) = 6 THEN 'FRI'
    WHEN EXTRACT (DAYOFWEEK FROM started_at) = 7 THEN 'SAT'
    WHEN EXTRACT (DAYOFWEEK FROM started_at) = 1 THEN 'SUN'
  END AS day_of_week,


  CASE
    WHEN EXTRACT (MONTH FROM started_at) = 11 THEN 'NOV'
    WHEN EXTRACT (MONTH FROM started_at) = 12 THEN 'DEC'
  END AS month,
 


  TIMESTAMP_DIFF (ended_at, started_at, second) AS ride_length,
  FORMAT_TIMESTAMP("%I:%M%p", started_at) AS starttime




FROM `scenic-patrol-411316.bicycle.novdec_trips`


WHERE TIMESTAMP_DIFF (ended_at, started_at, minute) > 0 AND TIMESTAMP_DIFF (ended_at, started_at, hour) < 24


#analyzing the datasets


#average, minimum and maximum of length of ride 
#average
SELECT  ROUND(AVG(ride_length)/60, 3) AS average, member_casual
FROM `scenic-patrol-411316.bicycle.data`
group by member_casual


#minumum
SELECT  ROUND(min(ride_length)/60, 3) AS min, member_casual
FROM `scenic-patrol-411316.bicycle.data`
group by member_casual


#maximum
SELECT  ROUND(max(ride_length)/60, 3) AS min, member_casual
FROM `scenic-patrol-411316.bicycle.data`
group by member_casual


#Greatest number of riders in which days in a week
#For casual riders
SELECT  count(day_of_week) AS number_of_riders, day_of_week           
FROM `scenic-patrol-411316.bicycle.data`           
WHERE member_casual = 'casual'           
GROUP BY day_of_week


#For member riders
SELECT  count(day_of_week) AS number_of_riders, day_of_week          
FROM `scenic-patrol-411316.bicycle.data`         
WHERE member_casual = 'member'           
GROUP BY day_of_week




#Popular start hours


#For casual riders
SELECT
EXTRACT (HOUR from started_at) AS hour, count (*) AS riders, member_casual
FROM `scenic-patrol-411316.bicycle.data`
WHERE member_casual = 'casual'
GROUP BY hour , member_casual
ORDER BY hour ASC


#For member riders
SELECT
EXTRACT (HOUR from started_at) AS hour, count (*) AS riders, member_casual
FROM `scenic-patrol-411316.bicycle.data`
WHERE member_casual = 'member'
GROUP BY hour , member_casual
ORDER BY hour ASC


#Popular start stations 
#For casual riders
SELECT count(*) AS count, start_station_name
FROM `scenic-patrol-411316.bicycle.data`
WHERE member_casual = 'casual'
GROUP BY start_station_name
ORDER BY count DESC




#For member riders
SELECT count(*) AS count, start_station_name
FROM `scenic-patrol-411316.bicycle.data`
WHERE member_casual = 'member'
GROUP BY start_station_name
ORDER BY count DESC


#Popular end station
#For casual riders
SELECT count(*) AS count, start_station_name
FROM `scenic-patrol-411316.bicycle.data`
WHERE member_casual = 'casual'
GROUP BY start_station_name
ORDER BY count DESC
#For member riders
SELECT count(*) AS count, start_station_name
FROM `scenic-patrol-411316.bicycle.data`
WHERE member_casual = 'member'
GROUP BY start_station_name
ORDER BY count DESC


#Popular routes
#For casual riders
SELECT COUNT(*) AS count,end_station_name,start_station_name
FROM `scenic-patrol-411316.bicycle.data`
WHERE member_casual = 'casual'
GROUP BY start_station_name, end_station_name
ORDER BY count DESC ;




#For member riders
SELECT COUNT(*) AS count,end_station_name,start_station_name
FROM `scenic-patrol-411316.bicycle.data`
WHERE member_casual = 'member'
GROUP BY start_station_name, end_station_name
ORDER BY count DESC ;


