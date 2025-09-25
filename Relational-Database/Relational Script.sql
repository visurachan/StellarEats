
DROP TABLE BucketItem CASCADE CONSTRAINTS PURGE;
DROP TABLE Transaction CASCADE CONSTRAINTS PURGE;
DROP TABLE "Order" CASCADE CONSTRAINTS PURGE;
DROP TABLE InventoryItem CASCADE CONSTRAINTS PURGE;
DROP TABLE MealDietary CASCADE CONSTRAINTS PURGE;
DROP TABLE DietaryCategory CASCADE CONSTRAINTS PURGE;
DROP TABLE Meal CASCADE CONSTRAINTS PURGE;
DROP TABLE Kitchen CASCADE CONSTRAINTS PURGE;
DROP TABLE DeliveryZone CASCADE CONSTRAINTS PURGE;
DROP TABLE TeamLeader CASCADE CONSTRAINTS PURGE;
DROP TABLE ZoneStaff CASCADE CONSTRAINTS PURGE;
DROP TABLE KitchenStaff CASCADE CONSTRAINTS PURGE;
DROP TABLE Employee CASCADE CONSTRAINTS PURGE;
DROP TABLE Hub CASCADE CONSTRAINTS PURGE;
DROP TABLE SubZone CASCADE CONSTRAINTS PURGE;
DROP TABLE NoFlyZone CASCADE CONSTRAINTS PURGE;
DROP TABLE CustomerDietaryPreference CASCADE CONSTRAINTS PURGE;
DROP TABLE Customer CASCADE CONSTRAINTS PURGE;
DROP TABLE Drone CASCADE CONSTRAINTS PURGE;


--Table creation

CREATE TABLE Employee (
    empNo CHAR(5) PRIMARY KEY NOT NULL,
    name VARCHAR2(100) NOT NULL,
    telephone VARCHAR2(15) UNIQUE NOT NULL,
    email VARCHAR2(50) UNIQUE NOT NULL,
    role VARCHAR2(20) CHECK (role IN ('Kitchen Staff', 'Zone Staff', 'Team Leader')) NOT NULL,
    salary NUMBER(8,2) CHECK (salary > 0) NOT NULL
);

CREATE TABLE KitchenStaff (
    empNo CHAR(5) PRIMARY KEY NOT NULL,
    kitchenID CHAR(5) NOT NULL,
    position VARCHAR2(30) CHECK (position IN ('Kitchen Manager', 'Chef', 'Support Staff')) NOT NULL
);

CREATE TABLE ZoneStaff (
    empNo CHAR(5) PRIMARY KEY NOT NULL,
    position VARCHAR2(30) CHECK (position IN ('Zone Manager', 'Zone Support Staff')) NOT NULL,
    zoneID CHAR(5) NOT NULL
);

CREATE TABLE TeamLeader (
    empNo CHAR(5) PRIMARY KEY NOT NULL,
    datePromoted DATE NOT NULL
);

CREATE TABLE DeliveryZone (
    zoneID CHAR(5) PRIMARY KEY NOT NULL,
    name VARCHAR2(30) UNIQUE NOT NULL,
    zoneManager CHAR(5) NOT NULL 
);

CREATE TABLE Kitchen (
    kitchenID CHAR(5) PRIMARY KEY NOT NULL,
    name VARCHAR2(30) NOT NULL,
    address VARCHAR2(100) NOT NULL,
    telephone VARCHAR2(15) UNIQUE NOT NULL,
    rating NUMBER(2,1),
    kitchenManager CHAR(5) NOT NULL,
    teamLeader CHAR(5) NOT NULL,
    deliveryZone CHAR(5) NOT NULL
);

CREATE TABLE Meal (
    mealID CHAR(5) PRIMARY KEY NOT NULL,
    name VARCHAR2(30) NOT NULL,
    type VARCHAR2(30) CHECK (type IN ('Main course', 'Dessert', 'Beverage')) NOT NULL,
    price NUMBER(6,2) NOT NULL CHECK (price>0),
    calories NUMBER(8) NOT NULL,
    kitchenPrepared CHAR(5) NOT NULL,
    createdBy CHAR(5) NOT NULL,
    introDate DATE NOT NULL,
    ingredients VARCHAR2(200) NOT NULL
);

CREATE TABLE DietaryCategory (
    dCategoryID CHAR(5) PRIMARY KEY NOT NULL,
    name VARCHAR2(20) UNIQUE NOT NULL
);


CREATE TABLE MealDietary (
    mealID CHAR(5) NOT NULL,
    dCategoryID CHAR(5) NOT NULL,
    PRIMARY KEY (mealID, dCategoryID)
);


