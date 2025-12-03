-- Problem: Good Days for a Seoul Forest Picnic
-- URL: https://solvesql.com/problems/good-days-for-a-seoulforest-picnic/

SELECT 
  measured_at AS good_day
FROM 
  measurements
WHERE 
  measured_at >= '2022-12-01' 
  AND measured_at < '2023-01-01'
  AND pm2_5 <= 9

ORDER BY 
  measured_at;
