/*
	Miles Technologies Data Bootcamp Assignment #3:

	1. The system should also be able to track Rooms. Rooms should have a status and an associated tavern. There 
	should be a way to track Room Stays which will contain a sale, guest, room, the date it was stayed in and the rate
	2. Write a query that returns guests with a birthday before 2000. 
	3. Write a query to return rooms that cost more than 100 gold a night
	4. Write a query that returns UNIQUE guest names. 
	5. Write a query that returns all guests ordered by name (ascending) Use ASC or DESC after your ORDER BY [col]
	6. Write a query that returns the top 10 highest price sales
	7. Write a query to return all the values stored in all Lookup Tables - Lookup tables are the tables we reference 
	typically with just an ID and a name. This should be a dynamic combining of all of the tables
	8. Write a query that returns Guest Classes with Levels and Generate a new column with a label for their level 
	grouping (lvl 1-10, 10-20, etc)

	@author: Eric Ramsey
	@version: 03/22/2022
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

-- CREATE TABLE statements for data in Taverns Database --
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
	RoleID int FOREIGN KEY REFERENCES Roles(RoleID)

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
	
INSERT INTO TavernServices(ServiceName, TavernServiceStatusID, TavernID)
VALUES
	('Gwent', 1, 1),
	('Dice Poker', 2, 1),
	('Fist Fighting Match', 1, 1),
	('Horse Racing', 1, 1),
	('Arm Wrestling', 3, 1);

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

INSERT INTO Users(UserName, UserDOB, RoleID)
VALUES
	('Geralt', '05/05/1168', 1),
	('Roach', '06/31/1245', 2),
	('Triss', '11/13/1235', 3),
	('Yennefer', '08/04/1173', 3),
	('Circi', '04/17/1251', 1);

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

INSERT INTO Guests(GuestName, GuestDOB, LvL, GuestClassID, GuestStatus, GuestNotes, Cakeday)
VALUES
	('Vesemir', '02/21/1106', 92, 1, 'Content', 'Oldest and most experienced Witcher', 'May 4th'),
	('Jaskier Dandelion', '07/03/1228', 45, 10, 'Happy', 'Talented musician and avid dice player', 'July 4th'),
	('Vernon Roache', '12/06/1176', 89, 4, 'Content', 'Commander of the Blue Stripes Special Forces', 'December 25th'),
	('Ves', '09/13/1226', 86, 4, 'Focused', 'Member of the Elite Blue Stripes Special Forces', 'September 15th'),
	('Geralt of Rivia','05/05/1168', 100, 1, 'Quiet', 'Legendary Witcher of The School of The Wolf', 'May 5th'),
	('Yennefer of Vengerberg', '08/04/1173', 100, 3, 'Aloof', 'Legendary Mage and Sorceress', 'August 4th'),
	('Triss Merigold', '11/13/1235', 89, 3, 'Happy', 'Legendary Mage and Sorceress', 'November 28th'),
	('Circi', '04/14/1251', 85, 1, 'Happy', 'Princess of Cintra', 'April 20th');

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

-- Write a query that returns Guest Classes with Levels and Generate a new column with a label for their grouping --
/*
I'm not entirely sure how to execute this, I may need an example for creating columns
in a query statement and organizng by ranges
*/