CREATE TABLE InventoryItem (
    itemID VARCHAR2(10) PRIMARY KEY NOT NULL,
    itemName VARCHAR2(20) NOT NULL,
    quantity NUMBER(6) NOT NULL,
    price NUMBER(6,2) NOT NULL,
    arrivedDate DATE NOT NULL,
    kitchenID CHAR(5) NOT NULL,
    expirationDate DATE
);

CREATE TABLE "Order" (
    orderID CHAR(5) PRIMARY KEY NOT NULL,
    orderDateTime DATE NOT NULL,
    orderStatus VARCHAR2(20) CHECK (orderStatus IN ('Cooking', 'On the way', 'Delivered', 'Cancelled')) NOT NULL,
    customerID CHAR(5) NOT NULL,
    kitchenID CHAR(5) NOT NULL,
    feedback VARCHAR2(300),
    deliveryDrone CHAR(5) NOT NULL
);

CREATE TABLE BucketItem (
    orderID CHAR(5)  NOT NULL,
    mealID CHAR(5)  NOT NULL,
    quantity NUMBER(3) NOT NULL,
    PRIMARY KEY (orderID, mealID)
);

CREATE TABLE Transaction (
    transactionID CHAR(5) PRIMARY KEY NOT NULL,
    orderID CHAR(5) NOT NULL,
    transType VARCHAR2(20) CHECK (transType IN ('Cash', 'Card', 'Online')) NOT NULL,
    transDateTime DATE NOT NULL,
    transStatus VARCHAR2(20) CHECK (transStatus IN ('Successful', 'Unsuccessful')) NOT NULL
);

CREATE TABLE Hub (
    hubID CHAR(5) PRIMARY KEY NOT NULL,
    name VARCHAR2(30) NOT NULL,
    zoneID CHAR(5) NOT NULL
);

CREATE TABLE SubZone (
    subzoneID CHAR(5) PRIMARY KEY NOT NULL,
    name VARCHAR2(30) NOT NULL,
    zoneID CHAR(5) NOT NULL
);

CREATE TABLE NoFlyZone (
    noFlyZoneID CHAR(5) PRIMARY KEY NOT NULL,
    subZoneID CHAR(5) NOT NULL,
    description VARCHAR2(200)  ,
    collectionPoint VARCHAR2(50) NOT NULL
);

CREATE TABLE Customer (
    customerID CHAR(5) PRIMARY KEY NOT NULL,
    name VARCHAR2(100) NOT NULL,
    telephone VARCHAR2(15) NOT NULL,
    email VARCHAR2(30) UNIQUE NOT NULL,
    address VARCHAR2(30) NOT NULL,
    loyaltyPoints NUMBER(4),
    subZoneID CHAR(5) NOT NULL,
    maxCalories NUMBER(5)
);

CREATE TABLE CustomerDietaryPreference (
    customerID CHAR(5)  NOT NULL,
    dCategoryID CHAR(5) NOT NULL,
    PRIMARY KEY (customerID,dCategoryID)
);

CREATE TABLE Drone (
    droneID CHAR(5) PRIMARY KEY NOT NULL,
    zoneID CHAR (5) NOT NULL,
    hubID CHAR(5) NOT NULL
);


-- Constraints for tables


-- DeliveryZone
ALTER TABLE DeliveryZone ADD CONSTRAINT fk_delivery_zone_manager 
    FOREIGN KEY (zoneManager) REFERENCES ZoneStaff(empNo)
    DEFERRABLE INITIALLY DEFERRED;

-- Kitchen
ALTER TABLE Kitchen ADD CONSTRAINT fk_kitchen_manager 
    FOREIGN KEY (kitchenManager) REFERENCES KitchenStaff(empNo)
    DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE Kitchen ADD CONSTRAINT fk_kitchen_team_leader 
    FOREIGN KEY (teamLeader) REFERENCES TeamLeader(empNo)
    DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE Kitchen ADD CONSTRAINT fk_kitchen_delivery_zone 
    FOREIGN KEY (deliveryZone) REFERENCES DeliveryZone(zoneID);
    
-- KitchenStaff
ALTER TABLE KitchenStaff ADD CONSTRAINT fk_kitchen_staff_employee 
    FOREIGN KEY (empNo) REFERENCES Employee(empNo);
ALTER TABLE KitchenStaff ADD CONSTRAINT fk_kitchen_kitchen 
    FOREIGN KEY (kitchenID) REFERENCES Kitchen(kitchenID);
    
-- ZoneStaff
ALTER TABLE ZoneStaff ADD CONSTRAINT fk_zone_staff_employee 
    FOREIGN KEY (empNo) REFERENCES Employee(empNo);
ALTER TABLE ZoneStaff ADD CONSTRAINT fk_zone_delivery_zone 
    FOREIGN KEY (zoneID) REFERENCES DeliveryZone(zoneID);

-- TeamLeader
ALTER TABLE TeamLeader ADD CONSTRAINT fk_team_leader_employee 
    FOREIGN KEY (empNo) REFERENCES Employee(empNo);

