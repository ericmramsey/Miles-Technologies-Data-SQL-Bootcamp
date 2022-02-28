/* 
	Taverns script used to create required tables, links and values for the database.

	@author: Eric Ramsey
*/
CREATE TABLE Taverns (
	
	TavernID int PRIMARY KEY IDENTITY(1, 1),
	TavernName varchar(250),
	FloorsCount int

);
ALTER TABLE Taverns ADD TavernID int;
ALTER TABLE Taverns ADD TavernName varchar(250);
ALTER TABLE Taverns ADD FloorsCount int;
ALTER TABLE Taverns ADD Locations varchar(250);
ALTER TABLE Taverns ADD Users varchar(250);
ALTER TABLE Taverns ADD Guest varchar(250);
ALTER TABLE Taverns ADD Class varchar(250);
ALTER TABLE Taverns ADD Lvl varchar(250);
ALTER TABLE Taverns ADD Roles varchar(250);
ALTER TABLE Taverns ADD Supplies varchar(250);
ALTER TABLE Taverns ADD FOREIGN KEY(FK_LocationID) References Locations(LocationsID);
ALTER TABLE Taverns ADD FOREIGN KEY(FK_UsersID) References Users(UserID)
ALTER TABLE Taverns ADD FOREIGN KEY(FK_GuestsID) References Guests(GuestsID);
ALTER TABLE Taverns ADD FOREIGN KEY(FK_GuestClassID) References GuestClass(GuestClassID);
ALTER TABLE Taverns ADD FOREIGN KEY(FK_SupplyID) References Supplies(SupplyID);
ALTER TABLE Taverns ADD FOREIGN KEY(FK_RolesID) References Roles(RoleID);

INSERT INTO Taverns(TavernID, TavernName, FloorsCount) VALUEs (1, 'Outskirts Inn', 3);
INSERT INTO Taverns(TavernID, TavernName, FloorsCount) VALUEs (2, 'The Shaggy Bear', 3);
INSERT INTO Taverns(TavernID, TavernName, FloorsCount) VALUEs (3, 'The New Narakort Inn', 2);
INSERT INTO Taverns(TavernID, TavernName, FloorsCount) VALUEs (4, 'The Country Inn', 1);
INSERT INTO Taverns(TavernID, TavernName, FloorsCount) VALUEs (5, 'The Sea Serpent Inn', 4);

CREATE TABLE Locations (

	LocationsID int PRIMARY KEY IDENTITY(1, 1),
	LocationsName varchar(250)

);
ALTER TABLE Locations ADD LocationID int;
ALTER TABLE Locations ADD LocationsName varchar(250);
INSERT INTO Locations(LocationsID, LocationsName) VALUES (1, 'Outskirts');
INSERT INTO Locations(LocationsID, LocationsName) VALUES (2, 'Forest');
INSERT INTO Locations(LocationsID, LocationsName) VALUES (3, 'City');
INSERT INTO Locations(LocationsID, LocationsName) VALUES (4, 'Country');
INSERT INTO Locations(LocationsID, LocationsName) VALUES (5, 'Coastal');

CREATE TABLE Users (

	UsersID int PRIMARY KEY IDENTITY(1, 1),
	UsersName varchar(250),
	UsersDOB varchar(250),
	/*RoleID*/

);

ALTER TABLE Users ADD UserName varchar(250);
ALTER TABLE Users ADD UserDOB varchar(250);
INSERT INTO Users(UsersName, UsersID, UsersDOB) VALUES ('Geralt', 1, 01/01/1500);
INSERT INTO Users(UsersName, UsersID, UsersDOB) VALUES ('Roach', 2, 01/02/1500);
INSERT INTO Users(UsersName, UsersID, UsersDOB) VALUES ('Trish', 3, 01/03/1500);
INSERT INTO Users(UsersName, UsersID, UsersDOB) VALUES ('Cerci', 4, 01/04/1500);
INSERT INTO Users(UsersName, UsersID, UsersDOB) VALUES ('Yennifer', 5, 01/05/1500);

