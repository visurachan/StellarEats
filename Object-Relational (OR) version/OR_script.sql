
-- Drop all dependent types first
DROP TYPE CustomerType FORCE;
DROP TYPE DietaryCategoryType FORCE;
DROP TYPE MealType FORCE;
DROP TYPE KitchenType FORCE;
DROP TYPE DZoneType FORCE;
DROP TYPE DZoneManagerType FORCE;
DROP TYPE DZoneMemberType FORCE;
DROP TYPE KitchenManagerType FORCE;
DROP TYPE KitchenTeamMemberType FORCE;
DROP TYPE TeamLeaderType FORCE;
DROP TYPE DZoneStaffType FORCE;
DROP TYPE KitchenStaffType FORCE;
DROP TYPE EmployeeType FORCE;

-- Drop collection types
DROP TYPE Diet_category_nt_type FORCE;
DROP TYPE Customer_nt_type FORCE;
DROP TYPE Dzone_staff_nt_type FORCE;
DROP TYPE Meal_nt_type FORCE;
DROP TYPE Kitchen_nt_type FORCE;
DROP TYPE Kitchen_staff_nt_type FORCE;

DROP TABLE CustomerTable CASCADE CONSTRAINTS PURGE;
DROP TABLE DietaryCategoryTable CASCADE CONSTRAINTS PURGE;
DROP TABLE MealTable CASCADE CONSTRAINTS PURGE;
DROP TABLE DZoneTable CASCADE CONSTRAINTS PURGE;
DROP TABLE KitchenTable CASCADE CONSTRAINTS PURGE;
DROP TABLE DZoneManagerTable CASCADE CONSTRAINTS PURGE;
DROP TABLE DZoneMemberTable CASCADE CONSTRAINTS PURGE;
DROP TABLE KitchenManagerTable CASCADE CONSTRAINTS PURGE;
DROP TABLE KitchenTeamMemberTable CASCADE CONSTRAINTS PURGE;
DROP TABLE DZoneStaffTable CASCADE CONSTRAINTS PURGE;
DROP TABLE KitchenStaffTable CASCADE CONSTRAINTS PURGE;
DROP TABLE TeamLeaderTable CASCADE CONSTRAINTS PURGE;


CREATE OR REPLACE TYPE KitchenType
/
CREATE OR REPLACE TYPE DZoneType
/
CREATE OR REPLACE TYPE DZoneStaffType
/
CREATE OR REPLACE TYPE MealType
/
CREATE OR REPLACE TYPE CustomerType
/
CREATE OR REPLACE TYPE KitchenStaffType
/
CREATE OR REPLACE TYPE DietaryCategoryType
/



CREATE TYPE Kitchen_nt_type AS TABLE OF REF KitchenType
/
CREATE TYPE Meal_nt_type AS TABLE OF REF MealType
/
CREATE TYPE Dzone_staff_nt_type AS TABLE OF REF DZoneStaffType
/
CREATE TYPE Customer_nt_type AS TABLE OF REF CustomerType
/
CREATE TYPE Diet_category_nt_type AS TABLE OF REF DietaryCategoryType
/
CREATE TYPE Kitchen_staff_nt_type AS TABLE OF REF KitchenStaffType
/



CREATE TYPE EmployeeType AS OBJECT (
  empNo NUMBER,
  name VARCHAR2(100),
  telephone VARCHAR2(15),
  email VARCHAR2(100),
  salary NUMBER,
  dob DATE,
  dateJoined DATE,
  NIN VARCHAR2(15)
) NOT FINAL;
/
CREATE OR REPLACE TYPE KitchenStaffType UNDER EmployeeType (
  uniformSize VARCHAR2(10),
  foodSafetyCertified CHAR(1),
  kitchen REF KitchenType
) NOT FINAL;
/

CREATE OR REPLACE TYPE DZoneStaffType UNDER EmployeeType (
  uniformSize VARCHAR2(10),
  deliveryZone REF DZoneType
) NOT FINAL;
/

CREATE OR REPLACE TYPE TeamLeaderType UNDER EmployeeType (
  datePromoted DATE,
  kitchensOversee kitchen_nt_type,
  mealsDesigned meal_nt_type
)
/

CREATE OR REPLACE TYPE KitchenTeamMemberType UNDER KitchenStaffType (
  role VARCHAR2(50)
)
/

CREATE OR REPLACE TYPE KitchenManagerType UNDER KitchenStaffType (
  datePromoted DATE,
  bonus NUMBER,
  kitchenManaged REF KitchenType
)
/

CREATE OR REPLACE TYPE DZoneMemberType UNDER DZoneStaffType (
  role VARCHAR2(50)
)
/

CREATE OR REPLACE TYPE DZoneManagerType UNDER DZoneStaffType (
  datePromoted DATE,
  bonus NUMBER,
  zoneManaged REF DZoneType
)
/

CREATE OR REPLACE TYPE DZoneType AS OBJECT (
  zoneID NUMBER,
  name VARCHAR2(50),
  managedBy REF DZoneManagerType,
  staff Dzone_staff_nt_type,
  customers Customer_nt_type,
  coveredKitchens Kitchen_nt_type
)
/

CREATE OR REPLACE TYPE KitchenType AS OBJECT (
  kitchenID NUMBER,
  name VARCHAR2(100),
  address VARCHAR2(200),
  telephone VARCHAR2(15),
  rating NUMBER(2,1),
  managedBy REF KitchenManagerType,
  staff Kitchen_staff_nt_type,
  overseenBy REF TeamLeaderType,
  mealsPrepared Meal_nt_type,
  dZone REF DZoneType
)
/


