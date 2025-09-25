INSERT INTO KitchenStaffTable (empNo, name, telephone, email, salary, dob, dateJoined, NIN, uniformSize, foodSafetyCertified, kitchen) VALUES (1001, 'John Doe', '02079461234', 'john.doe@kitchen.co.uk', 28000, DATE '1985-03-15', DATE '2010-06-01', 'AB123456C', 'M', 'Y', NULL);
INSERT INTO KitchenStaffTable (empNo, name, telephone, email, salary, dob, dateJoined, NIN, uniformSize, foodSafetyCertified, kitchen) VALUES (1002, 'Jane Smith', '02079465678', 'jane.smith@kitchen.co.uk', 22000, DATE '1990-07-22', DATE '2015-09-15', 'CD234567D', 'S', 'N', NULL);
INSERT INTO KitchenStaffTable (empNo, name, telephone, email, salary, dob, dateJoined, NIN, uniformSize, foodSafetyCertified, kitchen) VALUES (1003, 'Emily Johnson', '02079467890', 'emily.johnson@kitchen.co.uk', 20000, DATE '1992-11-05', DATE '2018-01-20', 'EF345678E', 'L', 'Y', NULL);
INSERT INTO KitchenStaffTable (empNo, name, telephone, email, salary, dob, dateJoined, NIN, uniformSize, foodSafetyCertified, kitchen) VALUES (1004, 'Michael Brown', '02079468901', 'michael.brown@kitchen.co.uk', 30000, DATE '1980-02-10', DATE '2008-03-25', 'GH456789F', 'XL', 'Y', NULL);
INSERT INTO KitchenStaffTable (empNo, name, telephone, email, salary, dob, dateJoined, NIN, uniformSize, foodSafetyCertified, kitchen) VALUES (1005, 'Sarah Davis', '02079469012', 'sarah.davis@kitchen.co.uk', 21000, DATE '1995-05-30', DATE '2019-07-10', 'IJ567890G', 'XXL', 'N', NULL);
INSERT INTO KitchenStaffTable (empNo, name, telephone, email, salary, dob, dateJoined, NIN, uniformSize, foodSafetyCertified, kitchen) VALUES (2001, 'Alice Green', '02079460001', 'alice.green@kitchen.co.uk', 35000, DATE '1980-01-15', DATE '2010-05-20', 'AA123456A', 'M', 'Y', NULL);
INSERT INTO KitchenStaffTable (empNo, name, telephone, email, salary, dob, dateJoined, NIN, uniformSize, foodSafetyCertified, kitchen) VALUES (2002, 'Bob White', '02079460002', 'bob.white@kitchen.co.uk', 36000, DATE '1978-03-22', DATE '2009-07-15', 'BB234567B', 'L', 'Y', NULL);
INSERT INTO KitchenStaffTable (empNo, name, telephone, email, salary, dob, dateJoined, NIN, uniformSize, foodSafetyCertified, kitchen) VALUES (2003, 'Carol Black', '02079460003', 'carol.black@kitchen.co.uk', 37000, DATE '1982-06-10', DATE '2011-09-01', 'CC345678C', 'S', 'Y', NULL);
INSERT INTO KitchenStaffTable (empNo, name, telephone, email, salary, dob, dateJoined, NIN, uniformSize, foodSafetyCertified, kitchen) VALUES (2004, 'David Brown', '02079460004', 'david.brown@kitchen.co.uk', 38000, DATE '1975-12-05', DATE '2008-11-30', 'DD456789D', 'XL', 'Y', NULL);
INSERT INTO KitchenStaffTable (empNo, name, telephone, email, salary, dob, dateJoined, NIN, uniformSize, foodSafetyCertified, kitchen) VALUES (2005, 'Eve Grey', '02079460005', 'eve.grey@kitchen.co.uk', 39000, DATE '1985-09-18', DATE '2012-03-12', 'EE567890E', 'M', 'Y', NULL);

INSERT INTO KitchenTeamMemberTable (empNo, role) VALUES (1001, 'Chef');
INSERT INTO KitchenTeamMemberTable (empNo, role) VALUES (1002, 'Kitchen Assistant');
INSERT INTO KitchenTeamMemberTable (empNo, role) VALUES (1003, 'Floor Assistant');
INSERT INTO KitchenTeamMemberTable (empNo, role) VALUES (1004, 'Chef');
INSERT INTO KitchenTeamMemberTable (empNo, role) VALUES (1005, 'Kitchen Assistant');

