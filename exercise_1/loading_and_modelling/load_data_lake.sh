# Final version for grading

# save my current directory
MY_DIR=$(pwd)
# create staging directory
mkdir ~/staging
mkdir ~/staging/exercise_1

# change to staging directory
cd ~/staging/exercise_1

# get file from data.medicare.gov
MY_URL="https://data.medicare.gov/views/bg9k-emty/files/Nqcy71p9Ss2RSBWDmP77H1DQXcyacr2khotGbDHHW_s?content_type=application%2Fzip%3B%20charset%3Dbinary&filename=Hospital_Revised_Flatfiles.zip"
wget "$MY_URL" -O medicare_data.zip
unzip medicare_data.zip

#make main DFS directory
hdfs dfs -mkdir /user/w205/hospital_compare

#rename files, create new sub-directories, and move files to sub-directories
MY_FILE="Hospital General Information.csv"
tail -n +2 "$MY_FILE" >hospitals.csv
hdfs dfs -mkdir /user/w205/hospital_compare/hospitals
hdfs dfs -put hospitals.csv /user/w205/hospital_compare/hospitals

MY_FILE2="Timely and Effective Care - Hospital.csv"
tail -n +2 "$MY_FILE2" >effective_care.csv
hdfs dfs -mkdir /user/w205/hospital_compare/effective_care
hdfs dfs -put effective_care.csv /user/w205/hospital_compare/effective_care

MY_FILE3="Readmissions and Deaths - Hospital.csv"
tail -n +2 "$MY_FILE3" >readmissions.csv
hdfs dfs -mkdir /user/w205/hospital_compare/readmissions
hdfs dfs -put readmissions.csv /user/w205/hospital_compare/readmissions

MY_FILE4="Measure Dates.csv"
tail -n +2 "$MY_FILE4" >Measures.csv
hdfs dfs -mkdir /user/w205/hospital_compare/Measures
hdfs dfs -put Measures.csv /user/w205/hospital_compare/Measures

MY_FILE5="hvbp_hcahps_05_28_2015.csv"
tail -n +2 "$MY_FILE5" >survey_responses.csv
hdfs dfs -mkdir /user/w205/hospital_compare/survey_responses
hdfs dfs -put survey_responses.csv /user/w205/hospital_compare/survey_responses


cd $MY_DIR

exit


