USE INVENTORY;
----------------------------------------------------------------------
SELECT * FROM SUPPLIER;
---------------------------------------------------------------------------------------
---A1 : CREATE A FUNCTION FOR AUTOGENERATION OF 5 CHARACTERS ALPHA NUMERIC ID. IT
--SHOULD ACCEPT 2 PARAMETERS A CHARACTER AND THE NUMBER AND RETURN THE ID BY
--CONCANATING THECHARACTER , REQUIRED ZEROS ANDTHESPECIFIED NUMBER.
------------------------------------------------------------------------------------
CREATE SEQUENCE S1
START WITH 12
INCREMENT BY 1

SELECT NEXT VALUE FOR S1;
--------------------------------------------------------------------
CREATE FUNCTION GENID(@C CHAR(1), @I AS INT)
RETURNS CHAR(5)
AS
BEGIN
     DECLARE @ID CHAR(5)
	 SELECT @ID = CASE 
	                  WHEN @I < 10 THEN CONCAT(@C,'000',@I)
					  WHEN @I < 100 THEN CONCAT(@C,'00',@I)
					  WHEN @I < 1000 THEN CONCAT(@C,'0',@I)
					  WHEN @I < 10000 THEN CONCAT(@C,@I)
					  ELSE 'NA'
	 END;
	 RETURN @ID;
END;
--------------------------------------------------------------------------------------------
--ADDSUPPLIER– SHOULD ADD THE SUPPLIER IN THE SUPLIER TABLE AND DISPLAY THE DETAILS OFTHE NEWSUPPLIER ADDED.
----------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE ADDSUPPLIERS @NAME VARCHAR(20),@ADDR VARCHAR(20),
@CITY VARCHAR(10),@PHONE CHAR(15),@EMAIL VARCHAR(30)
AS
BEGIN
     DECLARE @ID AS CHAR(5)
	 DECLARE @I AS INT
	 SET @I = (NEXT VALUE FOR S1);
	 SET @ID = DBO.GENID('S',@I);
     INSERT INTO SUPPLIER VALUES(
	 @ID,@NAME,@ADDR,@CITY,@PHONE,@EMAIL);

	SELECT * FROM SUPPLIER
	WHERE SID = @ID;

END;

ADDSUPPLIERS 'GAGAN AUTOMOBILES','BEJANKI','PAYAPAD','7689556789','GAGANK@GMAIL.COM';
---------------------------------------------------------------------------------------------------------------
--ADDPRO– SHOULD ADD THE PRODUCT IN THE PRODUCT TABLE AND DISPLAY THE DETAILS OF THE NEWPRODUCTADDED
---------------------------------------------------------------------------------------------------------------
SELECT * FROM PRODUCT;

CREATE SEQUENCE S2
START WITH 22
INCREMENT BY 1
--------------------------------------------------------------------------------------------

CREATE PROCEDURE ADDPROD @DESC VARCHAR(20),@PRICE INT,@CATG VARCHAR(20), @SID CHAR(5)
AS
BEGIN
      DECLARE @ID AS CHAR(5)
	  DECLARE @I AS INT

	  SET @I = (NEXT VALUE FOR S2)
	  SET @ID = DBO.GENID('P',@I)
     
	 INSERT INTO PRODUCT VALUES(@ID,@DESC,@PRICE,@CATG,@SID);

	 SELECT * FROM PRODUCT WHERE PID = @ID;
END;

EXEC ADDPROD 'KEYBOARD',3500,'IT','S0011';
---------------------------------------------------------------------------------------------------------------------
---ADDCUST– SHOULD ADD THE CUSTOMER IN THE CUSTOMER TABLE AND DISPLAY THE DETAILS OF THE NEWCUSTOMERADDED
----------------------------------------------------------------------------------------------------------------
SELECT * FROM CUST;

CREATE SEQUENCE S3
START WITH 12
INCREMENT BY 1
------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE ADDCUSTM @NAME VARCHAR(20),@ADDR VARCHAR(20),
@CITY VARCHAR(10),@PHONE CHAR(15),@EMAIL VARCHAR(30),@DOB DATE
AS
BEGIN
     DECLARE @ID AS CHAR(5)
	 DECLARE @I AS INT
	 SET @I = (NEXT VALUE FOR S3)
	 SET @ID = DBO.GENID('C',@I)
    INSERT INTO CUST VALUES(
	@ID,@NAME,@ADDR,@CITY,@PHONE,@EMAIL,@DOB);

	SELECT * FROM CUST
	WHERE CID = @ID;

END;

EXEC ADDCUSTM 'ANIL','SIRICILLA','KARIMNAGAR','7689990040','ANILRAV@GMAIL.COM','1996-08-01';

------------------------------------------------------------------------------------------------------------------------------
--ADDORDER– SHOULD ADD THE ORDER IN THE ORDERS TABLE AND DISPLAY THE DETAILS OF THE ORDER. 
---ORDER DATE SHOULD BECURRENTDATEANDSHOULD COMEAUTOMATICALLY.
-------------------------------------------------------------------------------------------
SELECT * FROM ORDERS;

CREATE SEQUENCE S4
START WITH 9
INCREMENT BY 1
--------------------------------------------------------------------------------------------------------------

DROP PROCEDURE ADDORDERS

CREATE PROCEDURE ADDORDERS @PID CHAR(5),@CID VARCHAR(5), @QTY INT
AS 
BEGIN  
     DECLARE @ID  AS CHAR(5)
	 DECLARE @I AS INT
	 SET @I = (NEXT VALUE FOR S4);
	 SET @ID = DBO.GENID('O',@I)

	  INSERT INTO ORDERS (OID, ODATE, PID, CID, OQTY)
	 VALUES(@ID,GETDATE(),@PID,@CID,@QTY);

	 SELECT * FROM ORDERS WHERE OID = @ID;
	 
END; 

EXEC ADDORDERS 'P0005','C0001',35;
-----------------------------------------------------------------------------------------------------------------
        