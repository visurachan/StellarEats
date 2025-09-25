
# StellarEats Database System

This project implements a **Food Delivery Database System** called **StellarEats** using **Oracle Database**, demonstrating both **Relational** and **Object-Relational** modeling approaches.

---

## **Project Overview**

The StellarEats database system supports the management of:

- Employees (Kitchen Staff, Delivery Zone Staff, Team Leaders, and Managers)  
- Kitchens and Delivery Zones  
- Meals, Dietary Categories, and Customer Preferences  
- Orders, Transactions, and Delivery Drones  
- Inventory and No-Fly Zones for drone deliveries  

The database is implemented in two versions:

1. **Relational Model** – traditional tables with primary and foreign keys  
2. **Object-Relational Model (OR)** – Oracle Object Types, Nested Tables, and Inheritance  

---

## **Database Design Approach**

Database design is a critical process to develop efficient and maintainable databases. Common approaches include:

- **Top-down (ER modelling)** – starts from high-level entities and relationships, then moves to attributes  
- **Bottom-up (Normalization)** – starts from attributes, groups them systematically to ensure data integrity  
- **Mixed approach** – combines elements of both  
- **Inside-out** – builds database from core components outwards  

### **Justification for Approach Used**

For **StellarEats**, a **top-down approach** with some **normalization principles** was used because:  
- It provided a clear and intuitive conceptual model of business processes  
- Normalization ensured data integrity and avoided redundancy  
- Easier to implement and map to Oracle Object-Relational structures  

---

## **Relational vs Object-Relational Models**

| Feature                       | Relational Model                  | Object-Relational Model                     |
|--------------------------------|---------------------------------|-------------------------------------------|
| Complexity                     | Simple, normalized tables       | Handles complex real-world scenarios      |
| Data integrity                  | Ensured via normalization       | Ensured via nested tables & object types  |
| Query processing                | Fast and efficient              | Slightly higher overhead for complex queries |
| Hierarchies & inheritance       | Limited                         | Fully supported (inheritance, nested objects) |
| Storage                         | Less storage                    | Requires more storage due to nested objects |

**Summary:**  
- **Relational model:** Simple, efficient, smaller storage, faster queries  
- **Object-Relational model:** Natural representation of real-world entities, easier to model complex relationships, supports inheritance and encapsulation, but may require more storage  

---

## **Technologies Used**

- **Database:** Oracle Database  
- **SQL Features:** Object Types, Nested Tables, REF types, Constraints, Foreign Keys  

---

## **Conclusion**

The top-down ER approach combined with normalization allowed for a clear conceptual design while ensuring data integrity. Both **Relational** and **Object-Relational** versions have strengths and limitations:  

- Relational is simple, efficient, and storage-friendly  
- Object-Relational is more natural for complex scenarios, supports inheritance, and simplifies modeling of real-world entities  

For StellarEats, the **Object-Relational approach outweighs its overhead** due to its closer alignment with the business domain and ease of handling complex queries.

---
