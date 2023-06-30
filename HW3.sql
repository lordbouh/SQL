1. Вывести всех работников чьи зарплаты есть в базе, вместе с зарплатами.

select employee_name, salary from employees
join salary on employees.id=salary.id
;


2. Вывести всех работников у которых ЗП меньше 2000.

select employee_name, salary from employees
join salary on employees.id=salary.id
where monthly_asalary < 2000;

3. Вывести все зарплатные позиции, но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)
тк работников 70 человек, а зп 15 штук, то надо добавить не существующие позиции в employee_salary c id > 70

insert into employee_salary (employee_id, salary_id)
values (72,14),
		(73,13),
		(74,12),
		(75,11),
		(76,10),
		(77,11);

теперь можно посмотреть позиции зп без работника:	
	
select employee_id,employee_name, salary_id from employee_salary
full join employees on employee_salary.employee_id = employees.id
where employee_name is null
order by employee_id
;

4. Вывести все зарплатные позиции  меньше 2000 но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)

select employee_id,employee_name, salary_id,monthly_asalary from employee_salary
full join employees on employee_salary.employee_id = employees.id
join salary on employee_salary.employee_id = salary.id
where monthly_asalary < 2000
order by employee_id;

5. Найти всех работников кому не начислена ЗП.
В таблице employee_salary salary_id not null, надо либо менять тип данных, либо ставить 0.
Но т.к. 0 это число, то меняем тип.

ALTER TABLE employee_salary ALTER salary_id DROP NOT null;

insert into employee_salary (employee_id,salary_id)
values (78,null),
		(79,null),
		(80,null),
		(81,null),
		(82,null),
		(83,null);

	добавим работников:
	
	insert into employees (employee_name)
values  
		('Pavel'),
		('Elen'),
		('Konstantin'),
		('Alexei'),
		('Mark'),
		('Igor'),
		('Dmitriy'),
		('Eugene'),
		('Paul'),
		('Henry'),
		('Tokoya'),
		('Roman'),
		('Kirill');
	
select employee_name,salary_id from employee_salary
join employees on employee_salary.employee_id = employees.id
where salary_id is null;

 6. Вывести всех работников с названиями их должности.
 
 select employees.id, employee_name, role_name from roles_employee
 full join employees on roles_employee.employee_id = employees.id
 full join roles on roles_employee.role_id = roles.id
 order by employees.id;
 
есть работники без должности.

 7. Вывести имена и должность только Java разработчиков.
 
 select employees.id, employee_name, role_name from roles_employee
 full join employees on roles_employee.employee_id = employees.id
 full join roles on roles_employee.role_id = roles.id
 where role_name like '%Java%'
 order by employees.id;
 
 8. Вывести имена и должность только Python разработчиков.
 
 select employees.id, employee_name, role_name from roles_employee
 full join employees on roles_employee.employee_id = employees.id
 full join roles on roles_employee.role_id = roles.id
 where role_name like '%Python%'
 order by employees.id;
 
 9. Вывести имена и должность всех QA инженеров.
 
 select employees.id, employee_name, role_name from roles_employee
 full join employees on roles_employee.employee_id = employees.id
 full join roles on roles_employee.role_id = roles.id
 where role_name like '%QA%'
 order by employees.id;

 10. Вывести имена и должность ручных QA инженеров.
 
 select employees.id, employee_name, role_name from roles_employee
 full join employees on roles_employee.employee_id = employees.id
 full join roles on roles_employee.role_id = roles.id
 where role_name like '%Manual QA%'
 order by employees.id;
 
 11. Вывести имена и должность автоматизаторов QA
 
 select employees.id, employee_name, role_name from roles_employee
 full join employees on roles_employee.employee_id = employees.id
 full join roles on roles_employee.role_id = roles.id
 where role_name like '%Automation QA%'
 order by employees.id;
 
 12. Вывести имена и зарплаты Junior специалистов
 
 select employees.id, employee_name, role_name, monthly_asalary from roles_employee
 full join employees on roles_employee.employee_id = employees.id
 full join roles on roles_employee.role_id = roles.id
 join salary on roles_employee.employee_id = salary.id
 where role_name like '%Junior%'
 order by employees.id;
 
 13. Вывести имена и зарплаты Middle специалистов
 
  select employees.id, employee_name, role_name, monthly_asalary from roles_employee
 full join employees on roles_employee.employee_id = employees.id
 full join roles on roles_employee.role_id = roles.id
 join salary on roles_employee.employee_id = salary.id
 where role_name like '%Middle%'
 order by employees.id;
 
 14. Вывести имена и зарплаты Senior специалистов
 
 select employees.id, employee_name, role_name, monthly_asalary from roles_employee
 full join employees on roles_employee.employee_id = employees.id
 full join roles on roles_employee.role_id = roles.id
 join salary on roles_employee.employee_id = salary.id
 where role_name like '%Senior%'
 order by employees.id;
 
 15. Вывести зарплаты Java разработчиков
 
 создаём реляционную базу. 
 
 create table roles_salary(
id serial primary key,
id_role int,
id_salary int,
foreign key (id_role) references roles(id),
foreign key (id_salary) references salary(id)
);

    insert into roles_salary(id_role, id_salary)
   values   (1,1),
   			(2,6),
   			(3,16),
   			(4,1),
   			(5,6),
   			(6,16),
   			(7,1),
   			(8,6),
   			(9,16),
   			(10,1),
   			(11,6),
   			(12,16),
   			(13,6),
   			(14,7),
   			(15,8),
   			(16,16),
   			(17,8),
   			(18,1),
   			(19,6),
   			(20,16);
 