-- Meal
ALTER TABLE Meal ADD CONSTRAINT fk_meal_kitchen 
    FOREIGN KEY (kitchenPrepared) REFERENCES Kitchen(kitchenID);
ALTER TABLE Meal ADD CONSTRAINT fk_meal_created_by 
    FOREIGN KEY (createdBy) REFERENCES TeamLeader(empNo);

-- MealDietary
ALTER TABLE MealDietary ADD CONSTRAINT fk_meal_dietary 
    FOREIGN KEY (mealID) REFERENCES Meal(mealID);
ALTER TABLE MealDietary ADD CONSTRAINT fk_dietary_category 
    FOREIGN KEY (dCategoryID) REFERENCES DietaryCategory(dCategoryID);

-- InventoryItem
ALTER TABLE InventoryItem ADD CONSTRAINT fk_inventory_kitchen 
    FOREIGN KEY (kitchenID) REFERENCES Kitchen(kitchenID);

-- Hub
ALTER TABLE Hub ADD CONSTRAINT fk_hub_delivery_zone 
    FOREIGN KEY (zoneID) REFERENCES DeliveryZone(zoneID);

-- SubZone
ALTER TABLE SubZone ADD CONSTRAINT fk_subzone_delivery_zone 
    FOREIGN KEY (zoneID) REFERENCES DeliveryZone(zoneID);

-- NoFlyZone
ALTER TABLE NoFlyZone ADD CONSTRAINT fk_nofly_subzone 
    FOREIGN KEY (subZoneID) REFERENCES SubZone(subzoneID);

-- Customer
ALTER TABLE Customer ADD CONSTRAINT fk_customer_subzone 
    FOREIGN KEY (subZoneID) REFERENCES SubZone(subzoneID);

-- CustomerDietaryPreference
ALTER TABLE CustomerDietaryPreference ADD CONSTRAINT fk_customer_dietary 
    FOREIGN KEY (customerID) REFERENCES Customer(customerID);
ALTER TABLE CustomerDietaryPreference ADD CONSTRAINT fk_dietary_dietary 
    FOREIGN KEY (dCategoryID) REFERENCES DietaryCategory(dCategoryID);

-- Drone
ALTER TABLE Drone ADD CONSTRAINT fk_zone_id 
    FOREIGN KEY (zoneID) REFERENCES DeliveryZone(zoneID);
ALTER TABLE Drone ADD CONSTRAINT fk_hub_id 
    FOREIGN KEY (hubID) REFERENCES Hub(hubID);

-- Order
ALTER TABLE "Order" ADD CONSTRAINT fk_order_customer 
    FOREIGN KEY (customerID) REFERENCES Customer(customerID);
ALTER TABLE "Order" ADD CONSTRAINT fk_order_kitchen 
    FOREIGN KEY (kitchenID) REFERENCES Kitchen(kitchenID);
ALTER TABLE "Order" ADD CONSTRAINT fk_order_drone 
    FOREIGN KEY (deliveryDrone) REFERENCES Drone(droneID);

-- BucketItem
ALTER TABLE BucketItem ADD CONSTRAINT fk_order_meal_order 
    FOREIGN KEY (orderID) REFERENCES "Order"(orderID);
ALTER TABLE BucketItem ADD CONSTRAINT fk_order_meal_meal 
    FOREIGN KEY (mealID) REFERENCES Meal(mealID);

-- Transaction
ALTER TABLE Transaction ADD CONSTRAINT fk_transaction_order 
    FOREIGN KEY (orderID) REFERENCES "Order"(orderID);
    

-- Insert into Employee 
INSERT INTO Employee (empNo, name, telephone, email, role, salary) VALUES ('E0001', 'John Doe', '07123456779', 'john.doe@example.com', 'Kitchen Staff', 25000.00);
INSERT INTO Employee (empNo, name, telephone, email, role, salary) VALUES ('E0002', 'Jane Smith', '07123456780', 'jane.smith@example.com', 'Kitchen Staff', 26000.00);
INSERT INTO Employee (empNo, name, telephone, email, role, salary) VALUES ('E0003', 'Alice Johnson', '07123456781', 'alice.johnson@example.com', 'Kitchen Staff', 27000.00);
INSERT INTO Employee (empNo, name, telephone, email, role, salary) VALUES ('E0004', 'Bob Brown', '07123456782', 'bob.brown@example.com', 'Kitchen Staff', 28000.00);
INSERT INTO Employee (empNo, name, telephone, email, role, salary) VALUES ('E0005', 'Charlie Davis', '07123456783', 'charlie.davis@example.com', 'Kitchen Staff', 29000.00);
INSERT INTO Employee (empNo, name, telephone, email, role, salary) VALUES ('E0016', 'Andrew Hamilton', '07223456783', 'andrew.ham@example.com', 'Kitchen Staff', 19000.00);
INSERT INTO Employee (empNo, name, telephone, email, role, salary) VALUES ('E0017', 'Lando Anderson', '07123956783', 'lando.and@example.com', 'Kitchen Staff', 28000.00);

