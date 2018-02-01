//3.1
//16
select round(max(staff_sal))as maximum,round(min(staff_sal)) as minimum,round(sum(staff_sal)) as total,round(avg(staff_sal)) as Average from staff_masters;
//17
select round(max(staff_sal))as maximum,round(min(staff_sal)) as minimum,round(sum(staff_sal)) as total,round(avg(staff_sal)) as Average,d.DESIGN_NAME from staff_masters s join department_masters d on d.dept_code=s.DEPT_CODE group by d.DESIGN_NAME;
//18
select d.DEPT_CODE,d.DESIGN_NAME,count(s.STAFF_CODE)
from staff_masters s join department_masters d on d.dept_code=s.dept_code
GROUP BY d.DESIGN_NAME,d.DEPT_CODE ;
//19
select count(mgr_code)"Total Number of Managers"  from staff_masters;
//20
select s.MGR_CODE,s.STAFF_NAME,min(s.STAFF_SAL) 
from staff_masters s ,DESIGNATION_MASTERS d 
where s.DESIGN_CODE = d.DESIGN_CODE and s.STAFF_SAL>10000 
group  by s.DEPT_CODE, s.STAFF_NAME, s.MGR_CODE,s.STAFF_SAL

order by s.STAFF_SAL DESC;
//alternative solution for 20
select s.mgr_code,s.staff_name,s.STAFF_SAL from staff_masters s 
where s.MGR_CODE= 
(select s.MGR_CODE  
from staff_masters s join designation_masters d on s.design_code=d.design_code 
where lower(d.DESIGN_NAME)='manager')AND staff_sal=
(select min(staff_sal) from (select staff_sal from staff_masters s 
where s.MGR_CODE= 
(select s.MGR_CODE  
from staff_masters s join designation_masters d on s.design_code=d.design_code 
where lower(d.DESIGN_NAME)='manager')AND staff_sal>10000));