# save my current working directory
MY_DIR=$(pwd)

# create staging directory
rm ~/staging/exercise_1/*
rmdir ~/staging/exercise_1
rmdir ~/staging/

# remove files from HDFS
hdfs dfs -rm /user/w205/hospital_compare/hospitals/hospitals.csv
hdfs dfs -rm /user/w205/hospital_compare/effective_care/effective_care.csv
hdfs dfs -rm /user/w205/hospital_compare/readmissions/readmissions.csv
hdfs dfs -rm /user/w205/hospital_compare/Measures/Measures.csv
hdfs dfs -rm /user/w205/hospital_compare/survey_responses/survey_responses.csv

# remove HDFS directories
hdfs dfs -rmdir /user/w205/hospital_compare/hospitals
hdfs dfs -rmdir /user/w205/hospital_compare/effective_care
hdfs dfs -rmdir /user/w205/hospital_compare/readmissions
hdfs dfs -rmdir /user/w205/hospital_compare/Measures
hdfs dfs -rmdir /user/w205/hospital_compare/survey_responses
hdfs dfs -rmdir /user/w205/hospital_compare

# Change directory
cd $MY_DIR

exit

