# SQL Notes Refresher

Syntax varies in each DBMS (Database Management Systems)

## MySQL, PostgreSQL, and SQLite

LIMIT 10

## MS SQL
TOP 10

## Oracle
WHERE ROWNUM <= 10

## Access
Read and Write typically means CRUD operations and hold titles of database admin (DBA) or database engineer

Read Access only = data analyst or data scientist

## Memorize SQL ORDER
mnemonic: Sweaty feet will give horrible odors.

SELECT --columns to display
FROM -- table(s) to pull from
WHERE -- filter rows
GROUP BY --split rows into groups
HAVING --filter grouped rows
ORDER BY --columns to sort

Computers work in this order: 
1. Gather all the data with the FROM
2. FIlters rows of data with the WHERE
3. Groups rows together with the GROUP BY
4. FIlters grouped rows with the HAVING
5. Specifies columns to display with the SELECT
6. Rearranges the results with the ORDER BY

## Data Model
A data model is a visualization that summarizes how all of the tables in a database are related to one another, along with details.

## Default Ports for Databases 
* MySQL: 3306
* Oracle: 1521
* PostgreSQL: 5432
* SQL Server: 1433

SQLite takes a file path to the .db database file you are trying to connect to.

## Exploring SQL with Python
Connecting to a database I've done before, but I haven't explored SQLAlchemy just yet. It is an ORM. 
To-Do: Explore SQLAlchemy

## Sub Flavors of SQL 
Oracle has procedural language SQL (PL/SQL)
SQL Server has transact SQL (T-SQL)

## American National Standards Institute (ANSI)
While some aim to be fully ANSI compliant, they are all just partially ANSI compliant.

## Subqueries 
A subquery is a query that is nested inside another. 
It will either be noncorrelated versus correlated subquery
Noncorrelated (Independent) is preferred as it does not slow down performance.

A subquery within the FROM clause is also known as a derived table because the subquery ends up essentially acting like a table for the duration of the query.

Alternative to Subquery is CTE (Common table expressions).
Advantages to CTE is that the subquery is named up front, which makes for cleaner code and also the ability to reference the subquery multiple times.

## Optimization
Joins Typically execute faster than subqueries
Write Working Code First, Then Optimize it

## WHERE vs HAVING
Filtering on columns then WHERE
FIltering on aggregations then HAVING

## Functions
COALESCE function replaces NULL values in a column with a different value.

## Creating Tables 
Something I didn't realize until now is that we can set default values when creating a table using DEFAULT keyword:
CREATE TABLE myTable(
    country VARCHAR(2) DEFAULT 'CA'
)
Restricting values we can do the following: 
country VARCHAR(2) CHECK (country IN ('CA','US'))

## Indexes 
Indexes are used to search through data quite often. 
It is ideal to create an index that you often filter on. 

CREATE INDEX nameOfIndex ON tableName('column_name');

May take a long time to create, but it is a onetime task that's worth it in the long run for faster queries.

Multicolumn INdex (Composite Index) are allowed.

Need CREATE privileges to create an index.

Dropping an index: 
DROP INDEX indexName

## VIEWS
DBAs create views to restrict access to tables. 
You can also create views based on complex queries that you plan on reusing in the future. 

CREATE VIEW viewName AS (query here)

## Transactions
Transaction allows you to more safely update a database. IT consists of a sequence of operations that are executed as a single unit.
START TRANSACTION;
CHANGES HERE

COMMIT;

If something looks wrong you can do a ROLLBACK which allows you to return to before the stages where made.

Based on your SQL you may need to use the word BEGIN;









