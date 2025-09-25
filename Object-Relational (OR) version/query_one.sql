SET LINESIZE 200
SET PAGESIZE 100

COLUMN manager_name FORMAT A20 HEADING 'Kitchen Manager'
COLUMN kitchen_name FORMAT A20 HEADING 'Kitchen'
COLUMN meal_name FORMAT A25 HEADING 'Meal'
COLUMN meal_type FORMAT A15 HEADING 'Meal Type'
COLUMN meal_price FORMAT 999.99 HEADING 'Price'
COLUMN meal_calories FORMAT 9999 HEADING 'Calories'
COLUMN team_leader FORMAT A20 HEADING 'Team Leader'
COLUMN tl_phone FORMAT A15 HEADING 'TL Phone'
COLUMN tl_nin FORMAT A15 HEADING 'TL NIN'

SELECT 
    ks.name AS manager_name,  
    k.name AS kitchen_name,
    m.name AS meal_name,
    m.type AS meal_type,
    m.price AS meal_price,
    m.calories AS meal_calories,
    tl.name AS team_leader,
    tl.telephone AS tl_phone,
    tl.NIN AS tl_nin
FROM KitchenManagerTable km
JOIN KitchenStaffTable ks  
    ON km.empNo = ks.empNo
JOIN KitchenTable k 
    ON km.kitchenManaged = REF(k)
JOIN MealTable m 
    ON m.kitchenPrepared = REF(k)
JOIN TeamLeaderTable tl 
    ON k.overseenBy = REF(tl)
ORDER BY 
    ks.name, k.name, m.name;