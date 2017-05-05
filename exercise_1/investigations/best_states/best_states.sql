SELECT h.state
    , count(h.state) as ProceduresScored
    , sum(score) as TotalScore
    , cast(sum(score) / count(h.state) as int) as AvgScore
FROM my_hospitals h
INNER JOIN my_effective_care ec
  ON h.provider_id = ec.provider_id
GROUP BY h.state
HAVING count(h.state) > 10
ORDER BY AvgScore desc
LIMIT 10;
