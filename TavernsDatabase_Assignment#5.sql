/*
	Miles Technologies Data Bootcamp Assignment #5:

	1. Write a function to return a "report" of all users and their roles
	2. Write a function to return all classes and the count of guests that hold those classes
	3. Write a function that returns all guests ordered by name (ascending) and their classes and corresponding levels. 
	Add a column that labels them beginner (lvl 1-5), intermediate (5-10) and expert (10+) for their classes (Don’t 
	alter the table for this)
	4. Write a function that takes a level and returns a “grouping” from question 3 (e.g. 1-5, 5-10, 10+, etc)
	5. Write a function that returns a report of all open rooms (not used) on a particular day (input) and which tavern 
	they belong to Modify the same function from 5 to instead return a report of prices in a range (min and max prices) - 
	Return Rooms and their taverns based on price inputs
	6. Write a stored procedure that uses the result from 6 to Create a Room in another tavern that undercuts (is less than)
	the cheapest room by a penny - thereby making the new room the cheapest one


	@author: Eric Ramsey
	@version: 03/12/2022
*/

-- DROP TABLE statements for created tables in Taverns Database --
DROP TABLE IF EXISTS Tavern;
DROP TABLE IF EXISTS Locations;
DROP TABLE IF EXISTS TavernOwner;
DROP TABLE IF EXISTS Rooms;
DROP TABLE IF EXISTS Supplies;
DROP TABLE IF EXISTS TavernServices;
DROP TABLE IF EXISTS TavernServiceStatus;
DROP TABLE IF EXISTS Users;
DROP TABLE IF EXISTS Classes;
DROP TABLE IF EXISTS GuestLevel;
DROP TABLE IF EXISTS Guests;
DROP TABLE IF EXISTS Roles;
DROP TABLE IF EXISTS SupplySales;
DROP TABLE IF EXISTS BasementRats;
GO

-- CREATE TABLE statements for data in Taverns Database (Kept drop statements so I can keep executing same script) --
CREATE TABLE Locations(

	LocationID int IDENTITY(1, 1) PRIMARY KEY,
	LocationName varchar(250)

);
GO

CREATE TABLE TavernOwner(

	OwnerID int IDENTITY(1, 1) PRIMARY KEY,
	OwnerName varchar(250)

);

CREATE TABLE Tavern(

	TavernID int IDENTITY(1, 1) PRIMARY KEY,
	TavernName varchar(250),
	FloorCount int,
	LocationID int FOREIGN KEY REFERENCES Locations(LocationID),
	OwnerID int FOREIGN KEY REFERENCES TavernOwner(OwnerID),

);

CREATE TABLE Rooms(

	RoomID int IDENTITY(1, 1) PRIMARY KEY,
	RoomNumber int,
	RoomCost int,
	RoomAvailibilityStatus varchar(250),
	TavernID int FOREIGN KEY REFERENCES Tavern(TavernID),

);
GO

CREATE TABLE Supplies(

	SuppliesID int IDENTITY(1, 1) PRIMARY KEY,
	SupplyUnitNum int,
	SupplyName varchar(250),
	SupplyCost int,
	SupplyCount int,
	SuppliesRecieved int,
	SuppliesRecievedDate varchar(250)
	
);

CREATE TABLE TavernServiceStatus(

	TavernServiceStatusID int IDENTITY(1, 1) PRIMARY KEY,
	TavernServiceStatus varchar(250)

);


CREATE TABLE TavernServices(

	TavernServiceID int IDENTITY(1, 1),
	ServiceName varchar(250),
	ServiceCost int,
	TavernServiceStatusID int FOREIGN KEY REFERENCES TavernServiceStatus(TavernServiceStatusID),
	TavernID int FOREIGN KEY REFERENCES Tavern(TavernID)

);

CREATE TABLE Roles(

	RoleID int IDENTITY(1, 1) PRIMARY KEY,
	RoleName varchar(250)

);

CREATE TABLE Users(

	UserID int IDENTITY(1, 1),
	UserName varchar(250),
	UserDOB varchar(250),
	RoleID int FOREIGN KEY REFERENCES Roles(RoleID),
	UserAdmin varchar(250)

);

CREATE TABLE Classes(

	ClassID int IDENTITY(1, 1) PRIMARY KEY,
	ClassName varchar(250)

);

