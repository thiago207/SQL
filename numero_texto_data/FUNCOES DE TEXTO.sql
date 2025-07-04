 SELECT 
 	first_name,
	lower(first_name),
	upper(first_name),
	length(first_name),
	initcap(first_name)
FROM employees;




SELECT 
	contact_name,
	contact_title,
	replace(contact_title, 'Owner', 'CEO')
FROM CUSTOMERS;


select
	'ABC-9999',
	left('ABC-9999', 3),
	right('ABC-9999', 4);
	
select
	'ABC-9999',
	substring('ABC-9999', 1, strpos('ABC-9999', '-') - 1),
	substring('ABC-9999', 5, 4),
	strpos('ABC-9999', '-');
	
	
