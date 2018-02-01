/****************************************************************************************
* File		: LAB1.txt								*
* Author	: Arun Rajachandar R						*
*****************************************************************************************/
//1
select s.STAFF_NAME as Name,s.STAFF_SAL as salary,s.DEPT_CODE from staff_masters s, DEPARTMENT_MASTERS d, DESIGNATION_MASTERS dd where s.DEPT_CODE = d.DEPT_CODE AND s.DESIGN_CODE = dd.DESIGN_CODE and s.DEPT_CODE IN(20,30,40);
//2
select s.STAFF_NAME as Name,s.STAFF_SAL as salary,s.DEPT_CODE as dept_code,d.DESIGN_NAME as Designation from staff_masters s, DEPARTMENT_MASTERS d, DESIGNATION_MASTERS dd where s.DEPT_CODE = d.DEPT_CODE AND s.DESIGN_CODE = dd.DESIGN_CODE;
//3
select STUDENT_CODE,SUBJECT1,SUBJECT2,SUBJECT3,(subject1+subject2+SUBJECT3) as total_marks from student_marks;
//4

select * from STAFF_MASTERS s join DESIGNATION_MASTERS d on s.DESIGN_CODE = d.DESIGN_CODE join DEPARTMENT_MASTERS dd on s.DEPT_CODE = dd.DEPT_CODE WHERE d.DESIGN_NAME IN ('PROFESSOR','LECTURER');
//5
select s.staff_code as staff_code,s.STAFF_NAME AS NAME,dd.DEPT_CODE as DEPT_CODE  from STAFF_MASTERS s join DESIGNATION_MASTERS d on s.DESIGN_CODE = d.DESIGN_CODE join DEPARTMENT_MASTERS dd on s.DEPT_CODE = dd.DEPT_CODE  where MONTHS_BETWEEN(s.hire_date,sysdate)/12>18;

//6
select s.STAFF_NAME as Name,d.DESIGN_NAME as Designation from STAFF_MASTERS s join DESIGNATION_MASTERS d on s.DESIGN_CODE = d.DESIGN_CODE where s.HIRE_DATE<to_date('JAN-2003','MM-YYYY');
//7
select s.STAFF_NAME as Name,d.DESIGN_NAME AS Designation,s.STAFF_SAL*10*12 as income  from STAFF_MASTERS s join DESIGNATION_MASTERS d on s.DESIGN_CODE = d.DESIGN_CODE;
//8
select staff_name,abs(months_between(hire_date,sysdate)/12) as experience from staff_masters join designation_masters on staff_masters.DESIGN_CODE = designation_masters.DESIGN_CODE where designation_masters.DESIGN_NAME='LECTURER';
//9
select concat(student_name,concat(',',DEPT_CODE))"Student Info" from "Student_Masters Table";
//10
select staff_name,STAFF_SAL from staff_masters where staff_sal between 12000 and 25000 order by STAFF_SAL,STAFF_NAME ASC;
//11
select * from staff_masters where MGR_CODE IS NULL;
//12
select s.STUDENT_NAME,s.DEPT_CODE,s.STUDENT_DOB from STUDENT_MASTERS s join DEPARTMENT_MASTERS d on d.DEPT_CODE=s.DEPT_CODE where s.STUDENT_DOB between TO_DATE('01-01-1981','DD-MM-YYYY') AND TO_DATE('31-03-1983', 'DD-MM-YYYY') order by s.STUDENT_DOB ASC;
//14
select b.* from book_transactions bb join book_masters b on b.book_code=bb.book_code where to_Date(Book_expected_Return_Date,'dd-mm-yyyy')=to_Date(NEXT_DAY(SYSDATE-8, 'Mon'),'dd-mm-yyyy') AND book_actual_return_Date is not null;
//13
select d.DEPT_CODE,sum(s.STAFF_SAL) from department_masters d join staff_masters s on s.DEPT_CODE = d.DEPT_CODE where s.MGR_CODE is null group by d.DEPT_CODE having sum(s.STAFF_SAL)>20000;
//15
select s.STUDENT_NAME,s.DEPT_CODE,s.STUDENT_DOB,nvl(d.DESIGN_NAME,'No department') "Department" from "Student_Masters Table" s join DEPARTMENT_MASTERS d on d.DEPT_CODE=s.DEPT_CODE where s.DEPT_CODE is null;

//16
select STAFF_NAME, STAFF_SAL, rpad('X', STAFF_SAL/1000, 'X') FROM STAFF_MASTERS;
