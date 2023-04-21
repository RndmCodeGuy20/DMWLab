-- Q1. Write a query to create range partitioned table:
--  Creates a table named- Sales consisting of four partitions, one for each quarter of sales. The column sale_date are the partitioning columns, while their values constitute the partitioning key of a specific row.
--  Each partition is given a name (sales_q1, sales_q2, ...), and each partition is contained in a separate tablespace (tsa, tsb, ...)
--  The columns for table must be prod_id, cust_id, promo_id, quantity sold, amount_sold – all in number format and sale_date.

-- CREATE TABLESPACE FOR THE TABLE
CREATE TABLESPACE tsa
    DATAFILE 'tsa.dbf' SIZE 100 M
    AUTOEXTEND ON NEXT 10 M MAXSIZE 1 G;

CREATE TABLESPACE tsb
    DATAFILE 'tsb.dbf' SIZE 100 M
    AUTOEXTEND ON NEXT 10 M MAXSIZE 1 G;

CREATE TABLESPACE tsc
    DATAFILE 'tsc.dbf' SIZE 100 M
    AUTOEXTEND ON NEXT 10 M MAXSIZE 1 G;

CREATE TABLESPACE tsd
    DATAFILE 'tsd.dbf' SIZE 100 M
    AUTOEXTEND ON NEXT 10 M MAXSIZE 1 G;

-- CREATE TABLE
CREATE TABLE sales_two
(
    prod_id       number(4),
    cust_id       number(4),
    promo_id      number(4),
    quantity_sold number(4),
    amount_sold   number(8, 2),
    sale_date     date
)
    PARTITION BY RANGE (sale_date)
(
    PARTITION sales_q1 VALUES LESS THAN (TO_DATE('01-APR-2023', 'DD-MON-YYYY')) TABLESPACE tsa,
    PARTITION sales_q2 VALUES LESS THAN (TO_DATE('01-JUL-2023', 'DD-MON-YYYY')) TABLESPACE tsb,
    PARTITION sales_q3 VALUES LESS THAN (TO_DATE('01-OCT-2023', 'DD-MON-YYYY')) TABLESPACE tsc,
    PARTITION sales_q4 VALUES LESS THAN (TO_DATE('01-JAN-2024', 'DD-MON-YYYY')) TABLESPACE tsd
);

-- ADDING SAMPLE DATA TO THE TABLE
INSERT INTO sales_two
VALUES (1, 1, 1, 1, 1, TO_DATE('01-JAN-2023', 'DD-MON-YYYY'));
INSERT INTO sales_two
VALUES (2, 2, 2, 2, 2, TO_DATE('01-APR-2023', 'DD-MON-YYYY'));
INSERT INTO sales_two
VALUES (3, 3, 3, 3, 3, TO_DATE('01-JUL-2023', 'DD-MON-YYYY'));
INSERT INTO sales_two
VALUES (4, 4, 4, 4, 4, TO_DATE('01-OCT-2023', 'DD-MON-YYYY'));

-- QUERYING THE TABLESPACE
SELECT tablespace_name, partition_name, partition_position, high_value
FROM dba_tab_partitions
WHERE table_name = 'SALES_TWO';

-- QUERYING THE PARTITIONS ONE BY ONE
SELECT *
FROM sales_two PARTITION (sales_q1);
SELECT *
FROM sales_two PARTITION (sales_q2);
SELECT *
FROM sales_two PARTITION (sales_q3);
SELECT *
FROM sales_two PARTITION (sales_q4);


-- Q2. Create the same table as in Q1. With a different name with ENABLE ROW MOVEMENT. Bring out the difference in these two tables.

-- CREATE A TABLE WITH ENABLE ROW MOVEMENT AND PARTITIONS
CREATE TABLE sales_two_erm
(
    prod_id       number(4),
    cust_id       number(4),
    promo_id      number(4),
    quantity_sold number(4),
    amount_sold   number(8, 2),
    sale_date     date
)
    PARTITION BY RANGE (sale_date)
