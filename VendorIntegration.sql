/*
Linkedin Learning Problem: 
We've partnered with an outside vendor to provide some services for our employees.
In order to get the employees enrolled, we need to share some information with the vendor

Table: Employees

EmployeeID int PK
FirstName varchar(255)
LastName varchar(255)
Department varchar(255)
Position varchar(255)
WeeklyPay int
Username varchar(255)

The vendor requires: 
Employee's ID as a 5 digit number add leading 0s
Each Employee's Name in the format Last, First
Login that uses employee's first inital and then up to 7 characters of their last name a max of 8 total characters 
Their work email, which we'll construct using their username from emplloyees table and the text @nadias-garden.com

Task Write a query that returns the info above. 
*/

SELECT 
RIGHT(CONCAT('00000', CONVERT(EmployeeID,VARCHAR)),5) as ID,
CONCAT(LASTNAME,', ',FIRSTNAME) AS NAME,
LOWER(CONCAT(LEFT(FIRSTNAME,1),LEFT(LASTNAME,7))) AS LOGIN,
CONCAT(Username,'@nadias-garden.com') as email
FROM Employees
ORDER BY 2; 