create table car (
	id BIGSERIAL NOT NULL PRIMARY KEY,
	make VARCHAR(100) NOT NULL,
	model VARCHAR(100) NOT NULL,
	price NUMERIC(19, 2) NOT NULL
);

create table person (
    id BIGSERIAL NOT NULL PRIMARY KEY,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50)  NOT NULL,
	email VARCHAR(150) ,
	gender VARCHAR(7)  NOT NULL,
	date_of_birth DATE  NOT NULL,
	country_of_birth VARCHAR(50)  NOT NULL,
    car_id BIGINT REFERENCES car (id),
    UNIQUE(car_id)
);



insert into car (id, make, model, price) values (1, 'Chevrolet', 'LUV', '51299.18');
insert into car (id, make, model, price) values (2, 'Lincoln', 'Navigator', '82567.90');
insert into car (id, make, model, price) values (3, 'Dodge', 'Grand Caravan', '23983.28');
insert into car (id, make, model, price) values (4, 'Kia', 'Sportage', '54364.32');

insert into person (first_name, last_name, email, gender, date_of_birth, country_of_birth) values ('Garth', 'Agirre', 'gagirre0@salon.com', 'Male', '2019-12-21', 'Mongolia');
insert into person (first_name, last_name, email, gender, date_of_birth, country_of_birth) values ('Sharla', 'Bond', 'sbond1@blog.com', 'Female', '2020-07-09', 'Japan');
insert into person (first_name, last_name, email, gender, date_of_birth, country_of_birth) values ('Kay', 'Buzzing', 'kbuzzing2@nifty.com', 'Female', '2020-02-22', 'Jamaica');
insert into person (first_name, last_name, email, gender, date_of_birth, country_of_birth) values ('Augustina', 'Kincey', 'akincey3@rediff.com', 'Female', '2020-02-26', 'China');
