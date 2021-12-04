# ETL_Using_Shell_Scripts
Copy the data in the file 'web-server-access-log.txt.gz' to the table 'access_log' in the PostgreSQL database 'template1'.

The file is available at the location : [Log Data](https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBM-DB0250EN-SkillsNetwork/labs/Bash%20Scripting/ETL%20using%20shell%20scripting/web-server-access-log.txt.gz)

The following are the columns and their data types in the file:

a. timestamp - TIMESTAMP. \
b. latitude - float. \
c. longitude - float. \
d. visitorid - char(37). 

and two more columns: accessedfrommobile (boolean) and browser_code (int). 

The columns which we need to copy to the table are the first four coumns : timestamp, latitude, longitude and visitorid. 

NOTE: The file comes with a header. So use the 'HEADER' option in the 'COPY' command. \
__cp-access-log.sh__. \
 This script downloads the file 'web-server-access-log.txt.gz'
 from [Here](https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBM-DB0250EN-SkillsNetwork/labs/Bash%20Scripting/ETL%20using%20shell%20scripting/) 

 The script then extracts the .txt file using gunzip. 

 The .txt file contains the timestamp, latitude, longitude 
 and visitor id apart from other data. 

 Transforms the text delimeter from "#" to "," and saves to a csv file. \
 Loads the data from the CSV file into the table 'access_log' in PostgreSQL database.
