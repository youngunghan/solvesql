-- Problem: Bad Finddust Days in a Row (이틀 연속 미세먼지가 나빠진 날)
-- URL: https://solvesql.com/problems/bad-finddust-days-in-a-row/

SELECT
  measured_at AS date_alert
FROM (
  SELECT
    measured_at,
    pm10,
    LAG(pm10, 1) OVER (ORDER BY measured_at) AS prev_pm10,
    LAG(pm10, 2) OVER (ORDER BY measured_at) AS prev_prev_pm10
  FROM
    measurements
) sub
WHERE
  pm10 >= 30
  AND pm10 > prev_pm10
  AND prev_pm10 > prev_prev_pm10
ORDER BY
  date_alert;