INSERT INTO KitchenManagerTable (empNo, datePromoted, bonus, kitchenManaged) VALUES (2001, DATE '2015-06-01', 5000, NULL);
INSERT INTO KitchenManagerTable (empNo, datePromoted, bonus, kitchenManaged) VALUES (2002, DATE '2014-08-15', 5500, NULL);
INSERT INTO KitchenManagerTable (empNo, datePromoted, bonus, kitchenManaged) VALUES (2003, DATE '2016-09-20', 6000, NULL);
INSERT INTO KitchenManagerTable (empNo, datePromoted, bonus, kitchenManaged) VALUES (2004, DATE '2013-11-10', 6500, NULL);
INSERT INTO KitchenManagerTable (empNo, datePromoted, bonus, kitchenManaged) VALUES (2005, DATE '2017-04-25', 7000, NULL);

INSERT INTO TeamLeaderTable VALUES (TeamLeaderType(3001, 'Thomas Clark', '02079461234', 'thomas.clark@kitchen.co.uk', 40000, DATE '1980-01-15', DATE '2005-06-01', 'AB123456A', DATE '2015-06-01', kitchen_nt_type(), meal_nt_type()));
INSERT INTO TeamLeaderTable VALUES (TeamLeaderType(3002, 'Laura Adams', '02079462345', 'laura.adams@kitchen.co.uk', 42000, DATE '1982-03-22', DATE '2006-07-15', 'CD234567B', DATE '2016-08-15', kitchen_nt_type(), meal_nt_type()));
INSERT INTO TeamLeaderTable VALUES (TeamLeaderType(3003, 'Peter Johnson', '02079463456', 'peter.johnson@kitchen.co.uk', 43000, DATE '1985-06-10', DATE '2007-09-01', 'EF345678C', DATE '2017-09-20', kitchen_nt_type(), meal_nt_type()));
INSERT INTO TeamLeaderTable VALUES (TeamLeaderType(3004, 'Susan Lee', '02079464567', 'susan.lee@kitchen.co.uk', 44000, DATE '1978-12-05', DATE '2008-11-30', 'GH456789D', DATE '2018-11-10', kitchen_nt_type(), meal_nt_type()));
INSERT INTO TeamLeaderTable VALUES (TeamLeaderType(3005, 'Robert Brown', '02079465678', 'robert.brown@kitchen.co.uk', 45000, DATE '1985-09-18', DATE '2009-03-12', 'IJ567890E', DATE '2019-04-25', kitchen_nt_type(), meal_nt_type()));

INSERT INTO DZoneStaffTable (empNo, name, telephone, email, salary, dob, dateJoined, NIN, uniformSize, deliveryZone) VALUES (4001, 'Alice Smith', '02079460001', 'alice.smith@delivery.co.uk', 25000, DATE '1990-05-15', DATE '2015-06-01', 'AB123456A', 'M', NULL);
INSERT INTO DZoneStaffTable (empNo, name, telephone, email, salary, dob, dateJoined, NIN, uniformSize, deliveryZone) VALUES (4002, 'Bob Johnson', '02079460002', 'bob.johnson@delivery.co.uk', 26000, DATE '1988-07-22', DATE '2016-09-15', 'CD234567B', 'L', NULL);
INSERT INTO DZoneStaffTable (empNo, name, telephone, email, salary, dob, dateJoined, NIN, uniformSize, deliveryZone) VALUES (4003, 'Carol Williams', '02079460003', 'carol.williams@delivery.co.uk', 27000, DATE '1992-11-05', DATE '2017-01-20', 'EF345678C', 'S', NULL);
INSERT INTO DZoneStaffTable (empNo, name, telephone, email, salary, dob, dateJoined, NIN, uniformSize, deliveryZone) VALUES (5001, 'Emily Davis', '02079460001', 'emily.davis@delivery.co.uk', 30000, DATE '1985-02-15', DATE '2010-06-01', 'AA123456A', 'M', NULL);
INSERT INTO DZoneStaffTable (empNo, name, telephone, email, salary, dob, dateJoined, NIN, uniformSize, deliveryZone) VALUES (5002, 'Michael Brown', '02079460002', 'michael.brown@delivery.co.uk', 31000, DATE '1982-07-22', DATE '2011-09-15', 'BB234567B', 'L', NULL);
INSERT INTO DZoneStaffTable (empNo, name, telephone, email, salary, dob, dateJoined, NIN, uniformSize, deliveryZone) VALUES (5003, 'Sarah Johnson', '02079460003', 'sarah.johnson@delivery.co.uk', 32000, DATE '1988-11-05', DATE '2012-01-20', 'CC345678C', 'S', NULL);
INSERT INTO DZoneStaffTable (empNo, name, telephone, email, salary, dob, dateJoined, NIN, uniformSize, deliveryZone) VALUES (5004, 'David Wilson', '02079460004', 'david.wilson@delivery.co.uk', 33000, DATE '1979-03-10', DATE '2009-04-25', 'DD456789D', 'XL', NULL);
INSERT INTO DZoneStaffTable (empNo, name, telephone, email, salary, dob, dateJoined, NIN, uniformSize, deliveryZone) VALUES (5005, 'Laura Martinez', '02079460005', 'laura.martinez@delivery.co.uk', 34000, DATE '1990-08-18', DATE '2013-07-30', 'EE567890E', 'M', NULL);

