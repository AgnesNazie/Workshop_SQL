# SQL Join exercise
#

#
# 1: Get the cities with a name starting with ping sorted by their population with the least populated cities first
#
SELECT * FROM city WHERE name LIKE 'ping%' ORDER BY population ASC;
#
# 2: Get the cities with a name starting with ran sorted by their population with the most populated cities first
#
SELECT * FROM city WHERE name LIKE 'ran%' ORDER BY population DESC;
#
# 3: Count all cities
#
SELECT COUNT(*)  FROM city;
#
# 4: Get the average population of all cities
#
SELECT AVG(population) FROM city;
#
# 5: Get the biggest population found in any of the cities
#
SELECT MAX(population) From city;
#
# 6: Get the smallest population found in any of the cities
#
SELECT MIN(population) FROM city;
#
# 7: Sum the population of all cities with a population below 10000
#
SELECT SUM(population) FROM city WHERE population < 10000;
#
# 8: Count the cities with the countrycodes MOZ and VNM
#
SELECT COUNT(*) FROM city WHERE CountryCode IN ('MOZ', 'VNM');
#
# 9: Get individual count of cities for the countrycodes MOZ and VNM
#
SELECT countrycode, COUNT(*) FROM city WHERE countrycode IN ( 'MOZ' AND 'VNM')
GROUP BY countrycode;
#
# 10: Get average population of cities in MOZ and VNM
#
SELECT countrycode, AVG(population) FROM city WHERE countrycode IN ('MOZ' AND 'VNM')
GROUP BY countrycode;
#
# 11: Get the countrycodes with more than 200 cities
#
SELECT countrycode, COUNT(*) AS city_count FROM city 
GROUP BY countrycode
HAVING city_count >200;
#
# 12: Get the countrycodes with more than 200 cities ordered by city count
#
SELECT countrycode, COUNT(*) AS city_count FROM city 
GROUP BY countrycode
HAVING city_count >200
ORDER BY city_count DESC;
#
# 13: What language(s) is spoken in the city with a population between 400 and 500 ?
#
SELECT DISTINCT cl.Language FROM City c
JOIN CountryLanguage cl ON c.CountryCode = cl.CountryCode
WHERE c.Population BETWEEN 400 AND 500;
#
# 14: What are the name(s) of the cities with a population between 500 and 600 people and the language(s) spoken in them
#
SELECT c.Name, cl.Language FROM City c
JOIN CountryLanguage cl ON c.CountryCode = cl.CountryCode
WHERE c.Population BETWEEN 500 AND 600;
#
# 15: What names of the cities are in the same country as the city with a population of 122199 (including the that city itself)
#
SELECT c2.Name FROM City c1
JOIN City c2 ON c1.CountryCode = c2.CountryCode
WHERE c1.Population = 122199;
#
# 16: What names of the cities are in the same country as the city with a population of 122199 (excluding the that city itself)
#
SELECT c2.Name FROM City c1
JOIN City c2 ON c1.CountryCode = c2.CountryCode
WHERE c1.Population = 122199 AND c2.Population <> 122199;
#
# 17: What are the city names in the country where Luanda is capital?
#
SELECT ci.Name FROM Country co
JOIN City ci ON co.Code = ci.CountryCode
WHERE co.Capital = (SELECT Id FROM City WHERE Name = 'Luanda');
#
# 18: What are the names of the capital cities in countries in the same region as the city named Yaren
#
SELECT ci.Name FROM Country co
JOIN City ci ON co.Capital = ci.Id
WHERE co.Region = (
  SELECT co2.Region   FROM City c
  JOIN Country co2 ON c.CountryCode = co2.Code
  WHERE c.Name = 'Yaren'
);
#
# 19: What unique languages are spoken in the countries in the same region as the city named Riga
#
SELECT DISTINCT cl.Language FROM CountryLanguage cl
JOIN Country co ON cl.CountryCode = co.Code
WHERE co.Region = (
  SELECT co2.Region  FROM City c
  JOIN Country co2 ON c.CountryCode = co2.Code
  WHERE c.Name = 'Riga'
);
#
# 20: Get the name of the most populous city
#
SELECT Name FROM City ORDER BY Population DESC LIMIT 1;
#
#