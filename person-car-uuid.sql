create table car (
	car_uid UUID NOT NULL PRIMARY KEY,
	make VARCHAR(100) NOT NULL,
	model VARCHAR(100) NOT NULL,
	price NUMERIC(19, 2) NOT NULL
);

create table person (
    person_uid UUID NOT NULL PRIMARY KEY,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50)  NOT NULL,
	email VARCHAR(150) ,
	gender VARCHAR(7)  NOT NULL,
	date_of_birth DATE  NOT NULL,
	country_of_birth VARCHAR(50)  NOT NULL,
    car_uid UUID REFERENCES car (car_uid),
    UNIQUE(car_uid),
    UNIQUE(email)
);

insert into car (car_uid, make, model, price) values (uuid_generate_v4(), 'Chevrolet', 'LUV', '51299.18');
insert into car (car_uid, make, model, price) values (uuid_generate_v4(), 'Lincoln', 'Navigator', '82567.90');
insert into car (car_uid, make, model, price) values (uuid_generate_v4(), 'Dodge', 'Grand Caravan', '23983.28');
insert into car (car_uid, make, model, price) values (uuid_generate_v4(), 'Kia', 'Sportage', '54364.32');

insert into person (person_uid, first_name, last_name, email, gender, date_of_birth, country_of_birth) 
values (uuid_generate_v4(), 'Garth', 'Agirre', 'gagirre0@salon.com', 'Male', '2019-12-21', 'Mongolia');

insert into person (person_uid, first_name, last_name, email, gender, date_of_birth, country_of_birth) 
values (uuid_generate_v4(),  'Sharla', 'Bond', 'sbond1@blog.com', 'Female', '2020-07-09', 'Japan');

insert into person (person_uid, first_name, last_name, email, gender, date_of_birth, country_of_birth) 
values (uuid_generate_v4(),  'Kay', 'Buzzing', 'kbuzzing2@nifty.com', 'Female', '2020-02-22', 'Jamaica');

insert into person (person_uid, first_name, last_name, email, gender, date_of_birth, country_of_birth) 
values (uuid_generate_v4(),  'Augustina', 'Kincey', 'akincey3@rediff.com', 'Female', '2020-02-26', 'China');
