SELECT CATEGORY,ROUND(SUM(SALES), 2) AS TOTAL_SALES,
ROUND(SUM(PROFIT), 2) AS TOTAL_PROFIT,
ROUND(AVG(PROFIT_MARGIN), 2) AS AVG_MARGIN_PCT
FROM SUPERSTORE_CLEAN
GROUP BY CATEGORY
ORDER BY TOTAL_SALES DESC;

SELECT STATE,round(sum(SALES), 2)as total_sales,
count(DISTINCT"Order_ID") as total_orders
from SUPERSTORE_CLEAN
group by STATE
order by total_sales DESC
LIMIT 5;

SELECT substr("ORDER_DATE", 1, 9) AS Month,
round(sum(sales), 2) as monthly_sales
FROM SUPERSTORE_CLEAN
group by month
order by month;

SELECT "PRODUCT_NAME",
round(sum(PROFIT), 2) as total_profit,
CASE
   when sum(profit) < 0 then "loss"
   when sum(profit) > 0 then "Profitt"
   else "Break-even"
END  as profit_status 
from SUPERSTORE_CLEAN
group by PRODUCT_NAME
order by total_profit Asc
LIMIT 5;

SELECT SEGMENT,
  count(DISTINCT "CUSTOMER_ID") as customers,
  round(sum(sales), 2)as total_sales,
  round(avg(PROFIT_MARGIN), 2) as avg_margin
from SUPERSTORE_CLEAN
group by SEGMENT
order by total_sales DESC;  

SELECT
    "SHIP_MODE",
	COUNT("ORDER_ID") AS TOTAL_ORDERS,
	round(AVG(julianday("SHIP_DATE") - julianday("ORDER_DATE")), 1) AS AVG_DAYS_TO_SHIP,
	round(SUM(SALES), 2) AS TOTAL_SALES
FROM SUPERSTORE_CLEAN
GROUP BY SHIP_MODE
ORDER BY AVG_DAYS_TO_SHIP ASC;	

SELECT
   CASE
     when DISCOUNT = 0  THEN 'No Discount'
	 when DISCOUNT <= 0.2 then 'Low (1-20%)'
	 when DISCOUNT <= 0.4 then 'medium (21-40%)'
	 ELSE                      'High(41%+)'
   END as DISCOUNT_band,
   count(*) as total_orders,
   round(avg(PROFIT_MARGIN), 2) as Avg_profit_margin,
   round(sum(profit), 2) as total_profit
from SUPERSTORE_CLEAN
GROUP by discount_band
order by avg_profit_margin desc;   

SELECT order_count, count(*) as num_customers,
  round(count(*) * 100.0 / sum(count(*)) over (), 1) as pct_of_customers
from (
   SELECT "CUSTOMER_ID", count(distinct "order_id") as order_count
   from SUPERSTORE_CLEAN
   GROUP by "CUSTOMER_ID"
) sub 
group by order_count
order by order_count;   
           