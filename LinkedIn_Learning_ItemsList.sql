/*

Table Structure: 

Orders:
OrderId int PK
CustomerId int 
OrderDate Date

OrdersDishes:
OrderDishesId int PK
OrderId int
DishId int

Dishes:
DishId int PK
Name varchar(50)
Description varchar(255)
price decimal
type varchar(50)

*/


--Task
--Return a list of items in each order since May 1, 2022, separated by commas, in alphabetical order

-- SQL request(s)​​​​​​‌​‌​‌‌‌‌​‌​‌​​​​​​‌‌​​​‌​ below
SELECT DISTINCT
Orders.ORDERID,
GROUP_CONCAT(Dishes.Name ORDER BY Dishes.Name) as Items
FROM Orders JOIN OrdersDishes 
ON Orders.ORDERID = OrdersDishes.ORDERID
JOIN Dishes ON Dishes.DISHID = OrdersDishes.DISHID
WHERE OrderDate >= '2022-05-01'
GROUP BY Orders.OrderId;
