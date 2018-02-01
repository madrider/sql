//6
//1
create table customer(customerid number(5),customername number(10),address1 varchar(30),address2 varchar2(30));
//2
ALTER table customer modify customername varchar(30) NOT NULL;
//3
alter table customer add( gender varchar2(1),age number(3),phoneno number(10));
//4
insert all
  into customer values(1000, ‘Allen’, ‘/#115 Chicago’, ‘#115 Chicago’, ‘M’, ‘25,
7878776’)
  into customer values(1001, George, /#116 France, #116 France, M, 25, 434524)
  into customer values(1002, Becker, /#114 New York, #114 New York, M, 45, 431525)
select * from dual;
//5
alter table customer add constraint CustId_Prim PRIMARY KEY(CustomerId);
select * from customer;
//6
insert into customer (CUSTOMERID,CUSTOMERNAME,ADDRESS1,ADDRESS2,GENDER,AGE,PHONENO) values(1002, 'John', '#114 Chicago', '#114 Chicago', 'M', 45, 439525);
select * from customer;
//7
alter table customer disable constraint CustId_Prim;
ALTER TABLE CUSTOMER
  MODIFY CUSTOMERNAME CHAR(50);
insert into customer (CUSTOMERID,CUSTOMERNAME,ADDRESS1,ADDRESS2,GENDER,AGE,PHONENO) values(1002, 'Becker', '#114 New York', '#114 New york' , 'M', 45, 431525);
insert into customer (CUSTOMERID,CUSTOMERNAME,ADDRESS1,ADDRESS2,GENDER,AGE,PHONENO) values(1003, 'Nanapatekar', '#115 India', '#115 India' , 'M', 45, 431525);
//8
 alter table customer enable constraint CustId_Prim;
//9
alter table customer drop constraint CustId_Prim;
insert into customer (CUSTOMERID,CUSTOMERNAME,ADDRESS1,ADDRESS2,GENDER,AGE,PHONENO) values(1002, 'Becker', '#114 New York', '#114 New york' , 'M', 45, 15000.50);

insert into customer (CUSTOMERID,CUSTOMERNAME,ADDRESS1,ADDRESS2,GENDER,AGE,PHONENO) values(1003, 'Nanapatekar', '#115 India', '#115 India ', 'M', 45, 20000.50);

//10
truncate table customer;
//11
alter table customer add email varchar2(30);
//12
alter table customer drop column email;
//13
alter table customer add emailid varchar2(30);
//14 
alter table customer set unused column emailid;
//15
alter table customer drop unused columns;
//16
comment on table customer is 'CUSTOMER_DETAILS';
//17
select * from user_tab_columns where table_name='customer';
//18
comment on column customer.phoneno is 'Personal Contact no';
//19
select * from user_col_comments where table_name ='customer';
//20
create table Suppliers as select Customerid,Customername,address1,address2,phoneno from customer;
select customerid as SuppID,CustomerName as Sname,address1 as Addr1,address2 as Addr2,phoneno as contactno from suppliers;
//21
drop table customer;
create table customermaster(customerid number(5),customername varchar2(30) NOT NULL,address1 varchar2(30) NOT NULL, address2 varchar2(30),gender varchar2(1),age number(3),phoneno number(10));
alter table customermaster add constraint custid_pk primary key(customerid);
//22

create sequence s1
start with 1
increment by 1
maxvalue 100
cycle;

create table accountsmaster 
(customerid number(5),
accountnumber number(10,2),
accounttype char(3),
ledgerbalance number(10,2) not null);

alter table accountsmaster add constraint acc_pk primary key(accountnumber);

create or replace trigger seq
before insert on accountsmaster
for each row
begin
  select s1.nextval
  into :new.accountnumber
  from dual;
end;
SELECT * FROM ACCOUNTSMASTER;
//23
alter table accountsmaster add constraint cust_acc foreign key(customerid) references customermaster(customerid);
//24
insert all 
  into customermaster values(1000, 'Allen', '#115 Chicago', '#115 Chicago', 'M', 25, 7878776)
  into customermaster values(1001, 'George',' #116 France', '#116 France', 'M', 25, 434524)
  into customermaster values(1002, 'Becker', '#114 New York', '#114 New York', 'M', 45, 431525)
select * from dual;
//25
alter table accountsmaster add constraint acctype check(ACCOUNTTYPE IN('NRI','IND'));
//26
insert into accountsmaster values(&customerid,&accountnumber,'&accounttype',&ledgerbalance);
select * from accountsmaster;
//27
alter table accountsmaster add constraint bal_check check(ledgerbalance > 5000);
//28
alter table 