INSERT INTO DZoneMemberTable (empNo, role) VALUES (4001, 'Drone Observer');
INSERT INTO DZoneMemberTable (empNo, role) VALUES (4002, 'Drone Observer');
INSERT INTO DZoneMemberTable (empNo, role) VALUES (4003, 'Customer Assistant');

INSERT INTO DZoneManagerTable (empNo, datePromoted, bonus, zoneManaged) VALUES (5001, DATE '2015-06-01', 5000, NULL);
INSERT INTO DZoneManagerTable (empNo, datePromoted, bonus, zoneManaged) VALUES (5002, DATE '2016-08-15', 5500, NULL);
INSERT INTO DZoneManagerTable (empNo, datePromoted, bonus, zoneManaged) VALUES (5003, DATE '2017-09-20', 6000, NULL);
INSERT INTO DZoneManagerTable (empNo, datePromoted, bonus, zoneManaged) VALUES (5004, DATE '2018-11-10', 6500, NULL);
INSERT INTO DZoneManagerTable (empNo, datePromoted, bonus, zoneManaged) VALUES (5005, DATE '2019-04-25', 7000, NULL);


INSERT INTO KitchenTable VALUES (KitchenType(1, 'Central Kitchen', '123 High Street, Newcastle, UK', '01911234567', 4.5, (SELECT REF(km) FROM KitchenManagerTable km WHERE km.empNo = 2001), Kitchen_staff_nt_type(), (SELECT REF(tl) FROM TeamLeaderTable tl WHERE tl.empNo = 3001), Meal_nt_type(), NULL));
INSERT INTO KitchenTable VALUES (KitchenType(2, 'East End Kitchen', '456 East Road, Newcastle, UK', '01911234568', 4.2, (SELECT REF(km) FROM KitchenManagerTable km WHERE km.empNo = 2002), Kitchen_staff_nt_type(), (SELECT REF(tl) FROM TeamLeaderTable tl WHERE tl.empNo = 3002), Meal_nt_type(), NULL));
INSERT INTO KitchenTable VALUES (KitchenType(3, 'West Side Kitchen', '789 West Avenue, Newcastle, UK', '01911234569', 4.0, (SELECT REF(km) FROM KitchenManagerTable km WHERE km.empNo = 2003), Kitchen_staff_nt_type(), (SELECT REF(tl) FROM TeamLeaderTable tl WHERE tl.empNo = 3003), Meal_nt_type(), NULL));
INSERT INTO KitchenTable VALUES (KitchenType(4, 'North Kitchen', '321 North Street, Newcastle, UK', '01911234570', 4.3, (SELECT REF(km) FROM KitchenManagerTable km WHERE km.empNo = 2004), Kitchen_staff_nt_type(), (SELECT REF(tl) FROM TeamLeaderTable tl WHERE tl.empNo = 3001), Meal_nt_type(), NULL));
INSERT INTO KitchenTable VALUES (KitchenType(5, 'South Kitchen', '654 South Road, Newcastle, UK', '01911234571', 4.1, (SELECT REF(km) FROM KitchenManagerTable km WHERE km.empNo = 2005), Kitchen_staff_nt_type(), (SELECT REF(tl) FROM TeamLeaderTable tl WHERE tl.empNo = 3002), Meal_nt_type(), NULL));

