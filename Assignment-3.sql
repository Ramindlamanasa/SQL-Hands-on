use demo;

SELECT * FROM EMP;
SELECT * FROM EMP_SAL;

------------------------------------------
ALTER TABLE EMP
ALTER COLUMN EID CHAR(5) NOT NULL;

ALTER TABLE EMP
ADD CONSTRAINT PKID PRIMARY KEY (EID);

----------------------------------
ALTER TABLE EMP
ALTER COLUMN NAME VARCHAR(20) NOT NULL;

---------------------------------------------
ALTER TABLE EMP
ADD CONSTRAINT C2 CHECK (ADDR <> '%UTTAM%NAGAR%');

------------------------------------------------------
ALTER TABLE EMP
ADD CONSTRAINT C3 CHECK (CITY IN ('DELHI','GURGAON','BGLR','NOIDA'));

-------------------------------------------------------------------------------
ALTER TABLE EMP
ADD CONSTRAINT PC4 UNIQUE (PHONE);

-----------------------------------------
ALTER TABLE EMP
ADD CONSTRAINT GML CHECK ((EMAIL LIKE '%GMAIL%')  OR (EMAIL LIKE '%YAHOO%'));
---------------------------------------------------
ALTER TABLE EMP
ADD CONSTRAINT DB CHECK (DOB <= '01-JAN-2000');

---------------------------------

ALTER TABLE EMP_SAL
ADD CONSTRAINT FKID FOREIGN KEY (EID) REFERENCES EMP(EID);

------------------------------------------------
ALTER TABLE EMP_SAL
ADD CONSTRAINT DPT DEFAULT 'TEMP' FOR DEPT;

ALTER TABLE EMP_SAL
ADD CONSTRAINT DPT2 CHECK (DEPT IN ('HR','MIS','OPS','IT','ADMIN','TEMP'));

---------------------------------------------------------------------
ALTER TABLE EMP_SAL
ADD CONSTRAINT DSC CHECK (DESI IN ('ASSOCIATE','MANAGER','VP','DIRECTOR'));

-----------------------------------------
ALTER TABLE EMP_SAL
ADD CONSTRAINT BSC CHECK (SALARY >= 20000);