/*
Linkedin Learning
Problem: Its that time of year again, Time for a sale at the store

Our Table: Dishes

DishID int PK
Name varchar(50)
Description varchar(255)
Price decimal
Type varchar(50)

We've decided to apply the following discounts to our menu:
Items below $7 will be 5% off
Items $7 to $10 will be 10% off
Items priced above 10 will be 15% off

Task: Calculate the sale price of all the menu items as determined by the provided discount schedule

Result: Four Columns:
Name, OriginalPrice
Discount Percent
DiscountedPrice Rounded to 2 decimal places

Sort the menu alphabetically by name

*/
SELECT 
Item,
OriginalPrice,
CASE 
WHEN DiscountPercent = 0.05 THEN '5%'
WHEN DiscountPercent = 0.1 THEN '10%'
ELSE '15%' 
END AS DiscountPercent,
ROUND(OriginalPrice - (OriginalPrice * DiscountPercent),2) as DiscountedPrice
FROM
(
SELECT name as Item,
       price as OriginalPrice,
       CASE
           WHEN price < 7 THEN 0.05
           WHEN price >= 7
                and price <= 10 THEN 0.1
           ELSE 0.15
       END AS DiscountPercent
FROM Dishes
)
ORDER BY 1;
