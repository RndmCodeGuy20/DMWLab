-- Create the employees table with four equal partitions

CREATE TABLE EMPLOYEES
(
    EMPNO   INT,
    EMPNAME VARCHAR(32)
)
PARTITION BY RANGE (EMPNO)
(
    PARTITION P1 VALUES LESS THAN (100),
    PARTITION P2 VALUES LESS THAN (200),
    PARTITION P3 VALUES LESS THAN (300),
    PARTITION P4 VALUES LESS THAN (MAXVALUE)
);

-- Insert some data into the employees table
INSERT INTO EMPLOYEES (EMPNO, EMPNAME) VALUES
                                          (10, 'Alice');
    (20, 'Bob'),
    (110, 'Charlie'),
    (210, 'David'),
    (310, 'Emily'),
    (410, 'Frank');

select * from v$option where parameter = 'Partitioning';