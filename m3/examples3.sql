-- weaves

USE Contacts;
go

-- Try some right joins.
-- These will only work on SQL Server.
-- SQLite does not support right joins.

-- Compare this right join to its left-join version.

-- With left-joins the preposition "from" fits.

-- We should say "from ... make-a-left-join-to ... "

-- But right-join was added after and we should change "from" to "to".

-- We should say "to ... make-a-right-join-from ... "

-- Here's a right outer join of the left outer join version of the ternary join.

select pa.*, p.person_first_name, p.person_last_name, a.address_city
from address a
right outer join person_address pa
on pa.person_address_person_id = a.address_id
right outer join person p
on pa.person_address_address_id = p.person_id

-- You see, it doesn't mention the NULL in the address record.


-- If we right join, but now from person

select pa.*, p.person_first_name, p.person_last_name, a.address_city
from person p
right outer join person_address pa
on pa.person_address_person_id = p.person_id
right outer join address a
on pa.person_address_address_id = a.address_id


-- we see the NULL address record has re-appeared.

/*

So the way a right join differs from a left join is where we start the
searching - ie. what we fix and search from.

With a left join, we start at the top, the grand-parent, fix our
search from there, then the parent and then the child.

With a right join, we start at the bottom, where we fix the child,
then the parent and then the grand-parent.

So left and right joins are exact duals of one another.

Right joins are computationally more expensive. (They have to remember
where they were.) But, if correctly used, they can be faster to
complete because they will make sorting easier. A right join is
implemented using the same mechanism in a database as a left join.

It is very rare that you'll need to use a right-join in preference to
a left-join. You would only notice a difference for very large record
sets with a low incidence of the records you are trying to track down.

*/

/*

Full joins

A full join is a union of a left and a right join. 

[ Note: these joins are not the joins that are duals. 
Left-join(address-person_address-person) is the dual of 
Right-join(person-person_address-address).]

This means we would union the results of 
Left-join(person-person_address-address)
Right-join(person-person_address-address)

With the usual rule for sets that there are no duplicated elements.

However, it is possible 

*/

select pa.*, p.person_first_name, p.person_last_name, a.address_city
from person p
right outer join person_address pa
on pa.person_address_person_id = p.person_id
right outer join address a
on pa.person_address_address_id = a.address_id

select pa.*, p.person_first_name, p.person_last_name, a.address_city
from person p
left outer join person_address pa
on pa.person_address_person_id = p.person_id
left outer join address a
on pa.person_address_address_id = a.address_id

select pa.*, p.person_first_name, p.person_last_name, a.address_city
from person p
full outer join person_address pa
on pa.person_address_person_id = p.person_id
full outer join address a
on pa.person_address_address_id = a.address_id

/*

This data isn't set up to show it, but a full outer join would show you both of these
types of record in one select.

 1. addresses that have no person
 2. persons that have no address.
 
So you very often use full joins to check for "stray" records.
 
*/

/*

Joins inner and outer.

Another peculiarity is that only left joins can be inner.

Right and full joins are always outer.

*/
