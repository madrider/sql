//4
//1
select s.staff_name,d.dept_code,d.design_name,s.staff_sal from staff_masters s join department_masters d on s.dept_code=d.dept_code where s.STAFF_SAL>20000;
//2
select s.staff_name,d.dept_code,d.design_name from staff_masters s join department_masters d on s.dept_code=d.dept_code where d.dept_code<>10 AND s.staff_name like '%A%' ;
//3

select * from STAFF_MASTERS;
INSERT ALL
      INTO MANAGER_MASTERS values(1004,'Kadhu',25000)
      INTO MANAGER_MASTERS values(1003,'Potter',43134)
SELECT * FROM DUAL;
select * from MANAGER_MASTERS;
select s.staff_code as Staff#,s.staff_name as Staff,dd.design_name as staff# ,s.MGR_CODE as mgr#,() as manager 
from staff_masters s join department_masters dd on s.DEPT_CODE = dd.DEPT_CODE;

select * from DESIGNATION_MASTERS,;
select s.STAFF_CODE staff#,s.STAFF_NAME STAFF,d.DESIGN_NAME,s.MGR_CODE Mgr#,m.STAFF_NAME Manager from staff_masters s, STAFF_MASTERS m,DEPARTMENT_MASTERS d where s.DEPT_CODE = d.DEPT_CODE AND s.MGR_CODE=m.STAFF_CODE;







//4

select ss.STUDENT_CODE,s.STUDENT_NAME,d.DESIGN_NAME,ss.SUBJECT1,ss.SUBJECT2,ss.SUBJECT3 
from  "Student_Masters Table" s join STUDENT_MARKS ss on ss.STUDENT_CODE = s.STUDENT_CODE join Department_Masters d on s.dept_code=d.dept_code 
where d.DEPT_CODE IN(10,20) AND ss.SUBJECT1>60 AND ss.SUBJECT2>60 AND ss.SUBJECT3>60 ;
//5
select s.STUDENT_CODE,s.STUDENT_NAME,b.BOOK_CODE,bb.BOOK_NAME 
from "Student_Masters Table" s join BOOK_TRANSACTIONS b on s.STUDENT_CODE=b.STUDENT_CODE join book_masters bb on bb.BOOK_CODE=b.BOOK_CODE join Department_Masters d on s.dept_code=d.dept_code 
where TO_DATE(b.BOOK_EXPECTED_RETURN_DATE, 'DD-MM-YYYY') = TO_DATE(sysdate,'DD-MM-YYYY');
//6
select s.STAFF_CODE,s.STAFF_NAME,d.DESIGN_NAME,dd.DESIGN_NAME,b.BOOK_CODE,bb.BOOK_NAME,b.BOOK_ISSUE_DATE
from STAFF_MASTERS s join Department_masters d on s.dept_code = d.dept_code join BOOK_TRANSACTIONS b on b.STAFF_CODE=s.STAFF_CODE join book_masters bb on bb.BOOK_CODE=b.BOOK_CODE join designation_masters dd on dd.design_code=s.design_code 
where to_date(b.BOOK_ISSUE_DATE,'DD-MM-YYYY') BETWEEN to_date(sysdate,'DD-MM-YYYY')-30 AND to_date(sysdate,'DD-MM-YYYY');
//7


