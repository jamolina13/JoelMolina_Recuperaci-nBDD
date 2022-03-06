CREATE DATABASE BD_Transaccional2

USE BD_Transaccional2

CREATE TABLE Building(
	id_Building int IDENTITY(1,1) NOT NULL,
	id_Location int NULL,
	Record_ID bigint NULL,
	Description varchar(max) NULL,
	Current_Status varchar(max) NULL,
	Current_Status_Date date NULL,
	Field_Date date NULL,
	Issued_Date date NULL,
	First_Construction_Document_Date date NULL,
	Estimated_Cost float NULL,
	Revised_Cost float NULL,
	Plansets float NULL,
	Existing_Construction_Type float NULL,
	Existing_Construction_Type_Description varchar(max) NULL,
	Proposed_Construction_Type float NULL,
	Proposed_Construction_Type_Description varchar(max) NULL,
	Supervisor_District float NULL,
	Number_of_Existing_Stories float NULL,
	Number_of_Proposed_Stories float NULL,
	Existing_Use varchar(max) NULL,
	Existing_Units float NULL,
	Proposed_Use varchar(max) NULL,
	Proposed_Units float NULL,
 CONSTRAINT PK_Building PRIMARY KEY CLUSTERED ( id_Building ASC)
 )


CREATE TABLE Location(
	id_Location int IDENTITY(1,1) NOT NULL,
	Block varchar(max) NULL,
	Lot varchar(max) NULL,
	Street_Name varchar(max) NULL,
	Street_Suffix varchar(max) NULL,
	Street_Number bigint NULL,
	Neighborhoods_Analysis varchar(max) NULL,
	Zipcode float NULL,
	Location varchar(max) NULL,
 CONSTRAINT PK_Location PRIMARY KEY CLUSTERED (id_Location ASC)
 )


 CREATE TABLE Permit(
	id_Permit int IDENTITY(1,1) NOT NULL,
	id_Building int NULL,
	Permit_Number varchar(max) NULL,
	Permit_Type bigint NULL,
	Permit_Type_Definition varchar(max) NULL,
	Permit_Creation_Date date NULL,
	Permit_Expiration_Date date NULL,
 CONSTRAINT PK_Permit PRIMARY KEY CLUSTERED (id_Permit ASC)
 )


ALTER TABLE Building  WITH CHECK ADD  CONSTRAINT FK_Building_Location FOREIGN KEY(id_Location)
REFERENCES Location (id_Location)

ALTER TABLE Permit  WITH CHECK ADD  CONSTRAINT FK_Permit_Building FOREIGN KEY(id_Building)
REFERENCES Building (id_Building)