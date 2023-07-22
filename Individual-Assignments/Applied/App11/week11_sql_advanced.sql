/*
Databases Week 11 Applied Class
week11_sql_advanced.sql

student id: 
student name:
last modified date:

*/
--1
--this is wrong
select unitcode, unitname, to_char(ohyear, 'yyyy')as year, ofsemester, enrolmark,
case upper(enrolgrade) 
when 'N' then 'Fail'
when 'P' then 'Pass'
when 'C' then 'Credit'
when 'D' then 'Distinction'
when 'HD' then 'High Distinction'
from uni.unit u join uni.enrolment e 
on u.unitcode=e.unitcode
join uni.student s on s.stuid = e.stuid
where upper(stufname)=upper('Claudette') and
upper(stulname) = upper('Serman')
order by year, ofsemester, unitcode
;


--2



--3


--4

/* Using outer join */



/* Using set operator MINUS */



/* Using subquery */



--5



--6



--7



--8


    
--9


    
--10







