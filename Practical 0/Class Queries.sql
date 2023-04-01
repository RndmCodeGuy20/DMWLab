-- GROUP-BY QUERIES ON :-

-- Continent
SELECT L.LOC_ID, L.COUNTRY, SUM(UNITS_SOLD) "TOTAL SALES"
FROM SALES S LEFT JOIN LOCATIONS L on L.LOC_ID = S.LOC_ID
GROUP BY L.COUNTRY, L.LOC_ID;

-- Country
SELECT location_id, country, SUM(dollars_sold) "TOTAL SALES"
FROM locations_table
GROUP BY country;

-- State
SELECT location_id, state, SUM(dollars_sold) "TOTAL SALES"
FROM locations_table
GROUP BY state;

-- City
SELECT location_id, city, SUM(dollars_sold) "TOTAL SALES"
FROM locations_table
GROUP BY city;


-- Grouping Sets (group by multiple columns) :-

-- Continent, Country
SELECT location_id, continent, country, SUM(dollars_sold) "TOTAL SALES"
FROM locations_table
GROUP BY continent, country
WITH ROLLUP;


-- Country, State
SELECT location_id, country, state, SUM(dollars_sold) "TOTAL SALES"
FROM locations_table
GROUP BY country, state
WITH ROLLUP;

-- State, City
SELECT location_id, state, city, SUM(dollars_sold) "TOTAL SALES"
FROM locations_table
GROUP BY state, city
WITH ROLLUP;


-- Continent WITH ROLLUP
SELECT location_id, continent, SUM(dollars_sold) "TOTAL SALES"
FROM locations_table
GROUP BY continent
WITH ROLLUP;