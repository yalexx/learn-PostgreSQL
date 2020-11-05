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

-- Aritmetic operations
SELECT id, make, model, price, ROUND(price * 0.10, 2), ROUND(price - (price * 0.10), 2) FROM car;

-- Alias
SELECT id, make, model, price AS original_price, ROUND(price * 0.10, 2) AS ten_percent, ROUND(price - (price * 0.10), 2) AS discount_after_ten_percent FROM car;

-- Coalesce 
SELECT COALESCE(null, 1) AS NUMBER;

SELECT COALESCE(email, 'Enail not found') FROM person;

-- NULLIF
SELECT NULLIF(10, 10);

SELECT NULLIF(10, 19);

SELECT COALESCE(10 / NULLIF(0, 0), 0);

-- Timestamps and Dates
SELECT NOW();

SELECT NOW()::DATE;

SELECT NOW()::TIME;

SELECT NOW() - INTERVAL '1 YEAR';

SELECT NOW() - INTERVAL '10 MONTHS';

SELECT (NOW() + INTERVAL '10 DAYS')::DATE;

-- Extracting Fields
SELECT EXTRACT(YEAR FROM NOW());

SELECT EXTRACT(MONTH FROM NOW());

SELECT EXTRACT(DOW FROM NOW());

SELECT EXTRACT(CENTURY FROM NOW());

-- Age function
SELECT first_name, last_name, gender, country_of_birth, date_of_birth, EXTRACT(YEAR FROM AGE(NOW(), date_of_birth)) AS age FROM person;

-- Primary Keys
ALTER TABLE person DROP CONSTRAINT person_pkey;

ALTER TABLE person ADD PRIMARY KEY (id);

DELETE FROM person WHERE id = 1;

-- Unique Constraints
SELECT email, count(*) FROM person GROUP BY email HAVING COUNT(*) > 1;

SELECT * FROM person WHERE email = 'gagirre0@salon.com';

ALTER TABLE person ADD CONSTRAINT unique_email_address UNIQUE (email);

DELETE FROM person WHERE id = 1001;

ALTER TABLE person DROP CONSTRAINT unique_email_address;

ALTER TABLE person ADD UNIQUE (email);

-- Check Constraints
SELECT DISTINCT gender FROM person;

ALTER TABLE person ADD CONSTRAINT gender_constraint CHECK (gender = 'Female' OR gender = 'Male');

-- Delete Records
DELETE FROM person WHERE gender = 'Female' AND country_of_birth = 'Nigeria';

-- Update Records
UPDATE person SET email = 'test@gmail.com' WHERE id = 3;

UPDATE person SET first_name = 'Test', last_name = 'Testis' WHERE id = 3;

-- On conflict do noting
SELECT * FROM person WHERE id = 11;

INSERT INTO person (id, first_name, last_name, gender, email, date_of_birth, country_of_birth) 
VALUES (11, 'Kur', 'Kur', 'Male', 'cjanuarya@msn.com', DATE '2019-11-14', 'Democratic Republic of the Congo') ON CONFLICT (email) DO NOTHING;

-- Upsert
INSERT INTO person (id, first_name, last_name, gender, email, date_of_birth, country_of_birth) 
VALUES (11, 'Kur', 'Kur', 'Male', 'cjanuarya@msn.com.uk', DATE '2019-11-14', 'Democratic Republic of the Congo') ON CONFLICT (email) DO UPDATE SET email = EXCLUDED.email;

-- Foreign Keys & Joins