вывод зп:

 		
select role_name, monthly_asalary from roles_salary
join roles on roles_salary.id_role = roles.id
join salary on roles_salary.id_role = salary.id
where role_name like '%Java developer%';
   	
   	
   	
 16. Вывести зарплаты Python разработчиков
 
 select role_name, monthly_asalary from roles_salary
join roles on roles_salary.id_role = roles.id
join salary on roles_salary.id_role = salary.id
where role_name like '%Python developer%';
 
 17. Вывести имена и зарплаты Junior Python разработчиков

select employee_name,monthly_asalary from roles_employee
join roles on roles_employee.role_id = roles.id
join salary on roles_employee.role_id = salary.id
join employees on roles_employee.employee_id = employees.id
where role_id = 1;
 
 18. Вывести имена и зарплаты Middle JS разработчиков

select employee_name,monthly_asalary from roles_employee
join roles on roles_employee.role_id = roles.id
join salary on roles_employee.role_id = salary.id
join employees on roles_employee.employee_id = employees.id
where role_id = 8;
 
 19. Вывести имена и зарплаты Senior Java разработчиков
 
select employee_name,monthly_asalary from roles_employee
join roles on roles_employee.role_id = roles.id
join salary on roles_employee.role_id = salary.id
join employees on roles_employee.employee_id = employees.id
where role_id = 6;

 20. Вывести зарплаты Junior QA инженеров

 select role_name,monthly_asalary from roles
 full join salary on roles.id = salary.id
 where role_name like '%Junior%QA%';
 
 21. Вывести среднюю зарплату всех Junior специалистов
 
 select avg(monthly_asalary) as Average_salary from salary
 join roles on salary.id = roles.id
 where role_name like '%Junior%'
 
 
 22. Вывести сумму зарплат JS разработчиков
 
 select sum(monthly_asalary) as sum_salary from salary
 join roles on salary.id = roles.id
 where role_name like '%JavaScript%'
 
 23. Вывести минимальную ЗП QA инженеров
 
 select min(monthly_asalary) as min_salary from salary
 join roles on salary.id = roles.id
 where role_name like '%QA%'
 
 24. Вывести максимальную ЗП QA инженеров
 
 select max(monthly_asalary) as max_salary from salary
 join roles on salary.id = roles.id
 where role_name like '%QA%'
 
 25. Вывести количество QA инженеров
 
 select count(employee_name) count_qa from employees
 join roles on employees.id = roles.id
 join roles_employee on employees.id = roles_employee.employee_id
 where role_name like '%QA%';


 26. Вывести количество Middle специалистов.
 
 select count(employee_name) count_middle from employees
 join roles on employees.id = roles.id
 join roles_employee on employees.id = roles_employee.employee_id
 where role_name like '%Middle%';
 
 27. Вывести количество разработчиков
 
 select count(employee_name) count_developers from employees
 join roles on employees.id = roles.id
 join roles_employee on employees.id = roles_employee.employee_id
 where role_name like '%developer%';
 
 28. Вывести фонд (сумму) зарплаты разработчиков.
 
 select sum(monthly_asalary) foundation_salary from roles_salary
 join roles on roles_salary.id_role = roles.id
 join salary on roles_salary.id_salary = salary.id
 where role_name like '%developer%';
 
 29. Вывести имена, должности и ЗП всех специалистов по возрастанию
 
 select employee_name,role_name,monthly_asalary from roles_employee
 join employees on roles_employee.employee_id = employees.id 
 join roles on roles_employee.role_id = roles.id
 join salary on roles_employee.role_id = salary.id
 order by monthly_asalary;
 
 30. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП от 1700 до 2300
 
  select employee_name,role_name,monthly_asalary from roles_employee
 join employees on roles_employee.employee_id = employees.id 
 join roles on roles_employee.role_id = roles.id
 join salary on roles_employee.role_id = salary.id
 where monthly_asalary>1700 and monthly_asalary<2300
 order by monthly_asalary;
 
 31. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП меньше 2300
 
 select employee_name,role_name,monthly_asalary from roles_employee
 join employees on roles_employee.employee_id = employees.id 
 join roles on roles_employee.role_id = roles.id
 join salary on roles_employee.role_id = salary.id
 where monthly_asalary<2300
 order by monthly_asalary;
 
 32. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП равна 1100, 1500, 2000
 
 select employee_name,role_name,monthly_asalary from roles_employee
 join employees on roles_employee.employee_id = employees.id 
 join roles on roles_employee.role_id = roles.id
 join salary on roles_employee.role_id = salary.id
 where monthly_asalary in (1100, 1500, 2000)
 order by monthly_asalary;
