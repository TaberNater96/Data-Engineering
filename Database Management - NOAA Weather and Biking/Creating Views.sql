/*
A view to summarize daily ridership, including total trips, average trip duration, and the count of 
unique bikes used.
*/
CREATE VIEW daily_ridership_summary AS
SELECT
    DATE(start_time) AS date,
    COUNT(*) AS total_trips,
    AVG(trip_duration_sec) / 60 AS avg_trip_duration_minutes,
    COUNT(DISTINCT bike_id) AS unique_bikes_used
FROM
    Trips
GROUP BY
    DATE(start_time);

/*
A view to understand how often each station is used as a starting and ending point for trips, which 
can be useful for station maintenance planning and bike redistribution.
*/
CREATE VIEW station_usage AS
SELECT
    s.station_id,
    s.station_name,
    COUNT(t.start_station_id) AS start_station_count,
    COUNT(t.end_station_id) AS end_station_count
FROM
    Stations s
LEFT JOIN Trips t ON s.station_id = t.start_station_id
LEFT JOIN Trips t2 ON s.station_id = t2.end_station_id
GROUP BY
    s.station_id;

/*
A view to analyze the impact of weather on ridership, correlating daily trip counts with weather 
conditions.
*/
CREATE VIEW weather_impact_on_ridership AS
SELECT
    n.date,
    COUNT(t.trip_id) AS total_trips,
    n.avg_temp,
    n.precipitation,
    n.snow
FROM
    NOAA n
LEFT JOIN Trips t ON DATE(t.start_time) = n.date
GROUP BY
    n.date
ORDER BY
    n.date;

/*
A view focusing on user demographics and their riding habits, which could include average trip 
duration and most frequently used stations by different user types and genders.
*/
CREATE VIEW user_demographics_usage AS
SELECT
    user_type,
    gender,
    AVG(trip_duration_sec) / 60 AS avg_trip_duration_minutes,
    COUNT(*) AS total_trips,
    MAX(start_station_name) AS most_frequent_start_station, 
    MAX(end_station_name) AS most_frequent_end_station 
FROM
    Trips
GROUP BY
    user_type, gender;
