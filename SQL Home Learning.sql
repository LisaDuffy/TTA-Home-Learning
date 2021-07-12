CREATE DATABASE vaccines;

USE vaccines; 

CREATE TABLE patient_details(
NHS_number INT NOT NULL UNIQUE,
first_name VARCHAR (20) NOT NULL, 
last_name VARCHAR (20) NOT NULL, 
date_of_birth DATE NOT NULL,
post_code CHAR (8) NOT NULL, 
PRIMARY KEY (NHS_number)
);

EXPLAIN patient_details;

CREATE TABLE vaccine_details(
batch_no CHAR(8) NOT NULL UNIQUE,
vaccine_name VARCHAR (20) NOT NULL, 
manufacturer VARCHAR (20) NOT NULL, 
date_of_manufacture DATE NOT NULL,
PRIMARY KEY (batch_no)
);

EXPLAIN vaccine_details;

CREATE TABLE vaccinations(
batch_no CHAR(8) NOT NULL,
NHS_number INT NOT NULL, 
vaccine_date DATE NOT NULL, 
PRIMARY KEY (batch_no, NHS_number)
);

EXPLAIN vaccinations;

INSERT INTO patient_details (NHS_number, first_name, last_name, date_of_birth, post_code)
VALUES ('12345678','Mary','Smith','1996-03-24','B87 5GX'),
('34567890','Luke','Page','1966-09-12','SW1 2HB'),
('87625414','Jenny','Page','1971-02-09','SW1 2HB'),
('58974123','Jed','Todd','2002-10-21','	PL8 9YB'),
('74563145','Kate','Marley','1987-05-12','NW2 9UQ'),
('47986321','John','Sanders','152-08-16','B91 5EJ'),
('65241789','Luke','Marley','2003-04-17','KW44 6RQ'),
('15896342','Emma','Reid','1997-11-10','CD4 4NM'),
('16528748','Emily','Moon','1988-12-05','B96 5YX'),
('65789127','Ted','Mann','1955-11-09','KX6 7RZ');

SELECT * FROM patient_details; 

INSERT INTO vaccine_details (batch_no, vaccine_name, manufacturer, date_of_manufacture)
VALUES ('123456', 'Pfizer/BioNTech','USA', '2020-09-20'),
('543789', 'Pfizer/BioNTech','USA', '2020-10-20'),
('678901', 'Pfizer/BioNTech','USA', '2021-03-01'),
('M90876', 'Moderna','Germany', '2020-09-11'),
('M90877', 'Moderna','Germany', '2020-09-22'),
('OX8976', 'Oxford/AstraZeneca','England', '2021-05-02'),
('OX56760', 'Oxford/AstraZeneca','England', '2021-06-30'),
('OX1976', 'Oxford/AstraZeneca','England', '2020-05-02');

SELECT * FROM vaccine_details;

ALTER TABLE vaccinations
ADD FOREIGN KEY (batch_no) REFERENCES vaccine_details(batch_no);

ALTER TABLE vaccinations
ADD FOREIGN KEY (NHS_number) REFERENCES patient_details(NHS_number);

INSERT INTO vaccinations (batch_no, NHS_number, vaccine_date)
VALUES ('M90877', '74563145', '2021-04-05'),
('M90877', '16528748', '2021-06-17'),
('OX8976', '74563145', '2021-03-23'),
('OX56760', '47986321', '2021-05-16'),
('123456', '16528748', '2021-04-05'),
('123456', '65241789', '2021-04-05'),
('678901', '16528748', '2021-06-28');

SELECT * FROM vaccinations;

UPDATE patient_details 
SET date_of_birth = '1952-08-16'
WHERE NHS_number = '47986321';

SELECT * FROM patient_details WHERE NHS_number = '47986321';

DELETE FROM vaccine_details WHERE batch_no = 'OX1976';

SELECT * FROM vaccine_details;

SELECT patient_details.last_name, patient_details.date_of_birth, vaccinations.vaccine_date
FROM vaccinations
INNER JOIN patient_details
ON patient_details.NHS_number = vaccinations.NHS_number;

SELECT * FROM patient_details
WHERE post_code = 'SW1 2HB';

SELECT patient_details.first_name, patient_details.last_name, vaccine_details.vaccine_name, vaccinations.vaccine_date
FROM vaccinations
INNER JOIN patient_details ON patient_details.NHS_number = vaccinations.NHS_number
INNER JOIN vaccine_details ON vaccine_details.batch_no = vaccinations.batch_no;

SELECT * FROM patient_details
ORDER BY last_name, date_of_birth; 

SELECT * FROM patient_details
WHERE date_of_birth < '2000-01-01';

-- DROP DATABASE vaccines;
