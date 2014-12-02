
-- weaves

-- The simplest statement is

select 1;

-- I have appended a semi-colon on the end.
-- In the SQLite editor, you can run SQL directly, but it doesn't need
-- semi-colons.

-- Microsoft's "SQL Server" is the other database you will be using.
-- It wants you to use the word "go" to indicate you have finished
-- editting and want to submit a command.

-- You haven't defined a table yet, but one of the key things about SQL
-- is that it expects output from SELECT statements to be tables.

select cast(1 as int) as x, 2 as y, 'Zed' as z;

-- A peculiar thing about SQL is that all the decoration is after the
-- keyword. In Java, you might say
--   int x = 1; // there is an integer called x that has the value 1.
-- in SQL,
--   cast(1 as int) as x // cast 1 as an integer and call it x.

-- Going back to tables and select.

-- That means you can use the output of a select rather that create
-- a temporary table.

-- The temporary table.

create table sample as select 1 as x, 2 as y, 'Zed' as z;
select 1 + x, 1 + y, 'new' || ' ' || z from sample;

-- All in one.

select 1 + x, 1 + y, 'new' || ' ' || z
from (select 1 as x, 2 as y, 'Zed' as z);

-- This latter form is often known as the sub-select and you will see it
-- a lot.

/* 

 The string concatenation operator is ||. This is defined in the standard.
 We'll be working with SQLite for just a short time. Unless you need to
 use it for a specific application, there is no need to learn its extensions
 of the SQL syntax. 

 Needless to say, there are all the usual functions - date arithmetic,
 formatting and arithmetic.

*/

-- You can form multiple rows using union

select 1 as x union select 2 as x




