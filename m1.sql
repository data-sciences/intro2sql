/* 

-- weaves

-- We will be using SQLite. 
-- This doesn't have an SQL command to create databases. You 
-- create a database using a tools menu.

CREATE DATABASE Contacts;
USE Contacts;

-- This code creates some tables and put some data into them using standard
-- SQL statements.

-- You will be writing queries against these tables.

-- You don't need to know how or why this code works to begin with.
-- You will need to know eventually.

-- Search for the *section* marker.

*/

-- *section*

-- create and drop
-- these make and delete tables. The word delete is used for records.


-- If the table exists drop it.
drop table if exists address;

-- And then create one. This might look like a function call, but
-- it is actually a schema definition. The "address" part is more like
-- class address {
--   Integer address_id,
--   ..
-- and so on.
-- Notice that String is more or less VARCHAR(55).

-- notice the constraints added at the end.
-- These are like public, static and so on, which, in Java, are at the
-- beginning.

-- These constraints are more specialized.

-- NOT NULL, means a null value cannot be used here.
-- and this check is enforced every time a record is added.

-- In SQL, the NULL value means "the value has not been given".
-- In other languages, the NULL value is specific to the data type.
-- In SAS, the missing value means minus infinity for numbers.

-- Note that constraints can be added to tables. A special constraint
-- is the PRIMARY KEY one. This states that a particular field with be used
-- as the index field. In a bibliography, you might have a key, CODD70,
-- that would refer to the article by Edgar "Ted" Codd, in the ACM in 1970.

-- All the other tables are the same as this in form. At the end of this
-- you'll see how foreign keys could be added.

-- The naming convention used here uses lower-case singular for the tables.
-- fields are lower-case.
-- SQL keywords and datatypes are in upper-case (not necessary.)

-- PK_ is used as a prefix for the primary key and later you will see
-- FK_ is used as a prefix for the foreign key.

CREATE TABLE address(
address_id INTEGER NOT NULL,
address_building_number VARCHAR(55) NOT NULL,
address_street VARCHAR(55) NOT NULL,
address_locality VARCHAR(55),
address_city VARCHAR(55) NOT NULL,
address_zip_postal VARCHAR(55) NOT NULL,
address_state_province_county VARCHAR(55) NOT NULL,
address_country VARCHAR(55) NOT NULL ,

CONSTRAINT PK_address PRIMARY KEY (address_id)

);

drop table if exists email_address;

CREATE TABLE email_address(
email_address_id INTEGER NOT NULL,
email_address_person_id INTEGER,
email_address VARCHAR(55) NOT NULL, 
CONSTRAINT PK_email_address 
PRIMARY KEY (email_address_id )
);

drop table if exists person;

CREATE TABLE person(
person_id INTEGER  NOT NULL,  
person_first_name VARCHAR(55) NOT NULL,
person_last_name VARCHAR(55) NULL,
person_contacted_number INTEGER NOT NULL, 
person_date_last_contacted DATETIME NOT NULL,
person_date_added DATETIME NOT NULL,  
CONSTRAINT PK_person 
PRIMARY KEY (person_id)
);

drop table if exists person_address;

CREATE TABLE person_address(
person_address_id INTEGER NOT NULL,
person_address_person_id INTEGER NOT NULL,
person_address_address_id INTEGER NOT NULL, 
CONSTRAINT PK_person_address 
PRIMARY KEY (person_address_id)
);

drop table if exists phone_number;

CREATE TABLE phone_number(
phone_number_id INTEGER NOT NULL,
phone_number_person_id INTEGER NOT  NULL,
phone_number VARCHAR(55) NOT NULL, 
CONSTRAINT PK_phone_number 
PRIMARY KEY (phone_number_id)
);

/*

-- weaves
-- SQLite doesn't support foreign keys either.

-- *section*

-- With a real database, we would be able to add foreign keys.
-- In SQLite, this is not implemented.
-- When you are able to run your SQL Server system,
-- you should be able to add these constraints.

ALTER TABLE email_address
      ADD  CONSTRAINT FK_email_address_person 
      FOREIGN KEY(email_address_person_id)
      REFERENCES person (person_id);
      
ALTER TABLE person_address
      ADD  CONSTRAINT FK_person_address_address
      FOREIGN KEY(person_address_address_id)
      REFERENCES address (address_id);
	   
ALTER TABLE person_address  
      ADD  CONSTRAINT FK_person_address_person 
      FOREIGN KEY(person_address_person_id)
      REFERENCES person (person_id) ;

ALTER TABLE phone_number   
      ADD  CONSTRAINT FK_phone_number_person 
      FOREIGN KEY(phone_number_person_id)
      REFERENCES person (person_id);

*/

/*

-- weaves

-- *section*

-- This adds data to the table.
-- If the foreign key constraints were in place, you would be 
-- required to fill in the "leaf" tables first and then move inwards.

-- The INSERT INTO statement is very verbose. You have to repeat all the 
-- columns you want insert into and then all the values.

*/

INSERT INTO address (address_id,
address_building_number,
address_street,
address_locality,
address_city,
address_zip_postal,
address_state_province_county,
address_country) VALUES (4,
'555',
'Pluralsight',
NULL,
'San Francisco',
'91001',
'California',
'US');

INSERT INTO address (address_id,
address_building_number,
address_street,
address_locality,
address_city,
address_zip_postal,
address_state_province_county,
address_country) VALUES (1,
'555',
'Pluralsight',
NULL,
'Los Angeles',
'91001',
'California',
'US');

INSERT INTO address (address_id,
address_building_number,
address_street,
address_locality,
address_city,
address_zip_postal,
address_state_province_county,
address_country) VALUES (2,
'555',
'Trainsignal',
NULL,
'Toronto',
'7777',
'Ontario',
'Canada');

INSERT INTO address (address_id,
address_building_number,
address_street,
address_locality,
address_city,
address_zip_postal,
address_state_province_county,
address_country) VALUES (3,
'555',
'Pluralsight',
'Boonies',
'Somewhere',
'11111',
'Maine',
'US');

INSERT INTO email_address (email_address_id,
email_address_person_id,
email_address) VALUES (1,
1,
'jon.flanders@mail.com');

INSERT INTO email_address (email_address_id,
email_address_person_id,
email_address) VALUES (2,
1,
'jonf@anothermail.com');

INSERT INTO email_address (email_address_id,
email_address_person_id,
email_address) VALUES (4,
3,
'fritz@mail.com');

INSERT INTO email_address (email_address_id,
email_address_person_id,
email_address) VALUES (5,
NULL,
'aaron@mail.com');

INSERT INTO person (person_id,
person_first_name,
person_last_name,
person_contacted_number,
person_date_last_contacted,
person_date_added ) VALUES (1,
'Jon',
'Flanders',
5,
'2013-09-14 11:43:31',
'2013-01-14 11:43:31');

INSERT INTO person (person_id,
person_first_name,
person_last_name,
person_contacted_number,
person_date_last_contacted,
person_date_added) VALUES (2,
'Shannon',
'Ahern',
0,
'2013-08-14 11:43:31',
'2013-02-14 11:43:31');

INSERT INTO person (person_id,
person_first_name,
person_last_name,
person_contacted_number,
person_date_last_contacted,
person_date_added) VALUES (3,
'Fritz',
'Onion',
1,
'2013-07-14 11:43:31',
'2013-03-14 11:43:31');

INSERT INTO person_address (person_address_id,
person_address_person_id,
person_address_address_id) VALUES (1,
1,
1);
INSERT INTO person_address (person_address_id,
person_address_person_id,
person_address_address_id) VALUES (3,
2,
1);
INSERT INTO person_address (person_address_id,
person_address_person_id,
person_address_address_id) VALUES (4,
2,
2);
INSERT INTO person_address (person_address_id,
person_address_person_id,
person_address_address_id) VALUES (5,
3,
3);


INSERT INTO phone_number (phone_number_id,
phone_number_person_id,
phone_number) VALUES (1,
1,
'555-1212');
INSERT INTO phone_number (phone_number_id,
phone_number_person_id,
phone_number) VALUES (2,
2,
'555-1213');
INSERT INTO phone_number (phone_number_id,
phone_number_person_id,
phone_number) VALUES (3,
3,
'555-1214');
INSERT INTO phone_number (phone_number_id,
phone_number_person_id,
phone_number) VALUES (4,
3,
'555-1215');

