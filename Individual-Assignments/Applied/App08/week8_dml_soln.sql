/*
Databases Week 8 Applied Sample Solution
week8_dml_soln.sql

Databases Units
Author: FIT Database Teaching Team
License: Copyright Monash University, unless otherwise stated. All Rights Reserved.
COPYRIGHT WARNING
Warning
This material is protected by copyright. For use within Monash University only. NOT FOR RESALE.
Do not remove this notice. 
*/

---==8.2.1 INSERT==--
/*1. Write SQL INSERT statements to add the data into the specified tables */
INSERT INTO student VALUES (
    11111111,
    'Bloggs',
    'Fred',
    to_date('01-Jan-2003','dd-Mon-yyyy')
);

INSERT INTO student VALUES (
    11111112,
    'Nice',
    'Nick',
    to_date('10-Oct-2004','dd-Mon-yyyy')
);

INSERT INTO student VALUES (
    11111113,
    'Wheat',
    'Wendy',
    to_date('05-May-2005','dd-Mon-yyyy')
);

INSERT INTO student VALUES (
    11111114,
    'Sheen',
    'Cindy',
    to_date('25-Dec-2004','dd-Mon-yyyy')
);

INSERT INTO unit VALUES (
    'FIT9999',
    'FIT Last Unit'
);

INSERT INTO unit VALUES (
    'FIT9132',
    'Introduction to Databases'
);

INSERT INTO unit VALUES (
    'FIT9161',
    'Project'
);

INSERT INTO unit VALUES (
    'FIT5111',
    'Student''s Life'
);



INSERT INTO enrolment VALUES (
    11111111,
    'FIT9132',
    2020,
    '1',
    35,
    'N'
);

INSERT INTO enrolment VALUES (
    11111111,
    'FIT9161',
    2020,
    '1',
    61,
    'C'
);

INSERT INTO enrolment VALUES (
    11111111,
    'FIT9132',
    2020,
    '2',
    42,
    'N'
);

INSERT INTO enrolment VALUES (
    11111111,
    'FIT5111',
    2020,
    '2',
    76,
    'D'
);

INSERT INTO enrolment VALUES (
    11111111,
    'FIT9132',
    2021,
    '1',
    NULL,
    NULL
);

INSERT INTO enrolment VALUES (
    11111112,
    'FIT9132',
    2020,
    '2',
    83,
    'HD'
);

INSERT INTO enrolment VALUES (
    11111112,
    'FIT9161',
    2020,
    '2',
    79,
    'D'
);

INSERT INTO enrolment VALUES (
    11111113,
    'FIT9132',
    2021,
    '1',
    NULL,
    NULL
);

INSERT INTO enrolment VALUES (
    11111113,
    'FIT5111',
    2021,
    '1',
    NULL,
    NULL
);



/*
  A different approach to inserting is illustrated below by using a list of
  the attributes you which to insert, any not listed will be made null.

  This approach is also useful if the data you have contains the attributes in a
  different order (for example you are working with data from another source) - the
  attributes are simply listed in the order they appear in the data itself

*/

INSERT INTO enrolment (stu_nbr, unit_code, enrol_year, enrol_semester) VALUES (
    11111114,
    'FIT9132',
    2021,
    '1'
);
INSERT INTO enrolment (stu_nbr, unit_code, enrol_year, enrol_semester) VALUES (
    11111114,
    'FIT5111',
    2021,
    '1'
);

COMMIT;

---==8.2.2 INSERT using SEQUENCEs ==--
/*1. Create a sequence for the STUDENT table called STUDENT_SEQ */
DROP SEQUENCE student_seq;

CREATE SEQUENCE student_seq START WITH 11111115 INCREMENT BY 1;

SELECT
    *
FROM
    cat;
-- cat refers to your Oracle catalogue, the objects which you own

/*2. Add a new student (MICKEY MOUSE) */

INSERT INTO student VALUES (
    student_seq.NEXTVAL,
    'Mouse',
    'Mickey',
    to_date('03-Feb-2004','dd-Mon-yyyy')
);