INSERT INTO Employee (empNo, name, telephone, email, role, salary) VALUES ('E0006', 'David Wilson', '07123456784', 'david.wilson@example.com', 'Zone Staff', 30000.00);
INSERT INTO Employee (empNo, name, telephone, email, role, salary) VALUES ('E0007', 'Eva Green', '07123456785', 'eva.green@example.com', 'Zone Staff', 31000.00);
INSERT INTO Employee (empNo, name, telephone, email, role, salary) VALUES ('E0008', 'Frank White', '07123456786', 'frank.white@example.com', 'Zone Staff', 32000.00);
INSERT INTO Employee (empNo, name, telephone, email, role, salary) VALUES ('E0009', 'Grace Black', '07123456787', 'grace.black@example.com', 'Zone Staff', 33000.00);
INSERT INTO Employee (empNo, name, telephone, email, role, salary) VALUES ('E0010', 'Henry Brown', '07123456788', 'henry.brown@example.com', 'Zone Staff', 34000.00);
INSERT INTO Employee (empNo, name, telephone, email, role, salary) VALUES ('E0018', 'Dan Brown', '07123457788', 'dan.brown@example.com', 'Zone Staff', 31000.00);
INSERT INTO Employee (empNo, name, telephone, email, role, salary) VALUES ('E0019', 'Piyal Red', '07123406788', 'piyal.redn@example.com', 'Zone Staff', 31000.00);

INSERT INTO Employee (empNo, name, telephone, email, role, salary) VALUES ('E0011', 'Ivy Taylor', '07123456789', 'ivy.taylor@example.com', 'Team Leader', 40000.00);
INSERT INTO Employee (empNo, name, telephone, email, role, salary) VALUES ('E0012', 'Jack Harris', '07123456790', 'jack.has@example.com', 'Team Leader', 41000.00);
INSERT INTO Employee (empNo, name, telephone, email, role, salary) VALUES ('E0013', 'Karen Clark', '07123456791', 'karen.cl@example.com', 'Team Leader', 42000.00);
INSERT INTO Employee (empNo, name, telephone, email, role, salary) VALUES ('E0014', 'Leo Lewis', '07123456792', 'leo.lewis@example.com', 'Team Leader', 43000.00);
INSERT INTO Employee (empNo, name, telephone, email, role, salary) VALUES ('E0015', 'Mia Walker', '07123456793', 'mia.walker@example.com', 'Team Leader', 44000.00);

-- Insert into DeliveryZone
INSERT INTO DeliveryZone (zoneID, name, zoneManager) VALUES ('Z0001', 'Newcastle', 'E0006');
INSERT INTO DeliveryZone (zoneID, name, zoneManager) VALUES ('Z0002', 'London', 'E0007');
INSERT INTO DeliveryZone (zoneID, name, zoneManager) VALUES ('Z0003', 'Birmingham', 'E0008');
INSERT INTO DeliveryZone (zoneID, name, zoneManager) VALUES ('Z0004', 'Manchester', 'E0009');
INSERT INTO DeliveryZone (zoneID, name, zoneManager) VALUES ('Z0005', 'Edinburgh', 'E0010');

-- Insert into Kitchen
INSERT INTO Kitchen (kitchenID, name, address, telephone, rating, kitchenManager, teamLeader, deliveryZone) VALUES ('K0001', 'Mother"s Kitchen', '123 High St, Newcastle', '02081234567', 4.5, 'E0001', 'E0011', 'Z0001');
INSERT INTO Kitchen (kitchenID, name, address, telephone, rating, kitchenManager, teamLeader, deliveryZone) VALUES ('K0002', 'Chinese Dragon', '456 Park Rd, London', '02081234568', 4.2, 'E0002', 'E0012', 'Z0002');
INSERT INTO Kitchen (kitchenID, name, address, telephone, rating, kitchenManager, teamLeader, deliveryZone) VALUES ('K0003', 'Spice Bazaar', '789 Elm St, Birmingham', '02081234569', 4.0, 'E0003', 'E0013', 'Z0003');
INSERT INTO Kitchen (kitchenID, name, address, telephone, rating, kitchenManager, teamLeader, deliveryZone) VALUES ('K0004', 'Steam Boat', '321 Oak St, Manchester', '02081234570', 4.3, 'E0004', 'E0014', 'Z0004');
INSERT INTO Kitchen (kitchenID, name, address, telephone, rating, kitchenManager, teamLeader, deliveryZone) VALUES ('K0005', 'Crab Ministry', '654 Pine St, Edinburgh', '02081234571', 4.1, 'E0005', 'E0015', 'Z0005');

