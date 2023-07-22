/*
Databases Week 10 Applied Class
week10_sql_intermediate.sql

student id: 
student name:
last modified date:

*/

--1
/*1. Find the maximum mark for FIT9136 in semester 2, 2019. */
select * 
from uni.enrolment
where upper(unitcode) = upper('FIT2094')
and ofsemester = 2
and to_char(ofyear, 'yyyy') = '2020';



select Max(enrolmark) 

--order by enrolmark;


--2
/*2. Find the average mark for FIT2094 in semester 2, 2020. Show the average mark with two
decimal places. Name the output column as average_mark. */
select to_char(avg(enrolmark), '999.0') as "average mark"
from uni.enrolment
where upper(unitcode) = upper('FIT2094')
and ofsemester = 2
and to_char(ofyear, 'yyyy') = '2020'
order by enrolmark desc;

--3
/*3. List the average mark for each offering of FIT9136. A unit offering is an instance of a particular unit in a particular semester - for example FIT1045 offered in semester 1 of 2019 - is a unit offering. In the listing, include the year and semester number. Sort the result according to the year then the semester.
 */


--4
/*4. Find the number of students enrolled in FIT1045 in the year 2019, under the following conditions (note two separate selects are required): */
-- a. 
/*a. Repeat students are counted multiple times in each semester of 2019 */

/* */
-- b. Repeat students are only counted once across 2019



--5
/*5. Find the total number of prerequisite units for FIT5145. */



--6
/*
6. Find the total number of enrolments per semester for each unit in the year 2019. The list should include the unit code, semester and the total number of enrolments. Order the list in increasing order of enrolment numbers. For units with the same number of enrolments, display them by the unit code order then by the semester order. */


--7
/*7. Find the total number of prerequisite units for each unit. In the list, include the unit code for which the count is applicable. Order the list by unit code. */


--8
/*8. Find the total number of students whose marks are being withheld (grade is recorded as WH) for each unit offered in semester 2 2020. In the listing include the unit code for which the count is applicable. Sort the list by descending order of the total number of students whose marks are being withheld, then by the unit code. */


--9
/*9. For each prerequisite unit, calculate how many times it has been used as a prerequisite (number of times used). In the listing include the prerequisite unit code, the prerequisite unit name and the number of times used. Sort the output by prerequisite unit code. */


--10
/*
10. Display the unit code and unit name of units which had at least 2 students who were granted a deferred exam (grade is recorded as DEF) in semester 2 2021. Order the list by unit code. */



--11
/*11. Find the oldest student/s in FIT9132. Display the student’s id, full name and the date of birth. Sort the list by student id. */


--12
/*12. A unit offering is an instance of a particular unit in a particular semester - for example FIT1045 offered in semester 1 of 2019 - is a unit offering. All unit offerings are listed in the OFFERING table. Find the unit offering/s with the highest number of enrolments for any unit offering which occurred in the year 2019. Display the unit code, offering semester and number of students enrolled in the offering. Sort the list by semester then by unit code. */


--13
/*13. Find all students enrolled in FIT3157 in semester 1, 2020 who have scored more than the average mark for FIT3157 in the same offering. Display the students' name and the mark. Sort the list in the order of the mark from the highest to the lowest then in increasing order of student name. */






