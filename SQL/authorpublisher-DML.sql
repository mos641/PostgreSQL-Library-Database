-- FileName:authorpublisher-DML
-- Description: script to populate database for lab 9
-- CST 8215

--emptying the tables to allow this script to be run multiple times without duplicate values
DELETE FROM Borrower_T;
DELETE FROM Publisher_T;
DELETE FROM Author_T;
DELETE FROM Books_T;
DELETE FROM Books_Out_T;

--populate the Borrower Table
INSERT INTO Borrower_T( Borrower_ID, Borrower_Name )
VALUES( 'MORZ', 'Zev Moriv');
INSERT INTO Borrower_T( Borrower_ID, Borrower_Name )
VALUES( 'GATD', 'Dof Gatum');
INSERT INTO Borrower_T( Borrower_ID, Borrower_Name )
VALUES( 'TOSF', 'Gin Tosig');
INSERT INTO Borrower_T( Borrower_ID, Borrower_Name )
VALUES( 'FELT', 'Taz Felor');
INSERT INTO Borrower_T( Borrower_ID, Borrower_Name )
VALUES( 'FIJJ', 'Juv Fijoy');
INSERT INTO Borrower_T( Borrower_ID, Borrower_Name )
VALUES( 'LUHK', 'Kit Luhuh');

--populate the Publisher Table
INSERT INTO Publisher_T( Publisher_ID, Publisher_Name )
VALUES( 'HARP', 'Harper');
INSERT INTO Publisher_T( Publisher_ID, Publisher_Name )
VALUES( 'ROSI', 'Rosiya Press');
INSERT INTO Publisher_T( Publisher_ID, Publisher_Name )
VALUES( 'SELF', 'Self Press');
INSERT INTO Publisher_T( Publisher_ID, Publisher_Name )
VALUES( 'WILE', 'Wiley');

--populate the Author Table
INSERT INTO Author_T( Author_ID, Author_Name )
VALUES( 'COELHOP', 'Paulo Coelho');
INSERT INTO Author_T( Author_ID, Author_Name )
VALUES( 'TOLSTOL', 'Leo Tolstoy');
INSERT INTO Author_T( Author_ID, Author_Name )
VALUES( 'ACHEBEC', 'Chinua Achebe');
INSERT INTO Author_T( Author_ID, Author_Name )
VALUES( 'LEEH', 'Harper Lee');

--populate the Books Table
INSERT INTO Books_T( Book_ID, Book_Title, Author_ID, Publisher_ID, Inventory )
VALUES( 'ALCHE', 'The Alchemist', 'COELHOP', 'HARP', 3 );
INSERT INTO Books_T( Book_ID, Book_Title, Author_ID, Publisher_ID, Inventory )
VALUES( 'ANNAK', 'Anna Karenina', 'TOLSTOL', 'ROSI', 1 );
INSERT INTO Books_T( Book_ID, Book_Title, Author_ID, Publisher_ID, Inventory )
VALUES( 'TFA', 'Things Fall Apart', 'ACHEBEC', 'SELF', 2 );
INSERT INTO Books_T( Book_ID, Book_Title, Author_ID, Publisher_ID, Inventory )
VALUES( 'TKAMB', 'To Kill A Mockingbird', 'LEEH', 'WILE', 1 );
INSERT INTO Books_T( Book_ID, Book_Title, Author_ID, Publisher_ID, Inventory )
VALUES( 'WNP', 'War and Peace', 'TOLSTOL', 'ROSI', 1 );

--populate the Books Out Table
INSERT INTO Books_Out_T( Book_Id, Inventory_Id, Borrower_ID )
VALUES( 'ALCHE', 1, 'MORZ');
INSERT INTO Books_Out_T( Book_Id, Inventory_Id, Borrower_ID )
VALUES( 'ALCHE', 2, 'GATD');
INSERT INTO Books_Out_T( Book_Id, Inventory_Id, Borrower_ID )
VALUES( 'ALCHE', 3, 'TOSF');
INSERT INTO Books_Out_T( Book_Id, Inventory_Id, Borrower_ID )
VALUES( 'ANNAK', 1, 'FELT');
INSERT INTO Books_Out_T( Book_Id, Inventory_Id, Borrower_ID )
VALUES( 'TFA', 1, 'FIJJ');
INSERT INTO Books_Out_T( Book_Id, Inventory_Id, Borrower_ID )
VALUES( 'TFA', 2, 'GATD');
INSERT INTO Books_Out_T( Book_Id, Inventory_Id, Borrower_ID )
VALUES( 'TKAMB', 1, 'LUHK');
INSERT INTO Books_Out_T( Book_Id, Inventory_Id, Borrower_ID )
VALUES( 'WNP', 1, 'LUHK');

--Insert two borrowers with no books out
INSERT INTO Borrower_T( Borrower_ID, Borrower_Name )
VALUES( 'SULH', 'Heyia Suls');
INSERT INTO Borrower_T( Borrower_ID, Borrower_Name )
VALUES( 'KURJ', 'Jileau Kurc');

--change value of Heyia to Hayia
UPDATE Borrower_T
SET Borrower_Name = 'Hayia Suls'
WHERE Borrower_Id = 'SULH';

--JOIN Statement to make 1NF
SELECT * FROM Books_T NATURAL JOIN Publisher_T NATURAL JOIN Author_T NATURAL JOIN Borrower_T;

--identify borrowers without books
SELECT Borrower_T.Borrower_Id, Borrower_Name FROM Borrower_T LEFT OUTER JOIN Books_Out_T
ON Borrower_T.Borrower_Id = Books_Out_T.Borrower_Id
WHERE NOT EXISTS (
SELECT 1
FROM Borrower_T
WHERE Borrower_T.Borrower_Id = Books_Out_T.Borrower_Id
);

-- eof abde0238-authorpublisher-DML