INSERT INTO MealTable VALUES (MealType(1, 'Spaghetti Bolognese', 'Main Course', 8.99, 850, DATE '2025-01-10', 'Spaghetti, minced beef, tomato sauce, onions, garlic, herbs', (SELECT REF(k) FROM KitchenTable k WHERE k.kitchenID = 1), (SELECT REF(tl) FROM TeamLeaderTable tl WHERE tl.empNo = 3001)));
INSERT INTO MealTable VALUES (MealType(2, 'Margherita Pizza', 'Main Course', 7.99, 700, DATE '2025-01-12', 'Pizza dough, tomato sauce, mozzarella cheese, basil', (SELECT REF(k) FROM KitchenTable k WHERE k.kitchenID = 1), (SELECT REF(tl) FROM TeamLeaderTable tl WHERE tl.empNo = 3001)));
INSERT INTO MealTable VALUES (MealType(3, 'Caesar Salad', 'Appetizer', 5.99, 450, DATE '2025-01-15', 'Romaine lettuce, croutons, parmesan cheese, Caesar dressing', (SELECT REF(k) FROM KitchenTable k WHERE k.kitchenID = 1), (SELECT REF(tl) FROM TeamLeaderTable tl WHERE tl.empNo = 3001)));
INSERT INTO MealTable VALUES (MealType(4, 'Grilled Chicken Sandwich', 'Main Course', 6.99, 600, DATE '2025-01-18', 'Grilled chicken breast, lettuce, tomato, mayonnaise, sandwich bun', (SELECT REF(k) FROM KitchenTable k WHERE k.kitchenID = 2), (SELECT REF(tl) FROM TeamLeaderTable tl WHERE tl.empNo = 3002)));
INSERT INTO MealTable VALUES (MealType(5, 'Tomato Soup', 'Appetizer', 4.99, 300, DATE '2025-01-20', 'Tomatoes, vegetable broth, onions, garlic, herbs', (SELECT REF(k) FROM KitchenTable k WHERE k.kitchenID = 2), (SELECT REF(tl) FROM TeamLeaderTable tl WHERE tl.empNo = 3002)));
INSERT INTO MealTable VALUES (MealType(6, 'Beef Tacos', 'Main Course', 7.49, 750, DATE '2025-01-22', 'Taco shells, seasoned beef, lettuce, cheese, salsa', (SELECT REF(k) FROM KitchenTable k WHERE k.kitchenID = 3), (SELECT REF(tl) FROM TeamLeaderTable tl WHERE tl.empNo = 3003)));
INSERT INTO MealTable VALUES (MealType(7, 'Vegetable Stir Fry', 'Main Course', 6.49, 500, DATE '2025-01-25', 'Mixed vegetables, soy sauce, garlic, ginger, rice noodles', (SELECT REF(k) FROM KitchenTable k WHERE k.kitchenID = 4), (SELECT REF(tl) FROM TeamLeaderTable tl WHERE tl.empNo = 3001)));
INSERT INTO MealTable VALUES (MealType(8, 'Fish and Chips', 'Main Course', 9.49, 950, DATE '2025-01-28', 'Battered fish fillet, potato fries, tartar sauce, lemon wedge', (SELECT REF(k) FROM KitchenTable k WHERE k.kitchenID = 5), (SELECT REF(tl) FROM TeamLeaderTable tl WHERE tl.empNo = 3002)));

INSERT INTO DZoneTable VALUES (DZoneType(1, 'North Newcastle Zone', (SELECT REF(dm) FROM DZoneManagerTable dm WHERE dm.empNo = 5001), Dzone_staff_nt_type(), Customer_nt_type(), Kitchen_nt_type()));
INSERT INTO DZoneTable VALUES (DZoneType(2, 'South Newcastle Zone', (SELECT REF(dm) FROM DZoneManagerTable dm WHERE dm.empNo = 5002), Dzone_staff_nt_type(), Customer_nt_type(), Kitchen_nt_type()));
INSERT INTO DZoneTable VALUES (DZoneType(3, 'East Newcastle Zone', (SELECT REF(dm) FROM DZoneManagerTable dm WHERE dm.empNo = 5003), Dzone_staff_nt_type(), Customer_nt_type(), Kitchen_nt_type()));
INSERT INTO DZoneTable VALUES (DZoneType(4, 'West Newcastle Zone', (SELECT REF(dm) FROM DZoneManagerTable dm WHERE dm.empNo = 5004), Dzone_staff_nt_type(), Customer_nt_type(), Kitchen_nt_type()));
INSERT INTO DZoneTable VALUES (DZoneType(5, 'Central Newcastle Zone', (SELECT REF(dm) FROM DZoneManagerTable dm WHERE dm.empNo = 5005), Dzone_staff_nt_type(), Customer_nt_type(), Kitchen_nt_type()));

INSERT INTO CustomerTable VALUES (CustomerType(1, 'Alice Johnson', '01911234501', 'alice.johnson@example.com', '10 Maple Street, Newcastle, UK', 120, (SELECT REF(dz) FROM DZoneTable dz WHERE dz.zoneID = 1), 2000.00, Diet_category_nt_type()));
INSERT INTO CustomerTable VALUES (CustomerType(2, 'Bob Smith', '01911234502', 'bob.smith@example.com', '22 Oak Avenue, Newcastle, UK', 85, (SELECT REF(dz) FROM DZoneTable dz WHERE dz.zoneID = 2), 1800.00, Diet_category_nt_type()));
INSERT INTO CustomerTable VALUES (CustomerType(3, 'Carol Williams', '01911234503', 'carol.williams@example.com', '35 Pine Road, Newcastle, UK', 150, (SELECT REF(dz) FROM DZoneTable dz WHERE dz.zoneID = 3), 2200.00, Diet_category_nt_type()));
INSERT INTO CustomerTable VALUES (CustomerType(4, 'David Brown', '01911234504', 'david.brown@example.com', '48 Birch Lane, Newcastle, UK', 95, (SELECT REF(dz) FROM DZoneTable dz WHERE dz.zoneID = 4), 1900.00, Diet_category_nt_type()));
INSERT INTO CustomerTable VALUES (CustomerType(5, 'Eva Green', '01911234505', 'eva.green@example.com', '59 Cedar Street, Newcastle, UK', 110, (SELECT REF(dz) FROM DZoneTable dz WHERE dz.zoneID = 5), 2100.00, Diet_category_nt_type()));
INSERT INTO CustomerTable VALUES (CustomerType(6, 'Frank Harris', '01911234506', 'frank.harris@example.com', '63 Elm Avenue, Newcastle, UK', 75, (SELECT REF(dz) FROM DZoneTable dz WHERE dz.zoneID = 1), 1700.00, Diet_category_nt_type()));
INSERT INTO CustomerTable VALUES (CustomerType(7, 'Grace Lee', '01911234507', 'grace.lee@example.com', '77 Willow Road, Newcastle, UK', 130, (SELECT REF(dz) FROM DZoneTable dz WHERE dz.zoneID = 2), 2000.00, Diet_category_nt_type()));
INSERT INTO CustomerTable VALUES (CustomerType(8, 'Henry Martin', '01911234508', 'henry.martin@example.com', '89 Ash Lane, Newcastle, UK', 90, (SELECT REF(dz) FROM DZoneTable dz WHERE dz.zoneID = 3), 1850.00, Diet_category_nt_type()));

