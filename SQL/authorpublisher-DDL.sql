-- FileName:authorpublisher-DDL
-- Description: script to create database for lab 9
-- CST 8215

--dropping the views if they exist to allow tables to be dropped
DROP VIEW IF EXISTS FIRSTFORM_V;
--dropping the tables if they exist, allows this script to be run multiple times without errors
DROP TABLE IF EXISTS Books_Out_T;
DROP TABLE IF EXISTS Books_T;
DROP TABLE IF EXISTS Author_T;
DROP TABLE IF EXISTS Publisher_T;
DROP TABLE IF EXISTS Borrower_T;

--creating the Borrower Table
CREATE TABLE Borrower_T(
  Borrower_Id		CHAR( 4 ),
  Borrower_Name 	VARCHAR( 60 ),
  CONSTRAINT PK_Borrower_Id PRIMARY KEY( Borrower_Id )
);

--creating the Publisher Table
CREATE TABLE Publisher_T (
  Publisher_Id        CHAR( 4 ),
  Publisher_Name      VARCHAR( 60 ),
  CONSTRAINT PK_Publisher_Id PRIMARY KEY( Publisher_Id )
);

--creating the Author Table
CREATE TABLE Author_T (
  Author_Id        VARCHAR( 7 ),
  Author_Name      VARCHAR( 60 ),
  CONSTRAINT PK_Author_Id PRIMARY KEY( Author_Id )
);

--creating the Books Table
CREATE TABLE Books_T (
  Book_Id	     VARCHAR( 5 ) NOT NULL,
  Book_Title         VARCHAR( 60 ),
  Author_Id	     VARCHAR( 7 ) NOT NULL,
  Publisher_Id       CHAR( 4 ) NOT NULL,
  Inventory	     INTEGER NOT NULL,
  CONSTRAINT PK_Book_Id PRIMARY KEY( Book_Id ),
  CONSTRAINT FK1_Author_Id FOREIGN KEY( Author_Id ) REFERENCES Author_T( Author_Id ),
  CONSTRAINT FK2_Publisher_Id FOREIGN KEY( Publisher_Id ) REFERENCES Publisher_T( Publisher_Id )
);

--creating the Books Out Table
CREATE TABLE Books_Out_T (
  Book_Id	       VARCHAR( 5 ),
  Inventory_Id         INTEGER,
  Borrower_Id	       CHAR( 4 ),
  CONSTRAINT PK_Books_Line PRIMARY KEY( Book_Id, Inventory_Id ),
  CONSTRAINT FK1_Book_ID FOREIGN KEY( Book_Id ) REFERENCES Books_T( Book_Id ),
  CONSTRAINT FK2_Borrower_Id FOREIGN KEY( Borrower_Id ) REFERENCES Borrower_T( Borrower_Id )
);

--creating view
CREATE VIEW FIRSTFORM_V
AS
SELECT * FROM Books_T NATURAL JOIN Publisher_T NATURAL JOIN Author_T NATURAL JOIN Borrower_T;


-- eof abde0238-authorpublisher-DDL