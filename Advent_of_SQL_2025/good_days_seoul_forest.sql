-- Problem: Good Days for a Seoul Forest Picnic
-- URL: https://solvesql.com/problems/good-days-for-a-seoulforest-picnic/

SELECT
  measured_at as good_day
FROM
  measurements
WHERE
  strftime('%Y-%m', measured_at) = '2022-12'
  AND pm10 < 30
  AND pm25 < 15
ORDER BY
  good_day;
