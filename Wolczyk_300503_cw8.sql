--1
BEGIN
	SELECT AVG(Rate) AS AverageRate FROM HumanResources.EmployeePayHistory;
	SELECT HumRes.* FROM HumanResources.Employee HumRes, HumanResources.EmployeePayHistory HumResPayHist
	WHERE HumRes.BusinessEntityID = HumResPayHist.BusinessEntityID
	AND Rate < (SELECT AVG(Rate) FROM HumanResources.EmployeePayHistory);
END;
GO



--2
CREATE FUNCTION FindShipDate (@OrderID INT) RETURNS DATE
BEGIN
	RETURN(
		SELECT ShipDate FROM Sales.SalesOrderHeader
		WHERE SalesOrderID = @OrderID)
END;
GO

--przyk³adowe wywo³anie
SELECT dbo.FindShipDate(45678);
GO



--3
CREATE PROCEDURE ProductInformation @ProductName NVARCHAR(50)
AS
	SELECT ProductID, ProductNumber, SafetyStockLevel FROM Production.Product WHERE Name = @ProductName
GO

--przyk³adowe wywo³anie
EXEC ProductInformation @ProductName= 'LL Crankarm';
GO



--4
CREATE FUNCTION CreditCardNo (@OrderID INT) RETURNS NVARCHAR(25)
BEGIN
	RETURN(
		SELECT CardNumber FROM Sales.CreditCard
		INNER JOIN Sales.SalesOrderHeader ON
		Sales.SalesOrderHeader.CreditCardID = Sales.CreditCard.CreditCardID
		AND Sales.SalesOrderHeader.SalesOrderID = @OrderID)
END;
GO

--przyk³adowe wywo³anie
SELECT dbo.CreditCardNo(43665)
GO



--5
CREATE PROCEDURE divide @num1 FLOAT, @num2 FLOAT
AS
	IF @num1<@num2
		RAISERROR('Niew³aœciwie zdefiniowa³eœ dane wejœciowe',16,1);
	ELSE
		PRINT @num1/@num2;
GO

--przyk³adowe wywo³anie
EXEC divide @num1 = 15, @num2 = 20;
GO
EXEC divide @num1=23.5, @num2 = 11.75;
GO
EXEC divide @num1=30, @num2 = 10;
GO

