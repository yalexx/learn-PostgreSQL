-- Order
SELECT * FROM person ORDER BY id ASC;

SELECT * FROM person ORDER BY id, email DESC;

SELECT country_of_birth from person ORDER BY country_of_birth;

SELECT DISTINCT country_of_birth FROM person ORDER BY country_of_birth;

-- Filter
SELECT * FROM person WHERE gender = 'Female';

SELECT * FROM person WHERE gender = 'Male' AND country_of_birth = 'Bulgaria';

SELECT * FROM person WHERE gender = 'Male' AND (country_of_birth = 'Bulgaria' OR country_of_birth = 'China');

-- Comparison
SELECT 1 <= 2;

SELECT 1 <> 2;

-- Limit, Offset
SELECT * FROM person LIMIT 10;

SELECT * FROM person OFFSET 5 LIMIT 5;

SELECT * FROM person OFFSET 5 FETCH FIRST 5 ROW ONLY;

SELECT * FROM person WHERE country_of_birth IN ('Bulgaria', 'Russia') ORDER BY country_of_birth;

-- Between | Data in range
SELECT * FROM person WHERE date_of_birth BETWEEN DATE '2019-01-01' AND '2019-11-11';

-- Like and ILike
SELECT * FROM person WHERE email LIKE '%youtube.com';

SELECT * FROM person WHERE email LIKE '%google.%';

SELECT * FROM person WHERE email LIKE '_______@%';

SELECT * FROM person WHERE country_of_birth ILIKE 'p%';

-- Group By
SELECT country_of_birth, COUNT(*) FROM person GROUP BY country_of_birth ORDER BY COUNT(*) DESC;

SELECT country_of_birth, COUNT(*) FROM person GROUP BY country_of_birth HAVING COUNT(*) > 5 ORDER BY country_of_birth;

-- Aggregate Functions
SELECT MAX(price) FROM car;

SELECT MIN(price) FROM car;

SELECT AVG(price) FROM car;

SELECT ROUND(AVG(price)) FROM car;

SELECT make, MIN(price) FROM car GROUP BY make;

SELECT SUM(price) FROM car;

SELECT make, SUM(price) FROM car GROUP BY make;

-- Aritmatic operations

