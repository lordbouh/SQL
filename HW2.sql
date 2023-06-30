 1. Вывести все поля и все строки.  
    select * from table;  
     
 2. Вывести всех студентов в таблице  
   select student from table;  
   
 3. Вывести только Id пользователей  
   select id from table;  
   
 4. Вывести только имя пользователей  
   select name from table;  
 
 5. Вывести только email пользователей  
   select email from table;  

 6. Вывести имя и email пользователей  
   select name, email from table;  

 7. Вывести id, имя, email и дату создания пользователей  
   select id, email, date_created from table;  

 8. Вывести пользователей где password 12333  
   select username from table  
   where password = '12333';  

 9. Вывести пользователей которые были созданы 2021-03-26 00:00:00  
   select username from table  
   where date_created = '2021-03-26 00:00:00';  

 10. Вывести пользователей где в имени есть слово Анна  
   select username from table  
   where name = 'Anna';  
   
 11. Вывести пользователей где в имени в конце есть 8  
   select username from table
   where name like = '%8';  

 12. Вывести пользователей где в имени в есть буква а  
   select username from table  
   where name like = 'a*';  
   
 13. Вывести пользователей которые были созданы 2021-07-12 00:00:00  
   select username from table  
   where date_created = '2021-07-12 00:00:00';  
   
 14. Вывести пользователей которые были созданы 2021-07-12 00:00:00 и имеют пароль 1m313  
    select username from table  
     where date_created = '2021-07-12 00:00:00' and password = '1m313';  
   
 15. Вывести пользователей которые были созданы 2021-07-12 00:00:00 и у которых в имени есть слово Andrey  
     select username from table  
     where date_created = '2021-07-12 00:00:00' and  name like 'Andrey*';  
   
 16. Вывести пользователей которые были созданы 2021-07-12 00:00:00 и у которых в имени есть цифра 8  
     select username from table  
     where date_created = '2021-07-12 00:00:00' and  name like '8*';  
    
17. Вывести пользователя у которых id равен 110  
     select username from table  
     where id = 110;  
  
  18. Вывести пользователя у которых id равен 153  
    select username from table  
     where id = 153;    
    
19. Вывести пользователя у которых id больше 140  
     select username from table  
     where id > 140;  
      
20. Вывести пользователя у которых id меньше 130  
     select username from table  
     where id < 130;  
  
21. Вывести пользователя у которых id меньше 127 или больше 188  
    select username from table  
    where id < 127 && id > 188;  
  
22. Вывести пользователя у которых id меньше либо равно 137  
    select username from table  
    where id <= 137;  
  
23. Вывести пользователя у которых id больше либо равно 137  
    select username from table  
    where id >= 137;  
  
24. Вывести пользователя у которых id больше 180 но меньше 190  
    select username from table  
    where id < 190 && id > 180;  
  
25. Вывести пользователя у которых id между 180 и 190  
    select username from table  
    where id between 180 and 190;  
  
26. Вывести пользователей где password равен 12333, 1m313, 123313  
    select username from table  
    where password = 12333 or password = '1m313' or password = 123313;  
  
27. Вывести пользователей где created_on равен 2020-10-03 00:00:00, 2021-05-19 00:00:00, 2021-03-26 00:00:00  
    select username from table  
    where created_on = '2020-10-03 00:00:00' or created_on = '2021-05-19 00:00:00' or created_on = '2021-03-26 00:00:00';  
  
28. Вывести минимальный id  
    select min(id) from table;  
  
29. Вывести максимальный.  
    select max(id) from table;  
  
30. Вывести количество пользователей  
    select count(username) from table;  
  
31. Вывести id пользователя, имя, дату создания пользователя. Отсортировать по порядку возрастания даты добавления пользоватлеля.  
    select id, name, date_created from table  
    order by date_created;  
  
32. Вывести id пользователя, имя, дату создания пользователя. Отсортировать по порядку убывания даты добавления пользоватлеля.  
    select id, name, date_created from table  
    order by date_created desc;  
