select * from student;

select * from unit;

select * from enrolment;


--Create a sequence for the STUDENT table called STUDENT_SEQ


drop sequence student_seq;


create sequence student_seq start with 11111115 increment by 1;

select * from cat;

--Add a new student (MICKEY MOUSE)

insert into student values (student_seq.nextval, 'Mouse', 'Mickey', to_date('01/01/2002', 'dd/mm/yyyy'));


select * from student;

insert into enrolment values (student_seq.currval, 'FIT9132', 2021, 11, null, null);

select * from enrolment;

commit;


--Advanced INSERT

select unit_code from unit
where unit_name = 'Intrduction to Databases';

insert into student values (student_seq.nextval, 'Mouse', 'Minnie', to_date('01/01/2002', 'dd/mm/yyyy'));
select * from student;

insert into enrolment values (student_seq.currval, 'Introduction to databases', 2021, 11, null, null);

