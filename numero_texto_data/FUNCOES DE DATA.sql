-- datas 

select * from employees;

select 
	first_name,
	birth_date,
	current_date,
	age(birth_date),
	date_part('month', hire_date)
	
from employees;