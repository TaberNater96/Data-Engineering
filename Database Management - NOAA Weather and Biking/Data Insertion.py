import pandas as pd
from sqlalchemy import create_engine

# Assuming trips.csv and NOAA.csv paths are defined
trips_csv_path = "C:\\Users\\Elijah Taber\\OneDrive\\Documents\\Projects\\Data Management Project\\trips.csv"
noaa_csv_path = "C:\\Users\\Elijah Taber\\OneDrive\\Documents\\Projects\\Data Management Project\\NOAA.csv"
database_url = 'postgresql://postgres:password@localhost/BikesWeatherDB'

# Load CSV files into DataFrames
trips_df = pd.read_csv(trips_csv_path)
noaa_df = pd.read_csv(noaa_csv_path)

# Extract unique stations
start_stations = trips_df[['start_station_id', 
                           'start_station_name', 
                           'start_station_latitude', 
                           'start_station_longitude']]\
                               .drop_duplicates()\
                                   .rename(columns=lambda x: x.replace('start_', ''))
                                   
end_stations = trips_df[['end_station_id', 
                         'end_station_name', 
                         'end_station_latitude', 
                         'end_station_longitude']]\
                             .drop_duplicates()\
                                 .rename(columns=lambda x: x.replace('end_', ''))
                                 
stations_df = pd.concat([start_stations, end_stations]).drop_duplicates(subset=['station_id'])

# Create SQLAlchemy engine
engine = create_engine(database_url)

# Insert data into PostgreSQL tables
stations_df.to_sql('stations', con=engine, if_exists='append', index=False)
trips_df.to_sql('trips', con=engine, if_exists='append', index=False)
noaa_df.to_sql('noaa', con=engine, if_exists='append', index=False)
