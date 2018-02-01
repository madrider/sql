//5
//1
create table previous_products (
pid int,
name varchar(40),
unit varchar(40),
price int,
stock int );

create table current_products (
pid int,
name varchar(40),
unit varchar(40),
price int,
stock int );

insert into previous_products values(7,'Uncle Bob''s Organic Dried Pears','12 - 1 lb
pkgs.',30.00,15);
insert into previous_products values(8,'Northwoods Cranberry Sauce','12 - 12 oz
jars',40.00,6);
insert into previous_products values(1,'Chang','24 - 12 oz bottles',19.00,17);
insert into previous_products values(3,'Aniseed Syrup','12 - 550 ml
bottles',10.00,13);
insert into previous_products values(4,'Chef Anton''s Cajun Seasoning','48 - 6 oz
jars',22.00,53);
insert into previous_products values(5,'Chef Anton''s Gumbo Mix','36
boxes',21.35,0);
insert into previous_products values(6,'Grandma''s Boysenberry Spread','12 - 8 oz
jars',25.00,120);
insert into current_products values(7,'Uncle Bob''s Organic Dried Pears','12 - 1 lb
pkgs.',30.00,15);
insert into current_products values(8,'Northwoods Cranberry Sauce','12 - 12 oz
jars',40.00,6);
insert into current_products values(9,'Mishi Kobe Niku','18 - 500 g pkgs.',97.00,29);
insert into current_products values(10,'Ikura','12 - 200 ml jars',31.00,31);
insert into current_products values(11,'Queso Cabrales','1 kg pkg.',21.00,22);
insert into current_products values(5,'Chef Anton''s Gumbo Mix','36 boxes',21.35,0);
insert into current_products values(6,'Grandma''s Boysenberry Spread','12 - 8 oz
jars',25.00,120);
//1
select * from PREVIOUS_PRODUCTS union select * from CURRENT_PRODUCTS;
//2
select * from PREVIOUS_PRODUCTS union all select * from CURRENT_PRODUCTS;
//3
select * from PREVIOUS_PRODUCTS intersect select * from CURRENT_PRODUCTS;
//4
select * from PREVIOUS_PRODUCTS MINUS  select * from CURRENT_PRODUCTS;