CREATE TABLE GuestLevel(

	GuestLevelID int IDENTITY(1, 1) PRIMARY KEY,
	LvL int,

);
GO

CREATE TABLE Guests(

	GuestID int IDENTITY(1, 1) PRIMARY KEY,
	GuestName varchar(250),
	GuestDOB varchar(250),
	LvL int,
	GuestClassID int FOREIGN KEY REFERENCES Classes(ClassID),
	GuestStatus varchar(250),
	GuestNotes varchar(250),
	GuestMultipleClasses varchar(250),
	Cakeday varchar(250),

);

CREATE TABLE SupplySales(

	SupplySalesID int IDENTITY(1, 1) PRIMARY KEY,
	SupplyID int FOREIGN KEY REFERENCES Supplies(SuppliesID),
	SupplyCost int,
	QuantitySold int,
	GuestID int FOREIGN KEY REFERENCES Guests(GuestID),
	DateOfPurchase varchar(250)

);

CREATE TABLE BasementRats(

	BasementRatsID int IDENTITY(1, 1),
	RatName varchar(250),
	TavernID int FOREIGN KEY REFERENCES Tavern(TavernID)

);

-- Seed tables with data and required data types for each field ---
INSERT INTO Locations(LocationName)
VALUES
	('Outskirts'),
	('Forest'),
	('City'),
	('Country'),
	('Coastal');

INSERT INTO TavernOwner(OwnerName)
VALUES
	('Donar The Hindar'),
	('Jaroslaw Gruda'),
	('Marta Bitner'),
	('Freya Allan'),
	('Joey Batey');

INSERT INTO Tavern(TavernName, FloorCount, LocationID, OwnerID) 
VALUES 
	('The Outskirts Inn', 3, 1, 1),
	('The Shaggy Bear', 3, 2, 2),
	('The New Narakort Inn', 5, 3, 3),
	('The Country Inn', 2, 4, 4),
	('The Sea Serpent Inn', 4, 5, 5);

INSERT INTO Rooms(RoomNumber, RoomCost, RoomAvailibilityStatus, TavernID)
VALUES
	(333, 200, 'Available', 1),
	(334, 200, 'Available', 1),
	(335, 200, 'Unavailable', 1),
	(336, 500, 'Available', 1),
	(337, 500, 'Available', 1),
	(338, 500, 'Unavailable', 1),
	(1, 300, 'Available', 2),
	(2, 300, 'Unavailable', 2),
	(3, 500, 'Available', 2),
	(4, 500, 'Available', 2),
	(5, 700, 'Available', 2),
	(21, 800, 'Available', 3),
	(22, 800, 'Available', 3),
	(23, 800, 'Available', 3),
	(24, 1000, 'Unavailable', 3),
	(25, 1000, 'Unavailable', 3),
	(100, 200, 'Unavailable', 4),
	(101, 200, 'Unavailable', 4),
	(102, 200, 'Available', 4),
	(103, 200, 'Available', 4),
	(104, 200, 'Unavailable', 4),
	(1, 650, 'Available', 5),
	(2, 650, 'Available', 5),
	(3, 650, 'Available', 5),
	(4, 1100, 'Unavailable', 5),
	(4, 1100, 'Unavailable', 5)

INSERT INTO Supplies (SupplyUnitNum, SupplyName, SupplyCost, SupplyCount) 
VALUES
	(1, 'Apricot', 3.00, 50),
	(2, 'Apple Bread', 2.00, 20),
	(3, 'Apple', 1.00, 30),
	(4, 'Baked Apple', 7.00, 15),
	(5, 'Baked Potato', 14.00, 15),
	(6, 'Blueberries', 4.00, 20),
	(7, 'Chicken', 18.00, 25),
	(8, 'Dried Fish', 18.00, 25),
	(9, 'Egg', 3.00, 36),
	(10, 'Exquisite Honey', 30.00, 10),
	(11, 'Fish', 14.00, 30),
	(12, 'Fried Meat', 20.00, 25),
	(13, 'Honey Comb', 8.00, 15),
	(14, 'Mutton Leg', 14.00, 20),
	(15, 'Pear', 3.00, 27),
	(16, 'Plum', 2.00, 30),
	(17, 'Poisoned Apple', 8.00, 5),
	(18, 'Potato', 6.00, 24),
	(19, 'Apple Juice', 12.00, 30),
	(20, 'Beauclair White Wine', 18.00, 15),
	(21, 'Cow Milk', 8.00, 12),
	(22, 'Fiorano Wine', 14.00, 15),
	(23, 'Kaedweni Stout Ale', 7.00, 35),
	(24, 'Redanian Lager', 11.00, 25),
	(25, 'Vizman Champion Ale', 7.00, 40),
	(26, 'Water', 5.00, 300),
	(27, 'White Wolf Wine', 14.00, 25);

