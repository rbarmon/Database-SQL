--Comment out SET ECHO and SPOOL commands before submitting your portfolio
--SET ECHO ON
--SPOOL sql_portfolio2_basic_output.txt

--****PLEASE ENTER YOUR DETAILS BELOW****
--sql_portfolio2_basic.sql

--Student ID: 31165176
--Student Name: Rian Barrett
--Unit Code: FIT2094
--Applied Class No: A02


/*1*/
-- PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer

SELECT
    pay_no,
    to_char(pay_date, 'DD Mon YYYY') AS date_paid,
    pay_type,
    paymethod_name,
    tenant_givname,
    tenant_famname
FROM
         rent.payment
    NATURAL JOIN rent.tenant
    NATURAL JOIN rent.paymethod
WHERE
    lower(tenant_famname) LIKE '%d%'
    AND pay_date BETWEEN '2021-01-01' AND '2021-06-30'
ORDER BY
    pay_type,
    pay_date;


/*2*/
-- PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer

SELECT
    maint_id,
    to_char(maint_datetime, 'dd/mm/yyyy hh:mi'),
    '$' || maint_cost AS maint_cost,
    p.prop_no,
    prop_address,
    o.owner_no,
    owner_givname
    || ' '
    || owner_famname  AS owner_fullname
FROM
         rent.maintenance m
    JOIN rent.property p
    ON m.prop_no = p.prop_no
    JOIN rent.owner    o
    ON o.owner_no = p.owner_no
WHERE
    to_char(maint_datetime, 'yyyy') = '2020'
ORDER BY
    maint_cost ASC,
    prop_no;

--Comment out SET ECHO and SPOOL commands before submitting your portfolio
--SPOOL OFF
--SET ECHO OFF