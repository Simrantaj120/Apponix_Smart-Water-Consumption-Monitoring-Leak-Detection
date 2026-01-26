CREATE DATABASE smart_water;
USE smart_water;

CREATE TABLE household_consumption (
    record_id INT AUTO_INCREMENT PRIMARY KEY,
    date DATE,
    household_id VARCHAR(20),
    daily_consumption_liters FLOAT,
    pressure_psi FLOAT,
    temperature_c FLOAT,
    rainfall_mm FLOAT,
    population_density INT
);

CREATE TABLE pipeline_maintenance (
    maintenance_id INT AUTO_INCREMENT PRIMARY KEY,
    household_id VARCHAR(20),
    last_maintenance_date DATE,
    pipeline_status VARCHAR(50)
);

CREATE TABLE seasonal_changes (
    season_id INT AUTO_INCREMENT PRIMARY KEY,
    month VARCHAR(15),
    avg_temperature FLOAT,
    avg_rainfall FLOAT
);

INSERT INTO household_consumption
(date, household_id, daily_consumption_liters, pressure_psi, temperature_c, rainfall_mm, population_density)
VALUES
('2024-01-03','H1001',980,45,30,0,3000);

SELECT *
FROM household_consumption
WHERE daily_consumption_liters > 700;

SELECT *
FROM household_consumption
WHERE daily_consumption_liters > 600
AND pressure_psi < 48;

import mysql.connector
import pandas as pd

conn = mysql.connector.connect(
    host="localhost",
    user="root",
    password="password",
    database="smart_water_db"
)

query = "SELECT * FROM household_consumption"
df = pd.read_sql(query, conn)

df.head()
