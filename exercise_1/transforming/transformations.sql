-- All transformations for Exercise 1

-- Modified hospitals table
CREATE TABLE my_hospitals AS
SELECT provider_id, hospital_name, state
FROM hospitals;

-- Modified effective_care table
CREATE TABLE my_effective_care AS
SELECT provider_id,
    measure_id,
    measure_name,
    cast(score as float) as score,
    cast(sample as int) as sample
FROM effective_care
WHERE score is not null
  and cast(sample as int) > 29;

-- Modified readmissions table
CREATE TABLE my_readmissions AS
SELECT provider_id,
    measure_id,
    measure_name,
    cast(denominator as int) as sample,
    cast(score as float) as score
FROM readmissions
WHERE score is not null
  and cast(denominator as int) > 29;


-- Table for procedural variability
CREATE TABLE proc_variability AS
SELECT x.measure_name
    , x.measure_id
    , count(measure_id)
    , stddev(x.score) as Variability
FROM
(
  SELECT h.provider_id, measure_id, measure_name, score
  FROM my_hospitals h
  INNER JOIN my_effective_care ec
    ON h.provider_id = ec.provider_id

  UNION

  SELECT h.provider_id, measure_id, measure_name, score
  FROM my_hospitals h
  INNER JOIN my_readmissions r
    ON h.provider_id = r.provider_id
) x
GROUP BY x.measure_name, x.measure_id
HAVING count(measure_id) > 10;


-- Modified survey responses table
CREATE TABLE my_survey_resp AS
SELECT provider_id,
    cast(substring(ovr_rtg_achieve,1,1) as int) as ovr_rtg_achieve,
    cast(substring(ovr_rtg_dim,1,1) as int) ovr_rtg_dim,
    cast(base_score as int) as base_score
FROM survey_responses
WHERE base_score is not null
  and ovr_rtg_achieve is not null;

