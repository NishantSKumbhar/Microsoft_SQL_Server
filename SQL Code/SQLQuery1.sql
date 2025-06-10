SELECT 'NISHANT', 'SANJAY', 'KUMBHAR';

SELECT 'NAME';

SELECT 1+2;

SELECT (6*3) - (2*3);

SELECT  ' Brewster''s SQL Training Class ';

SELECT * FROM Person.Person;

SELECT FirstName, MiddleName,LastName from Person.Person;

SELECT TOP 10 FirstName, MiddleName, LastName from Person.Person;

SELECT TOP 10 PERCENT FirstName, MiddleName, LastName from Person.Person;

SELECT * FROM Person.Person;

SELECT TOP 10 * FROM Person.Person;

SELECT TOP 10 FirstName AS [Customer First Name], LastName AS "Customer Last Name" FROM Person.Person;

SELECT FirstName, BusinessEntityID FROM Person.Person WHERE BusinessEntityID > 10 ORDER BY BusinessEntityID DESC;

SELECT * FROM Production.Product WHERE ListPrice > 100;

SELECT * FROM Production.Product WHERE ListPrice = 782.99;

SELECT * FROM Production.Product WHERE ListPrice <> 782.99;

SELECT * FROM HumanResources.vEmployee
WHERE FirstName = 'Ken';

SELECT * FROM HumanResources.vEmployee
WHERE FirstName <> 'Ken';

SELECT * FROM HumanResources.Employee WHERE BirthDate >= '1/1/1980';

SELECT * FROM HumanResources.Employee WHERE BirthDate >= '1-1-1980';


SELECT * FROM HumanResources.Employee WHERE BirthDate >= '1/1/1980' AND Gender = 'F';

SELECT * FROM HumanResources.Employee WHERE BirthDate >= '1/1/1980' OR Gender = 'F';


SELECT * FROM HumanResources.Employee WHERE (BirthDate >= '1/1/1980' AND Gender = 'F') OR MaritalStatus = 'S';

/* Multiple OR statements */
SELECT * FROM HumanResources.vEmployee WHERE FirstName IN ('Chris', 'Steve', 'Thomas');

SELECT * FROM Sales.vStoreWithDemographics WHERE AnnualSales BETWEEN 1000000 AND 2000000;

SELECT * FROM HumanResources.vEmployee WHERE FirstName LIKE 'Mi%';

SELECT * FROM Person.Person WHERE MiddleName IS NULL;

SELECT * FROM Person.Person WHERE MiddleName IS NOT NULL;

/* Sorted by 2 nd Column i.e. LastName */
SELECT FirstName, LastName FROM Sales.vIndividualCustomer ORDER BY 2;

/* Sorted by 2 nd Column i.e. LastName , in ORDER BY we can use Alias but not in WHERE Clause.*/
SELECT FirstName, LastName AS [Customer Last Name] FROM Sales.vIndividualCustomer ORDER BY [Customer Last Name];

/*
SELECT
FROM
WHERE
GROUP BY
HAVING
ORDER BY

This is how you write the sequence.


FROM
WHERE
GROUP BY
HAVING
SELECT
ORDER BY

This is how it actually executes.
so we can use the alias in ORDER BY Clause.
*/

/*Different by coloums */
SELECT FirstName, LastName FROM Sales.vIndividualCustomer ORDER BY FirstName, LastName DESC;

SELECT FirstName, LastName, CountryRegionName FROM Sales.vIndividualCustomer WHERE CountryRegionName = 'United States' OR CountryRegionName = 'France' ORDER BY CountryRegionName;

SELECT * FROM Production.Product P;

SELECT * FROM Production.ProductSubcategory;

SELECT P.Name, P.ProductNumber FROM Production.Product P;

SELECT P.Name, P.ProductNumber, PS.Name AS [Product Subcategry Name] FROM Production.Product P
INNER JOIN Production.ProductSubcategory PS ON P.ProductSubcategoryID = PS.ProductSubcategoryID;

SELECT P.Name AS [Product Name], PM.Name AS[Model Name], PM.CatalogDescription FROM Production.Product P INNER JOIN Production.ProductModel PM ON P.ProductModelID = PM.ProductModelID;

/* JOIN THREE TABLES */

SELECT * FROM ((Production.Product P 
INNER JOIN Production.ProductSubcategory PC ON P.ProductSubcategoryID = PC.ProductSubcategoryID)
INNER JOIN Production.ProductModel PM ON P.ProductModelID = PM.ProductModelID);


/* LEFT OUTER JOIN */

SELECT * FROM Production.Product; /* 504 rows */

/*BElow has 295 rows */
SELECT * FROM Production.Product P INNER JOIN Production.ProductSubcategory PS ON P.ProductSubcategoryID = PS.ProductSubcategoryID;

/* SEE it has 504 rows */
SELECT * FROM Production.Product P LEFT OUTER JOIN Production.ProductSubcategory PS ON P.ProductSubcategoryID = PS.ProductSubcategoryID;

/* SEE it has 295 rows */
SELECT * FROM Production.Product P RIGHT OUTER JOIN Production.ProductSubcategory PS ON P.ProductSubcategoryID = PS.ProductSubcategoryID;

/* SEE it has 504 rows */
SELECT * FROM Production.ProductSubcategory PS RIGHT OUTER JOIN Production.Product P ON P.ProductSubcategoryID = PS.ProductSubcategoryID;

/* Aggregate Function */

SELECT MAX(TotalDue) FROM Sales.SalesOrderHeader;


SELECT COUNT(*) FROM Sales.SalesOrderHeader; /* Return No of Rows */

SELECT COUNT(SalesOrderID) FROM Sales.SalesOrderHeader; /* Return non null count of rows */

SELECT COUNT(DISTINCT FirstName) FROM Person.Person;

SELECT AVG(TotalDue) FROM Sales.SalesOrderHeader;


SELECT SUM(TotalDue) FROM Sales.SalesOrderHeader;

/* The GROUP BY statement is often used with aggregate functions (COUNT(), MAX(), MIN(), SUM(), AVG()) to group the result-set by one or more columns.*/

SELECT SalesOrderID, TotalDue FROM Sales.SalesOrderHeader;

SELECT SalesOrderID, MAX(TotalDue) AS [AVG] FROM Sales.SalesOrderHeader GROUP BY SalesOrderID;

/* Better Understanding */
SELECT * FROM Production.ProductInventory;
