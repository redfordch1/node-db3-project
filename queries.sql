-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.
SELECT product.ProductName, category.CategoryName FROM product JOIN category ON product.CategoryId = Category.Id;
-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.
SELECT o.Id, s.CompanyName FROM [Order] AS o JOIN Shipper AS s ON o.ShipVia = s.Id WHERE o.OrderDate < '2012-08-09';
-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.
SELECT P.ProductName, OD.Quantity FROM [Order] AS O JOIN OrderDetail AS OD ON O.Id = OD.OrderId JOIN Product AS P ON OD.ProductId = P.Id WHERE O.Id = 10251 ORDER BY P.ProductName;
-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.
SELECT O.id, C.CompanyName, E.LastName FROM [Order] AS O JOIN Customer AS C ON O.CustomerId = C.Id JOIN Employee AS E ON O.EmployeeId = E.Id