# 1. Find total sales according to year.

SELECT T.YEAR, SUM(SALES_DOLLARS)
FROM sales S
         LEFT JOIN times T ON S.TIMEID = T.TIMEID
GROUP BY T.YEAR;

# 2. Find total sales according to state.

SELECT L.STATE, SUM(SALES_DOLLARS) "TOTAL SALES"
FROM sales S
         LEFT JOIN locations L ON S.LOCID = l.LOCID
GROUP BY l.STATE;

# 3. Find total sales according to year and state.

SELECT L.STATE, T.YEAR, SUM(SALES_DOLLARS) "TOTAL SALES"
FROM sales S
         LEFT JOIN locations L ON S.LOCID = l.LOCID
         LEFT JOIN times T ON S.TIMEID = T.TIMEID
GROUP BY L.STATE, T.YEAR;

# 4. Find all subsets of sales according to year and state (hint : cube)

SELECT L.STATE, T.YEAR, SUM(SALES_DOLLARS) "TOTAL SALES"
FROM sales S
         LEFT JOIN locations L ON S.LOCID = l.LOCID
         LEFT JOIN times T ON S.TIMEID = T.TIMEID
GROUP BY L.STATE, T.YEAR;

# 5. Find subsets of sales according to year and state (hint : rollup)

SELECT L.STATE, T.YEAR, SUM(SALES_DOLLARS) "TOTAL SALES"
FROM sales S
         LEFT JOIN locations L ON S.LOCID = l.LOCID
         LEFT JOIN times T ON S.TIMEID = T.TIMEID
GROUP BY L.STATE, T.YEAR
WITH ROLLUP;

# 6. Comment on the results of previous three queries.
# 7. Find the total sales of raincoats for each location last year.

SELECT L.STATE, SUM(SALES_DOLLARS)
FROM sales S
         LEFT JOIN locations L on L.LOCID = S.LOCID
         LEFT JOIN products p on S.PID = p.PID
         LEFT JOIN times T ON S.TIMEID = T.TIMEID
WHERE p.PNAME = 'Winter Coat'
  AND T.YEAR = 2020
GROUP BY l.STATE;

# 8. Find the total sales of New Year greeting cards for each year.

SELECT T.YEAR, SUM(SALES_DOLLARS)
FROM sales S
         LEFT JOIN locations L on L.LOCID = S.LOCID
         LEFT JOIN products p on S.PID = p.PID
         LEFT JOIN times T ON S.TIMEID = T.TIMEID
WHERE p.PNAME = 'Winter Coat'
GROUP BY T.YEAR;

# 9. Find the total sales of winter wear purchased on holidays in each country.

SELECT SUM(SALES_DOLLARS)
FROM sales S
         LEFT JOIN locations L on L.LOCID = S.LOCID
         LEFT JOIN products p on S.PID = p.PID
         LEFT JOIN times T ON S.TIMEID = T.TIMEID
WHERE T.HOLIDAY_FLAG = 1;

# 10. Find the total sales of category accessories for each month city-wise for year 2016.

