use test;

SELECT * FROM EMP;
SELECT * FROM EMP_SAL;
------------------------------------------------------------------------------------------------------------------
---EID,NAME,DOJ,DEPT,DESC,SALARY AS BASIC, HRA(15% OF BASIC),PF(9% OF BASIC),NET(BASIC+HRA+PF),GROSS(NET-PF)
-------------------------------------------------------------------------------------------------------------------
 CREATE VIEW EMP_SAL_DETAILS
 AS
 SELECT EMP.EID,DOJ,NAME,DEPT,DESI,SALARY AS 'BASIC', SALARY *.15 AS 'HRA',SALARY *.9 AS 'PF', SALARY+(SALARY*.15)+(SALARY*.9) AS 'NET', SALARY+(SALARY*.15)+(SALARY*.9)- SALARY *.9 AS 'GROSS'
 FROM EMP
 INNER JOIN EMP_SAL
 ON EMP.EID = EMP_SAL.EID;

 SELECT * FROM EMP_SAL_DETAILS;
 --------------------------------------------------------------------------------------------------------
 ---CREATE VIEW TO DISPLAY EID,NAME,DOJ,DESI,DEPT OF ALL THE MANAGERS JOINED IN 2019
 ---------------------------------------------------------------------------------------
 CREATE VIEW ASSIG6
 AS
 SELECT EMP.EID,NAME,DOJ,DESI,DEPT 
 FROM EMP
 INNER JOIN
 EMP_SAL ON EMP.EID = EMP_SAL.EID
WHERE DESI LIKE '%MANAGER%' AND DOJ LIKE '%2019%'
WITH CHECK OPTION;

SELECT * FROM ASSIG6;
-----------------------------------------------------------------------------------------------------------
----Q3 - CREATE VIEW TO HOW MANY TEAM MEMBERS IN EACH DEPT AND IN EACH CITY ALONG WITH TOTAL SALARY AND AVG SALARY
-----------------------------------------------------------------------------------
CREATE VIEW ASSG61
AS
SELECT DEPT, CITY, COUNT(EMP.EID) AS 'NO OF EMP',SUM(SALARY) AS 'TOTAL SALARY', AVG(SALARY) AS 'AVG SALARY'
FROM EMP_SAL
INNER JOIN EMP
ON EMP.EID = EMP_SAL.EID
GROUP BY DEPT,CITY ;

SELECT * FROM ASSG61;

--------------------------------------------------------------------------------------------------------
--- CREATE A VIEW BILL TO DISPLAY, ID,ODATE,CNAME,ADDRESS,PHONE,PDESC,OQTY, PRICE,AMOUNT-----
----------------------------------------------------------------------------------------------------

USE INVENTORY;


CREATE VIEW BILL
AS
SELECT ORDERS.OID,ODATE,CNAME,ADDRESS,PHONE,PDESC,OQTY, PRICE,(PRICE * OQTY) AS 'AMT'
FROM ORDERS
INNER JOIN
CUST ON ORDERS.CID = CUST.CID
INNER JOIN
PRODUCT ON ORDERS.PID = PRODUCT.PID;

SELECT * FROM BILL;
----------------------------------------------------------------------------