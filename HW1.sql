Таблица employees

Создать таблицу employees
- id. serial,  primary key,
- employee_name. Varchar(50), not null
Наполнить таблицу employee 70 строками.


create table employees(
id serial primary key,
employee_name Varchar(50) not null
);

insert into employees (employee_name)
values  ('Aaron'),
		('Abbe'),
		('Abbot'),
		('Abdel'),
		('Abdiel'),
		('Abdul'),
		('Abdulla'),
		('Abdullah'),
		('Abe'),
		('Abel'),
		('Abhishek'),
		('Abhner'),
		('Abi'),
		('Abinash'),
		('Abner'),
		('Abraham'),
		('Abram'),
		('Abrasax'),
		('Acar'),
		('Acayib'),
		('Ace'),
		('Achilles'),
		('Achmad'),
		('Acton'),
		('Adair'),
		('Adal'),
		('Adalbert'),
		('Adam'),
		('Adan'),
		('Adar'),
		('Addison'),
		('Adel'),
		('Adelard'),
		('Adelbert'),
		('Ademola'),
		('Aden'),
		('Adhamh'),
		('Adigun'),
		('Adin'),
		('Adir'),
		('Adiv'),
		('Adlai'),
		('Adler'),
		('Adli'),
		('Admon'),
		('Adnan'),
		('Adni'),
		('Adolf'),
		('Adolfo'),
		('Adolph'),
		('Adolpho'),
		('Adolphus'),
		('Adom'),
		('Adon'),
		('Adonis'),
		('Ador'),
		('Adrain'),
		('Adri'),
		('Adrian'),
		('Adriel'),
		('Adrien'),
		('Adrienne'),
		('Aeneas'),
		('Aengus'),
		('Aeron'),
		('Affonso'),
		('Afonso'),
		('Agathon'),
		('Agler'),
		('Agni');	
	
	
	Таблица salary

Создать таблицу salary
- id. Serial  primary key,
- monthly_salary. Int, not null
Наполнить таблицу salary 15 строками:
- 1000
- 1100
- 1200
- 1300
- 1400
- 1500
- 1600
- 1700
- 1800
- 1900
- 2000
- 2100
- 2200
- 2300
- 2400
- 2500

	
	create table salary(
id serial primary key,
monthly_asalary int not null
);

insert into salary (monthly_asalary)
values (1000),
		(1100),
		(1200),
		(1300),
		(1400),
		(1500),
		(1600),
		(1700),
		(1800),
		(1900),
		(2000),
		(2100),
		(2200),
		(2300),
		(2400),
		(2500);
	
	
	
	Таблица employee_salary

Создать таблицу employee_salary
- id. Serial  primary key,
- employee_id. Int, not null, unique
- salary_id. Int, not null
Наполнить таблицу employee_salary 40 строками:
- в 10 строк из 40 вставить несуществующие employee_id

id  employee_id salary_id
1	3			7
2	1			4
3	5			9
4	40			13	
5	23			14
6	11			2
7 	52			10
8	15			13
9	26			4
10	16			1
11	33			7
..	..			..

	
	create table employee_salary(
	id serial primary key,
	employee_id int not null unique,
	salary_id int not null
	);
	
insert into employee_salary (employee_id, salary_id)
		values  (3,7),
				(1,4),
				(5,9),
				(40,13),
				(23,4),
				(11,2),
				(52,10),
				(15,13),
				(26,4),
				(16,1),
				(33,7),				
				(12,13),
				(13,5),
				(14,1),
				(17,15),
				(18,14),
				(19,7),
				(20,6),
				(21,5),
				(22,4),
				(24,14),
				(25,13),
				(27,11),
				(28,10),
				(29,9),
				(30,8),
				(31,10),
				(32,6),
				(34,5),
				(35,3),
				(36,2),
				(37,13),
				(38,4),
				(39,14),
				(41,13),
				(42,11),
				(43,5),
				(44,8),
				(45,5),
				(46,11);
				

Таблица roles

Создать таблицу roles
- id. Serial  primary key,
- role_name. int, not null, unique
Поменять тип столба role_name с int на varchar(30)
Наполнить таблицу roles 20 строками:
id			role_name
1			Junior Python developer
2			Middle Python developer
3			Senior Python developer
4			Junior Java developer
5			Middle Java developer	
6			Senior Java developer
7			Junior JavaScript developer
8			Middle JavaScript developer
9			Senior JavaScript developer
10			Junior Manual QA engineer
11			Middle Manual QA engineer
12			Senior Manual QA engineer
13			Project Manager
14			Designer
15			HR
16			CEO
17			Sales manager
18			Junior Automation QA engineer
19			Middle Automation QA engineer
20			Senior Automation QA engineer


			create table roles(
id serial primary key,
role_name int unique not null
);

ALTER TABLE roles ALTER COLUMN role_name TYPE varchar(30);

insert into roles (role_name)
		values  ('Junior Python developer'),
				('Middle Python developer'),
				('Senior Python developer'),
				('Junior Java developer'),
				('Middle Java developer'),
				('Senior Java developer'),
				('Junior JavaScript developer'),
				('Middle JavaScript developer'),
				('Senior JavaScript developer'),
				('Junior Manual QA engineer'),
				('Middle Manual QA engineer'),
				('Senior Manual QA engineer'),
				('Project Manager'),
				('Designer'),
				('HR'),
				('CEO'),
				('Sales manager'),
				('Junior Automation QA engineer'),
				('Middle Automation QA engineer'),
				('Senior Automation QA engineer');
				
			
			
			
Таблица roles_employee

Создать таблицу roles_employee
- id. Serial  primary key,
- employee_id. Int, not null, unique (внешний ключ для таблицы employees, поле id)
- role_id. Int, not null (внешний ключ для таблицы roles, поле id)
Наполнить таблицу roles_employee 40 строками:


id		employee_id		role_id
1		7				2	
2		20				4
3		3				9
4		5				13
5		23				4
6		11				2
7		10				9
8		22				13
9		21				3
10		34				4
11		6				7
..		..				..
			
				
create table roles_employee(
id serial primary key,
employee_id int unique not null, foreign key (employee_id) references  employees(id),
role_id int not null, foreign key (role_id) references  roles(id)
);			
			
insert into roles_employee (employee_id, role_id)			
			values  (7,2),
					(20,4),
					(3,9),
					(5,13),
					(23,4),
					(11,2),
					(10,9),
					(22,13),
					(21,3),
					(34,4),
					(6,7),
					(12,20),
					(13,19),
					(14,18),
					(15,17),
					(16,16),
					(17,15),
					(18,14),
					(19,13),
					(24,12),
					(25,11),
					(26,10),
					(27,9),
					(28,8),
					(29,7),
					(30,6),
					(31,5),
					(32,4),
					(33,3),
					(35,2),
					(36,1),
					(37,2),
					(38,3),
					(39,4),
					(40,5),
					(41,6),
					(42,7),
					(43,8),
					(44,9),
					(45,17);
					
					select * from roles_employee;
	
	drop table roles;

alter table myschema.mytable modify mycolumn varchar2(12);
	delete from employee_salary; 