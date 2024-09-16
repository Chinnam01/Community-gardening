/*Create a store procedure to get the sub query 
of the residents based on the land they work for*/

CREATE PROC   spGetSubQueryResidents @Land INT
AS
SELECT * FROM dbo.Resident --Select all the residents
WHERE         ResidentID IN (SELECT ResidentID FROM dbo.Resident
						 WHERE Land = @Land); -- filter residents who work in a particular land
/* this query can be executable and to run the query please use
below parameter for land = 10001, 10002, 10003. 
Excutable code will be spGetSubQueryResidents @Land = 10001*/


/*combine volunteers in both resident table and volunteer table. 
By this we can see who works in locations where they are from */
CREATE PROC spGetUnionVolunteer @Location int
AS
SELECT      Volunteer,Location 
FROM        dbo.Resident --Select all volunteers from Resident table
WHERE       Location = @Location
UNION
SELECT      VolunteerID,Location 
FROM        dbo.Volunteer --Select all volunteerids from Volunteer table
WHERE       Location = @Location

/* this query can be executable and to run the query please use
below parameter for Location = 11001, 11002, 11003. 
Excutable code will be spGetUnionVolunteer @Location = 11001*/


/*To get the volunteer details from the Volunteer table based on the location */

CREATE PROC   spGetVolunteerLocation @Location int
AS
SELECT * FROM dbo.Volunteer 
WHERE         Location = @Location --Select all the volunteers from the Volunteer table
 /* this query can be executable and to run the query please use
below parameter for Location = 11001, 11002, 11003. 
Excutable code will be spGetVolunteerLocation @Location = 11001*/


/*to insert a new resident to the table*/ 

ALTER PROC spInsertResident (@ResidentID		INT,
								@ResidentName	varchar(150),
								@Location		int,
								@Volunteer		int,
								@Land			int) --These are parameters for user has to insert
AS
		BEGIN
			INSERT INTO dbo.Resident
					    (ResidentID,
					     ResidentName,
					     Location,
					     Volunteer,
					     Land) -- These are the columns of the table
			VALUES      (@ResidentID, 
					     @ResidentName,
					     @Location,
					     @Volunteer,
					     @Land) -- Paramters are added here as values to be added.
		END

		/* this query can be executable and to run the query please use new parameters according to the values given.
		ex: spInsertResident @ResidentID = 3537393, @ResidentName = "TEST", @Location = 110023, @Volunteer = 112232, @Land = 12324*/
		
		
		/*Get the location of resident based on the location*/

CREATE PROC     ResidentLocations @Location int 
AS  
SELECT * FROM   dbo.Resident 
WHERE           Location = @Location -- Get all the residents, @Location is the parameter 


		/* this query can be executable and to run the query please use new parameters according to the values given.
		ex: ResidentLocations @Location = 11001/*
		
		
		/*to insert a new resident to the table*/ 

ALTER PROC spInsertResident (@ResidentID		INT,
								@ResidentName	varchar(150),
								@Location		int,
								@Volunteer		int,
								@Land			int) --These are parameters for user has to insert
AS
		BEGIN
			INSERT INTO dbo.Resident
					(ResidentID,
					ResidentName,
					Location,
					Volunteer,
					Land) -- These are the columns of the table
			VALUES (@ResidentID, 
					@ResidentName,
					@Location,
					@Volunteer,
					@Land) -- Paramters are added here as values to be added.
		END

		/* this query can be executable and to run the query please use new parameters according to the values given.
		ex: spInsertResident @ResidentID = 3537393, @ResidentName = "TEST", @Location = 11001, @Volunteer = 13001, @Land = 10001*/