CREATE TABLE Guests (
	
	GuestID int PRIMARY KEY IDENTITY(1, 1),
	GuestName varchar(250),
	GuestNotes varchar(250),
	GuestDOB varchar(250),
	Cakeday varchar(250),
	GuestStatus varchar(250)

);

ALTER TABLE Guests ADD GuestName varchar(250);
ALTER TABLE Guests ADD GuestDOB varchar(250);
ALTER TABLE Guests ADD Cakeday varchar(250);
ALTER TABLE Guests ADD GuestStatus varchar(250);
INSERT INTO Guests(GuestName, GuestID, GuestDOB, Cakeday, GuestStatus) VALUES ('Geralt', 1, 01/01/1500, 'Monday', 'Indifferent');
INSERT INTO Guests(GuestName, GuestID, GuestDOB, Cakeday, GuestStatus) VALUES ('Roach', 2, 01/02/1500, 'Tuesday', 'Happy');
INSERT INTO Guests(GuestName, GuestID, GuestDOB, Cakeday, GuestStatus) VALUES ('Trish', 3, 01/03/1500, 'Wednesday', 'Focused');
INSERT INTO Guests(GuestName, GuestID, GuestDOB, Cakeday, GuestStatus) VALUES ('Cerci', 4, 01/04/1500, 'Thursday', 'Rebelious');
INSERT INTO Guests(GuestName, GuestID, GuestDOB, Cakeday, GuestStatus) VALUES ('Yennifer', 5, 01/05/1500, 'Friday', 'Angry');

CREATE TABLE GuestClass (

	GuestClassID int PRIMARY KEY IDENTITY(1, 1),
	ClassType varchar(250),
	lvl int

);

ALTER TABLE GuestClass ADD ClassType varchar(250);
INSERT INTO GuestClass(GuestClassID, ClassType, lvl) VALUES (1, 'Witcher', 99);
INSERT INTO GuestClass(GuestClassID, ClassType, lvl) VALUES (2, 'Horse', 99);
INSERT INTO GuestClass(GuestClassID, ClassType, lvl) VALUES (3, 'Mage', 75);
INSERT INTO GuestClass(GuestClassID, ClassType, lvl) VALUES (4, 'Witcher', 60);
INSERT INTO GuestClass(GuestClassID, ClassType, lvl) VALUES (5, 'Mage', 98);

CREATE TABLE Roles (

	RoleID int PRIMARY KEY IDENTITY(1, 1),
	RoleName varchar(250),

);

CREATE TABLE Supplies (
	
	SupplyID int PRIMARY KEY IDENTITY(1, 1),
	SupplyUnit int,
	SupplyName varchar(250)

);

ALTER TABLE Supplies ADD SupplyUnit varchar(250);
ALTER TABLE Supplies ADD SupplyName varchar(250);
INSERT INTO Supplies(SupplyID, SupplyUnit, SupplyName) VALUES (1, 400, 'Sword');
INSERT INTO Supplies(SupplyID, SupplyUnit, SupplyName) VALUES (2, 401, 'Orb');
INSERT INTO Supplies(SupplyID, SupplyUnit, SupplyName) VALUES (3, 402, 'Horse Feed');
INSERT INTO Supplies(SupplyID, SupplyUnit, SupplyName) VALUES (4, 403, 'Magic Potion');
INSERT INTO Supplies(SupplyID, SupplyUnit, SupplyName) VALUES (5, 404, 'Crystal Ball');
INSERT INTO Supplies(SupplyID, SupplyUnit, SupplyName) VALUES (6, 405, 'Mead');

CREATE TABLE SuppliesSales (
	
	SupplySoldID int PRIMARY KEY IDENTITY(1, 1),
	SuppliesSold varchar(250)

);

CREATE TABLE BasementRats (

	BasementRatsID int PRIMARY KEY IDENTITY(1, 1),
	RatName varchar(250) 

);