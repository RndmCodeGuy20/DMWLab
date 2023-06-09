INSERT INTO times (TIMEID, DATE, WEEK, MONTH, QUARTER, YEAR, holiday_flag)
VALUES (1, '2015-01-01', 1, 1, 1, 2015, true),
       (2, '2015-04-15', 16, 4, 2, 2015, false),
       (3, '2015-07-01', 27, 7, 3, 2015, true),
       (4, '2015-10-31', 44, 10, 4, 2015, true),
       (5, '2016-02-14', 7, 2, 1, 2016, true),
       (6, '2016-05-27', 22, 5, 2, 2016, false),
       (7, '2016-08-10', 32, 8, 3, 2016, false),
       (8, '2016-11-22', 47, 11, 4, 2016, false),
       (9, '2017-03-17', 11, 3, 1, 2017, true),
       (10, '2017-06-30', 26, 6, 2, 2017, false),
       (11, '2017-09-23', 38, 9, 3, 2017, true),
       (12, '2017-12-24', 52, 12, 4, 2017, true),
       (13, '2018-01-31', 5, 1, 1, 2018, false),
       (14, '2018-05-05', 18, 5, 2, 2018, true),
       (15, '2018-08-17', 33, 8, 3, 2018, false);

INSERT INTO times (timeid, date, week, month, quarter, year, holiday_flag)
VALUES (16, '2019-02-14', 7, 2, 1, 2019, true),
       (17, '2019-05-27', 22, 5, 2, 2019, false),
       (18, '2019-08-10', 32, 8, 3, 2019, false),
       (19, '2019-11-22', 47, 11, 4, 2019, false),
       (20, '2020-03-17', 11, 3, 1, 2020, true),
       (21, '2020-06-30', 26, 6, 2, 2020, false),
       (22, '2020-09-23', 38, 9, 3, 2020, true),
       (23, '2020-12-24', 52, 12, 4, 2020, true),
       (24, '2015-02-14', 7, 2, 1, 2015, true),
       (25, '2015-05-27', 22, 5, 2, 2015, false),
       (26, '2015-08-10', 32, 8, 3, 2015, false),
       (27, '2015-11-22', 47, 11, 4, 2015, false),
       (28, '2016-03-17', 11, 3, 1, 2016, true),
       (29, '2016-06-30', 26, 6, 2, 2016, false),
       (30, '2016-09-23', 38, 9, 3, 2016, true);


SELECT *
FROM times;