INSERT INTO TavernServiceStatus(TavernServiceStatus)
VALUES
	('Active'),
	('Inactive'),
	('Discontinued');
	
INSERT INTO TavernServices(ServiceName, ServiceCost, TavernServiceStatusID, TavernID)
VALUES
	('Gwent', 20, 1, 1),
	('Dice Poker', 20, 2, 1),
	('Fist Fighting Match', 10, 1, 1),
	('Horse Racing', 25, 1, 1),
	('Arm Wrestling', 15, 3, 1);

INSERT INTO Roles(RoleName)
VALUES
	('Witcher'),
	('Horse'),
	('Mage'),
	('Warrior'),
	('Knight'),
	('Assassin'),
	('Farmer'),
	('Fisherman'),
	('Blacksmith');

INSERT INTO Users(UserName, UserDOB, RoleID, UserAdmin)
VALUES
	('Geralt', '05/05/1168', 1, 'True'),
	('Roach', '06/31/1245', 2, 'False'),
	('Triss', '11/13/1235', 3, 'True'),
	('Yennefer', '08/04/1173', 3, 'True'),
	('Circi', '04/17/1251', 1, 'False');

INSERT INTO Classes(ClassName)
VALUES
	('Witcher'),
	('Horse'),
	('Mage'),
	('Warrior'),
	('Knight'),
	('Assassin'),
	('Farmer'),
	('Fisherman'),
	('Blacksmith'),
	('Bard');

INSERT INTO Guests(GuestName, GuestDOB, LvL, GuestClassID, GuestStatus, GuestNotes, GuestMultipleClasses, Cakeday)
VALUES
	('Vesemir', '02/21/1106', 92, 1, 'Content', 'Oldest and most experienced Witcher', 'False', 'May 4th'),
	('Jaskier Dandelion', '07/03/1228', 45, 10, 'Happy', 'Talented musician and avid dice player', 'False', 'July 4th'),
	('Vernon Roache', '12/06/1176', 89, 4, 'Content', 'Commander of the Blue Stripes Special Forces', 'False','December 25th'),
	('Ves', '09/13/1226', 86, 4, 'Focused', 'Member of the Elite Blue Stripes Special Forces', 'False', 'September 15th'),
	('Geralt of Rivia','05/05/1168', 100, 1, 'Quiet', 'Legendary Witcher of The School of The Wolf', 'False', 'May 5th'),
	('Yennefer of Vengerberg', '08/04/1173', 100, 3, 'Aloof', 'Legendary Mage and Sorceress', 'False', 'August 4th'),
	('Triss Merigold', '11/13/1235', 89, 3, 'Happy', 'Legendary Mage and Sorceress', 'False', 'November 28th'),
	('Circi', '04/14/1251', 85, 1, 'Happy', 'Princess of Cintra',  'False','April 20th');

INSERT INTO SupplySales(SupplyID, SupplyCost, QuantitySold, GuestID, DateOfPurchase)
VALUES
	(12, 20.00, 1, 5, '05/22/1272'),
	(27, 14.00, 2, 5, '05/22/1272'),
	(20, 18.00, 1, 7, '05/22/1272'),
	(22, 14.00, 3, 6, '05/22/1272'),
	(12, 20.00, 1, 3, '05/23/1272'),
	(22, 14.00, 1, 4, '05/23/1272');

INSERT INTO BasementRats(RatName, TavernID)
VALUES
	('Squeks', 1),
	('Meeko', 2),
	('Ralph', 2),
	('Stew', 4);

GO

-- Query Statements to extract required data from tables --
-- Write a query that returns guests with a birthday before 2000 --
SELECT
	CASE 
		WHEN GuestDOB < 2000 Then GuestID
	END
FROM Guests

-- Write a query to return rooms that cost more than 100 gold a night --
SELECT
	CASE 
		WHEN RoomCost > 100 Then RoomID
	END
FROM Rooms

-- Write a query that returns UNIQUE guest names --
SELECT DISTINCT GuestName FROM Guests

