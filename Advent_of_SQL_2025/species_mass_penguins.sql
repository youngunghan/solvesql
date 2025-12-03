-- Problem: Species and Mass of Penguins
-- URL: https://solvesql.com/problems/species-and-mass-of-penguins/

SELECT
  species,
  AVG(body_mass_g) as avg_mass
FROM
  penguins
GROUP BY
  species
ORDER BY
  avg_mass DESC,
  species ASC;