-- Insert into KitchenStaff 
INSERT INTO KitchenStaff (empNo, kitchenID, position) VALUES ('E0001', 'K0001', 'Kitchen Manager');
INSERT INTO KitchenStaff (empNo, kitchenID, position) VALUES ('E0002', 'K0002', 'Kitchen Manager');
INSERT INTO KitchenStaff (empNo, kitchenID, position) VALUES ('E0003', 'K0003', 'Kitchen Manager');
INSERT INTO KitchenStaff (empNo, kitchenID, position) VALUES ('E0004', 'K0004', 'Kitchen Manager');
INSERT INTO KitchenStaff (empNo, kitchenID, position) VALUES ('E0005', 'K0005', 'Kitchen Manager');
INSERT INTO KitchenStaff (empNo, kitchenID, position) VALUES ('E0016', 'K0001', 'Chef');
INSERT INTO KitchenStaff (empNo, kitchenID, position) VALUES ('E0017', 'K0001', 'Support Staff');


-- Insert into ZoneStaff 
INSERT INTO ZoneStaff (empNo, position, zoneID) VALUES ('E0006', 'Zone Manager', 'Z0001');
INSERT INTO ZoneStaff (empNo, position, zoneID) VALUES ('E0007', 'Zone Manager', 'Z0002');
INSERT INTO ZoneStaff (empNo, position, zoneID) VALUES ('E0008', 'Zone Manager', 'Z0003');
INSERT INTO ZoneStaff (empNo, position, zoneID) VALUES ('E0009', 'Zone Manager', 'Z0004');
INSERT INTO ZoneStaff (empNo, position, zoneID) VALUES ('E0010', 'Zone Manager', 'Z0005');
INSERT INTO ZoneStaff (empNo, position, zoneID) VALUES ('E0018', 'Zone Support Staff', 'Z0001');
INSERT INTO ZoneStaff (empNo, position, zoneID) VALUES ('E0019', 'Zone Support Staff', 'Z0001');


-- Insert into TeamLeader
INSERT INTO TeamLeader (empNo, datePromoted) VALUES ('E0011', TO_DATE('2023-01-15', 'YYYY-MM-DD'));
INSERT INTO TeamLeader (empNo, datePromoted) VALUES ('E0012', TO_DATE('2023-02-10', 'YYYY-MM-DD'));
INSERT INTO TeamLeader (empNo, datePromoted) VALUES ('E0013', TO_DATE('2023-03-05', 'YYYY-MM-DD'));
INSERT INTO TeamLeader (empNo, datePromoted) VALUES ('E0014', TO_DATE('2023-04-20', 'YYYY-MM-DD'));
INSERT INTO TeamLeader (empNo, datePromoted) VALUES ('E0015', TO_DATE('2023-05-01', 'YYYY-MM-DD'));

-- Insert into Meal 
INSERT INTO Meal (mealID, name, type, price, calories, kitchenPrepared, createdBy, introDate, ingredients) VALUES ('M0001', 'Chicken Curry', 'Main course', 12.50, 600, 'K0001', 'E0011', TO_DATE('2023-02-01', 'YYYY-MM-DD'), 'Chicken, Rice, Spices');
INSERT INTO Meal (mealID, name, type, price, calories, kitchenPrepared, createdBy, introDate, ingredients) VALUES ('M0002', 'Vegan Burger', 'Main course', 10.00, 450, 'K0001', 'E0011', TO_DATE('2023-02-02', 'YYYY-MM-DD'), 'Vegan Patty, Lettuce, Tomato');
INSERT INTO Meal (mealID, name, type, price, calories, kitchenPrepared, createdBy, introDate, ingredients) VALUES ('M0003', 'Chocolate Cake', 'Dessert', 6.00, 350, 'K0001', 'E0011', TO_DATE('2023-02-03', 'YYYY-MM-DD'), 'Chocolate, Flour, Sugar');
INSERT INTO Meal (mealID, name, type, price, calories, kitchenPrepared, createdBy, introDate, ingredients) VALUES ('M0004', 'Green Tea', 'Beverage', 3.00, 50, 'K0002', 'E0012', TO_DATE('2023-02-04', 'YYYY-MM-DD'), 'Green Tea Leaves, Water');
INSERT INTO Meal (mealID, name, type, price, calories, kitchenPrepared, createdBy, introDate, ingredients) VALUES ('M0005', 'Fish and Chips', 'Main course', 14.00, 800, 'K0002', 'E0012', TO_DATE('2023-02-05', 'YYYY-MM-DD'), 'Fish, Potatoes, Oil');
INSERT INTO Meal (mealID, name, type, price, calories, kitchenPrepared, createdBy, introDate, ingredients) VALUES ('M0006', 'Beef salad', 'Main course', 16.00, 800, 'K0001', 'E0011', TO_DATE('2023-02-05', 'YYYY-MM-DD'), 'Beef, Lettuce, Oil');
INSERT INTO Meal (mealID, name, type, price, calories, kitchenPrepared, createdBy, introDate, ingredients) VALUES ('M0007', 'Grilled Chicken', 'Main course', 18.50, 750, 'K0003', 'E0013', TO_DATE('2023-03-10', 'YYYY-MM-DD'), 'Chicken, Olive oil, Herbs, Garlic');
INSERT INTO Meal (mealID, name, type, price, calories, kitchenPrepared, createdBy, introDate, ingredients) VALUES ('M0008', 'Pasta Alfredo', 'Main course', 14.00, 900, 'K0004', 'E0013', TO_DATE('2023-04-15', 'YYYY-MM-DD'), 'Pasta, Cream, Parmesan, Butter');
INSERT INTO Meal (mealID, name, type, price, calories, kitchenPrepared, createdBy, introDate, ingredients) VALUES ('M0009', 'Caesar Salad', 'Main course', 10.00, 450, 'K0004', 'E0014', TO_DATE('2023-05-20', 'YYYY-MM-DD'), 'Lettuce, Croutons, Chicken, Caesar dressing');
INSERT INTO Meal (mealID, name, type, price, calories, kitchenPrepared, createdBy, introDate, ingredients) VALUES ('M0010', 'Chocolate Butter Cake', 'Dessert', 8.00, 600, 'K0005', 'E0015', TO_DATE('2023-06-25', 'YYYY-MM-DD'), 'Flour, Cocoa, Sugar, Eggs, Butter');


