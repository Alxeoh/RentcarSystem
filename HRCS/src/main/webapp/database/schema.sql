CREATE TABLE client (
client_id varchar(20) primary key,
client_pw varchar(20) not null,
name varchar(20) not null,
reservation_date  timestamp ,
return_date timestamp ,
reg_date timestamp DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE vehicle (
vehicle_id varchar(20) primary key,
Number varchar(15) not null,
Name varchar(20) not null,
Rentalable char(2) not null,
hour_rate int not null
);


CREATE TABLE board (
no int  primary key,
type char(2) not null,
client_id varchar(20),
title varchar(100) not null,
contents varchar(3000) not null,
m_date timestamp DEFAULT CURRENT_TIMESTAMP,
w_date timestamp DEFAULT CURRENT_TIMESTAMP,
foreign key(client_id) references client(client_id)
);

CREATE TABLE booking (
vehicle_id varchar(20),
book_code varchar(20),
client_id varchar(20),
location_id varchar(20),
reservation_date timestamp not null,
return_date timestamp not null,
cost int not null,
reg_date timestamp DEFAULT CURRENT_TIMESTAMP
);