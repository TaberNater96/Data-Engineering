-- Create Stations Table
CREATE TABLE Stations (
    station_id INTEGER PRIMARY KEY,
    station_name VARCHAR,
    station_latitude FLOAT,
    station_longitude FLOAT
);

-- Create Trips Table
CREATE TABLE Trips (
    trip_id SERIAL PRIMARY KEY,
    trip_duration_sec INTEGER,
    start_time TIMESTAMP,
    stop_time TIMESTAMP,
    start_station_id INTEGER,
    start_station_name VARCHAR,
    start_station_latitude FLOAT,
    start_station_longitude FLOAT,
    end_station_id INTEGER,
    end_station_name VARCHAR,
    end_station_latitude FLOAT,
    end_station_longitude FLOAT,
    bike_id INTEGER,
    user_type VARCHAR,
    birth_year INTEGER,
    gender INTEGER,
    FOREIGN KEY (start_station_id) REFERENCES Stations(station_id),
    FOREIGN KEY (end_station_id) REFERENCES Stations(station_id)
);

-- Create NOAA Table
CREATE TABLE NOAA (
    weather_id SERIAL PRIMARY KEY,
    date DATE,
    avg_wind FLOAT,
    precipitation FLOAT,
    snow FLOAT,
    snow_depth FLOAT,
    avg_temp INTEGER,
    max_temp INTEGER,
    min_temp INTEGER,
    top_wind_dir_2_min INTEGER,
    top_wind_dir_5_min FLOAT,
    top_wind_speed_2_min FLOAT,
    top_wind_speed_5_min FLOAT
);
