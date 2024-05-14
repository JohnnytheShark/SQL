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

## Functions and Operators
COALESCE function replaces NULL values in a column with a different value.

CAST('2021-02-25' AS DATE); cast tells it is a date

| Aggregate Functions | Numeric Functions | String Functions | Datetime Functions | Null Functions
|---|---|---|---|---|
| Count() | ABS() | LENGTH() | CURRENT_DATE | COALESCE() |
| SUM() | SQRT () | TRIM() | CURRENT_TIME | | 
| AVG() | LOG() | CONCAT() | DATEDIFF() | | 
| MIN() | ROUND() | SUBSTR() | DATEDIFF() | | 
| MAX() | CAST() | REGEXP() | EXTRACT() | |
| | | | CONVERT() | |

Aggregate functions apply calculations to non-null values in a column. Only exception is COUNT(*) which counts all rows including null values. 

You can also aggregate multiple rows into a single list using functions like ARRAY_AGG, GROUP_CONCAT, LISTAGG, and STRING_AGG

Oracle also offers: 
MEDIAN, STATS_MODE,STDDEV

Trimming in MySQL,Oracle, and PostgreSQL: 
TRIM(LEADING ...) and TRIM(Trailing)
Another keyword option is LTRIM and RTRIM

### Concatenating: 
MS SQL, MySQL, and PostgreSQL: 
CONCAT()
Oracle,SQLite,PostgreSQL:
column || - || name

### Operators 
Are symbols or keywords that perform a calculation or comparison.


## Advanced Functions
Case Statement is used to apply if-else logic within a query.
Window Functions Split data into groups, aggregate or order the data within each group, and return a value for each row. 
Pivoting and Unpivoting Turn values in a column into multiple columns or consolidate mulitple columns into a single column (Supported by ORACLE and SQL Server)

ROW_NUMBER OVER (PARTITION BY name ORDER BY month) 
For each name a row number is generated

A window is a group of rowss
The function you want to apply to each window
Other common functions include RANK(),
FIRST_VALUE(),LAG()

OVER This states that you are specifying a window function
PARTITION BY This states how you want to split your data into windows

ORDER BY This states how each window should be sorted

NTH_VALUE(column,number of row)
returns a specific rank number within each window. SQL Server does NOT support NTH_VALUE

LAG to look a certain number of rows behind
LEAD to look ahead



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

## Multiple Tables
Joining Tables - Combine the columns of two tables based on matching rows

Inner Join (Default) specifies that only matching rows should be returned.

LEFT Join - Returns the rows in the left table and the matching rows in the other table

Right Join - Returns the rows in the right table and the matching rows in other table 

Full Outer Join - Returns the rows in both tables

CROSS JOIN returns all cominations of rows in the two tables

### Syntax
USING Shortcut - Use using instead of the ON clause if the names of the columns that youare joining on match 
USING (name)
Natural JOIN Shortcut - Use instead of INNER JOIN if the names of columns that you are joining on match 
states NATURAL JOIN pets;
Self Join Use either the old join or new join syntax to return all combinations of the rows in a table with itself.


Union Operators - Combine rows of two tables based on matching columns

CTE - Temporarily Save the output of a query for another query to reference








