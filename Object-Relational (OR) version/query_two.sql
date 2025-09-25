SET LINESIZE 200
SET PAGESIZE 100

COLUMN customer_id FORMAT 99999 HEADING 'Cust ID'
COLUMN customer_name FORMAT A20 HEADING 'Customer Name'
COLUMN customer_phone FORMAT A15 HEADING 'Customer Phone'
COLUMN customer_address FORMAT A35 HEADING 'Customer Address'
COLUMN loyalty_points FORMAT 999 HEADING 'Loyalty Pts'
COLUMN max_calories FORMAT 9999 HEADING 'Max Calories'
COLUMN zone_name FORMAT A25 HEADING 'Delivery Zone'
COLUMN manager_name FORMAT A20 HEADING 'Zone Manager'

SELECT 
    c.customerID AS customer_id,
    c.name AS customer_name,
    c.telephone AS customer_phone,
    c.address AS customer_address,
    c.loyaltyPoints AS loyalty_points,
    c.maxCalories AS max_calories,  
    dz.name AS zone_name,
    dzs.name AS manager_name
FROM CustomerTable c
JOIN DZoneTable dz 
    ON c.deliveryZone = REF(dz)
JOIN DZoneManagerTable dzm 
    ON dz.managedBy = REF(dzm)
JOIN DZoneStaffTable dzs 
    ON dzm.empNo = dzs.empNo
ORDER BY c.customerID;