CREATE OR REPLACE TYPE MealType AS OBJECT (
  mealID NUMBER,
  name VARCHAR2(100),
  type VARCHAR2(50),
  price NUMBER(6,2),
  calories NUMBER(6,2),
  introDate DATE,
  ingredients VARCHAR2(4000),
  kitchenPrepared REF KitchenType,
  designedBy REF TeamLeaderType
)
/

CREATE OR REPLACE TYPE DietaryCategoryType AS OBJECT (
  dCategoryID NUMBER,
  name VARCHAR2(100),
  customersChoosen Customer_nt_type
)
/

CREATE OR REPLACE TYPE CustomerType AS OBJECT (
  customerID NUMBER,
  name VARCHAR2(100),
  telephone VARCHAR2(15),
  email VARCHAR2(100),
  address VARCHAR2(200),
  loyaltyPoints NUMBER,
  deliveryZone REF DZoneType,
  maxCalories NUMBER(6,2),
  dietaryPreferences Diet_category_nt_type
)
/



-- STEP 6: Create Tables for Object Types

CREATE TABLE TeamLeaderTable OF TeamLeaderType (
  PRIMARY KEY (empNo)
) NESTED TABLE kitchensOversee STORE AS kitchens_nt
  NESTED TABLE mealsDesigned STORE AS mealsdesigned_nt;

CREATE TABLE KitchenStaffTable OF KitchenStaffType (
  PRIMARY KEY (empNo)
);

CREATE TABLE DZoneStaffTable OF DZoneStaffType (
  PRIMARY KEY (empNo)
);

CREATE TABLE KitchenTeamMemberTable OF KitchenTeamMemberType (
  PRIMARY KEY (empNo)
);

CREATE TABLE KitchenManagerTable OF KitchenManagerType (
  PRIMARY KEY (empNo)
);

CREATE TABLE DZoneMemberTable OF DZoneMemberType (
  PRIMARY KEY (empNo)
);

CREATE TABLE DZoneManagerTable OF DZoneManagerType (
  PRIMARY KEY (empNo)
);

CREATE TABLE KitchenTable OF KitchenType (
  PRIMARY KEY (kitchenID)
) NESTED TABLE staff STORE AS kitchen_staff_nt
  NESTED TABLE mealsPrepared STORE AS kitchen_meals_nt;

CREATE TABLE DZoneTable OF DZoneType (
  PRIMARY KEY (zoneID)
) NESTED TABLE staff STORE AS Dzonestaff_nt
  NESTED TABLE customers STORE AS dzone_customers
  NESTED TABLE coveredKitchens STORE AS Kitchen_nt;

CREATE TABLE MealTable OF MealType (
  PRIMARY KEY (mealID)
);

CREATE TABLE DietaryCategoryTable OF DietaryCategoryType (
  PRIMARY KEY (dCategoryID)
) NESTED TABLE customersChoosen STORE AS diet_customers_nt;

CREATE TABLE CustomerTable OF CustomerType (
  PRIMARY KEY (customerID)
) NESTED TABLE dietaryPreferences STORE AS cust_diet_nt;


--Foreign Keys
-- KitchenStaffTable
ALTER TABLE KitchenStaffTable
ADD CONSTRAINT FK_KitchenStaff_Kitchen
FOREIGN KEY (kitchen)
REFERENCES KitchenTable;

-- DZoneStaffTable
ALTER TABLE DZoneStaffTable
ADD CONSTRAINT FK_DZoneStaff_Zone
FOREIGN KEY (deliveryZone)
REFERENCES DZoneTable;

-- KitchenManagerTable
ALTER TABLE KitchenManagerTable
ADD CONSTRAINT FK_KitchenManager_Kitchen
FOREIGN KEY (kitchenManaged)
REFERENCES KitchenTable;

-- DZoneManagerTable
ALTER TABLE DZoneManagerTable
ADD CONSTRAINT FK_DZoneManager_Zone
FOREIGN KEY (zoneManaged)
REFERENCES DZoneTable;

-- DZoneTable
ALTER TABLE DZoneTable
ADD CONSTRAINT FK_DZone_ManagedBy
FOREIGN KEY (managedBy)
REFERENCES DZoneManagerTable;

-- KitchenTable
ALTER TABLE KitchenTable
ADD CONSTRAINT FK_Kitchen_ManagedBy
FOREIGN KEY (managedBy)
REFERENCES KitchenManagerTable;

ALTER TABLE KitchenTable
ADD CONSTRAINT FK_Kitchen_OverseenBy
FOREIGN KEY (overseenBy)
REFERENCES TeamLeaderTable;

ALTER TABLE KitchenTable
ADD CONSTRAINT fk_kitchen_dzone
FOREIGN KEY (dZone) REFERENCES DZoneTable;


-- MealTable
ALTER TABLE MealTable
ADD CONSTRAINT FK_M_Kitchen
FOREIGN KEY (kitchenPrepared)
REFERENCES KitchenTable;

ALTER TABLE MealTable
ADD CONSTRAINT FK_Meal_DesignedBy
FOREIGN KEY (designedBy)
REFERENCES TeamLeaderTable;

-- CustomerTable
ALTER TABLE CustomerTable
ADD CONSTRAINT FK_Customer_DeliveryZone
FOREIGN KEY (deliveryZone)
REFERENCES DZoneTable;