-- Insert into DietaryCategory 
INSERT INTO DietaryCategory (dCategoryID, name) VALUES ('DC001', 'Vegetarian');
INSERT INTO DietaryCategory (dCategoryID, name) VALUES ('DC002', 'Vegan');
INSERT INTO DietaryCategory (dCategoryID, name) VALUES ('DC003', 'Gluten-Free');
INSERT INTO DietaryCategory (dCategoryID, name) VALUES ('DC004', 'Dairy-Free');
INSERT INTO DietaryCategory (dCategoryID, name) VALUES ('DC005', 'Nut-Free');

-- Insert into MealDietary 
INSERT INTO MealDietary (mealID, dCategoryID) VALUES ('M0002', 'DC002'); 
INSERT INTO MealDietary (mealID, dCategoryID) VALUES ('M0003', 'DC001'); 
INSERT INTO MealDietary (mealID, dCategoryID) VALUES ('M0004', 'DC002'); 
INSERT INTO MealDietary (mealID, dCategoryID) VALUES ('M0004', 'DC003'); 
INSERT INTO MealDietary (mealID, dCategoryID) VALUES ('M0005', 'DC004'); 

-- Insert into InventoryItem
INSERT INTO InventoryItem (itemID, itemName, quantity, price, arrivedDate, kitchenID, expirationDate) VALUES ('I0001', 'Chicken', 100, 5.00, TO_DATE('2023-10-01', 'YYYY-MM-DD'), 'K0001', TO_DATE('2023-10-15', 'YYYY-MM-DD'));
INSERT INTO InventoryItem (itemID, itemName, quantity, price, arrivedDate, kitchenID, expirationDate) VALUES ('I0002', 'Vegan Patty', 50, 3.00, TO_DATE('2023-10-02', 'YYYY-MM-DD'), 'K0002', TO_DATE('2023-10-20', 'YYYY-MM-DD'));
INSERT INTO InventoryItem (itemID, itemName, quantity, price, arrivedDate, kitchenID, expirationDate) VALUES ('I0003', 'Chocolate', 30, 4.00, TO_DATE('2023-10-03', 'YYYY-MM-DD'), 'K0001', TO_DATE('2023-11-01', 'YYYY-MM-DD'));
INSERT INTO InventoryItem (itemID, itemName, quantity, price, arrivedDate, kitchenID, expirationDate) VALUES ('I0004', 'Green Tea Leaves', 20, 2.00, TO_DATE('2023-10-04', 'YYYY-MM-DD'), 'K0002', TO_DATE('2024-01-01', 'YYYY-MM-DD'));
INSERT INTO InventoryItem (itemID, itemName, quantity, price, arrivedDate, kitchenID, expirationDate) VALUES ('I0005', 'Fish', 60, 6.00, TO_DATE('2023-10-05', 'YYYY-MM-DD'), 'K0001', TO_DATE('2023-10-12', 'YYYY-MM-DD'));

