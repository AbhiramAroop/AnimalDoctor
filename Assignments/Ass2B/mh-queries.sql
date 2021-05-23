--****PLEASE ENTER YOUR DETAILS BELOW****
--mh-queries.sql

--Student ID: 30632714
--Student Name: Abhiram Aroop
--Tutorial No: Tutorial 06

/* Comments for your marker:




*/


/*
    Q1
*/
-- PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE
-- ENSURE your query has a semicolon (;) at the end of this answer

SELECT
    mh.endorsement.ht_nbr,
    mh.endorsement.emp_nbr,
    mh.employee.emp_lname,
    mh.employee.emp_fname,
    TO_CHAR(TO_DATE(mh.endorsement.end_last_annual_review),'Dy DD Mon YYYY')   "REVIEW_DATE"
FROM
         mh.endorsement
    INNER JOIN mh.employee
    ON mh.endorsement.emp_nbr = mh.employee.emp_nbr
WHERE
    mh.endorsement.end_last_annual_review > '31 March 2020'
ORDER BY
    mh.endorsement.end_last_annual_review;
    
/*
    Q2
*/
-- PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE
-- ENSURE your query has a semicolon (;) at the end of this answer

SELECT
    mh.charter.charter_nbr,
    mh.charter.client_nbr,
    mh.client.client_lname,
    mh.client.client_fname,
    mh.charter.charter_special_reqs
FROM
         mh.charter
    INNER JOIN mh.client
    ON mh.charter.client_nbr = mh.client.client_nbr
WHERE
    mh.charter.charter_special_reqs IS NOT null
ORDER BY
    mh.charter.charter_nbr;




/*
    Q3
*/
-- PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE
-- ENSURE your query has a semicolon (;) at the end of this answer

SELECT
    mh.charter_leg.charter_nbr,
    concat(mh.client.client_fname, concat(' ', mh.client.client_lname)) fullname,
    mh.charter.charter_cost_per_hour
FROM
         mh.client
    INNER JOIN mh.charter
    ON mh.client.client_nbr = mh.charter.client_nbr
    INNER JOIN mh.charter_leg
    ON mh.charter.charter_nbr = mh.charter_leg.charter_nbr
    INNER JOIN mh.location
    ON mh.charter_leg.location_nbr_destination = mh.location.location_nbr
WHERE
    mh.charter_leg.location_nbr_destination = (
        SELECT
            mh.location.location_nbr
        FROM
            mh.location
        WHERE
            mh.location.location_name = 'Mount Doom'
    ) AND ((mh.charter.charter_cost_per_hour < 1000)
    OR ( mh.charter.charter_special_reqs IS NULL ))
ORDER BY
    fullname DESC;


/*
    Q4
*/
-- PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE
-- ENSURE your query has a semicolon (;) at the end of this answer

SELECT
    mh.helicopter_type.ht_name,
    mh.helicopter_type.ht_nbr,
    COUNT(*) "NUMBER OF HELICOPTERS"
FROM
         mh.helicopter
    INNER JOIN mh.helicopter_type
    ON mh.helicopter_type.ht_nbr = mh.helicopter.ht_nbr
GROUP BY
    mh.helicopter_type.ht_name,
    mh.helicopter_type.ht_nbr
HAVING
    COUNT(*) > 1
ORDER BY
    "NUMBER OF HELICOPTERS" DESC;



/*
    Q5
*/
-- PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE
-- ENSURE your query has a semicolon (;) at the end of this answer

SELECT
    mh.location.location_nbr,
    mh.location.location_name,
    COUNT(*) "NUMBER OF ORIGIN LOCATION"
FROM
         mh.location
    INNER JOIN mh.charter_leg
    ON mh.location.location_nbr = mh.charter_leg.location_nbr_origin
GROUP BY
    mh.location.location_nbr,
    mh.location.location_name
HAVING
    COUNT(*) > 1
ORDER BY
    "NUMBER OF ORIGIN LOCATION";


/*
    Q6
*/
-- PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE
-- ENSURE your query has a semicolon (;) at the end of this answer

SELECT
    mh.helicopter_type.ht_nbr,
    mh.helicopter_type.ht_name,
    SUM(mh.helicopter.heli_hrs_flown) "TOTAL HOURS FLOWN"
FROM
         mh.helicopter
    INNER JOIN mh.helicopter_type
    ON mh.helicopter_type.ht_nbr = mh.helicopter.ht_nbr
