# Food Delivery Data Analysis (SQL-based Study)
## Project Overview 
This project simulates a real-world food delivery database (like Swiggy/Zomato) to analyze customer behavior, restaurant performance, and revenue growth.

**Key Problems Solved**
* Identifying "Loyal Customers" and high-value users.
* Calculating Month-over-month revenue growth using window Functions.
* Finding top-performing restaurants and favorite dishes.

## Database Schema
The database consists of the following tables:
* **Users:** Customer demographics
* **Restaurants:** Details like cuisine, rating, and pricing.
* **Orders & order Details:** Transactional data linking users to restaurants.
* **Menu & Food:** Pricing and item categorization.

## Key SQL Techniques Used 
* **Joins:** Inner Join, Left Join, Self Join
* **Aggregations:** GROUP BY, SUM, COUNT, AVG.
* **Window Functions:** LEAD, LAG (for growth calculation), RANK
* **CTE (Common Table Expressions):** For cleaner query struture.

## How to Run
1. Run the script 'schema.sql' to create the database and tables.
2. Run 'analysis_queries.sql' to view the solutions to the case study questions.

##Insights 
Based on the data analytics, the following trends were identified.
1. **Revenue Volatility:** The platform saw massive growth in June 2022, with a **103% increase** in revenue compared to May ((₹965 → ₹1960).
    * However, July saw a correction with a **28% drop** in revenue, suggesting a need for customer retention strategies after the initial surge.

2.  **Customer Preferences:**
    * **"Choco Lava Cake"** is the most frequently ordered item, acting as a key "add-on" driver for increasing basket size.
    * One power user (*Nitish*) ordered it **5 times**, highlighting specific product loyalty.

3.  **Restaurant Performance:**
    * **Box8** emerged as the top-performing restaurant for the analyzed period, leading in both **total order volume** and **customer loyalty** (highest repeat customer count).

4.  **Menu Pricing Strategy:**
    * High-ticket items like *Non-veg Pizza* (Avg Price: ₹450) drive revenue, while lower-priced items like *Choco Lava Cake* (~₹98) drive volume.

