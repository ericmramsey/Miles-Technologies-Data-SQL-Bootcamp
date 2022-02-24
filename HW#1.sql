/*
    DB CLASS #1 - HW #1

    1. Try creating a script for your database design. This will make the database much more maintainable. 
    Try “Seeding” the table/add dummy data

    2. The system should also be able to track Supplies. Supplies should have a unit and a name for instance
     “ounce” and “strong ale” There should also be a way to track counts. That is to say- inventory. It should 
     have a supply Id, tavern id, and the date it was updated as well as the current count for that supply. 
     There also needs to be a way to show what the tavern received. This will include supply id, tavern id, cost, 
     the amount received, and date.
                (Note: Supplies table and tavern IDs must exist in their respective tables)

    3. Taverns should also provide services. Services should have a name (ie. Pool or Weapon sharpening). They 
    should also have a status which should be a manageable list of values (stored in another table). For instance, 
    ‘active’, ‘inactive’ but we may also want to add others down the line. Such as out of stock or discontinued. 
    The database should also keep track of it with a sales table. This table will track service, guest, price, 
    date purchased, amount purchased, and the tavern it belongs to

    4. Seed all tables with at least 5-10 rows of data each. Add some repeated fields to show normalization

    @author: Eric Ramsey
    @version: 2/24/22
*/

/* DROP TABLE statements for neccesary Tables created */
DROP TABLE IF EXISTS [Tavern];
DROP TABLE IF EXISTS [Users];
DROP TABLE IF EXISTS [Roles];
DROP TABLE IF EXISTS [Locations];
DROP TABLE IF EXISTS [BasementRats;

IF OBJECT_ID(‘dbo.[Tavern], ‘U’) IS NOT NULL DROP TABLE
dbo.[Tavern];

CREATE Table [Table Name] (
    [Column Name] [Column Type] IDENTITY([seed], [increment]), 
    [Column Name] [Column Type]
);

/* Used to create a table identified as Tavern with 5 Data Types */
CREATE TABLE [Tavern] (
    
    TavernID INT IDENTITY(1, 1),
    TavernName varchar(250),
    TavernOwnerID varchar(250),
    TavernLocationID varchar(250);
    NumberOfFloors int

);

/* Used to create a table identified as Users with 4 Data Types */
CREATE TABLE [Users] (

    UserID Int IDENTITY(1, 1),
    UserName varchar(250),
    UserDOB varchar(250),
    RolesID
);

/* Used to create a table identified as Roles with 2 Data Types */
CREATE TABLE [Roles] (

    RolesID IDENTITY(1, 1),
    RolesName varchar(250)
);

/* Used to create a table identified as Locations with 2 Data Types */
CREATE TABLE [Locations] (

    LocationsID IDENTITY(1, 1),
    LocationsName varchar(250)
);

/* Used to create a table identified as BasementRats with 3 Data Types */
CREATE TABLE [BasementRats] (

    BasementRatsID IDENTITY(1, 1),
    RatName varchar(250),
    TavernID
);

/* ALTER TABLE used to add the neccesary columns to the Tavers table for data to be stored from sub-tables*/
ALTER TABLE [Tavern] (ADD/DROP COLUMN/ALTER COLUMN)[Users] (varchar(255));
ALTER TABLE [Tavern] (ADD/DROP COLUMN/ALTER COLUMN)[Roles] (varchar(255));
ALTER TABLE [Tavern] (ADD/DROP COLUMN/ALTER COLUMN)[Locations] (varchar(255));
ALTER TABLE [Tavern] (ADD/DROP COLUMN/ALTER COLUMN)[BasementRats] (varchar(255));

/* Seeds Data into the Taverns table in the correct and desired values (I used Inn names freom Witcher 3)*/
INSERT INTO Taverns(TavernName, TavernID) VALUES ("Outskirts Inn", 1);
INSERT INTO Taverns(TavernName, TavernID) VALUES ("The Shaggy Bear", 2);
INSERT INTO Taverns(TavernName, TavernID) VALUES ("The New Narakort Inn", 3);
INSERT INTO Taverns(TavernName, TavernID) VALUES ("Country Inn", 4);
INSERT INTO Users(TavernID, NumberOfFloors) VALUES (1, 3);
INSERT INTO Users(TavernID, NumberOfFloors) VALUES (2, 3);
INSERT INTO Users(TavernID, NumberOfFloors) VALUES (3, 3);
INSERT INTO Users(TavernID, NumberOfFloors) VALUES (4, 3);

INSERT INTO Users(Username, UserID) VALUES ("Geralt", 1);
INSERT INTO Users(Username, UserID) VALUES ("Roach", 2);
INSERT INTO Users(Username, UserID) VALUES ("Trish", 3);
INSERT INTO Users(Username, UserID) VALUES ("Cerci", 4);
INSERT INTO Users(Username, UserDOB) VALUES ("Geralt", "01/01/1990");
INSERT INTO Users(Username, UserDOB) VALUES ("Roach", "01/02/1990");
INSERT INTO Users(Username, UserDOB) VALUES ("Trish", "01/03/1990");
INSERT INTO Users(Username, UserDOB) VALUES ("Cerci", "01/04/1990");

INSERT INTO Locations(LocationsName, LocationsID) VALUES ("Outskirts", 1);
INSERT INTO Locations(LocationsName, LocationsID) VALUES ("Forest", 2);
INSERT INTO Locations(LocationsName, LocationsID) VALUES ("City", 3);
INSERT INTO Locations(LocationsName, LocationsID) VALUES ("Country", 4);

INSERT INTO BasementRats(RatName, BasementRatsID) VALUES ("Squeks", 1);
INSERT INTO BasementRats(RatName, BasementRatsID) VALUES ("Meeko", 2);
INSERT INTO BasementRats(RatName, BasementRatsID) VALUES ("Ralph", 3);
INSERT INTO BasementRats(RatName, BasementRatsID) VALUES ("Stew", 4);