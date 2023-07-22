-- if you want to retrieve data from UNIT table you need to write:
select  unitcode, unitname
from uni.unit;


SELECT
         stuid, stufname, stulname
     FROM
         uni.student
     WHERE
         studob < TO_DATE('30/Apr/1992', 'dd/Mon/yyyy')
     ORDER BY
         stuid;


-- select sysdate from dual;

select to_char (sysdate, 'dd/mm/yyyy') from dual;
select to_char (sysdate, 'dd/mm/yyyy hh:mi:ss pm') from dual;
select to_char (sysdate, 'dd/mm/yyyy hh:mi:ss pm') as "server datetime" from dual;


select to_char(sysdate, 'dd mm yyyy') from dual;

select * from uni.student;

select studob from uni.student;

select to_char(studob, 'dd-mm-yy') as "date of birth" from uni.student;

