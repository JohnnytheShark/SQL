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

--Summation Based on a Rolling Total think of credit card that carries balance and changes each month. This is something
-- I worked on at work but I simplified it here for future projects.

SELECT 
    column_id
    SUM(Previous_Month_Totals)
    -- add your other months here depending on how many case statements you got.
FROM (
    Select 
    column_id,
    Case
    WHEN to_date(month_number,'YYYYMM') <= to_date(to_char(ADD_MONTHS(sysdate,-1)'YYYYMM'),'YYYYMM') THEN amount_column
    ELSE 0
    END as Previous_Month_Totals
    -- You would repeat the above but change the month number to -2 or whatever month you would like 
    From 
    tbl1
    --- Where clause if you need one
)
GROUP BY
column_id


