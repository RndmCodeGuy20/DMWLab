-- create relational table

create table trans_demo
(
    id      int primary key,
    salary  int,
    dept_no int
);

-- adding data to trans table

insert into trans_demo
values (1, 10000, 1);
insert into trans_demo
values (3, 10000, 1);
insert into trans_demo
values (2, 10000, 1);

-- reading data from trans
SELECT *
FROM TRANS_DEMO;

select table_name, iot_type, iot_name
from user_tables
where table_name like '%TRANS_DEMO%';

select *
from user_segments
where segment_name like '%TRANS_DEMO%';

select index_name, index_type, table_name
from user_indexes
where table_name like
      '%TRANS_DEMO%';

EXPLAIN PLAN FOR
select *
from trans_demo
where id = 1;
select *
from table (DBMS_XPLAN.DISPLAY);

-- iot table

create table IOT_trans_demo
(
    id      int primary key,
    salary  int,
    dept_no int
) ORGANIZATION INDEX;

insert into IOT_trans_demo
values (1, 10000, 1);
insert into IOT_trans_demo
values (3, 10000, 1);
insert into IOT_trans_demo
values (2, 10000, 1);

select *
from IOT_trans_demo;

select table_name, iot_type, iot_name
from user_tables
where table_name like
      '%IOT_TRANS_DEMO%';

select *
from user_segments
where segment_name like '%IOT_TRANS_DEMO%';


select index_name, index_type, table_name
from user_indexes
where table_name like
      '%IOT_TRANS_DEMO%';