SELECT corr(base_score, AvgScore) as BaseScoreCorrelation
    , corr(ovr_rtg_achieve, AvgScore) as OvrRatingCorrelation
FROM my_survey_resp s
INNER JOIN (    -- Query from question1 (best hospitals)
    SELECT h.provider_id
        , count(h.provider_id) as ProceduresScored
        , sum(score) as TotalScore
        , cast(sum(score) / count(h.provider_id) as int) as AvgScore
    FROM my_hospitals h
    INNER JOIN my_effective_care ec
      ON h.provider_id = ec.provider_id
    GROUP BY h.provider_id
    HAVING count(h.provider_id) > 10
  ) b   --best
  on s.provider_id = b.provider_id;
