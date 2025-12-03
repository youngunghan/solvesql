-- Problem: Good Days for a Seoul Forest Picnic
-- URL: https://solvesql.com/problems/good-days-for-a-seoulforest-picnic/
-- NOTE: This is a template based on common air quality schemas.
-- You may need to adjust table and column names.

SELECT
  measure_date,
  pm10,
  pm25
FROM
  measurements
WHERE
  pm10 < 30
  AND pm25 < 15
  AND weather = 'Sunny' -- Example condition
ORDER BY
  measure_date;