-- Write a query that returns all guests ordered by name (ascending) --
SELECT GuestName FROM Guests ORDER BY GuestName DESC

-- Write a query the top 10 HIGHEST price sales --
SELECT TOP 10 SupplyCost FROM Supplies

-- Write a query to return all the values stored in all Lookup Tables --
SELECT * FROM GuestLevel RIGHT JOIN Classes ON GuestLevel.LvL=Classes.ClassID

-- Write a query to return users who have admin roles --
SELECT
	CASE
		WHEN UserAdmin = 'True' THEN UserName + ' is an Admin'
		ELSE NULL

	END
FROM Users

-- Write a query to return users who have admin roles and information about their tavern --
SELECT CONCAT (
                '“Welcome, ',
                UserName,
                '. Your tavern, ',
                TavernName,
                ' at ',
                LocationName,
                ' is doing well. The last thing we sold was ',
                ServiceName,
                ' for ',
                ServiceCost,
                '.'
               ) AS welcome_text
FROM tavern
INNER JOIN Users ON Tavern.OwnerID = Users.UserID
INNER JOIN Locations ON Tavern.LocationID = Locations.LocationID
INNER JOIN TavernServices ON Tavern.TavernID = TavernServices.TavernServiceID
INNER JOIN SupplySales ON TavernServices.TavernServiceID = TavernServices.TavernID

WHERE SupplySales.SupplySalesID IN
(
    SELECT MAX(SupplySales.SupplySalesID)
    FROM tavern
    INNER JOIN Locations ON Tavern.LocationID = Locations.LocationID
    INNER JOIN TavernServices ON Tavern.TavernID = TavernServices.TavernID
    INNER JOIN SupplySales ON TavernServices.TavernServiceID = SupplySales.SupplySalesID
    GROUP BY TavernName
);

-- Write a query that returns all guests ordered by name (ascending) and their classes and corresponding levels --
SELECT GuestID, GuestName, GuestClassID, LvL
FROM Guests
ORDER BY GuestName ASC

-- Write a query that returns the top 10 sales in terms of sales prices and what the services were --
SELECT TOP 10 ServiceCost FROM TavernServices ORDER BY ServiceCost DESC

-- Write a query that returns guests with 2 or more classes --
SELECT
	CASE
		WHEN GuestMultipleClasses = 'True' THEN GuestID
	END
FROM Guests

-- Write a query that returns guests with two or more classes with levels higher than 5 --
SELECT
	CASE
		WHEN GuestMultipleClasses = 'True' AND LVL >= 5 THEN GuestID
	END
FROM Guests

-- Write a function to return a "report" of all Users and their roles --
CREATE FUNCTION UsersRolesReport (
	
	@User_ID int

)
RETURNS TABLE
AS
RETURN
	SELECT
		UserID,
		UserName,
		UserDOB,
		RoleID
		
	FROM
		Users
	WHERE
		UserID = @User_ID

-- Write a function to return all classes and the count of guests that hold those classes --
CREATE FUNCTION GuestsClassesReport (
	
	@Guest_ID int

)
RETURNS TABLE
AS
RETURN
	SELECT
		GuestID,
		GuestName,
		GuestClassID,
		LvL
	FROM
		Guests
	WHERE
		GuestID = @Guest_ID

-- Write a function that returns a report of all open rooms on a particular day and which Tavern they belong to --
CREATE FUNCTION AvailableRoomsReport(

	@Tavern_ID int

)
RETURNS TABLE
AS
RETURN
	SELECT
		RoomID,
		RoomNumber,
		RoomCost,
		RoomAvailibilityStatus
		TavernID

	FROM
		Rooms, Tavern
	WHERE
		TavernID = @Tavern_ID
		
-- Write a stored procedure that uses the result from 6 to Create a Room in another tavern that undercuts (is less than) the cheapest room --
CREATE PROCEDURE Rooms addRooms
	@Room_ID int
	@Room_Number int
	@Room_Cost int
	@Room_Avail_Status varchar(250)
	
AS
BEGIN
	SET NOCOUNT ON

	INSERT INTO Rooms (

		RoomID,
		RoomNumber,
		RoomCost,
		RoomAvailibilityStatus
	)
	VALUE (

		@20
		@700
		@1200
		@'Availible'
-- The ones missing I cannot find a correct solution for --