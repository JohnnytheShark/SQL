-- Which days did people order pizza?
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

-- Task: 
-- Return a list of days that "Handcrafted Pizza" was ordered and how many were ordered on each day

--Answer:
SELECT COUNT(Dishes.Name) as NumSold
,CAST(Orders.ORDERDATE AS Date) as Day
FROM Orders
JOIN OrdersDishes ON Orders.OrderId = OrdersDishes.ORDERID 
JOIN Dishes ON Dishes.DishId = OrdersDishes.DishId
WHERE Dishes.NAME LIKE '%Handcrafted Pizza%'
GROUP BY CAST(Orders.ORDERDATE AS Date)
ORDER BY 2 ASC;
