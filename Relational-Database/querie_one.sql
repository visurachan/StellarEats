SET LINESIZE 500
SET PAGESIZE 50


COLUMN KID FORMAT A8 HEADING "K. ID"
COLUMN KMgr FORMAT A13 HEADING "K. Mgr"
COLUMN MealName FORMAT A22 HEADING "Meal Name"
COLUMN MealType FORMAT A15 HEADING "Meal Type"
COLUMN Price FORMAT 999.99 HEADING "Price"
COLUMN Cal FORMAT 9999 HEADING "Cal"
COLUMN Ingred FORMAT A45 HEADING "Ingredients"
COLUMN TLName FORMAT A16 HEADING "TL Name"
COLUMN TLTel FORMAT A14 HEADING "TL Tel"
COLUMN TLEmail FORMAT A40 HEADING "TL Email" 
COLUMN TLSalary FORMAT 99999 HEADING "TL Sal"

SET HEADING ON

SELECT 
    k.kitchenID AS KID,
    km.name AS KMgr,
    m.name AS MealName,
    m.type AS MealType,
    m.price AS Price,
    m.calories AS Cal,
    SUBSTR(m.ingredients, 1, 45) AS Ingred,
    t.name AS TLName,
    t.telephone AS TLTel,
    t.email AS TLEmail,
    t.salary AS TLSalary
FROM Kitchen k
JOIN Employee km ON k.kitchenManager = km.empNo
JOIN Meal m ON k.kitchenID = m.kitchenPrepared
JOIN Employee t ON k.teamLeader = t.empNo;

