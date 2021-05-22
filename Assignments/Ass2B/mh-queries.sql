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


/*
    Q6
*/
-- PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE
-- ENSURE your query has a semicolon (;) at the end of this answer


/*
    Q7
*/
-- PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE
-- ENSURE your query has a semicolon (;) at the end of this answer


/*
    Q8
*/
-- PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE
-- ENSURE your query has a semicolon (;) at the end of this answer


/*
    Q9
*/
-- PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE
-- ENSURE your query has a semicolon (;) at the end of this answer


/*
    Q10
*/
-- PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE
-- ENSURE your query has a semicolon (;) at the end of this answer