INSERT INTO DietaryCategoryTable VALUES (DietaryCategoryType(1, 'Vegan', Customer_nt_type()));
INSERT INTO DietaryCategoryTable VALUES (DietaryCategoryType(2, 'Vegetarian', Customer_nt_type()));
INSERT INTO DietaryCategoryTable VALUES (DietaryCategoryType(3, 'Gluten-Free', Customer_nt_type()));
INSERT INTO DietaryCategoryTable VALUES (DietaryCategoryType(4, 'Keto', Customer_nt_type()));


UPDATE KitchenStaffTable SET kitchen = (SELECT REF(k) FROM KitchenTable k WHERE k.kitchenID = 1) WHERE empNo = 1001;
UPDATE KitchenStaffTable SET kitchen = (SELECT REF(k) FROM KitchenTable k WHERE k.kitchenID = 2) WHERE empNo = 1002;
UPDATE KitchenStaffTable SET kitchen = (SELECT REF(k) FROM KitchenTable k WHERE k.kitchenID = 3) WHERE empNo = 1003;
UPDATE KitchenStaffTable SET kitchen = (SELECT REF(k) FROM KitchenTable k WHERE k.kitchenID = 4) WHERE empNo = 1004;
UPDATE KitchenStaffTable SET kitchen = (SELECT REF(k) FROM KitchenTable k WHERE k.kitchenID = 5) WHERE empNo = 1005;
UPDATE KitchenStaffTable SET kitchen = (SELECT REF(k) FROM KitchenTable k WHERE k.kitchenID = 1) WHERE empNo = 2001;
UPDATE KitchenStaffTable SET kitchen = (SELECT REF(k) FROM KitchenTable k WHERE k.kitchenID = 2) WHERE empNo = 2002;
UPDATE KitchenStaffTable SET kitchen = (SELECT REF(k) FROM KitchenTable k WHERE k.kitchenID = 3) WHERE empNo = 2003;
UPDATE KitchenStaffTable SET kitchen = (SELECT REF(k) FROM KitchenTable k WHERE k.kitchenID = 4) WHERE empNo = 2004;
UPDATE KitchenStaffTable SET kitchen = (SELECT REF(k) FROM KitchenTable k WHERE k.kitchenID = 5) WHERE empNo = 2005;

UPDATE KitchenManagerTable SET kitchenManaged = (SELECT REF(k) FROM KitchenTable k WHERE k.kitchenID = 1) WHERE empNo = 2001;
UPDATE KitchenManagerTable SET kitchenManaged = (SELECT REF(k) FROM KitchenTable k WHERE k.kitchenID = 2) WHERE empNo = 2002;
UPDATE KitchenManagerTable SET kitchenManaged = (SELECT REF(k) FROM KitchenTable k WHERE k.kitchenID = 3) WHERE empNo = 2003;
UPDATE KitchenManagerTable SET kitchenManaged = (SELECT REF(k) FROM KitchenTable k WHERE k.kitchenID = 4) WHERE empNo = 2004;
UPDATE KitchenManagerTable SET kitchenManaged = (SELECT REF(k) FROM KitchenTable k WHERE k.kitchenID = 5) WHERE empNo = 2005;

UPDATE KitchenTable k
SET managedBy = (SELECT REF(km) FROM KitchenManagerTable km WHERE km.empNo = 2001)
WHERE k.kitchenID = 1;

UPDATE KitchenTable k
SET managedBy = (SELECT REF(km) FROM KitchenManagerTable km WHERE km.empNo = 2002)
WHERE k.kitchenID = 2;

UPDATE KitchenTable k
SET managedBy = (SELECT REF(km) FROM KitchenManagerTable km WHERE km.empNo = 2003)
WHERE k.kitchenID = 3;

