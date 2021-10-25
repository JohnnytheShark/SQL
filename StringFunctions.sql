-- Functions for Strings

-- Concatenate the columns. Remember you may need to concantenate a space in between
SELECT column1 || column2 FROM tbl1

--Length of the strings
SELECT LENGTH(column1) FROM tbl1 

--Upper Case Words
SELECT UPPER(column1) FROM tbl1 

--Select the first 2 characters on a string. 
SELECT LEFT(column1,2) FROM tbl1

-- SELECT the specified number of characters from the right of a string
SELECT RIGHT(column1,2) FROM tbl2

--Trim the leading and trailing characters from a character string.
SELECT TRIM(BOTH '_' FROM column1) as trimmedcolumn from table1
-- Could always switch Both out for TRAILING or LEADING

-- Removing instances of something with this: 
SELECT Replace(column1, '-','') Frtom tbl2