-- Insert into Hub 
INSERT INTO Hub (hubID, name, zoneID) VALUES ('H0001', 'James Park', 'Z0001');
INSERT INTO Hub (hubID, name, zoneID) VALUES ('H0002', 'Monument', 'Z0001');
INSERT INTO Hub (hubID, name, zoneID) VALUES ('H0003', 'Broad Street', 'Z0002');
INSERT INTO Hub (hubID, name, zoneID) VALUES ('H0004', 'Old Trafford', 'Z0004');
INSERT INTO Hub (hubID, name, zoneID) VALUES ('H0005', 'Royal Mile', 'Z0005');

-- Insert into SubZone
INSERT INTO SubZone (subzoneID, name, zoneID) VALUES ('SZ001', 'Northumberland', 'Z0001');
INSERT INTO SubZone (subzoneID, name, zoneID) VALUES ('SZ002', 'Quayside', 'Z0001');
INSERT INTO SubZone (subzoneID, name, zoneID) VALUES ('SZ003', 'North London', 'Z0002');
INSERT INTO SubZone (subzoneID, name, zoneID) VALUES ('SZ004', 'South London', 'Z0002');
INSERT INTO SubZone (subzoneID, name, zoneID) VALUES ('SZ005', 'Central London', 'Z0002');
INSERT INTO SubZone (subzoneID, name, zoneID) VALUES ('SZ006', 'Mosely', 'Z0003');
INSERT INTO SubZone (subzoneID, name, zoneID) VALUES ('SZ007', 'Deans Gate', 'Z0004');
INSERT INTO SubZone (subzoneID, name, zoneID) VALUES ('SZ008', 'Old Town', 'Z0005');

-- Insert into NoFlyZone 
INSERT INTO NoFlyZone (noFlyZoneID, subZoneID, description, collectionPoint) VALUES ('NF001', 'SZ001', 'Publicly dense', 'Northumbria University');
INSERT INTO NoFlyZone (noFlyZoneID, subZoneID, description, collectionPoint) VALUES ('NF002', 'SZ003', 'Tottenham Stadium', 'Hale Retail Park');
INSERT INTO NoFlyZone (noFlyZoneID, subZoneID, description, collectionPoint) VALUES ('NF003', 'SZ002', 'Walk area', 'Tyne Bridge');
INSERT INTO NoFlyZone (noFlyZoneID, subZoneID, description, collectionPoint) VALUES ('NF004', 'SZ004', 'Gatwick Airport', 'Crawley Railway Station');
INSERT INTO NoFlyZone (noFlyZoneID, subZoneID, description, collectionPoint) VALUES ('NF005', 'SZ005', 'Westminister Abbey', 'Trafalgar Square');

-- Insert into Customer
INSERT INTO Customer (customerID, name, telephone, email, address, loyaltyPoints, subZoneID, maxCalories) VALUES ('C0001', 'Emma Watson', '07123456784', 'emma.watson@example.com', '123 Elm St, Newcastle', 100, 'SZ001', 2000);
INSERT INTO Customer (customerID, name, telephone, email, address, loyaltyPoints, subZoneID, maxCalories) VALUES ('C0002', 'Tom Hardy', '07123456785', 'tom.hardy@example.com', '456 Oak St, Newcastle', 200, 'SZ002', 1800);
INSERT INTO Customer (customerID, name, telephone, email, address, loyaltyPoints, subZoneID, maxCalories) VALUES ('C0003', 'Olivia Brown', '07123456786', 'olivia.brown@example.com', '789 Pine St, London', 150, 'SZ003', 2200);
INSERT INTO Customer (customerID, name, telephone, email, address, loyaltyPoints, subZoneID, maxCalories) VALUES ('C0004', 'Michael Green', '07123456787', 'michael.green@example.com', '321 Maple St, London', 300, 'SZ004', 1900);
INSERT INTO Customer (customerID, name, telephone, email, address, loyaltyPoints, subZoneID, maxCalories) VALUES ('C0005', 'Sophia White', '07123456788', 'sophia.white@example.com', '654 Birch St, London', 250, 'SZ005', 2100);
INSERT INTO Customer (customerID, name, telephone, email, address, loyaltyPoints, subZoneID, maxCalories) VALUES ('C0006', 'Hiroshi Tanaka', '07234567899', 'hiroshi.tanaka@example.com', '12 Maple Ave, Birmingham', 300, 'SZ006', 2200);
INSERT INTO Customer (customerID, name, telephone, email, address, loyaltyPoints, subZoneID, maxCalories) VALUES ('C0007', 'Mei Zhang', '07345678900', 'mei.zhang@example.com', '45 Oak St, Manchester', 275, 'SZ007', 2000);
INSERT INTO Customer (customerID, name, telephone, email, address, loyaltyPoints, subZoneID, maxCalories) VALUES ('C0008', 'Arjun Patel', '07456789011', 'arjun.patel@example.com', '78 Rosewood Rd, Edinburgh', 320, 'SZ008', 2300);

