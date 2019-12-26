SELECT facid, name, membercost, monthlymaintenance 
	FROM cd.facilities 
	WHERE 
		membercost > 0 AND 
		membercost < monthlymaintenance/50.0;


SELECT * FROM cd.facilities 
	WHERE 
		name LIKE '%Tennis%'; 

https://pgexercises.com/questions/basic/where4.html
SELECT * FROM cd.facilities 
	WHERE facid = 1 OR facid = 5;

SELECT * FROM cd.facilities 
	WHERE facid IN (1,5);

#IN with a single-column table 
SELECT * FROM cd.facilities 
	WHERE facid IN
	( 
	  SELECT facid FROM cd.facilities
	);


SELECT name,
  CASE
	WHEN monthlymaintenance > 100 THEN
	'expensive'
	WHEN monthlymaintenance <= 100 THEN
	'cheap'
  END AS cost
FROM cd.facilities 


SELECT name,
  CASE
	WHEN monthlymaintenance > 100 THEN
	'expensive'
	ELSE
	'cheap'
  END AS cost
FROM cd.facilities 



SELECT memid, surname, firstname, joindate 
	FROM cd.members
	WHERE joindate >= '2012-09-01';


SELECT surname FROM cd.members            #only group-by field 
	GROUP BY surname 
	ORDER BY surname 
	LIMIT 10;

SELECT DISTINCT surname FROM cd.members   #all fields identical 
	ORDER BY surname 
	LIMIT 10;


SELECT surname FROM cd.members
UNION
SELECT name FROM cd.facilities;


#only the latest date
SELECT max(joindate) FROM cd.members;


#the whole row with the latest date 
SELECT firstname, surname, joindate 
	FROM cd.members
	WHERE joindate = 
	  (SELECT max(joindate)       #此subquery回的是一個1x1的table 也就是純量 所以可以直接拿來用
	   FROM cd.members LIMIT 1);


SELECT firstname, surname, joindate 
	FROM cd.members
	ORDER BY joindate DESC LIMIT 1;