UPDATE KitchenTable k
SET managedBy = (SELECT REF(km) FROM KitchenManagerTable km WHERE km.empNo = 2004)
WHERE k.kitchenID = 4;

UPDATE KitchenTable k
SET managedBy = (SELECT REF(km) FROM KitchenManagerTable km WHERE km.empNo = 2005)
WHERE k.kitchenID = 5;

UPDATE DZoneStaffTable SET deliveryZone = (SELECT REF(d) FROM DZoneTable d WHERE d.zoneID = 1) WHERE empNo = 4001;
UPDATE DZoneStaffTable SET deliveryZone = (SELECT REF(d) FROM DZoneTable d WHERE d.zoneID = 2) WHERE empNo = 4002;
UPDATE DZoneStaffTable SET deliveryZone = (SELECT REF(d) FROM DZoneTable d WHERE d.zoneID = 3) WHERE empNo = 4003;
UPDATE DZoneStaffTable SET deliveryZone = (SELECT REF(d) FROM DZoneTable d WHERE d.zoneID = 1) WHERE empNo = 5001;
UPDATE DZoneStaffTable SET deliveryZone = (SELECT REF(d) FROM DZoneTable d WHERE d.zoneID = 2) WHERE empNo = 5002;
UPDATE DZoneStaffTable SET deliveryZone = (SELECT REF(d) FROM DZoneTable d WHERE d.zoneID = 3) WHERE empNo = 5003;
UPDATE DZoneStaffTable SET deliveryZone = (SELECT REF(d) FROM DZoneTable d WHERE d.zoneID = 4) WHERE empNo = 5004;
UPDATE DZoneStaffTable SET deliveryZone = (SELECT REF(d) FROM DZoneTable d WHERE d.zoneID = 5) WHERE empNo = 5005;

UPDATE DZoneManagerTable SET zoneManaged = (SELECT REF(d) FROM DZoneTable d WHERE d.zoneID = 1) WHERE empNo = 5001;
UPDATE DZoneManagerTable SET zoneManaged = (SELECT REF(d) FROM DZoneTable d WHERE d.zoneID = 2) WHERE empNo = 5002;
UPDATE DZoneManagerTable SET zoneManaged = (SELECT REF(d) FROM DZoneTable d WHERE d.zoneID = 3) WHERE empNo = 5003;
UPDATE DZoneManagerTable SET zoneManaged = (SELECT REF(d) FROM DZoneTable d WHERE d.zoneID = 4) WHERE empNo = 5004;
UPDATE DZoneManagerTable SET zoneManaged = (SELECT REF(d) FROM DZoneTable d WHERE d.zoneID = 5) WHERE empNo = 5005;


UPDATE KitchenTable SET dZone = (SELECT REF(dz) FROM DZoneTable dz WHERE dz.zoneID = 1) WHERE kitchenID = 1;
UPDATE KitchenTable SET dZone = (SELECT REF(dz) FROM DZoneTable dz WHERE dz.zoneID = 2) WHERE kitchenID = 2;
UPDATE KitchenTable SET dZone = (SELECT REF(dz) FROM DZoneTable dz WHERE dz.zoneID = 3) WHERE kitchenID = 3;
UPDATE KitchenTable SET dZone = (SELECT REF(dz) FROM DZoneTable dz WHERE dz.zoneID = 4) WHERE kitchenID = 4;
UPDATE KitchenTable SET dZone = (SELECT REF(dz) FROM DZoneTable dz WHERE dz.zoneID = 5) WHERE kitchenID = 5;

INSERT INTO TABLE (SELECT kitchensOversee FROM TeamLeaderTable TL WHERE TL.empNo = 3001) SELECT REF(K) FROM KitchenTable K WHERE K.overseenBy.empNo = 3001;
INSERT INTO TABLE (SELECT kitchensOversee FROM TeamLeaderTable TL WHERE TL.empNo = 3002) SELECT REF(K) FROM KitchenTable K WHERE K.overseenBy.empNo = 3002;
INSERT INTO TABLE (SELECT kitchensoversee FROM TeamLeaderTable TL WHERE TL.empNo = 3003) SELECT REF(K) FROM KitchenTable K WHERE K.overseenBy.empNo = 3003;
INSERT INTO TABLE (SELECT kitchensOversee FROM TeamLeaderTable TL WHERE TL.empNo = 3004) SELECT REF(K) FROM KitchenTable K WHERE K.overseenBy.empNo = 3004;
INSERT INTO TABLE (SELECT kitchensOversee FROM TeamLeaderTable TL WHERE TL.empNo = 3005) SELECT REF(K) FROM KitchenTable K WHERE K.overseenBy.empNo = 3005;

