CREATE DATABASE DWH_EsquemaEstrella_BuildingPermits
use DWH_EsquemaEstrella_BuildingPermits
CREATE TABLE Dim_Building(
	id_Building int IDENTITY(1,1) NOT NULL,
	Description varchar(max) NULL,
	Current_Status varchar(max) NULL,
	Plansets float NULL,
	Supervisor_District float NULL,
	Number_of_Existing_Stories float NULL,
	Number_of_Proposed_Stories float NULL,
 CONSTRAINT PK_Dim_Building PRIMARY KEY CLUSTERED(id_Building ASC)
)


CREATE TABLE Dim_Location(
	id_Location int IDENTITY(1,1) NOT NULL,
	Block varchar(max) NULL,
	Lot varchar(max) NULL,
	Street_Name varchar(max) NULL,
	Street_Suffix varchar(max) NULL,
	Neighborhoods_Analysis varchar(max) NULL,
	Zipcode float NULL,
	Location varchar(max) NULL,
 CONSTRAINT PK_Dim_Location PRIMARY KEY CLUSTERED (id_Location ASC)
)



CREATE TABLE Dim_Permit(
	id_Permit int IDENTITY(1,1) NOT NULL,
	Permit_Number varchar(max) NULL,
	Permit_Type bigint NULL,
	Permit_Type_Definition varchar(max) NULL,
 CONSTRAINT PK_Dim_Permit PRIMARY KEY CLUSTERED (id_Permit ASC)
 )


 CREATE TABLE Dim_Time(
	TimeId int IDENTITY(1,1) NOT NULL,
	Date date NULL,
	year int NULL,
	month int NULL,
	day int NULL,
	dayname varchar(50) NULL,
	dayweek int NULL,
	week int NULL,
	trimester int NULL,
 CONSTRAINT PK_Dim_Time PRIMARY KEY CLUSTERED (TimeId ASC)
)


CREATE TABLE Fact_Building(
	id_FactCost int IDENTITY(1,1) NOT NULL,
	id_Building int NULL,
	id_Location int NULL,
	id_Permit int NULL,
	id_Time int NULL,
	Estimated_Cost float NULL,
	Revised_Cost float NULL,
	Existing_Units float NULL,
	total float NULL,
 CONSTRAINT PK_Fact_Sales PRIMARY KEY CLUSTERED (id_FactCost ASC)
 )


ALTER TABLE Fact_Building  WITH CHECK ADD  CONSTRAINT FK_Fact_Sales_Dim_Building FOREIGN KEY(id_Building)
REFERENCES Dim_Building (id_Building)

ALTER TABLE Fact_Building  WITH CHECK ADD  CONSTRAINT FK_Fact_Sales_Dim_Location FOREIGN KEY(id_Location)
REFERENCES Dim_Location (id_Location)

ALTER TABLE Fact_Building WITH CHECK ADD  CONSTRAINT FK_Fact_Sales_Dim_Permit FOREIGN KEY(id_Permit)
REFERENCES Dim_Permit (id_Permit)

ALTER TABLE Fact_Building  WITH CHECK ADD  CONSTRAINT FK_Fact_Sales_Dim_Time FOREIGN KEY(id_Time)
REFERENCES Dim_Time (TimeId)
