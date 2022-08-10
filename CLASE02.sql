--CLASE 2
--FUNCIONES AGRUPADAS
--VAN A AFECTARSE SEGUN EL GRUPO DE LA CONSULTA
--AVG,COUNT,MIN,MAX,SUM
SELECT country, city, COUNT(city) as qCity, COUNT(region) as qRegion FROM COTOZO.SALES.Customers
GROUP BY country, city
ORDER BY country, city
GO

--COUNT no opera sobre valores nulos

SELECT * FROM COTOZO.SALES.Customers WHERE country = 'Brazil' AND city ='Sao Paulo'

--GROUP BY NO ES IGUAL A DISTINCT
--DISTINCT ES UNA SOBRECARGA
SELECT country, city, COUNT(country) qCountry, COUNT(DISTINCT country) qCountry FROM COTOZO.SALES.Customers
GROUP BY country, city
ORDER BY country, city
GO

--FUNCIONES DE VENTANA 
--REALIZAN CALCULOS EN UN CONJUNTO DE FILAS QUE ESTAN RELACIONADAS ENTRE SI
--A DIFERENCIA DE LAS FUNCIONES AGREGADAS, LAS FUNCIONES DE VENTANA NO COLAPSAN EL RESULTADO DE LAS FILAS EN UN SOLO VALOR
--sintaxis:window_function_name(<expression>) OVER()

SELECT *,
	COUNT(country) OVER() AS qCountry
FROM COTOZO.SALES.Customers

--GRUPO POR PAIS
SELECT country, COUNT(country)
FROM COTOZO.SALES.Customers
GROUP BY country

--SOBRECARGA DE OVER
SELECT *, COUNT(country) OVER(PARTITION BY country ORDER BY city) as qCountry
FROM COTOZO.SALES.Customers
GO

--MAS FUNCIONES DE VENTANA
SELECT *, ROW_NUMBER() OVER(PARTITION BY country ORDER BY country) as Row_Number_column
from [COTOZO].[SALES].[Customers]
GO

SELECT *, ROW_NUMBER() OVER(ORDER BY country) as Row_Number_column
from [COTOZO].[SALES].[Customers]
GO

SELECT *, RANK() OVER(ORDER BY country) as Rank_column
from [COTOZO].[SALES].[Customers]
GO

SELECT *, DENSE_RANK() OVER(ORDER BY country) as Rank_column
from [COTOZO].[SALES].[Customers]
GO

SELECT *, NTILE(6) OVER(ORDER BY country) as NTILE_column
from [COTOZO].[SALES].[Customers]
GO

--LAG/LEAD()
--LEAD MUESTRA EL VALOR DE LA FILA SIGUIENTE
--LAG MUESTRA EL VALOR DE LA FILA ANTERIOR
SELECT *, 
LEAD([address], 1, 'N/A') OVER(ORDER BY country) "LEAD",
[address], 
LAG([address],1, 'N/A') OVER(ORDER BY country) "LAG"
FROM [COTOZO].[SALES].[Customers]
GO

--WHERE
--HAVING
--DIFFERENCE BETWEEN
SELECT
country,
COUNT(country) as qCountry
FROM [COTOZO].[SALES].[Customers]
--WHERE count(country) > 5
GROUP BY country
HAVING count(country) > 5

--BUSQUEDA MEDIANTE PATRONES
SELECT * FROM [COTOZO].[SALES].[Customers]
WHERE country like '_ran%ce'

SELECT * FROM [COTOZO].[SALES].[Customers]
WHERE country like '%[cl]_'

SELECT * FROM [COTOZO].[SALES].[Customers]
WHERE country like '%[abc]_'

SELECT * FROM [COTOZO].[SALES].[Customers]
WHERE country like '%[a-c]_'

SELECT * FROM [COTOZO].[SALES].[Customers]
WHERE address like '[0-9]%'















