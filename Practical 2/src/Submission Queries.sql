-- Q1. Find the total sales by country_id and channel_desc for the US and GB through the Internet and direct sales in September 2000 and October 2000 using ROLL-UP Extension. The query should return the following:
-- 1. The aggregation rows that would be produced by GROUP BY
-- 2. The First-level subtotals aggregating across country_iso_code for each combination of channel_desc and calendar_month.
-- 3. Second-level subtotals aggregating across calendar_month_desc and country_iso_code for each channel_desc value.
-- 4. A grand total row.

-- COUNTRY ISO CODE -> US, GB
SELECT *
FROM COUNTRIES
WHERE COUNTRY_ISO_CODE IN ('US', 'GB');

-- CHANNEL DESC -> Internet, Direct
SELECT *
FROM CHANNELS
WHERE CHANNEL_DESC = 'Internet';

-- CALENDAR MONTH -> September 2000, October 2000
SELECT *
FROM TIMES
WHERE CALENDAR_MONTH_NUMBER = 9
   OR CALENDAR_MONTH_NUMBER = 10;

-- 1. Group By
SELECT *
FROM SALES;