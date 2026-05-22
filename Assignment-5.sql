use DEMO;

select * from EMP;
select * from EMP_SAL;

------------------------------
---EDI,NAME,CITY,DOJ,DESI,SALARY OF THE DELHI EMPLOYEES
SELECT * FROM EMP;
SELECT * FROM EMP_SAL;

SELECT EMP.EID, NAME, CITY, DOJ, DEPT, DESI, SALARY
FROM EMP 
INNER JOIN EMP_SAL
ON EMP.EID=EMP_SAL.EID
WHERE CITY = 'DELHI';

---------------------------------------------------------------------

SELECT EMP.EID, NAME, ADDR, CITY, PHONE, EMAIL, DOB, SALARY
FROM EMP 
INNER JOIN EMP_SAL
ON EMP.EID=EMP_SAL.EID
WHERE SALARY IS NULL;


--------------------------------------------------------------------

-----Q1 -> PID, PDESC, CATEGORY,SNAME,SCITY
----Q2-->OID,ODATE,CNAME,CADDRESS,CPHONE,PDESC,PRICE,OQTY,
-------------------------------------------------------
USE INVENTORY;

SELECT * FROM SUPPLIER;
SELECT * FROM PRODUCT;

SELECT * FROM ORDERS;
SELECT * FROM CUST;
----------------------------------------------------------------------
SELECT PRODUCT.PID,PDESC,CATEGORY,SNAME,SCITY
FROM SUPPLIER
INNER JOIN 
PRODUCT
ON PRODUCT.SID = SUPPLIER.SID;
--------------------------------------------------------
SELECT ORDERS.OID,ODATE,CNAME,ADDRESS,PHONE,PDESC,OQTY, PRICE,(PRICE * OQTY) AS 'AMT'
FROM ORDERS
INNER JOIN
CUST ON ORDERS.CID = CUST.CID
INNER JOIN
PRODUCT ON ORDERS.PID = PRODUCT.PID;
----------------------------------------------------------------------------