INSERT INTO TABLE (SELECT mealsDesigned FROM TeamLeaderTable TL WHERE TL.empNo = 3001) SELECT REF(M) FROM MealTable M WHERE M.designedBy.empNo = 3001;
INSERT INTO TABLE (SELECT mealsDesigned FROM TeamLeaderTable TL WHERE TL.empNo = 3002) SELECT REF(M) FROM MealTable M WHERE M.designedBy.empNo = 3002;
INSERT INTO TABLE (SELECT mealsDesigned FROM TeamLeaderTable TL WHERE TL.empNo = 3003) SELECT REF(M) FROM MealTable M WHERE M.designedBy.empNo = 3003;
INSERT INTO TABLE (SELECT mealsDesigned FROM TeamLeaderTable TL WHERE TL.empNo = 3004) SELECT REF(M) FROM MealTable M WHERE M.designedBy.empNo = 3004;
INSERT INTO TABLE (SELECT mealsDesigned FROM TeamLeaderTable TL WHERE TL.empNo = 3005) SELECT REF(M) FROM MealTable M WHERE M.designedBy.empNo = 3005;

INSERT INTO TABLE (SELECT k.mealsPrepared FROM KitchenTable k WHERE k.kitchenID = 1) SELECT REF(m) FROM MealTable m WHERE m.kitchenPrepared.kitchenID = 1;
INSERT INTO TABLE (SELECT k.mealsPrepared FROM KitchenTable k WHERE k.kitchenID = 2) SELECT REF(m) FROM MealTable m WHERE m.kitchenPrepared.kitchenID = 2;
INSERT INTO TABLE (SELECT k.mealsPrepared FROM KitchenTable k WHERE k.kitchenID = 3) SELECT REF(m) FROM MealTable m WHERE m.kitchenPrepared.kitchenID = 3;
INSERT INTO TABLE (SELECT k.mealsPrepared FROM KitchenTable k WHERE k.kitchenID = 4) SELECT REF(m) FROM MealTable m WHERE m.kitchenPrepared.kitchenID = 4;
INSERT INTO TABLE (SELECT k.mealsPrepared FROM KitchenTable k WHERE k.kitchenID = 5) SELECT REF(m) FROM MealTable m WHERE m.kitchenPrepared.kitchenID = 5;

INSERT INTO TABLE (SELECT k.staff FROM KitchenTable k WHERE k.kitchenID = 1)
SELECT REF(s) FROM KitchenStaffTable s WHERE s.kitchen.kitchenID = 1;

INSERT INTO TABLE (SELECT k.staff FROM KitchenTable k WHERE k.kitchenID = 2)
SELECT REF(s) FROM KitchenStaffTable s WHERE s.kitchen.kitchenID = 2;

INSERT INTO TABLE (SELECT k.staff FROM KitchenTable k WHERE k.kitchenID = 3)
SELECT REF(s) FROM KitchenStaffTable s WHERE s.kitchen.kitchenID = 3;

INSERT INTO TABLE (SELECT k.staff FROM KitchenTable k WHERE k.kitchenID = 4)
SELECT REF(s) FROM KitchenStaffTable s WHERE s.kitchen.kitchenID = 4;

INSERT INTO TABLE (SELECT k.staff FROM KitchenTable k WHERE k.kitchenID = 5)
SELECT REF(s) FROM KitchenStaffTable s WHERE s.kitchen.kitchenID = 5;

INSERT INTO TABLE (SELECT d.staff FROM DZoneTable d WHERE d.zoneID = 1) SELECT REF(s) FROM DZoneStaffTable s WHERE s.deliveryZone.zoneID = 1;
INSERT INTO TABLE (SELECT d.staff FROM DZoneTable d WHERE d.zoneID = 2) SELECT REF(s) FROM DZoneStaffTable s WHERE s.deliveryZone.zoneID = 2;
INSERT INTO TABLE (SELECT d.staff FROM DZoneTable d WHERE d.zoneID = 3) SELECT REF(s) FROM DZoneStaffTable s WHERE s.deliveryZone.zoneID = 3;
INSERT INTO TABLE (SELECT d.staff FROM DZoneTable d WHERE d.zoneID = 4) SELECT REF(s) FROM DZoneStaffTable s WHERE s.deliveryZone.zoneID = 4;
INSERT INTO TABLE (SELECT d.staff FROM DZoneTable d WHERE d.zoneID = 5) SELECT REF(s) FROM DZoneStaffTable s WHERE s.deliveryZone.zoneID = 5;