SELECT
    *
FROM
    student;

-- Add an enrolment

INSERT INTO enrolment VALUES (
    student_seq.CURRVAL,
    'FIT9132',
    2021,
    '1',
    NULL,
    NULL
);

COMMIT;

SELECT
    *
FROM
    enrolment;

---==8.2.3 Advanced INSERT==--
/*1. A new student has started a course and needs to enrol into "Introduction to databases".
 Enter the new student's details and his/her enrollment to the database using the sequence 
 in combination with a SELECT statement. You can make up details of the new student and 
 when they will attempt "Introduction to databases". */
 
INSERT INTO student VALUES (
    student_seq.NEXTVAL,
    'Last',
    'First',
    to_date('01-Jan-2005','dd-Mon-yyyy')
);

INSERT INTO enrolment VALUES (
    student_seq.CURRVAL,
    (
        SELECT
            unit_code
        FROM
            unit
        WHERE
            unit_name = 'Introduction to Databases'
    ),
    2021,
    '1',
    NULL,
    NULL
);

COMMIT;

SELECT
    *
FROM
    student;

SELECT
    *
FROM
    enrolment;

---==8.2.4 Creating a table and inserting data as a single SQL statement==--
/*1. Create a table called FIT5111_STUDENT. The table should contain all enrolments for the 
unit FIT5111 */
DROP TABLE fit5111_student;

CREATE TABLE fit5111_student
    AS
        SELECT
            *
        FROM
            enrolment
        WHERE
            unit_code = 'FIT5111';

COMMENT ON COLUMN fit5111_student.stu_nbr IS
    'Student number';

COMMENT ON COLUMN fit5111_student.unit_code IS
    'Unit code';

COMMENT ON COLUMN fit5111_student.enrol_year IS
    'Enrolment year';

COMMENT ON COLUMN fit5111_student.enrol_semester IS
    'Enrolment semester';

COMMENT ON COLUMN fit5111_student.enrol_mark IS
    'Enrolment mark (real)';

COMMENT ON COLUMN fit5111_student.enrol_grade IS
    'Enrolment grade (letter)';
 
/*2. Check the table exists */

SELECT
    *
FROM
    cat;

/*3. List the contents of the table */

SELECT
    *
FROM
    fit5111_student;

---==8.2.5 UPDATE==--
/*1. Update the unit name of FIT9999 from 'FIT Last Unit' to 'place holder unit'.*/
SELECT
    *
FROM
    unit;

UPDATE unit
SET
    unit_name = 'place holder unit'
WHERE
    upper(unit_code) = 'FIT9999';

COMMIT;

SELECT
    *
FROM
    unit;

/*2. Enter the mark and grade for the student with the student number of 11111113 
for the unit code FIT9132 that the student enrolled in semester 1 of 2021. 
The mark is 75 and the grade is D.*/
SELECT
    *
FROM
    enrolment;

UPDATE enrolment
SET
    enrol_mark = 75,
    enrol_grade = 'D'
WHERE
        stu_nbr = 11111113
    AND enrol_semester = '1'
    AND enrol_year = 2021
    AND upper(unit_code) = 'FIT9132';

COMMIT;

SELECT
    *
FROM
    enrolment;

/*3. The university introduced a new grade classification scale. 
The new classification are:
0 - 44 is N
45 - 54 is P1
55 - 64 is P2
65 - 74 is C
75 - 84 is D
85 - 100 is HD
Change the database to reflect the new grade classification scale.
*/

SELECT
    *
FROM
    enrolment;

UPDATE enrolment
SET
    enrol_grade = 'N'
WHERE
        enrol_mark >= 0
    AND enrol_mark <= 44;

UPDATE enrolment
SET
    enrol_grade = 'P1'
WHERE
        enrol_mark >= 45
    AND enrol_mark <= 54;

UPDATE enrolment
SET
    enrol_grade = 'P2'
