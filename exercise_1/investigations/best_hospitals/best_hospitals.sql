SELECT h.hospital_name
    , count(h.provider_id) as ProceduresScored
    , sum(score) as TotalScore
    , cast(sum(score) / count(h.provider_id) as int) as AvgScore
FROM my_hospitals h
INNER JOIN my_effective_care ec
  ON h.provider_id = ec.provider_id
GROUP BY h.provider_id, h.hospital_name
HAVING count(h.provider_id) > 10
ORDER BY AvgScore desc
LIMIT 10;