(
    PARTITION sales_q1 VALUES LESS THAN (TO_DATE('01-APR-2023', 'DD-MON-YYYY')) TABLESPACE tsa,
    PARTITION sales_q2 VALUES LESS THAN (TO_DATE('01-JUL-2023', 'DD-MON-YYYY')) TABLESPACE tsb,
    PARTITION sales_q3 VALUES LESS THAN (TO_DATE('01-OCT-2023', 'DD-MON-YYYY')) TABLESPACE tsc,
    PARTITION sales_q4 VALUES LESS THAN (TO_DATE('01-JAN-2024', 'DD-MON-YYYY')) TABLESPACE tsd
)
    ENABLE ROW MOVEMENT;

-- ADDING SAMPLE DATA TO THE TABLE
INSERT INTO sales_two_erm
VALUES (1, 1, 1, 1, 1, TO_DATE('01-JAN-2023', 'DD-MON-YYYY'));
INSERT INTO sales_two_erm
VALUES (2, 2, 2, 2, 2, TO_DATE('01-APR-2023', 'DD-MON-YYYY'));
INSERT INTO sales_two_erm
VALUES (3, 3, 3, 3, 3, TO_DATE('01-JUL-2023', 'DD-MON-YYYY'));
INSERT INTO sales_two_erm
VALUES (4, 4, 4, 4, 4, TO_DATE('01-OCT-2023', 'DD-MON-YYYY'));

-- QUERYING THE TABLESPACE
SELECT tablespace_name, partition_name, partition_position, high_value
FROM dba_tab_partitions
WHERE table_name = 'SALES_TWO_ERM';

