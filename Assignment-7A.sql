USE LEARN54;

SELECT * FROM EMP;
SELECT * FROM EMP_SAL;

----------------------------------------------------------------------------------------
---A-1: CREATE A FUNCTION CALC TO PERFORM THE SPECIFIED OPERATION ON THE GIVEN TWO NUMBERS .
---------------------------------------------------------------------------
CREATE FUNCTION OP_TWO(@A INT, @B INT, @O AS CHAR(1))
RETURNS INT
AS 
BEGIN
  DECLARE @R AS INT;

  IF @O = '+'
      SET @R = @A + @B;

  ELSE IF @O = '-'
      SET @R = @A - @B;
  ELSE IF @O = '*'
      SET @R = @A * @B;
  ELSE IF @O = '/'
     SET @R = @A / @B;
  ELSE IF @O = '%'
     SET @R= @A % @B;
  ELSE
      SET @O = 0
  RETURN @R;
END;

SELECT DBO.OP_TWO(10,20,'+');
----------------------------------------------------------------------------------------------------------
--A-2: FUNCTION TO GENERATE THE EMAIL ID BY ACCEPTING NAME & EID. 
--EMAIL SHOULD CONTAIN 1ST CHARACTER OF 1ST NAME , 1ST CHARACTER OF LAST NAME, LAST 
---3 DIGITS OF EMP ID  FOLLOWED BY @RCG.COM; 
---------------------------------------------------------------------------------------------------------------
CREATE FUNCTION EMAIL(@ID CHAR(5), @NAME VARCHAR(20))
RETURNS TABLE
AS 
   RETURN(SELECT EID, NAME,CONCAT(LEFT (NAME,1),RIGHT(NAME, LEN(NAME)- CHARINDEX(' ' , NAME)), RIGHT(EID,3), '@OUTLOOK.COM') AS 'CORPMAIL' FROM EMP)

SELECT * FROM DBO.EMAIL('E0001','RAMESH GUPTA');

-------------------------------------------------------------------------------------------------------------------------------------
--A-3: FUNCTION TO RETURN  EID, NAME, DESI, DEPT ,SALARY OF THE EMPLOYEES OF A SPECIFIED DEPARTMENT.
-----------------------------------------------------------------------------------------------------------
CREATE FUNCTION EMP_DEPT(@DEP VARCHAR(20))
RETURNS TABLE
AS
  RETURN(SELECT EMP.EID, NAME, DESI, DEPT,SALARY FROM EMP
  INNER JOIN EMP_SAL ON EMP.EID = EMP_SAL.EID
  WHERE DEPT = @DEP);

  SELECT * FROM EMP_DEPT('IT');
-------------------------------------------------------------------------------------------------------
--A-4: FUNCTION TO DISPLAY THE NAME , DEPT . DESI , CITY  OF THE EMPLOYEES WHO HAVE THE BIRTHDAY IN  THE CURRENT MONTH.
--------------------------------------------------------------------------------------------------
CREATE FUNCTION CUR_DOB()
RETURNS TABLE
AS
  RETURN(SELECT EMP.EID, NAME, DESI, DEPT,DOB,CITY FROM EMP
  INNER JOIN EMP_SAL ON EMP.EID = EMP_SAL.EID
  WHERE MONTH(DOB) = MONTH(GETDATE()));

SELECT * FROM  DBO.CUR_DOB();

-----------------------------------------------------------------------------------------------------------------
---A-5: FUNCTION TO DISPLAY THE NAME, DEPT & DOJ OF EMPLOYEES WHO HAVE COMPLETED 5 YEARS IN THE COMPANY
---------------------------------------------------------------------------
CREATE FUNCTION EMP_TENURE()
RETURNS TABLE
AS 
    RETURN(SELECT EMP.EID,NAME,DEPT,DOJ,DATEDIFF(YY,DOJ,GETDATE()) AS 'TENURE' FROM EMP
	INNER JOIN EMP_SAL ON EMP.EID = EMP_SAL.EID
	WHERE DATEDIFF(YY,DOJ,GETDATE()) > 5);

SELECT * FROM DBO.EMP_TENURE();
-------------------------------------------------------------------------------------------------------------
