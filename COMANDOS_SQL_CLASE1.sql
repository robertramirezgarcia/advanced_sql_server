-- DDL: CREATE, ALTER & DROP

CREATE DATABASE COTOZO
GO -- LOTE 1

USE COTOZO
GO -- LOTE 2

CREATE SCHEMA PRODUCT
GO

CREATE SCHEMA SALES
GO

CREATE TABLE PRODUCT.Categories(
	Categoryid INT,
	CategoryName VARCHAR(50),
	"Description" VARCHAR(50)
)
GO

-- DML: INSERT, DELETE & UPDATE
INSERT INTO PRODUCT.Categories (Categoryid, CategoryName) VALUES(1, 'Beverages')
INSERT INTO PRODUCT.Categories (Categoryid, "Description") VALUES (2, '')
INSERT INTO PRODUCT.Categories (Categoryid, "Description") VALUES (3, 'Other')
INSERT INTO PRODUCT.Categories (Categoryid, "Description") VALUES (-1, 'Datux')

DELETE FROM PRODUCT.Categories

UPDATE PRODUCT.Categories SET "Description" = 'Desconocido'
WHERE Categoryid = 2

-- DQL
SELECT * FROM PRODUCT.Categories
GO

SELECT * FROM PRODUCT.Categories
WHERE LEN("Description")>0
GO

SELECT * FROM SALES.Customers WHERE region IS NULL
-- CONSTRAINTS	

--- DEFAULT
ALTER TABLE PRODUCT.Categories
ADD CONSTRAINT cons_df_description
DEFAULT 'N/A' FOR "Description"
GO

ALTER TABLE PRODUCT.Categories
ADD CONSTRAINT cons_df_categoryname
DEFAULT 'N/A' FOR CategoryName
GO

-- CHECK
-- REVISAR LO QUE SE ESTA INSERTANDO EN BASE A UNA CONDICION
ALTER TABLE PRODUCT.Categories
ADD CONSTRAINT cons_check_description
CHECK (LEN("Description")>0)
GO

ALTER TABLE PRODUCT.Categories
ADD CONSTRAINT cons_check_categoryid
CHECK (Categoryid >0)
GO

-- UNIQUE
-- VALORES DE CIERTA COLUMNA DEBEN SER UNICOS
ALTER TABLE PRODUCT.Categories
ADD CONSTRAINT UC_CategoryID
UNIQUE (Categoryid)
GO

-- USO DE BULK
-- INSERTAR DATOS A PARTIR DE UNA FUENTE (UN ARCHIVO POR EJ)
-- BULK INSERT
-- {database_name.schema_name.table_or_view_name}
-- FROM 'data_file'
-- [WITH (... options)]
BULK INSERT COTOZO.SALES.Customers
FROM 'C:\Archivos\Personal\Capacitaciones\Informatica\SQL_SERVER\Unidad_I\Clases\01\Customers.csv'
WITH (
	FORMAT = 'CSV',
	FIELDTERMINATOR = ';',
	FIRSTROW = 2,
	KEEPNULLS
)


BULK INSERT COTOZO.PRODUCT.Products
FROM 'C:\Archivos\Personal\Capacitaciones\Informatica\SQL_SERVER\Unidad_I\Clases\01\Products.csv'
WITH (
	FORMAT = 'CSV',
	FIELDTERMINATOR = ';',
	FIRSTROW = 2
)

BULK INSERT COTOZO.PRODUCT.Suppliers
FROM 'C:\Archivos\Personal\Capacitaciones\Informatica\SQL_SERVER\Unidad_I\Clases\01\Suppliers.csv'
WITH (
	FORMAT = 'CSV',
	FIELDTERMINATOR = ';',
	FIRSTROW = 2
)

TRUNCATE TABLE COTOZO.SALES.Customers

DROP DATABASE COTOZO