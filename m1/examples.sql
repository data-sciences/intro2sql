/* 

 weaves

 Preamble to Introduction to SQL 

*/

/*

* History

** Early Days

Relational databases were developed by IBM in the early 1970's.  The
key contributor was Edgar Codd. The first system was System-R. SQL was
developed from it. System-R went on to be the basis of DB2, which is
still a product.

SQL was developed by Codd first as a data manipulation language DML. He
wanted to explain to other researchers how the database should be behave if you
searched, inserted, deleted and so on.

He then went on to extend SQL to be a data definition language DDL. So
he added a means to specify datatypes and name and columns and,
critically, keys and foreign keys.

It is now usually the case that the DDL is different from the DML. The
eXtended Markup Languages XML use XML Schema Definition. A schema is a
description of the data structure.

A Java class is a schema, an SQL CREATE TABLE statement and a set of
SAS informat statements would all be described  as schema now.


Databases existed before the 1970s but were big flat tables and were
merged together in the way SAS does.

** Emergence of SQL standard

From about the 1990's, companies like Informix, Sybase and Oracle
developed database systems that supported SQL. It was standardized in
1989 and then again in 1992.

SQL does not provide a complete description of how a database would be
created and managed.

So all the manufacturers have developed their own extensions to SQL. 

Sybase sold its database to Microsoft in the 1990's. And Microsoft
renamed it SQL Server.

*** Features and Implementations

Some very capable open-source databases became available. These were
effectively free to use. PostgreSQL is a very complete implementation
and became the basis of Informix's commmercial product. Many small
web-servers use MySQL - a near complete implementation. Most lesser
implementations choose not to implement the rarely used features of
RIGHT-JOIN and FULL-JOIN.

Transaction management is another feature that is often not
implemented. This feature is fundamental to a production database
system. And no-one should consider using a database that does not
support transactions for any commercially important data.

There are some very small implementations used in mobile phones and
browsers.  SQLite and, written entirely in Java, is Derby from Apache.

* Analytics, Transactions, Batches and Locking

Relational databases, and SAS, use record-by-record processing and
this introduces record-locking. A record is locked for update by one,
and only one, process. All the other processes have to wait.

An analytics database is one that is not viable for commercially
important data and so doesn't have to lock data.

Examples are - kdb from kx.com and Vertica from Hewlett-Packard - now
use the vector processing features of modern microprocessors to
process by columns. To avoid locking problems the data is made
read-only, or, equivalently, copy-on-write. These column databases are
also relational databases.

These databases are suitable for analytics. They can handle very fast
data streams. And these are often called, OLAP systems - On-Line
Analytic Processing.

Databases have usually been batch- or transaction- oriented. Usually,
a number of transactions were processed simultaneously, typically
overnight. The banking system would clear cheques like this and
transport part-cleared cheques by post - giving rise to 5 days delay.

Now, some electronic payments (credit cards on chip and PIN) are
processed one-by-one - that is, transaction by transaction.

This latter process is known as OLTP or On-Line Transaction
Processing. Conventional record-locked databases find it difficult to
keep up with high-throughput OLTP.

The performance improvements of columnar databases are so huge, that
they are now being used as commercial systems. Most investment banks
are moving their very slow back-office trade booking systems from
record-locked databases to copy-on-write column-processing
databases. Their liquidity and risk exposures are updated on-line (and
not overnight) and so have more money to move around the market,
increasing turnover and therefore profit.

* Technologies, Distributed Systems and Big Data

A technological advance that has helped is Solid-State Disks
SSD. These are comparable in performance to memory and can write data
in fractions of a microsecond rather than tens of milliseconds.

So very fast transaction systems, like the columnar trading databases,
log all the input data to SSD arrays, so that should a database
process fail, it can be re-run loading it with the logged data.


As disks have gotten faster, they have also gotten
bigger. Large-scale, record-locked, commercial relational databases
can be huge.

Usually, as systems get larger - the question that is posed is "can it
scale?". Record-locked databases become very slow if they are
distributed to handle very large amounts of data. If the database is
made up of two disks in the same machine room, then they can be
updated together in milliseconds. If the two disks are in different
machine rooms, then they may need seconds to be updated together.

So large distributed record-locked databases are rarely used. Some
specialist applications use them. Usually these are slow, batch
processing systems: inter-library loans, inter-hospital medical
records and parts allocation systems.

** Social Media Datasets

Very large data-sets read-only databases for analysis have existed for
decades. Mostly they are scientific: astronomic data, proteins,
genomes, high-energy particle physics. These have been
distributed. The most famous is SETI - the search for
extra-terrestrial intelligence.

A new generation of data has arrived with the World-Wide Web

  - Web-logs, these are kept by routers of HTTP GET commands made by
    users in their domains.

  - Site-hits, these are logs of HTTP GET commands received by a web-site.

  - Analytics reports, a site-hit can be converted to an analytics
    update and can be logged a central collection agency.

  - News feeds - twitter, Facebook and many other social media sites
    can log their output.

The large scientific databases and the web-generated data have
mandated a new generation of technology. Hadoop was designed by Yahoo!
and Google and other major websites have added to the development of databases.

These databases are often not SQL (NoSQL) because they are very often
not relational. They are rarely even SCRUDL (Search Create Read
Update Delete and List).

They have been simplified to just two steps: Map-Reduce. And these two
jobs can be distributed and paralleled across many hosts with many
processes.

Many analysts because of their experience with SQL prefer to work with
large datasets as SQL, so there are products like Hive and Shark.

Another issue is that long batch-jobs running over Big Data is often
out-of-date before it can be used. Because of that, there have been
developments to support data streams with Big Data - Spark and Storm.

There are also hybrid OLAP systems that use a real-time database on
top of an historical one. The real-time database is handling live
streams and using a large read-only database as reference. An example
might be "the historical database reports 20 mentions of 'Blue Star
Airlines' per day by 1pm for day volatility of more than 5%; the
real-time database has reported 10 mentions by 10am, projecting
forward ... ".


*/
