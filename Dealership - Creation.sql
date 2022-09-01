create table contact_info (
	contact_info_id SERIAL primary key,
	phone VARCHAR(15),
	address VARCHAR(150),
	email VARCHAR(320) --maximum size of a legitimate email address
)

create table person (
	person_id SERIAL primary key,
	first_name VARCHAR(100),
	last_name VARCHAR(100),
	contact_info_id INTEGER not null unique,
	foreign key(contact_info_id) references contact_info(contact_info_id)
)

create table customer (
	customer_id SERIAL primary key,
	person_id INTEGER not null unique,
	foreign key(person_id) references person(person_id)
)

create table salesperson (
	salesperson_id SERIAL primary key,
	person_id INTEGER not null unique,
	foreign key(person_id) references person(person_id)
)

create table mechanic (
	mechanic_id SERIAL primary key,
	person_id INTEGER not null unique,
	foreign key(person_id) references person(person_id)
)

create table vehicle (
	vin VARCHAR(17) primary key,
	customer_id INTEGER not null,
	make VARCHAR(50),
	model VARCHAR(50),
	year smallint,
	foreign key(customer_id) references customer(customer_id)
)

create table invoice (
	invoice_id SERIAL primary key,
	vin VARCHAR(17),
	salesperson_id INTEGER not null,
	purchase_date DATE, 
	used BOOLEAN,
	amount NUMERIC(9,2),
	foreign key(vin) references vehicle(vin),
	foreign key(salesperson_id) references salesperson(salesperson_id)
)

create table service_ticket (
	service_ticket_id SERIAL primary key,
	vin VARCHAR(17),
	service_date DATE,
	amount NUMERIC(9,2),
	description VARCHAR(1000),
	foreign key(vin) references vehicle(vin)
)

create table part (
	part_id SERIAL primary key,
	service_ticket_id INTEGER not null,
	part VARCHAR(150),
	amount NUMERIC(7,2),
	foreign key(service_ticket_id) references service_ticket(service_ticket_id)
)

create table work_history (
	mechanic_id INTEGER not null,
	service_ticket_id INTEGER not null,
	foreign key(mechanic_id) references mechanic(mechanic_id),
	foreign key(service_ticket_id) references service_ticket(service_ticket_id)
)