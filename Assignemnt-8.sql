USE INVENTORY;

SELECT * FROM SUPPLIER;
--------------------------------------------------------------------------------
--ADDSUPPLIER – SHOULD ADD THE SUPPLIER IN THE SUPLIER TABLE AND  DISPLAY THE  
--DETAILS OF THE NEW SUPPLIER ADDED.
---------------------------------------------------------------

CREATE PROCEDURE ADDSUPPLIER @ID CHAR(5),@NAME VARCHAR(20),@ADDR VARCHAR(20),
@CITY VARCHAR(10),@PHONE CHAR(15),@EMAIL VARCHAR(30)
AS
BEGIN
    INSERT INTO SUPPLIER VALUES(
	@ID,@NAME,@ADDR,@CITY,@PHONE,@EMAIL);

	SELECT * FROM SUPPLIER
	WHERE SID = @ID;

END;

ADDSUPPLIER 'S0011','AAROHI ENTERPRISES','BELLANDUR','BANAGLUR','7689512340','AAROHIK@GMAIL.COM';

-------------------------------------------------------------------------------------------------------------
--ADDPRO–SHOULD ADD THE PRODUCT IN THE PRODUCT TABLE AND  DISPLAY THE  
--DETAILS OF THE NEW PRODUCT ADDED

SELECT * FROM PRODUCT;

CREATE PROCEDURE ADDPRO @ID CHAR(5),@DESC VARCHAR(20),@PRICE INT,@CATG VARCHAR(20), @SID CHAR(5)
AS
BEGIN
     
	 INSERT INTO PRODUCT VALUES(@ID,@DESC,@PRICE,@CATG,@SID);

	 SELECT * FROM PRODUCT WHERE PID = @ID;
END;

EXEC ADDPRO 'P0021','COOLPAD',3500,'IT','S0011';

-------------------------------------------------------------------------------------------------------
--ADDCUST–SHOULD ADD THE CUSTOMER IN THE CUSTOMER TABLE AND  DISPLAY THE  
--DETAILS OF THE NEW CUSTOMER ADDED.
---------------------------------------------------------------------------------------------
SELECT * FROM CUST;

CREATE PROCEDURE ADDCUST @ID CHAR(5),@NAME VARCHAR(20),@ADDR VARCHAR(20),
@CITY VARCHAR(10),@PHONE CHAR(15),@EMAIL VARCHAR(30),@DOB DATE
AS
BEGIN
    INSERT INTO CUST VALUES(
	@ID,@NAME,@ADDR,@CITY,@PHONE,@EMAIL,@DOB);

	SELECT * FROM CUST
	WHERE CID = @ID;

END;

EXEC ADDCUST 'C0011','AAROHI','BELLANDUR','BANAGLUR','7689512340','AAROHIK@GMAIL.COM','1993-04-07';

--------------------------------------------------------------------------------------------------------------------------
---ADDORDER–SHOULD ADD THE ORDER IN THE ORDERS TABLE AND  DISPLAY THE  DETAILS OF THE ORDER. 
--ORDER DATE  SHOULD BE CURRENT DATE AND SHOULD COME AUTOMATICALLY
-------------------------------------------------------------------------------------------------------------
SELECT * FROM ORDERS;

CREATE PROCEDURE ADDORDERS @ID CHAR(5), @PID CHAR(5), @CID CHAR(5), @QTY INT
AS
BEGIN
     
	 INSERT INTO ORDERS (OID, ODATE, PID, CID, OQTY)
	 VALUES(@ID,GETDATE(),@PID,@CID,@QTY);
	 
	 SELECT * FROM ORDERS WHERE OID = @ID;
	 
END; 

EXEC ADDORDERS 'O0008','P0004','C0003',39;

--------------------------------------------------------------------------------


