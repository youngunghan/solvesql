-- Problem: Movies about Love
-- URL: https://solvesql.com/problems/movies-about-love/

SELECT
  title,
  year,
  rotten_tomatoes
FROM
  movies
WHERE
  LOWER(title) LIKE '%love%'
ORDER BY
  rotten_tomatoes DESC,
  year DESC;
