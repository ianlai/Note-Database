
-- Where condition: number 
SELECT facid, name, membercost, monthlymaintenance 
	FROM cd.facilities 
	WHERE 
		membercost > 0 AND 
		membercost < monthlymaintenance/50.0;


-- Where condition: text 
SELECT * FROM cd.facilities 
	WHERE 
		name LIKE '%Tennis%'; 


-- Where condition: or 
SELECT * FROM cd.facilities 
	WHERE facid = 1 OR facid = 5;


-- Where condition: IN
SELECT * FROM cd.facilities 
	WHERE facid IN (1,5);


-- IN with a single-column table 
SELECT * FROM cd.facilities 
	WHERE facid IN
	( 
	  SELECT facid FROM cd.facilities
	);


-- CASE, customized output field 
SELECT name,
  CASE
	WHEN monthlymaintenance > 100 THEN
	'expensive'
	WHEN monthlymaintenance <= 100 THEN
	'cheap'
  END AS cost
FROM cd.facilities 


-- CASE, customized output field 
SELECT name,
  CASE
	WHEN monthlymaintenance > 100 THEN
	'expensive'
	ELSE
	'cheap'
  END AS cost
FROM cd.facilities 


-- Date
SELECT memid, surname, firstname, joindate 
	FROM cd.members
	WHERE joindate >= '2012-09-01';


-- GROUP BY: consider as identical as if group-by field identical 
SELECT surname FROM cd.members
	GROUP BY surname 
	ORDER BY surname 
	LIMIT 10;


-- SELECT DISTINCT: consider as identical as if all fields identical 
SELECT DISTINCT surname FROM cd.members
	ORDER BY surname 
	LIMIT 10;


-- UNION (output in the same field)
SELECT surname FROM cd.members
UNION
SELECT name FROM cd.facilities;


-- only the latest date
SELECT max(joindate) FROM cd.members;


-- Sol1: the whole row with the latest date 
SELECT firstname, surname, joindate 
	FROM cd.members
	WHERE joindate = 
	  (SELECT max(joindate)       -- this subquery respond an 1x1 table, which is a scalar, so we can compare it directly 
	   FROM cd.members LIMIT 1);


-- Sol2: use ORDER BY and get the first to get the latest date
SELECT firstname, surname, joindate 
	FROM cd.members
	ORDER BY joindate DESC LIMIT 1;