INSERT INTO TABLE (SELECT d.coveredKitchens FROM DZoneTable d WHERE d.zoneID = 1) SELECT REF(k) FROM KitchenTable k WHERE k.kitchenID = 1;
INSERT INTO TABLE (SELECT d.coveredKitchens FROM DZoneTable d WHERE d.zoneID = 2) SELECT REF(k) FROM KitchenTable k WHERE k.kitchenID = 2;
INSERT INTO TABLE (SELECT d.coveredKitchens FROM DZoneTable d WHERE d.zoneID = 3) SELECT REF(k) FROM KitchenTable k WHERE k.kitchenID = 3;
INSERT INTO TABLE (SELECT d.coveredKitchens FROM DZoneTable d WHERE d.zoneID = 4) SELECT REF(k) FROM KitchenTable k WHERE k.kitchenID = 4;
INSERT INTO TABLE (SELECT d.coveredKitchens FROM DZoneTable d WHERE d.zoneID = 5) SELECT REF(k) FROM KitchenTable k WHERE k.kitchenID = 5;


INSERT INTO TABLE (SELECT d.customers FROM DZoneTable d WHERE d.zoneID = 1) SELECT REF(c) FROM CustomerTable c WHERE c.deliveryZone = (SELECT REF(d) FROM DZoneTable d WHERE d.zoneID = 1);
INSERT INTO TABLE (SELECT d.customers FROM DZoneTable d WHERE d.zoneID = 2) SELECT REF(c) FROM CustomerTable c WHERE c.deliveryZone = (SELECT REF(d) FROM DZoneTable d WHERE d.zoneID = 2);
INSERT INTO TABLE (SELECT d.customers FROM DZoneTable d WHERE d.zoneID = 3) SELECT REF(c) FROM CustomerTable c WHERE c.deliveryZone = (SELECT REF(d) FROM DZoneTable d WHERE d.zoneID = 3);
INSERT INTO TABLE (SELECT d.customers FROM DZoneTable d WHERE d.zoneID = 4) SELECT REF(c) FROM CustomerTable c WHERE c.deliveryZone = (SELECT REF(d) FROM DZoneTable d WHERE d.zoneID = 4);
INSERT INTO TABLE (SELECT d.customers FROM DZoneTable d WHERE d.zoneID = 5) SELECT REF(c) FROM CustomerTable c WHERE c.deliveryZone = (SELECT REF(d) FROM DZoneTable d WHERE d.zoneID = 5);

INSERT INTO TABLE (SELECT c.dietaryPreferences FROM CustomerTable c WHERE c.customerID = 1) SELECT REF(dc) FROM DietaryCategoryTable dc WHERE dc.dCategoryID IN (1, 3);
INSERT INTO TABLE (SELECT c.dietaryPreferences FROM CustomerTable c WHERE c.customerID = 2) SELECT REF(dc) FROM DietaryCategoryTable dc WHERE dc.dCategoryID = 2;
INSERT INTO TABLE (SELECT c.dietaryPreferences FROM CustomerTable c WHERE c.customerID = 3) SELECT REF(dc) FROM DietaryCategoryTable dc WHERE dc.dCategoryID = 4;
INSERT INTO TABLE (SELECT c.dietaryPreferences FROM CustomerTable c WHERE c.customerID = 4) SELECT REF(dc) FROM DietaryCategoryTable dc WHERE dc.dCategoryID IN (1, 4);
INSERT INTO TABLE (SELECT c.dietaryPreferences FROM CustomerTable c WHERE c.customerID = 5) SELECT REF(dc) FROM DietaryCategoryTable dc WHERE dc.dCategoryID IN (2, 3);
INSERT INTO TABLE (SELECT c.dietaryPreferences FROM CustomerTable c WHERE c.customerID = 6) SELECT REF(dc) FROM DietaryCategoryTable dc WHERE dc.dCategoryID = 4;
INSERT INTO TABLE (SELECT c.dietaryPreferences FROM CustomerTable c WHERE c.customerID = 7) SELECT REF(dc) FROM DietaryCategoryTable dc WHERE dc.dCategoryID IN (1, 2);
INSERT INTO TABLE (SELECT c.dietaryPreferences FROM CustomerTable c WHERE c.customerID = 8) SELECT REF(dc) FROM DietaryCategoryTable dc WHERE dc.dCategoryID = 3;

INSERT INTO TABLE (SELECT dc.customersChoosen FROM DietaryCategoryTable dc WHERE dc.dCategoryID = 1) SELECT REF(c) FROM CustomerTable c WHERE c.customerID IN (1, 4, 7);
INSERT INTO TABLE (SELECT dc.customersChoosen FROM DietaryCategoryTable dc WHERE dc.dCategoryID = 2) SELECT REF(c) FROM CustomerTable c WHERE c.customerID IN (2, 5, 7);
INSERT INTO TABLE (SELECT dc.customersChoosen FROM DietaryCategoryTable dc WHERE dc.dCategoryID = 3) SELECT REF(c) FROM CustomerTable c WHERE c.customerID IN (1, 5, 8);
INSERT INTO TABLE (SELECT dc.customersChoosen FROM DietaryCategoryTable dc WHERE dc.dCategoryID = 4) SELECT REF(c) FROM CustomerTable c WHERE c.customerID IN (3, 4, 6);
