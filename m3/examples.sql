-- weaves

-- Joins

-- Here is an inner join. Both key fields must be satisfied.

select e.email_address p.*
from person p 
inner join email_address e 
on p.person_id = e.email_address_person_id;

-- Here is an inner join, from the email addresses to the persons.

select e.email_address, e.email_address_person_id, p.*
from email_address e 
inner join person p
on p.person_id = e.email_address_person_id;

-- Here is a left (outer) join, from the email addresses to the persons.
-- Notice, in the syntax, "left" is the "from" table, the right is the table
-- after "left join". It might help if you think of it as 
-- "from .. left join to ..." or
-- "from .. left join with ... "

-- the order of the "on clause" is not important. It is the order of the "from .."
-- that determines who is left.

-- This will have one partial row.

select e.email_address, e.email_address_person_id, p.*
from email_address e 
left join person p
on p.person_id = e.email_address_person_id;

-- The on clause is a not just special where clause.
-- This produces an inner join even though it is supposed to be
-- a left join.

select e.email_address, e.email_address_person_id, p.*
from email_address e 
left join person p
where p.person_id = e.email_address_person_id;

-- Questions
-- What happens if you don't have an "on" or "where" clause?
