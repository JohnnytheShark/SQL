-- Always subject to have different syntax in different environments
-- I choose these as the ones that I am more than likely to use. Will be adding more as I encounter more things.


--Round Function
SELECT Round(column1 / column2, 2)* 100 AS percent FROM tbl1 

--Sign Function
SELECT Sign(column1) FROM tbl1
-- Returns 1 if positive, -1 if negative, 0 if the value is 0

--Power Function
SELECT POWER(column1, 2) FROM tbl1
-- takes the first numeric expression and raises it to the power specified in the 2nd numeric expression

SELECT SQRT(column1) FROM tbl1
-- Square Root of the numeric value

