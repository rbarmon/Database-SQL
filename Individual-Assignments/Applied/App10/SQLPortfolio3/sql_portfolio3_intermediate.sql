/*Comment out SET ECHO and SPOOL commands before submitting your portfolio*/
--SET ECHO ON
--SPOOL sql_portfolio3_intermediate_output.txt

/*****PLEASE ENTER YOUR DETAILS BELOW*****/
/*sql_portfolio3_intermediate.sql*/

/*Student ID: 31165176*/
/*Student Name: Rian Barrett*/
/*Unit Code: FIT2094*/
/*Applied Class No: A02*/

/*1*/
/* PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE*/
/* ENSURE that your query is formatted and has a semicolon*/
/* (;) at the end of this answer*/

SELECT
    p.prop_no,
    prop_address,
    COUNT(rent_agreement_no) AS number_of_rents
FROM
         rent.property p
    JOIN rent.rent r
    ON p.prop_no = r.prop_no
WHERE
    to_char(rent_lease_start, 'yyyy') = '2020'
    OR to_char(rent_lease_start, 'yyyy') = '2021'
GROUP BY
    p.prop_no,
    prop_address
HAVING
    COUNT(*) > 2
ORDER BY
    number_of_rents DESC,
    prop_no;

/*2*/
/* PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE*/
/* ENSURE that your query is formatted and has a semicolon*/
/* (;) at the end of this answer*/


SELECT
    p.prop_no,
    prop_address,
    COUNT(maint_id)        AS number_of_maintenance,
    '$' || SUM(maint_cost) AS total_maint_cost,
    '$' || MAX(maint_cost) AS max_maint_cost
FROM
         rent.property p
    JOIN rent.maintenance m
    ON p.prop_no = m.prop_no
WHERE
    to_char(maint_datetime, 'yyyy') = '2022'
GROUP BY
    p.prop_no,
    prop_address
ORDER BY
    number_of_maintenance DESC,
    prop_no;


--Comment out SET ECHO and SPOOL commands before submitting your portfolio
--SPOOL OFF
--SET ECHO OFF