-- Display the id, names, and email addresses for the sales people
select salesperson_id, first_name, last_name, email
from salesperson
inner join person
on person.person_id = salesperson.person_id
inner join contact_info
on person.contact_info_id = contact_info.contact_info_id 

-- Find the mechanic that bought a car at the dealership
select first_name, last_name
from mechanic
inner join person
on mechanic.person_id = person.person_id
inner join customer
on mechanic.person_id = customer.person_id

-- Find the salesperson who has never made a sale
select first_name,last_name, count(invoice.salesperson_id)
from person
inner join salesperson
on salesperson.person_id = person.person_id
full join invoice
on salesperson.salesperson_id = invoice.salesperson_id
group by person.first_name, person.last_name
having count(invoice.salesperson_id) = 0

-- list the mechanics that have worked together on the same service ticket

select first_name, last_name
from person
full join mechanic
on mechanic.person_id = person.person_id 
full join work_history
on mechanic.mechanic_id = work_history.mechanic_id
where service_ticket_id = (
	-- find service_ticket that is listed in work history more than once ( once for each mechanic)
	select service_ticket_id
	from work_history
	group by service_ticket_id
	having count(service_ticket_id) > 1
)

