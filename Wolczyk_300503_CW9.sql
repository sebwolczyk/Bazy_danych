--Sebastian Wolczyk, 300503, Geoinformatyka 2 rok

--1
CREATE FUNCTION Generate_Fib_Number (@Number INT)
RETURNS @fib TABLE (
	Ciag_Fibonacciego INT)
BEGIN
	DECLARE @fibonacci INT =0;
	DECLARE @count INT =1;
	DECLARE @num1 INT =1;
	DECLARE @num2 INT =1;

	--"Symulacja" petli for za pomoca @count oraz inkrementacji
	WHILE @count <= @Number
	BEGIN
		IF @count = 1 OR @count = 2
			BEGIN
				SET @fibonacci = 1;
				INSERT INTO @fib
				SELECT @fibonacci;
			END;
		ELSE
			BEGIN
				SET @fibonacci = @num1 + @num2;
				SET @num1 = @num2;
				SET @num2 = @fibonacci;
				INSERT INTO @fib
					SELECT @fibonacci;
			END;
		SET @count = @count +1;
		END;
	RETURN;
END;
GO

CREATE PROCEDURE Fibonacci @Number INT
AS
	SELECT * FROM dbo.Generate_Fib_Number(@Number);
GO

--kilka przykladowych wywolan
EXEC Fibonacci @Number=10;
GO
EXEC Fibonacci @Number=1;
GO
EXEC Fibonacci @Number=2;
GO
EXEC Fibonacci @Number=30;
GO


--2
CREATE TRIGGER ToUpper
ON Person.Person
FOR UPDATE AS
UPDATE Person.Person SET LastName=UPPER(LastName)
GO

UPDATE Person.Person
SET FirstName='Jan' WHERE BusinessEntityID = 1;
GO

SELECT FirstName,LastName FROM Person.Person
WHERE BusinessEntityID = 1;
GO


--3
CREATE TRIGGER taxRateMonitoring
ON Sales.SalesTaxRate
AFTER UPDATE AS
BEGIN
	DECLARE @old_tax FLOAT = (SELECT TaxRate FROM DELETED);
	DECLARE @new_tax FLOAT = (SELECT TaxRate FROM INSERTED);
	DECLARE @percentage FLOAT = @old_tax * 0.3;
IF
	(@new_tax >@old_tax + @percentage) OR (@new_tax < @old_tax - @percentage)
	PRINT 'Blad- zmieniono wartosc w polu TaxRate o wiecej niz 30%'
	ROLLBACK;
END;
GO

SELECT SalesTaxRateID,TaxRate FROM Sales.SalesTaxRate
WHERE SalesTaxRateID = 1;
GO

UPDATE Sales.SalesTaxRate
SET TaxRate = '20'
WHERE SalesTaxRateID = 1;
GO

SELECT SalesTaxRateID,TaxRate FROM Sales.SalesTaxRate
WHERE SalesTaxRateID = 1;
GO