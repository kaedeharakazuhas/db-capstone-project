SELECT CustomerDetails.CustomerID, CustomerDetails.CustomerName,
Orders.OrderID, Orders.TotalCost, Menu.MenuName
FROM CustomerDetails
JOIN Orders ON CustomerDetails.CustomerID = Orders.CustomerID
JOIN Menu ON Orders.MenuID = Menu.MenuID
ORDER BY Orders.TotalCost ASC;
