USE LEARN54;

SELECT * FROM EMP;
SELECT * FROM EMP_SAL;
-----------------------------------------------------------------------------------------
--A-1 :  EID, NAME, CITY OF GURGAON EMPLOYEES
-------------------------------------------------
SELECT EID,NAME, CITY FROM EMP WHERE CITY = 'GURGAON';
---------------------------------------------------------------
---A-2 :  EID, NAME , DOJ ,DEPT, DESI & SALARY  OF ALL MANAGERS.
-----------------------------------------------------
SELECT E.EID ,E.NAME,E.DOJ,S.DESI,S.DEPT,S.SALARY 
FROM EMP E
JOIN EMP_SAL S 
ON E.EID = S.EID
WHERE DESI LIKE '%MANAGER%'; 
-----------------------------------------------------------------------------------------
--A-3:  REDUCE THE SALARY OF ALL DELHI EMPLOYEES BY 10%
----------------------------------------------------------------------------------
SELECT EID,SALARY, (SALARY-(SALARY*0.10)) AS 'REDUCED' FROM EMP_SAL
WHERE EID IN (SELECT EID FROM EMP WHERE CITY = 'DELHI');

UPDATE EMP_SAL SET SALARY = SALARY - (SALARY*0.10) WHERE CITY = 'DELHI';
------------------------------------------------------------------------------
--A-4 : DISPLAY THE EID, NAME , CITY,  DOJ ,DEPT, DESI & SALARY OF THE  TEAM 
---MEMBERS OF DAVID & RAMESH GUPTA.
-----------------------------------------------------------------------------
SELECT EMP.EID, EMP.NAME,EMP.DOJ,EMP_SAL.DEPT,EMP_SAL.DESI,EMP_SAL.SALARY FROM EMP
INNER JOIN EMP_SAL ON EMP.EID = EMP_SAL.EID WHERE EMP.EID IN(
SELECT EID FROM EMP_SAL WHERE DEPT IN( SELECT DEPT FROM EMP_SAL 
WHERE EID IN (SELECT EID FROM EMP WHERE NAME IN ('DAVID','RAMESH GUPTA'))));

-------------------------------------------------------------------------------
--A-5: CREATE A TRAINING TABLE CONTAINING EID, NAME, DEPT. INSERT THE DETAILS 
---OF  OPS TEAM MEMBERS IN THE TRAINING TABLE
-----------------------------------------------------------------
CREATE TABLE TRAINING(
EID CHAR(5),
NAME VARCHAR(20),
DEPT VARCHAR(20));

SELECT * FROM TRAINING;

INSERT INTO TRAINING(EID,NAME,DEPT)
SELECT EMP.EID, NAME,DEPT FROM EMP
INNER JOIN EMP_SAL
ON EMP.EID = EMP_SAL.EID WHERE DEPT = 'OPS';
----------------------------------------------------------------------------------------------
--A-6: DETAILS OF DIRECTORS SHOULD BE DELETED FROM THE TRAINING TABLE.
---------------------------------------------------------------------------------

DELETE FROM TRAINING
WHERE EID IN (SELECT EID FROM EMP_SAL WHERE DESI = 'DIRECTOR');
-------------------------------------------------------------------------------------------------------
--A-7: DISPLAY THE SALARY DETAILS OFF ALL EMPLOYES IF ANY OF THE TEAM MEMBER HAS SALARY MORE THAN 200000.
-------------------------------------------------------------------------------------------------------
SELECT E.EID,E.NAME,S.SALARY FROM EMP E
INNER JOIN EMP_SAL S ON E.EID = S.EID
 WHERE EXISTS(SELECT * FROM EMP_SAL WHERE SALARY >200000);

 SELECT * FROM EMP_SAL
 WHERE EXISTS(SELECT EID FROM EMP_SAL WHERE SALARY >200000);
