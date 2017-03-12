SELECT round(Variability,2) , measure_name
FROM proc_variability
ORDER BY Variability desc
LIMIT 10;