select distinct m.staff_name,d.DESIGN_NAME,dd.DESIGN_NAME,s.STAFF_NAME 
from staff_masters m,STAFF_MASTERS s,DESIGNATION_MASTERS d,DEPARTMENT_MASTERS dd
where m.DESIGN_CODE=d.DESIGN_CODE AND m.DEPT_CODE=dd.DEPT_CODE 
AND s.DEPT_CODE IN 
(SELECT S.DEPT_code FROM STAFF_MASTERS S,DESIGNATION_MASTERS D WHERE S.DESIGN_CODE = D.DESIGN_CODE AND LOWER(D.DESIGN_NAME)='head of department') 
AND m.DEPT_CODE IN 
(SELECT S.DEPT_code FROM STAFF_MASTERS S,DESIGNATION_MASTERS D WHERE S.DESIGN_CODE = D.DESIGN_CODE AND LOWER(D.DESIGN_NAME)='head of department') 
AND m.DESIGN_CODE<>
(SELECT S.DESIGN_CODE FROM STAFF_MASTERS S,DESIGNATION_MASTERS D where S.DESIGN_CODE = D.DESIGN_CODE AND LOWER(D.DESIGN_NAME)='head of department')
AND s.DESIGN_CODE IN
(SELECT S.DESIGN_CODE FROM STAFF_MASTERS S,DESIGNATION_MASTERS D where S.DESIGN_CODE = D.DESIGN_CODE AND LOWER(D.DESIGN_NAME)='head of department');
UPDATE STAFF_MASTERS SET DEPT_CODE=40 WHERE DEPT_CODE =20;
//8
select s.STUDENT_CODE "Student Code",s.STUDENT_NAME"Student name",d.DESIGN_NAME "Department Name",(m.SUBJECT1+m.SUBJECT2+m.SUBJECT3)"Total Marks",ss.staff_name "Staff Name" 
from "Student_Masters Table" s,STUDENT_MARKS m,DEPARTMENT_MASTERS d,STAFF_MASTERS ss,DESIGNATION_MASTERS dd
where s.STUDENT_CODE=m.STUDENT_CODE 
AND s.DEPT_CODE = d.DEPT_CODE 
AND ss.DEPT_CODE = s.DEPT_CODE 
and ss.DEPT_CODE=d.DEPT_CODE 
and dd.DESIGN_CODE=ss.DESIGN_CODE 
AND ss.DESIGN_CODE=(SELECT S.DESIGN_CODE FROM STAFF_MASTERS S,DESIGNATION_MASTERS D where S.DESIGN_CODE = D.DESIGN_CODE AND LOWER(D.DESIGN_NAME)='head of department');

select * from "Student_Masters Table";
UPDATE "Student_Masters Table" set dept_code=40 where dept_code is null;
//9
select s.STAFF_CODE "staff code",s.STAFF_NAME "staff name",d.DESIGN_NAME "designation",dd.DESIGN_NAME "department",b.BOOK_CODE "book code",b.BOOK_NAME "book name",b.BOOK_PUB_AUTHOR "author",(TO_DATE(sysdate, 'DD-MM-YYYY')-to_DATE(BOOK_ACTUAL_RETURN_DATE,'DD-MM-YYYY'))*5 as fine
from staff_masters s,designation_masters d,department_masters dd,book_masters b,BOOK_TRANSACTIONS bt
where s.STAFF_CODE = bt.STAFF_CODE
AND s.DEPT_CODE=dd.DEPT_CODE
AND s.DESIGN_CODE =d.DESIGN_CODE
AND bt.BOOK_CODE=b.BOOK_CODE
AND bt.BOOK_ACTUAL_RETURN_DATE is NOT NULL AND to_date(bt.BOOK_ACTUAL_RETURN_DATE,'DD-MM-YYYY')<to_date(sysdate,'DD-MM-YYYY');

select ,to_date(BOOK_ACTUAL_RETURN_DATE,'DD-MM-YYYY') from book_transactions;
//10
select staff_code,staff_name,staff_sal 
from staff_masters 
where staff_sal<(select avg(staff_sal)from STAFF_MASTERS);
//11
select staff_code,staff_name from staff_masters s join designation_masters d on s.design_code=d.design_code where lower(d.design_name) != 'manager';
//12
select BOOK_PUB_AUTHOR,BOOK_NAME 
from BOOK_MASTERS 
where BOOK_PUB_AUTHOR IN(select BOOK_PUB_AUTHOR from BOOK_MASTERS group by BOOK_PUB_AUTHOR having count(BOOK_PUB_AUTHOR)>1);

//13 not sure
select DISTINCT s.staff_code,s.STAFF_NAME,d.DESIGN_NAME
from STAFF_MASTERS s join BOOK_TRANSACTIONS b on b.staff_code=s.staff_code 
join BOOK_MASTERS bb on bb.BOOK_CODE = b.BOOK_CODE
join department_masters d on s.DEPT_CODE = d.DEPT_CODE
where s.STAFF_NAME IN(select s.STAFF_NAME
from STAFF_MASTERS s join BOOK_TRANSACTIONS b on b.staff_code=s.staff_code 
join BOOK_MASTERS bb on bb.BOOK_CODE = b.BOOK_CODE 
group by s.staff_name having count(s.STAFF_NAME)>1); 

