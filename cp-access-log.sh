#! /bin/bash
# cp-access-log.sh
# This script downloads the file 'web-server-access-log.txt.gz'
# from "https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBM-DB0250EN-SkillsNetwork/labs/Bash%20Scripting/ETL%20using%20shell%20scripting/".

# The script then extracts the .txt file using gunzip.

# The .txt file contains the timestamp, latitude, longitude 
# and visitor id apart from other data.

# Transforms the text delimeter from "#" to "," and saves to a csv file.
# Loads the data from the CSV file into the table 'access_log' in PostgreSQL database.
echo "Creating access_log table in PostgreSQL database"

echo '\c template1;\\CREATE TABLE IF NOT EXISTS access_log(timestamp TIMESTAMP, latitude float, longitude float, visitor_id char(37));' | psql --username=postgres --host=localhost

echo "Downloading the file"
wget "https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBM-DB0250EN-SkillsNetwork/labs/Bash%20Scripting/ETL%20using%20shell%20scripting/web-server-access-log.txt.gz"

echo "Unzip the .gz file"

gunzip  web-server-access-log.txt.gz 

echo "Extracting required fields"

cut -d"#" -f1-4 web-server-access-log.txt > extracted-data.txt

echo "Transforming Data into CSV format"

tr "#" "," < extracted-data.txt > extracted-data.csv

echo "Loading data into the table access_log in PostgreSQL"

echo "\c template1;\COPY access_log FROM '/home/project/extracted-data.csv' DELIMITERS ',' CSV HEADER;" | psql --username=postgres --host=localhost 
