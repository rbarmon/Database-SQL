/*
Databases Week 8 Applied
week8_dml.sql

student id: 
student name:
last modified date:

*/

/*-==8.2.1 INSERT==--*/
/*1. Write SQL INSERT statements to add the data into the specified tables */
--insert into UNIT

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
    'Students Life '
);

COMMIT;

SELECT   * FROM    unit; 

--insert into STUDENT
insert into student values (11111111, 'Bloggs', 'Fred', to_date('01/Jan/2003', 'dd/mm/yyyy'));
insert into student values (11111112, 'Nice', 'Nick', to_date('10/Oct/2004', 'dd/mm/yyyy'));
insert into student values (11111113, 'Wheat', 'Wendy', to_date('05/May/2005', 'dd/mm/yyyy'));
insert into student values (11111114, 'Sheen', 'Cindy', to_date('25/Dec/2004', 'dd/mm/yyyy'));
COMMIT;

SELECT   * FROM   student; 

--insert into ENROLMENT

--insert into enrolment values (11111111, 'FIT9132', 2020, '1',35, 'N');
--insert into enrolment values (11111111, 'FIT9161', 2020, '1', 61, 'C');
--insert into enrolment values (11111111, 'FIT9132', 2020, '2', 42, 'N');
--insert into enrolment values (11111111, 'FIT5111', 2020, '2', 76, 'D');
--insert into enrolment values (11111111, 'FIT9132', 2021, '1', '', '');
--insert into enrolment values (11111112, 'FIT9132', 2020, '2', 83, 'HD');
--insert into enrolment values (11111112, 'FIT9161', 2020, '2', 79, 'D');
--insert into enrolment values (11111113, 'FIT9132', 2021, '1', '', '');
--insert into enrolment values (11111113, 'FIT5111', 2021, '1', '', '');
--insert into enrolment values (11111114, 'FIT9132', 2021, '1', '', '');
--insert into enrolment values (11111114, 'FIT5111', 2021, '1', null, null);



insert into enrolment values (11111111, 'FIT9132', 2020, '1',35, 'N');
insert into enrolment values (11111111, 'FIT9161', 2020, '1', 61, 'C');
insert into enrolment values (11111111, 'FIT9132', 2020, '2', 42, 'N');
insert into enrolment values (11111111, 'FIT5111', 2020, '2', 76, 'D');
insert into enrolment values (11111111, 'FIT9132', 2021, '1', null, null);
insert into enrolment values (11111112, 'FIT9132', 2020, '2', 83, 'HD');
insert into enrolment values (11111112, 'FIT9161', 2020, '2', 79, 'D');
insert into enrolment values (11111113, 'FIT9132', 2021, '1', null, null);
insert into enrolment values (11111113, 'FIT5111', 2021, '1', null, null);
insert into enrolment values (11111114, 'FIT9132', 2021, '1', null, null);
insert into enrolment values (11111114, 'FIT5111', 2021, '1', null, null);

COMMIT;

SELECT   * FROM   enrolment; 


---==8.2.2 INSERT using SEQUENCEs ==--
/*1. Create a sequence for the STUDENT table called STUDENT_SEQ */

/*2. Add a new student (MICKEY MOUSE) */

-- Add an enrolment

---==8.2.3 Advanced INSERT==--
/*1. A new student has started a course and needs to enrol into "Introduction to databases".
 Enter the new student's details and his/her enrollment to the database using the sequence 
 in combination with a SELECT statement. You can make up details of the new student and 
 when they will attempt "Introduction to databases". */

---==8.2.4 Creating a table and inserting data as a single SQL statement==--
/*1. Create a table called FIT5111_STUDENT. The table should contain all enrolments for the 
unit FIT5111 */

/*2. Check the table exists */

/*3. List the contents of the table */

---==8.2.5 UPDATE==--
/*1. Update the unit name of FIT9999 from 'FIT Last Unit' to 'place holder unit'.*/

/*2. Enter the mark and grade for the student with the student number of 11111113 
for the unit code FIT9132 that the student enrolled in semester 1 of 2021. 
The mark is 75 and the grade is D.*/

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

/*4. Due to the new regulation, the Faculty of IT decided to change 'Project' unit code 
from FIT9161 into FIT5161. Change the database to reflect this situation.
Note: you need to disable the FK constraint before you do the modification 
then enable the FK to have it active again.
*/


--==8.2.6 DELETE==--
/*1. A student with student number 11111114 has taken intermission in semester 1 2021, 
hence all the enrolment of this student for semester 1 2021 should be removed. 
Change the database to reflect this situation.*/

/*2. The faculty decided to remove all 'Student's Life' unit's enrolments. 
Change the database to reflect this situation.
Note: unit names are unique in the database.*/

/*3. Assume that Wendy Wheat (student number 11111113) has withdrawn from the university. 
Remove her details from the database.*/

