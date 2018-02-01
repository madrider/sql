//2
//1
select STUDENT_NAME,to_char(STUDENT_DOB,'MONTH,DD YYYY') from "Student_Masters Table" where to_char(to_date(STUDENT_DOB,'DD/MM/YYYY'),'D')=1 OR to_char(to_date(STUDENT_DOB,'DD/MM/YYYY'),'D')=7;
//2
select staff_name,round(months_between(sysdate,HIRE_DATE)/12) as "Months Worked" from staff_masters order by "Months Worked";
//3
select * from staff_masters where staff_name like 'A%S';
//4
select staff_masters.staff_name,designation_masters.DESIGN_NAME from staff_masters,designation_masters where staff_masters.DESIGN_CODE = designation_masters.DESIGN_CODE and staff_masters.STAFF_NAME like '_N%' or staff_masters.STAFF_NAME like '__N%' AND staff_masters.STAFF_NAME like '%N' or staff_masters.STAFF_NAME like'%S';
//5
select staff_name,lpad(staff_sal,15,'$') from staff_masters;
//6
select staff_name from staff_masters where staff_name like '%/_%' ESCAPE '/';
//7
select * from staff_masters where to_char(to_date(hire_Date,'DD/MM/YYYY'),'MM')=12;
//8
select staff_name,staff_sal,case when staff_sal>=50000 then 'A' when staff_sal>=25000 AND staff_sal<50000 then 'B' when staff_sal>=10000 AND staff_sal<25000 then 'C' else 'D' end "Grade" from staff_masters;
//9
SELECT staff_name,hire_date, to_char(hire_date, 'fmDAY') AS "Day" 
FROM staff_masters
ORDER BY (next_day(hire_date, 'MONDAY') - hire_date) DESC;
//10
select lpad('*',length(staff_name),'*') from staff_masters;
//11
select substr(staff_name,1,1)||lpad('*',length(staff_name)-2,'*')||substr(staff_name,length(staff_name),length(staff_name)) from staff_masters;
//12
select * from staff_masters where to_char(hire_Date,'DD')<15;
//13
SELECT staff_name,hire_date, to_char(hire_date, 'fmDAY') AS "Day" 
FROM staff_masters
ORDER BY (next_day(hire_date, 'MONDAY') - hire_date) DESC;
//14
select instr('Mississippi','i',1,3) from dual;
//15
select to_char(next_day(last_day(sysdate)-7,'Monday'),'DDSPTH MONTH,YYYY') as "PAY DATE" from dual;