GROUP BY
    mh.helicopter_type.ht_nbr,
    mh.helicopter_type.ht_name
ORDER BY
    "TOTAL HOURS FLOWN";

/*
    Q7
*/
-- PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE
-- ENSURE your query has a semicolon (;) at the end of this answer

SELECT
    mh.charter_leg.charter_nbr AS charter_nbr1,
    TO_CHAR(TO_DATE(mh.charter_leg.cl_atd), 'TS DD Mon YYYY') "Date/Time"
FROM
         mh.charter
    INNER JOIN mh.charter_leg
    ON mh.charter.charter_nbr = mh.charter_leg.charter_nbr
    INNER JOIN mh.employee
    ON mh.charter.emp_nbr = mh.employee.emp_nbr
WHERE
    mh.charter_leg.cl_atd IS NOT NULL
    AND mh.charter.emp_nbr = (
        SELECT
            mh.employee.emp_nbr
        FROM
            mh.employee
        WHERE
                mh.employee.emp_lname = 'Baggins'
            AND mh.employee.emp_fname = 'Frodo'
    AND mh.charter_leg.cl_leg_nbr = 1
    ) AND mh.charter_leg.charter_nbr NOT IN ((SELECT mh.charter_leg.charter_nbr FROM mh.charter_leg WHERE mh.charter_leg.cl_atd IS null))
ORDER BY
    mh.charter_leg.cl_atd DESC;

/*
    Q8
*/
-- PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE
-- ENSURE your query has a semicolon (;) at the end of this answer

SELECT
    mh.charter_leg.charter_nbr,
    mh.charter.client_nbr,
    NVL(mh.client.client_fname, '-'),
    NVL(mh.client.client_lname, '-'),
    CONCAT('$',TO_CHAR(round(mh.charter.charter_cost_per_hour * (mh.charter_leg.cl_ata -
    mh.charter_leg.cl_atd) * 24,2))) totalchartercost
FROM
         mh.charter
    INNER JOIN mh.charter_leg
    ON mh.charter_leg.charter_nbr = mh.charter.charter_nbr
    INNER JOIN mh.client
    ON mh.client.client_nbr = mh.charter.client_nbr
WHERE
    (mh.charter_leg.charter_nbr) NOT IN((SELECT mh.charter_leg.charter_nbr FROM mh.charter_leg WHERE mh.charter_leg.cl_atd IS null)) AND
   ((mh.charter.charter_cost_per_hour *(mh.charter_leg.cl_ata -
    mh.charter_leg.cl_atd) * 24) < (SELECT DISTINCT AVG(mh.charter.charter_cost_per_hour *(mh.charter_leg.cl_ata -
    mh.charter_leg.cl_atd) * 24) OVER() FROM mh.charter INNER JOIN MH.charter_leg ON mh.charter_leg.charter_nbr=mh.charter.charter_nbr ))
GROUP BY
    mh.charter_leg.charter_nbr,
    mh.charter.client_nbr,
    mh.client.client_fname,
    mh.client.client_lname,
    round(mh.charter.charter_cost_per_hour *(mh.charter_leg.cl_ata - mh.charter_leg.cl_atd) * 24,2)
ORDER BY
    totalchartercost DESC;

/*
    Q9
*/
-- PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE
-- ENSURE your query has a semicolon (;) at the end of this answer

SELECT
    DISTINCT mh.charter_leg.charter_nbr,
    concat(mh.employee.emp_fname, concat(' ', mh.employee.emp_lname)) "PILOTNAME",
    concat(mh.client.client_fname, concat(' ', mh.client.client_lname)) "CLIENTNAME"    
FROM
         mh.charter
    INNER JOIN mh.employee
    ON mh.employee.emp_nbr = mh.charter.emp_nbr
    INNER JOIN mh.client
    ON mh.client.client_nbr = mh.charter.client_nbr
    INNER JOIN mh.charter_leg
    ON mh.charter.charter_nbr = mh.charter_leg.charter_nbr
WHERE
    (mh.charter_leg.charter_nbr NOT IN (SELECT mh.charter_leg.charter_nbr FROM mh.charter_leg WHERE mh.charter_leg.cl_etd != mh.charter_leg.cl_atd OR mh.charter_leg.cl_atd IS null))
ORDER BY
    mh.charter_leg.charter_nbr;




/*
    Q10
*/
-- PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE
-- ENSURE your query has a semicolon (;) at the end of this answer

