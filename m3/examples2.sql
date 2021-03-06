-- weaves

USE Contacts;
go

-- Ternary Joins

-- The e-mail address in the previous examples is a simple binary join.

-- Here is an inner join, from the email addresses to the persons.

select e.email_address, e.email_address_person_id, p.*
from email_address e 
inner join person p
on p.person_id = e.email_address_person_id;

-- This will have one partial row.

select e.email_address, e.email_address_person_id, p.*
from email_address e 
left join person p
on p.person_id = e.email_address_person_id;

/*

 The address tables illustrate the ternary join.
 The ternary join is by far the most useful join.
 
 Anything to do with reservations or bookings will be a ternary join.

 Anything that is an item, like a sales order item.

 See the notes in m1.sql, but, generally, it arises when two entities 
 use a third and both are has-N (not just has-A).

 The email address example is simple. Every e-mail address has only one owner.

   person has-N e-mail-address 
   e-mail-address has-A person

 So we only need to link each e-mail-address with each person.

 Note: the person has no link to the e-mail-address in its record. 
 A left join from person to e-mail-address that uses the link.
 You don't even need to literally specify the foreign key.

*/

/*

 The address table is different. A person can have multiple addresses and an 
 address can have multiple occupants.

 person has-N address
 address has-N person

 Because we have done some programming, we could solve this by giving each 
 person record a list of all the addresses they have.

 And give each address a list of persons residing there.

 Problem is that, you would have keep both lists up-to-date. And then,
 relational database design doesn't allow you to have a list (or
 table) that is specific to a record.

 So, we have to use a table. The table contains what are sometimes called link 
 records and, so, the table is sometimes called a link table.

*/

-- From the person_address record point-of-view
-- It is in the centre and we left join to person (to its left) and left join to address (to its right).

select  pa.*, p.person_first_name, p.person_last_name, a.address_city 
from person_address pa
left join person p
on pa.person_address_person_id = p.person_id
left join address a
on pa.person_address_address_id = a.address_id

/* 
 
Note: SQLite has a very relaxed syntax checker. It will allow this

select  pa.*, p.person_first_name, p.person_last_, a.address_city 
from person_address pa
left join person p, address a
on pa.person_address_person_id = p.person_id and 
   pa.person_address_address_id = a.address_id

which would seem to allow you to left-join to two tables simultaneously.

*/

-- From the person point-of-view, the output is the same, but we interpret it
-- differently: Ahern has two addresses.
-- From person, we left-join to person_address and then left join to address.

select  pa.*, p.person_first_name, p.person_last_name, a.address_city
from person p
left join person_address pa
on pa.person_address_person_id = p.person_id 
left join address a
on pa.person_address_address_id = a.address_id

-- From the address point of view, the output is the same, but we interpret it
-- differently: two people are at the Los Angeles office 
-- *and* we finally pick up the NULL address. We have an address in San Francisco 
-- where no-one lives.

-- On SQL Server use the query execution planner to see this. Type Ctrl-M and then execute the query.
-- You should see a new tab in results: "Execution Plan". 

select pa.*, p.person_first_name, p.person_last_name, a.address_city
from address a
left join person_address pa
on pa.person_address_person_id = a.address_id
left join person p
on pa.person_address_address_id = p.person_id

/*

Join syntax is hard to understand. Often there are query designers that help, but use phrases like
"each on the left, all on the right".

For left joins, the "from" table is the left-hand-side, you fix the record 
and then you "left join to" the table to the right. 
It then becomes the left table for the next "left join to".

Think of a ternary join as a family tree.

We have the parents in the person table. 
We have their children in the person_address table. 
We have their children in the address table.

When we left join from the person table, we are saying, 
for each grand-parent, find each child, and each of their grand-children.


*/


/* 

Note: SQLite allows other syntax variants all of which are open to interpretation.

-- These are all subtly different but very wrong.

-- You might think that you could explicitly left join to both.
select p.person_first_name, p.person_last_name, a.address_city, 
 pa.*
from person_address pa
left join person p
left join address a
on pa.person_address_person_id = p.person_id and 
   pa.person_address_address_id = a.address_id

-- You might think that you can use two tables on the left and join with one
-- right
select p.person_first_name, p.person_last_name, a.address_city, 
 pa.*
from person p, address a
left join person_address pa
on pa.person_address_person_id = p.person_id and 
   pa.person_address_address_id = a.address_id

*/

/* 

 The ternary join has its own symbol in Entity-Relationship Diagrams.

 The ternary join is called an associative composition in UML class diagrams.

 The example with the addresses is a simple one, there are no attributes other 
 than identity in the link record.

 Imagine the police want to maintain a system with which they can determine 
 who was living with whom at what time.

 The person_address record would now be extended with two additional date fields.
 "from" and "to".

 With this we could now find when two (or more) people lived together.

 
 This becomes a reservation system. Imagine the person is a hospital patient, 
 and the address is a hospital bed, with the "from" and the "to" fields, we can
 book a patient to take a bed in, say, accident and emergency for a night, then 
 to respiratory illnesses for a week, then to pyschiatric for another week.

 
 Changing emphasis, we concentrate on the "beds" and not the "patients" and we 
 have a taxi booking system. Each "bed" is a taxi, that takes many "patients".


 Consider now, a sales ordering system. A customer rings in a sales order and 
 asks to buy some goods from the catalogue.

 sales-order has-N goods each at quantity n
 stock has-N goods at price P and has quantity m

 sales-order-item is the link record, with attribute quantity n


 So the ternary join is very, very common.

*/


