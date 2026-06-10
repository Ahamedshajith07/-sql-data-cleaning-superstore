select * FROM superstore_raw LIMIT 10;

select count(*) as total_rows from superstore_raw;

SELECT
     sum(case when "CUSTOMER_NAME" IS NULL then 1 ELSE 0 END) AS NULL_CUSTOMERS,
	 SUM(CASE WHEN "SALES" IS NULL THEN 1 ELSE 0 END) AS NULL_SALES,
	 SUM(CASE WHEN "ORDER_DATE" IS NULL THEN 1 ELSE 0 END) AS NULL_DATES 
FROM superstore_raw;	

SELECT Order_ID, COUNT(*) AS count
FROM superstore_raw
GROUP BY Order_ID
HAVING COUNT(*) > 1;


SELECT SHIP_DATE , count(*) as count
from superstore_raw
GROUP by SHIP_DATE
HAVING COUNT(*) > 1
LIMIT 20;

