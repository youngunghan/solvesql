-- Problem: Count Stamps (스탬프 개수 세기)
-- URL: https://solvesql.com/problems/count-stamps/

SELECT
  CASE
    WHEN total_bill >= 25 THEN 2
    WHEN total_bill >= 15 THEN 1
    ELSE 0
  END AS stamp,
  COUNT(*) AS count_bill
FROM
  tips
GROUP BY
  stamp
ORDER BY
  stamp ASC;
