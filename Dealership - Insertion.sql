-- Contact Info
--1
insert into contact_info (phone, address, email)
values('(555)-901-1234','333 33rd St SE Someplace WA', 'whodis@notreal.com');

--2
insert into contact_info (phone, address, email)
values ('1-555-678-9101','67 Oval Cir. Nowhere WA', 'whatshisface@notreal.com');

--3
insert into contact_info (phone, address, email)
values ('360-8742', '93567 NW 45th Ave Yonder WA', 'joedawn@notreal.com');

--4
insert into contact_info (phone, address, email)
values ('123-456-1234','P.O. Box #44 Hearnortheir WA', 'qwerty@notreal.com');

--5
insert into contact_info (phone, address, email)
values ('112-358-1321', '3455 Finonacci Dr. Golden WA', 'mostirrational@notreal.com');

--People
insert into person (first_name, last_name, contact_info_id)
values('Hubert','Dison',1);

insert into person (first_name, last_name, contact_info_id)
values('Nemo','Noone',2);

insert into person (first_name, last_name, contact_info_id)
values('Joe','Dawn',3);

insert into person (first_name, last_name, contact_info_id)
values('U.I.','Op',4);

insert into person (first_name, last_name, contact_info_id)
values('Gertrude','Green',5);

--Roles
insert into customer(person_id) values (1);
insert into customer(person_id) values (3);
insert into mechanic(person_id) values (2);
insert into mechanic(person_id) values (3);
insert into salesperson(person_id) values(4);
insert into salesperson(person_id) values(5);

-- Vehicles
insert into vehicle(vin, customer_id, make, model, year)
values ('123456789ABCDEFGH', 1, 'Jupiter', 'Atom', 2022);

insert into vehicle(vin, customer_id, make, model, year)
values ('L00K4TTH1SF4K3V1N', 1, 'Fjord', 'Gemini', 2015);

-- Invoices
insert into invoice (vin, salesperson_id, purchase_date, used, amount)
values('123456789ABCDEFGH',2,'2022-07-05',false,45321.00);

insert into invoice (vin, salesperson_id, purchase_date, used, amount)
values('L00K4TTH1SF4K3V1N',2,'2020-09-25',true,16087.00);

-- Service Ticket
insert into service_ticket (vin, service_date, amount, description)
values ('L00K4TTH1SF4K3V1N','2020-12-13',33.87,
'Tire rotation and realignment'
);

insert into service_ticket (vin, service_date, amount, description)
values ('L00K4TTH1SF4K3V1N','2021-05-09',231.98,
'Replaced spark plugs and fuel injector'
);

--Parts
insert into part( service_ticket_id, part, amount)
values(2, 'Spark plug set for Fjorg Gemini', 55.55);

insert into part( service_ticket_id, part, amount)
values(2, 'Fuel injector for Fjord Gemini', 89.34);

--Work History -- connects mechanics and service tickets in a many to many relationship
insert into work_history(mechanic_id, service_ticket_id)
values (1,1);

insert into work_history(mechanic_id, service_ticket_id)
values (1,2);

insert into work_history(mechanic_id, service_ticket_id)
values (2,2);