WHERE
        enrol_mark >= 55
    AND enrol_mark <= 64;

UPDATE enrolment
SET
    enrol_grade = 'C'
WHERE
        enrol_mark >= 65
    AND enrol_mark <= 74;

UPDATE enrolment
SET
    enrol_grade = 'D'
WHERE
        enrol_mark >= 75
    AND enrol_mark <= 84;

UPDATE enrolment
SET
    enrol_grade = 'HD'
WHERE
    enrol_mark >= 85;

COMMIT;

--Alternative solution for Q3
UPDATE enrolment
SET
    enrol_grade =
        CASE
            WHEN enrol_mark BETWEEN 0 AND 44   THEN
                'N'
            WHEN enrol_mark BETWEEN 45 AND 54  THEN
                'P1'
            WHEN enrol_mark BETWEEN 55 AND 64  THEN
                'P2'
            WHEN enrol_mark BETWEEN 65 AND 74  THEN
                'C'
            WHEN enrol_mark BETWEEN 75 AND 84  THEN
                'D'
            WHEN enrol_mark BETWEEN 85 AND 100 THEN
                'HD'
        END;

COMMIT;

SELECT
    *
FROM
    enrolment;

/*4. Due to the new regulation, the Faculty of IT decided to change 'Project' unit code 
from FIT9161 into FIT5161. Change the database to reflect this situation.
Note: you need to disable the FK constraint before you do the modification 
then enable the FK to have it active again.
*/

SELECT
    *
FROM
    unit;

SELECT
    *
FROM
    enrolment;

/* A direct update statement on unit table will return error 
"integrity constraint (AAA.STUDENT_ENROLMENT_FK) violated - child record found".

Thus, you need to use the ALTER TABLE statement to disable 
the FOREIGN KEY constraint first and then enable it back.*/

ALTER TABLE enrolment DISABLE CONSTRAINT unit_enrolment_fk;

UPDATE enrolment
SET
    unit_code = 'FIT5161'
WHERE
    upper(unit_code) = 'FIT9161';

UPDATE unit
SET
    unit_code = 'FIT5161'
WHERE
    upper(unit_code) = 'FIT9161';

COMMIT;

ALTER TABLE enrolment ENABLE CONSTRAINT unit_enrolment_fk;

SELECT
    *
FROM
    unit;

SELECT
    *
FROM
    enrolment;

--==8.2.6 DELETE==--
/*1. A student with student number 11111114 has taken intermission in semester 1 2021, 
hence all the enrolment of this student for semester 1 2021 should be removed. 
Change the database to reflect this situation.*/
SELECT
    *
FROM
    enrolment;

DELETE FROM enrolment
WHERE
        stu_nbr = 11111114
    AND enrol_semester = '1'
    AND enrol_year = 2021;

COMMIT;

SELECT
    *
FROM
    enrolment;

/*2. The faculty decided to remove all 'Student's Life' unit's enrolments. 
Change the database to reflect this situation.
Note: unit names are unique in the database.*/

SELECT
    *
FROM
    enrolment;

DELETE FROM enrolment
WHERE
    unit_code = (
        SELECT
            unit_code
        FROM
            unit
        WHERE
            upper(unit_name) = upper('Student''s Life')
    );

COMMIT;

SELECT
    *
FROM
    enrolment;

/*3. Assume that Wendy Wheat (student number 11111113) has withdrawn from the university. 
Remove her details from the database.*/
SELECT
    *
FROM
    student;

SELECT
    *
FROM
    enrolment;

 
-- this statement will return error "integrity constraint (AAA.STUDENT_ENROLMENT_FK) violated - child record found"
DELETE FROM student
WHERE
    stu_nbr = 11111113;

-- so, child records need to be deleted first and then the parent record:
DELETE FROM enrolment
WHERE
    stu_nbr = 11111113;

DELETE FROM student
WHERE
    stu_nbr = 11111113;

COMMIT;

SELECT
    *
FROM
    student;

SELECT
    *
FROM
    enrolment;

