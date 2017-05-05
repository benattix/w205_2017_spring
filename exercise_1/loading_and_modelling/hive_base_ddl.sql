--Final version for grading

DROP TABLE hospitals;

CREATE EXTERNAL TABLE hospitals
(
  provider_ID string,
  hospital_name string,
  address string,
  city string,
  state string,
  zip string,
  county string,
  phone string,
  hospital_type string,
  hospital_ownership string,
  EM_services string
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
  "separatorChar" = ",",
  "quoteChar" = '"',
  "escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/hospitals'
;



DROP TABLE effective_care;

CREATE EXTERNAL TABLE effective_care
(
  provider_ID string,
  hospital_name string,
  address string,
  city string,
  state string,
  zip string,
  county string,
  phone string,
  condition string,
  measure_ID string,
  measure_name string,
  score string,
  sample string,
  footnote string,
  measure_start_date string,
  measure_end_date string
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
  "separatorChar" = ",",
  "quoteChar" = '"',
  "escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/effective_care'
;




DROP TABLE readmissions;

CREATE EXTERNAL TABLE readmissions
(
  provider_ID string,
  hospital_name string,
  address string,
  city string,
  state string,
  zip string,
  county string,
  phone string,
  measure_name string,
  measure_ID string,
  comp_to_nation string,
  denominator string,
  score string,
  lower_est string,
  higher_est string,
  footnote string,
  measure_start_date string,
  measure_end_date string
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
  "separatorChar" = ",",
  "quoteChar" = '"',
  "escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/readmissions'
;



DROP TABLE Measures;

CREATE EXTERNAL TABLE Measures
(
  measure_name string,
  measure_id string,
  measure_start_qtr string,
  measure_start_date string,
  measure_end_qtr string,
  measure_end_date string
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
  "separatorChar" = ",",
  "quoteChar" = '"',
  "escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/Measures'
;





DROP TABLE survey_responses;

CREATE EXTERNAL TABLE survey_responses
(
  provider_ID string,
  hospital_name string,
  address string,
  city string,
  state string,
  zip string,
  county string,
  comm_nurse_achieve string,
  comm_nurse_impr string,
  comm_nurse_dim string,
  comm_doc_achieve string,
  comm_doc_impr string,
  comm_doc_dim string,
  responsiveness_achieve string,
  responsiveness_impr string,
  responsiveness_dim string,
  pain_mgt_achieve string,
  pain_mgt_impr string,
  pain_mgt_dim string,
  comm_meds_achieve string,
  comm_meds_impr string,
  comm_meds_dim string,
  cleanliness_achieve string,
  cleanliness_impr string,
  cleanliness_dim string,
  discharge_achieve string,
  discharge_impr string,
  discharge_dim string,
  ovr_rtg_achieve string,
  ovr_rtg_impr string,
  ovr_rtg_dim string,
  base_score string,
  consistency_score string
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
  "separatorChar" = ",",
  "quoteChar" = '"',
  "escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/survey_responses'
;

