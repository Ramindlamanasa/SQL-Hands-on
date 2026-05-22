USE TEST;

SELECT * FROM EMP;
SELECT * FROM EMP_SAL;

----------------------------------------
--A-1--DEPARTMENT WISE TEAM SIZE AND AVERAGE SALARY OF ALL EMPLOYEES
---------------------------------
SELECT DEPT, COUNT(EID) AS 'TEAM SIZE', AVG(SALARY) AS 'AVG SALARY'
FROM EMP_SAL
GROUP BY DEPT;
----------------------------------------------------------------
--A-2 --COUNT OF MANAGERS IN THE COMPANY.
--------------------------------------------
SELECT DESI, COUNT(EID) AS 'NO OF MANAGERS'
FROM EMP_SAL
WHERE DESI LIKE '%MANAGER%'
GROUP BY DESI;
----------------------------------------
-A3---MAXI & MINI SALARY OF AN ASSOCIATE
---------------------------------------
SELECT DESI,MAX(SALARY) AS 'MAXIMUM SALARY', MIN(SALARY) AS 'MINIMUM SALARY'
FROM EMP_SAL
WHERE DESI = 'ASSOCIATE'
GROUP BY DESI;
------------------------------------------------------------
---A4--DEPARTMENT WISE TEAM SIZE AND AVERAGE SALARY OF DELHI EMPLOYEES
------------------------------------------------
SELECT EMP_SAL.DEPT, COUNT(*) AS 'TEAM SIZE', AVG(EMP_SAL.SALARY) AS 'AVG SALARY',EMP.CITY
FROM EMP_SAL
INNER JOIN
EMP ON EMP.EID = EMP_SAL.EID
WHERE EMP.CITY ='DELHI'
GROUP BY DEPT,EMP.CITY
ORDER BY DEPT DESC;
---------------------------------------------------------
---A5---GENERATE OFFICIAL MAIL OF THE EMPLOYEE TAKING 1ST CHARACTER NAME, 1ST CHARACTER OF LASTNAME, LAST 3 DIGIT OE EMPLOYEEE ID, 
----FOLLOWED BY 'RCG.COM, EMIAL SHOULD BE IN UPPER CASE
----------------------------------------------------------------------
SELECT * FROM EMP;

SELECT UPPER(CONCAT(LEFT(NAME,1),LEFT(RIGHT(NAME, LEN(NAME)-CHARINDEX(' ',NAME)),1), RIGHT(EID,3))) + 'RCG.COM' FROM EMP;

----------------------------------------------------------------------------------------------------------------------------
---A6---NAME,CITY PHNO &EMAIL OF THE EMPLOYEES WHOSE AGE >= 40
------------------------------------------------------------------------------------------------

SELECT NAME, CITY, PHONE, EMAIL,DATEDIFF(YY,DOB,GETDATE()) AS 'AGE'  FROM EMP;

-----------------------------------------------------------------------------------------------
--A7 ----EID NAME DOJ OF ALL EMPLOYEES WHERE DOJ IS MORETHAN 5 YEARS
------------------------------------------------------------------------------
SELECT EID,NAME,DOJ,DATEDIFF(YY,DOJ,GETDATE()) AS 'TENURE'  FROM EMP
WHERE  DATEDIFF(YY,DOJ,GETDATE()) > 5
ORDER BY 'TENURE' ;
-------------------------------------------------------------------------------
-A8--DETAILS OF ALL MANAGER BIRTHDAY IN THE CURRENT MONTH
-------------------------------------------------------------------------

SELECT EMP.NAME, CITY,PHONE,DESI,DOB FROM EMP
INNER JOIN EMP_SAL
ON EMP.EID = EMP_SAL.EID
WHERE MONTH(DOB) = DATEPART(M,GETDATE()) AND DESI LIKE '%MANAGER%';
------------------------------------------------------------------------------
---A9----EDI,DEPT,DESI,SALARY OF THE EMPLOYEE WHO IS GETTING MAXIMUM SALARY
-----------------------------------------------------------
SELECT TOP 1 * FROM EMP_SAL
ORDER BY SALARY DESC;
-----------------------------------------------------------------
---A10-----EDI, NAME OF THE EMPLOYEE WHO HAS LONGEST NAME
--------------------------------------------------------
SELECT TOP 1 EID,NAME,(LEN(NAME)) AS 'LONGEST NAME' FROM EMP
ORDER BY 'LONGEST NAME'  DESC;
---------------------------------------------------------------------


