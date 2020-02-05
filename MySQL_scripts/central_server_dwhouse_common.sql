use dwhouse;

# Create table for time dimension

CREATE TABLE weeks(
   weeknbr INT AUTO_INCREMENT PRIMARY KEY,
   datestart date,
   dateend date
);

INSERT INTO weeks(weeknbr, datestart, dateend)
VALUES(48, '2019-11-25', '2019-12-01');
INSERT INTO weeks(datestart, dateend)
VALUES('2019-12-02', '2019-12-08');
INSERT INTO weeks(datestart, dateend)
VALUES('2019-12-09', '2019-12-15');
INSERT INTO weeks(datestart, dateend)
VALUES('2019-12-16', '2019-12-22');

CREATE TABLE time_dim(
   key_dim INT AUTO_INCREMENT PRIMARY KEY,
   hour INT,
   day INT,
   week INT,
   month INT,
   year INT
);



drop table time_dim;