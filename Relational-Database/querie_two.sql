
SET LINESIZE 500 
SET PAGESIZE 50


COLUMN Name FORMAT A20 HEADING "Name"
COLUMN Telephone FORMAT A15 HEADING "Telephone"
COLUMN Email FORMAT A30 HEADING "Email"
COLUMN Address FORMAT A25 HEADING "Address"
COLUMN LoyaltyPoints FORMAT 99999 HEADING "Loyalty Points"
COLUMN SubZone FORMAT A25 HEADING "SubZone" 
COLUMN DeliveryZone FORMAT A20 HEADING "Delivery Zone"
COLUMN ZoneManager FORMAT A20 HEADING "Zone Manager"


SELECT 
    c.name AS Name,
    c.telephone AS Telephone,
    c.email AS Email,
    c.address AS Address,
    c.loyaltyPoints AS LoyaltyPoints,
    s.name AS SubZone,
    z.name AS DeliveryZone,
    e.name AS ZoneManager
FROM Customer c
JOIN SubZone s ON c.subZoneID = s.subZoneID
JOIN DeliveryZone z ON s.zoneID = z.zoneID
JOIN Employee e ON z.zoneManager = e.empNo;