-- Insert into CustomerDietaryPreference
INSERT INTO CustomerDietaryPreference (customerID, dCategoryID) VALUES ('C0001', 'DC002'); 
INSERT INTO CustomerDietaryPreference (customerID, dCategoryID) VALUES ('C0002', 'DC001'); 
INSERT INTO CustomerDietaryPreference (customerID, dCategoryID) VALUES ('C0003', 'DC003'); 
INSERT INTO CustomerDietaryPreference (customerID, dCategoryID) VALUES ('C0004', 'DC004'); 
INSERT INTO CustomerDietaryPreference (customerID, dCategoryID) VALUES ('C0005', 'DC005'); 

-- Insert into Drone
INSERT INTO Drone (droneID, zoneID, hubID) VALUES ('DR001', 'Z0001', 'H0001');
INSERT INTO Drone (droneID, zoneID, hubID) VALUES ('DR002', 'Z0001', 'H0002');
INSERT INTO Drone (droneID, zoneID, hubID) VALUES ('DR003', 'Z0002', 'H0003');
INSERT INTO Drone (droneID, zoneID, hubID) VALUES ('DR004', 'Z0004', 'H0004');
INSERT INTO Drone (droneID, zoneID, hubID) VALUES ('DR005', 'Z0005', 'H0005');

--Insert order
INSERT INTO "Order" (orderID, orderDateTime, orderStatus, customerID, kitchenID, feedback, deliveryDrone) VALUES ('O0001', TO_DATE('2023-10-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Delivered', 'C0001', 'K0001', 'Great service!', 'DR001');
INSERT INTO "Order" (orderID, orderDateTime, orderStatus, customerID, kitchenID, feedback, deliveryDrone) VALUES ('O0002', TO_DATE('2023-10-02 13:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'On the way', 'C0002', 'K0001', NULL, 'DR002');
INSERT INTO "Order" (orderID, orderDateTime, orderStatus, customerID, kitchenID, feedback, deliveryDrone) VALUES ('O0003', TO_DATE('2023-10-03 14:45:00', 'YYYY-MM-DD HH24:MI:SS'), 'Cooking', 'C0003', 'K0002', NULL, 'DR003');
INSERT INTO "Order" (orderID, orderDateTime, orderStatus, customerID, kitchenID, feedback, deliveryDrone) VALUES ('O0004', TO_DATE('2023-10-04 15:15:00', 'YYYY-MM-DD HH24:MI:SS'), 'Delivered', 'C0004', 'K0002', 'Food was cold.', 'DR003');
INSERT INTO "Order" (orderID, orderDateTime, orderStatus, customerID, kitchenID, feedback, deliveryDrone) VALUES ('O0005', TO_DATE('2023-10-05 16:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Cancelled', 'C0005', 'K0002', NULL, 'DR003');

--BucketItem
INSERT INTO BucketItem (orderID, mealID, quantity) VALUES ('O0001', 'M0001', 2);
INSERT INTO BucketItem (orderID, mealID, quantity) VALUES ('O0001', 'M0006', 1);
INSERT INTO BucketItem (orderID, mealID, quantity) VALUES ('O0002', 'M0002', 1);
INSERT INTO BucketItem (orderID, mealID, quantity) VALUES ('O0003', 'M0004', 3);
INSERT INTO BucketItem (orderID, mealID, quantity) VALUES ('O0004', 'M0005', 2);

--Transaction
INSERT INTO Transaction (transactionID, orderID, transType, transDateTime, transStatus) VALUES ('T0001', 'O0001', 'Card', TO_DATE('2023-10-01 12:05:00', 'YYYY-MM-DD HH24:MI:SS'), 'Successful');
INSERT INTO Transaction (transactionID, orderID, transType, transDateTime, transStatus) VALUES ('T0002', 'O0002', 'Online', TO_DATE('2023-10-02 13:35:00', 'YYYY-MM-DD HH24:MI:SS'), 'Successful');
INSERT INTO Transaction (transactionID, orderID, transType, transDateTime, transStatus) VALUES ('T0003', 'O0003', 'Cash', TO_DATE('2023-10-03 14:50:00', 'YYYY-MM-DD HH24:MI:SS'), 'Unsuccessful');
INSERT INTO Transaction (transactionID, orderID, transType, transDateTime, transStatus) VALUES ('T0004', 'O0004', 'Card', TO_DATE('2023-10-04 15:20:00', 'YYYY-MM-DD HH24:MI:SS'), 'Successful');
INSERT INTO Transaction (transactionID, orderID, transType, transDateTime, transStatus) VALUES ('T0005', 'O0005', 'Online', TO_DATE('2023-10-05 16:05:00', 'YYYY-MM-DD HH24:MI:SS'), 'Unsuccessful');

COMMIT;