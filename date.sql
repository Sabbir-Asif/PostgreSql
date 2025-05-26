SHOW TIMEZONE;

SELECT now();

create Table timez (ts TIMESTAMP without time zone, tsz TIMESTAMP with time zone);

INSERT INTO timez VALUES('2025-01-12 10:45:00','2025-01-12 10:45:00');

SELECT * FROM timez;

SELECT CURRENT_DATE;

SELECT now()::date;

SELECT to_char(now(),'yyyy/mm/dd');

SELECT to_char(now(),'DDD');

SELECT CURRENT_DATE - INTERVAL '1 year 2 month';

SELECT age(CURRENT_DATE, '2001-10-10');