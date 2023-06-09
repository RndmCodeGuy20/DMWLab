-- CREATE A SAMPLE DATABASE WITH HASH PARTITIONING
CREATE TABLE TEST_HASH
(
    ID   INT,
    NAME VARCHAR(20),
    AGE  INT
)
    PARTITION BY HASH (ID)
--     PARTITIONS 4
(
    PARTITION P0,
    PARTITION P1,
    PARTITION P2,
    PARTITION P3
);

-- INSERT DATA INTO THE TABLE
INSERT INTO TEST_HASH
VALUES (1, 'John', 25);
INSERT INTO TEST_HASH
VALUES (2, 'Mary', 30);
INSERT INTO TEST_HASH
VALUES (3, 'Peter', 35);

INSERT INTO TEST_HASH
VALUES (24, 'Sam', 25);
INSERT INTO TEST_HASH
VALUES (25, 'Tom', 30);

-- QUERY THE TABLE
SELECT *
FROM TEST_HASH;

-- QUERY THE PARTITION TABLES
SELECT *
FROM TEST_HASH PARTITION (P0);

SELECT *
FROM TEST_HASH PARTITION (P1);

SELECT *
FROM TEST_HASH PARTITION (P2);

SELECT *
FROM TEST_HASH PARTITION (P3);


-- DROP THE TABLE
DROP TABLE TEST_HASH;