select s.staff_code,s.STAFF_NAME,d.DESIGN_NAME
from STAFF_MASTERS s join BOOK_TRANSACTIONS b on b.staff_code=s.staff_code 
join BOOK_MASTERS bb on bb.BOOK_CODE = b.BOOK_CODE
join department_masters d on s.DEPT_CODE = d.DEPT_CODE;

select distinct STAFF_MASTERS.STAFF_CODE,STAFF_MASTERS.STAFF_NAME,BOOK_MASTERS.BOOK_NAME
from STAFF_MASTERS,BOOK_MASTERS,BOOK_TRANSACTIONS order by STAFF_MASTERS.STAFF_CODE
where staff_masters.staff_name IN(select s.staff_name from staff_masters s join);
//14

select s.student_code,s.STUDENT_NAME,d.DESIGN_NAME,ss.SUBJECT1,ss.SUBJECT2,ss.SUBJECT3,(ss.SUBJECT1+ss.SUBJECT2+ss.SUBJECT3) AS TOTAL
from "Student_Masters Table" s,department_masters d,STUDENT_MARKS ss where d.DEPT_CODE=s.DEPT_CODE AND ss.STUDENT_CODE = s.STUDENT_CODE 
GROUP BY s.student_code,s.STUDENT_NAME,d.DESIGN_NAME,ss.SUBJECT1,ss.SUBJECT2,ss.SUBJECT3 
ORDER BY d.DESIGN_NAME,TOTAL desc;

//15 need to look
select s.STAFF_NAME,d.DESIGN_NAME,s.STAFF_SAL 
from STAFF_MASTERS s join  DEPARTMENT_MASTERS d on s.DEPT_CODE = d.DEPT_CODE

having s.STAFF_SAL < (select avg(m.STAFF_SAL)
from STAFF_MASTERS m join  DEPARTMENT_MASTERS d on m.DEPT_CODE = d.DEPT_CODE
group by m.DESIGN_CODE,m.DEPT_CODE);



//16 
select s.STAFF_NAME,d.DESIGN_NAME from staff_masters s,department_masters d,DESIGNATION_MASTERS dd where s.dept_code=d.dept_code AND s.DESIGN_CODE = dd.DESIGN_CODE order by d.DESIGN_NAME;
//17 not sure
select s.STUDENT_CODE,s.STUDENT_NAME 
from "Student_Masters Table" s,DEPARTMENT_MASTERS d,STUDENT_MARKS ss 
where d.DEPT_CODE=s.DEPT_CODE AND ss.STUDENT_CODE = s.STUDENT_CODE AND s.DEPT_CODE=(select dept_code from DEPARTMENT_MASTERS where lower(DESIGN_NAME)  like '%computer%') 
AND ss.SUBJECT1=(select max(s.subject1)from STUDENT_MARKS s,d.);
update DEPARTMENT_MASTERS set design_name='Computer Science' where dept_code=20;
//18

select s.student_code,s.student_name,d.design_name 
from "Student_Masters Table" s,department_masters d 
where s.DEPT_CODE = d.DEPT_CODE AND d.DEPT_CODE =
(select s.DEPT_CODE as p
from "Student_Masters Table" s,department_masters d 
where s.DEPT_CODE = d.DEPT_CODE 
group by s.dept_code,d.DESIGN_NAME 
having count(s.student_code)=(select max(count(s.student_code)) as d
from "Student_Masters Table" s,department_masters d 
where s.DEPT_CODE = d.DEPT_CODE 
group by s.dept_code,d.DESIGN_NAME));

//19
//20 
select STAFF_NAME,count(staff_code) from staff_masters where DEPT_CODE= (select dept_code from staff_masters s join designation_masters d on s.design_code = d.design_code where lower(d.DESIGN_NAME)='manager');
