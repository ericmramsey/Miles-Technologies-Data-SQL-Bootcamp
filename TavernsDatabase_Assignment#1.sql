/*
	Miles Technologies Data Bootcamp Assignment #1:

	1. Try creating a script for your database design. This will make the database much more maintainable. 
	Try “Seeding” the table/add dummy data

	2. The system should also be able to track Supplies. Supplies should have a unit and a name for instance “ounce” 
	and “strong ale” There should also be a way to track counts. That is to say- inventory. It should have a supply Id, 
	tavern id, and the date it was updated as well as the current count for that supply. There also needs to be a way 
	to show what the tavern received. This will include supply id, tavern id, cost, the amount received, and date.
                (Note: Supplies table and tavern IDs must exist in their respective tables)

	3. Taverns should also provide services. Services should have a name (ie. Pool or Weapon sharpening). They should also 
	have a status which should be a manageable list of values (stored in another table). For instance, ‘active’, ‘inactive’ 
	but we may also want to add others down the line. Such as out of stock or discontinued. The database should also keep 
	track of it with a sales table. This table will track service, guest, price, date purchased, amount purchased, and the 
	tavern it belongs to.

	@author: Eric Ramsey
	@version: 03/22/2022
*/

-- DROP TABLE statements for created tables in Taverns Database --
DROP TABLE IF EXISTS Tavern;
DROP TABLE IF EXISTS Locations;
DROP TABLE IF EXISTS Supplies;
DROP TABLE IF EXISTS TavernServices;
DROP TABLE IF EXISTS TavernServiceStatus;
DROP TABLE IF EXISTS Users;
DROP TABLE IF EXISTS Roles;
DROP TABLE IF EXISTS BasementRats;

-- CREATE TABLE statements for data in Taverns Database --
CREATE TABLE Locations(

	LocationID int IDENTITY(1, 1) PRIMARY KEY,
	LocationName varchar(250)

);

CREATE TABLE Tavern(

	TavernID int IDENTITY(1, 1) PRIMARY KEY,
	TavernName varchar(250),
	FloorCount int,
	LocationID int FOREIGN KEY REFERENCES Locations(LocationID)

);

CREATE TABLE Supplies(

	SuppliesID int IDENTITY(1, 1),
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

CREATE TABLE BasementRats(

	BasementRatsID int IDENTITY(1, 1),
	RatName varchar(250),
	TavernID int FOREIGN KEY REFERENCES Tavern(TavernID)

);

-- Seed tables with data and required data types for each field ---
INSERT INTO Locations
VALUES
	('Outskirts'),
	('Forest'),
	('City'),
	('Country'),
	('Coastal');


INSERT INTO Tavern (TavernName, FloorCount, LocationID) 
VALUES 
	('The Outskirts Inn', 3, 1),
	('The Shaggy Bear', 3, 2),
	('The New Narakort Inn', 5, 3),
	('The Country Inn', 2, 4),
	('The Sea Serpent Inn', 4, 5);

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

INSERT INTO BasementRats(RatName, TavernID)
VALUES
	('Squeks', 1),
	('Meeko', 2),
	('Ralph', 2),
	('Stew', 4);