-- Q3. Create a table with list partition as follows:
--  Table having columns deptno, deptname, quarterly_sales and state.
--  Create partition on state:
--  Northwest on OR and WA
--  Southwest on AZ, UT and NM
--  northeast on NY, VM and NJ
--  southeast on FL and GA
--  northcentral on SD and WI
--  southcentral on OK and TX
--  Add the following entries into the table and make conclusion to which partition the
-- entry maps:
--  (10, &#39;accounting&#39;, 100, &#39;WA&#39;)
--  (20, &#39;R&amp;D&#39;, 150, &#39;OR&#39;)
--  (30, &#39;sales&#39;, 100, &#39;FL&#39;)
--  (40, &#39;HR&#39;, 10, &#39;TX&#39;)
--  (50, &#39;systems engineering&#39;, 10, &#39;CA&#39;)

-- CREATE A TABLE WITH LIST PARTITION
CREATE TABLE SALES_Q3
(
    deptno          number(4),
    deptname        varchar2(20),
    quarterly_sales number(4),
    state           varchar2(2)
)
    PARTITION BY LIST
(
    state
)
(
    PARTITION northwest VALUES ('OR', 'WA'),
    PARTITION southwest VALUES ('AZ', 'UT', 'NM'),
    PARTITION northeast VALUES ('NY', 'VM', 'NJ'),
    PARTITION southeast VALUES ('FL', 'GA'),
    PARTITION northcentral VALUES ('SD', 'WI'),
    PARTITION southcentral VALUES ('OK', 'TX')
);

-- ADDING SAMPLE DATA TO THE TABLE
INSERT INTO SALES_Q3
VALUES (10, 'accounting', 100, 'WA');
INSERT INTO SALES_Q3
VALUES (20, 'R&D', 150, 'OR');
INSERT INTO SALES_Q3
VALUES (30, 'sales', 100, 'FL');
INSERT INTO SALES_Q3
VALUES (40, 'HR', 10, 'TX');
INSERT INTO SALES_Q3 -- THIS WILL NOT GO TO ANY PARTITION (SINCE IT IS NOT IN THE LIST)
VALUES (50, 'systems engineering', 10, 'CA');

-- QUERYING THE TABLE TO FIND OUT WHICH PARTITION THE DATA IS GOING TO
SELECT *
FROM SALES_Q3 PARTITION (NORTHWEST);

SELECT *
FROM SALES_Q3 PARTITION (northcentral)
WHERE STATE = 'WA';


-- Q4

CREATE TABLE sales_Q4
(
    year        NUMBER(4),
    month       NUMBER(2),
    day         NUMBER(2),
    amount_sold NUMBER
)
    PARTITION BY RANGE (year, month, day)
(
    PARTITION p1 VALUES LESS THAN (2001, 1, 1),
    PARTITION p2 VALUES LESS THAN (2001, 4, 1),
    PARTITION p3 VALUES LESS THAN (2001, 7, 1),
    PARTITION p4 VALUES LESS THAN (2001, 10, 1),
    PARTITION p5 VALUES LESS THAN (2002, 1, 1),
    PARTITION p6 VALUES LESS THAN (MAXVALUE, MAXVALUE, MAXVALUE)
);

INSERT INTO sales_Q4
VALUES (2001, 3, 17, 2000);
INSERT INTO sales_Q4
VALUES (2001, 11, 1, 5000);
INSERT INTO sales_Q4
VALUES (2002, 1, 1, 4000);

EXPLAIN PLAN FOR
SELECT *
FROM sales_Q4
WHERE year = 2001
  AND month = 3
  AND day = 17;

SELECT *
FROM TABLE (DBMS_XPLAN.DISPLAY);


-- Q5

CREATE TABLE supplier_parts
(
    supplier_id NUMBER,
    partnum     NUMBER,
    quantity    NUMBER
)
    PARTITION BY RANGE (supplier_id, partnum)
(
    PARTITION p1 VALUES LESS THAN (6, 50),
    PARTITION p2 VALUES LESS THAN (11, 100),
    PARTITION p3 VALUES LESS THAN (MAXVALUE, MAXVALUE)
);

INSERT INTO supplier_parts
VALUES (5, 5, 1000);
INSERT INTO supplier_parts
VALUES (5, 150, 1000);
INSERT INTO supplier_parts
VALUES (10, 100, 1000);

SELECT *
FROM SUPPLIER_PARTS PARTITION (P1);
SELECT *
FROM SUPPLIER_PARTS PARTITION (P2);
SELECT *
FROM SUPPLIER_PARTS PARTITION (P3);

-- Q6

CREATE TABLE sales_Q6
(
    prod_id       NUMBER,
    cust_id       NUMBER,
    promo_id      NUMBER,
    quantity_sold NUMBER,
    amount_sold   NUMBER,
    time_id       DATE
)
    PARTITION BY RANGE (time_id) INTERVAL (NUMTOYMINTERVAL(1, 'MONTH'))
(
    PARTITION sales_q1 VALUES LESS THAN (TO_DATE('01-APR-2022', 'DD-MON-YYYY')),
    PARTITION sales_q2 VALUES LESS THAN (TO_DATE('01-JUL-2022', 'DD-MON-YYYY')),
    PARTITION sales_q3 VALUES LESS THAN (TO_DATE('01-OCT-2022', 'DD-MON-YYYY')),
    PARTITION sales_q4 VALUES LESS THAN (TO_DATE('01-JAN-2023', 'DD-MON-YYYY'))
);

INSERT INTO sales_Q6
VALUES (1, 1, 1, 10, 100, TO_DATE('01-JAN-2022', 'DD-MON-YYYY'));
INSERT INTO sales_Q6
VALUES (2, 2, 2, 20, 200, TO_DATE('01-OCT-2022', 'DD-MON-YYYY'));
INSERT INTO sales_Q6
VALUES (3, 3, 3, 30, 300, TO_DATE('01-JUL-2022', 'DD-MON-YYYY'));

SELECT *
FROM sales_Q6 PARTITION (sales_q1);
SELECT *
FROM sales_Q6 PARTITION (sales_q2);
SELECT *
FROM sales_Q6 PARTITION (sales_q3);
SELECT *
FROM sales_Q6 PARTITION (sales_q4);


-- Q8

-- Create the parent table Orders with range partitioning on Order Date
CREATE TABLE Orders (
    order_id NUMBER,
    order_date DATE,
    customer_id NUMBER,
    shipper_id NUMBER,
    CONSTRAINT pk_orders PRIMARY KEY (order_id)
) PARTITION BY RANGE (order_date) INTERVAL (NUMTOYMINTERVAL(3, 'MONTH'))
(
    PARTITION q1_orders VALUES LESS THAN (TO_DATE('01-APR-2022', 'DD-MON-YYYY')),
    PARTITION q2_orders VALUES LESS THAN (TO_DATE('01-JUL-2022', 'DD-MON-YYYY')),
    PARTITION q3_orders VALUES LESS THAN (TO_DATE('01-OCT-2022', 'DD-MON-YYYY')),
    PARTITION q4_orders VALUES LESS THAN (TO_DATE('01-JAN-2023', 'DD-MON-YYYY'))
);

-- Create the child table order_items with reference partitioning on order_id
CREATE TABLE order_items (
    order_id NUMBER,
    product_id NUMBER,
    price NUMBER,
    quantity NUMBER,
    CONSTRAINT fk_order_items_orders
        FOREIGN KEY (order_id)
        REFERENCES Orders (order_id)
) PARTITION BY REFERENCE (fk_order_items_orders);

-- Delete the partitions and drop the tables
ALTER TABLE Orders DROP PARTITION q1_orders;
ALTER TABLE Orders DROP PARTITION q2_orders;
ALTER TABLE Orders DROP PARTITION q3_orders;
ALTER TABLE Orders DROP PARTITION q4_orders;
DROP TABLE order_items;
DROP TABLE Orders;


-- Q7

CREATE TABLE customer
(
    cust_id       NUMBER,
    cust_name     VARCHAR2(50),
    cust_state    CHAR(2),
    time_id       DATE,
    quantity_sold NUMBER,
    amount_sold   NUMBER
)
    PARTITION BY RANGE (time_id)
    SUBPARTITION BY LIST
(
    cust_state
)
    SUBPARTITION TEMPLATE
(
    SUBPARTITION 
    west
    VALUES ('MH', 'GJ'),
    SUBPARTITION
    south
    VALUES ('TN', 'AP'),
    SUBPARTITION
    north
    VALUES ('UP', 'HP'),
    SUBPARTITION
    unknown
    VALUES (DEFAULT)
)
(
    PARTITION old VALUES LESS THAN (TO_DATE('01-JAN-2005', 'DD-MON-YYYY')),
    PARTITION acquired VALUES LESS THAN (TO_DATE('01-JAN-2010', 'DD-MON-YYYY')),
    PARTITION recent VALUES LESS THAN (TO_DATE('01-JAN-2015', 'DD-MON-YYYY')),
    PARTITION unknown VALUES LESS THAN (MAXVALUE)
);

-- Insert data into the table
INSERT INTO customer
VALUES (1, 'John', 'MH', TO_DATE('01-JAN-2003', 'DD-MON-YYYY'), 100, 1000);
INSERT INTO customer
VALUES (2, 'David', 'TN', TO_DATE('01-JAN-2008', 'DD-MON-YYYY'), 200, 2000);
INSERT INTO customer
VALUES (3, 'Sara', 'UP', TO_DATE('01-JAN-2013', 'DD-MON-YYYY'), 300, 3000);
INSERT INTO customer
VALUES (4, 'Michael', 'RJ', TO_DATE('01-JAN-2017', 'DD-MON-YYYY'), 400, 4000);

-- Check partitions of the data
SELECT cust_id, cust_name, cust_state, time_id, DBMS_ROWID.ROWID_OBJECT(rowid)
FROM customer;