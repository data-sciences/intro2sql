intro2sql
=========

Introduction to SQL scripts for SQLite and SQL Server.

There are a few modules, there is some sample scripts in each.
 m1 m2 m3 m4 m5

Before you can use them, you need to create the sample database. There are
two creation processes: one for SQLite and the other for SQL Server.

To create the demo database, you need to create a database and then import and 
run the script m1.sql

The sqlite/ directory has a script to create and fill the tables for SQLite.

The ssmc/ directory has scripts to create the database and another to create
and fill the tables.

Note SQLite doesn't:
 support foreign keys
 only supports left joins (inner and outer)
and you need to create the database using the menu.
The SQLite system used was the Firefox SQLite extension/add-on.

The SQL Server system was 2008 R2.
