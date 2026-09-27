CREATE DATABASE food_delivery;
USE food_delivery;

-- To count the total number of orders;
SELECT*FROM orders;
SELECT COUNT(*) from orders;
-- To check the distinct weather conditions
SELECT DISTINCT Weather from orders;

-- To check the minimum, maximum and average delivery time
SELECT MIN(Delivery_Time_Minutes) as minimum_time,
MAX(Delivery_Time_Minutes) as maximum_time,
ROUND(AVG(Delivery_Time_Minutes),2) as average_time
FROM orders;

-- Impact of Weather on the delivery
SELECT Weather,COUNT(order_id) as total_orders ,AVG(Delivery_Time_Minutes) as average_time
FROM orders GROUP BY Weather ORDER BY average_time DESC;

-- Impact of traffic on the delivery
SELECT Traffic_Level, COUNT(*) Orders, ROUND(AVG(Delivery_Time_Minutes),2) Avg_Time
FROM orders GROUP BY Traffic_Level ORDER BY Avg_Time DESC;

-- Impact of Timing of the Day on the Delivery
SELECT Time_of_Day, COUNT(*) Orders, ROUND(AVG(Delivery_Time_Minutes),2) Avg_Time
FROM orders GROUP BY Time_of_Day ORDER BY Avg_Time DESC;

-- Impact of Experience of Delivery  Riders
SELECT Courier_Experience_yrs, ROUND(AVG(Delivery_Time_Minutes),2) AS Avg_Time 
FROM orders GROUP BY Courier_Experience_yrs ORDER BY Courier_Experience_yrs ASC;

-- It tells how vehicle type affects the delivery time
SELECT Vehicle_Type, ROUND(AVG(Delivery_Time_Minutes),2) AS Avg_Time
FROM orders GROUP BY Vehicle_Type ORDER BY Avg_Time DESC;

-- It tells how a combination of weather and traffic level affects the average delivery time
SELECT Weather, Traffic_Level,ROUND(AVG(Delivery_Time_Minutes),2) as Avg_Time
FROM orders GROUP BY Weather, Traffic_Level ORDER BY Avg_Time DESC;

-- It categorises the delay time among three sections
SELECT Order_ID,Delivery_Time_Minutes, CASE 
WHEN Delivery_Time_Minutes<=40 THEN "Fast"
WHEN Delivery_Time_Minutes<=60 THEN "Moderate"
ELSE "Delayed"
END AS Delivery_level
FROM orders;

SELECT Weather, ROUND(AVG(Delivery_Time_Minutes),2) as average_time, DENSE_RANK() OVER(ORDER BY AVG(Delivery_Time_Minutes) ASC) as Weather_Rank 
FROM orders GROUP BY Weather;

-- Trying to find the best combination
SELECT Weather, Courier_Experience_yrs, ROUND(AVG(Delivery_Time_Minutes),2) as Avg_Time,
DENSE_RANK() OVER(ORDER BY AVG(Delivery_Time_Minutes)) as ranking FROM orders WHERE Weather!="Unknown" GROUP BY Weather, Courier_Experience_yrs;

-- Which Weather contributed to most delayed deliveries
WITH Delayed_Orders AS(
SELECT*FROM orders where Delivery_Time_Minutes>60
)
SELECT Weather, COUNT(*) AS delay_orders, ROUND(AVG(Delivery_Time_Minutes),2) AS Average_Time FROM Delayed_Orders WHERE Weather!="Unknown" GROUP BY Weather ORDER BY delay_orders ASC;

-- How Delivery time was affected by Weather
WITH WorstConditions AS
(
    SELECT *FROM orders
    WHERE Traffic_Level='High' AND Weather IN ('Snowy','Rainy')
)
SELECT
    Weather, COUNT(*) orders, ROUND(AVG(Delivery_Time_Minutes),2) Avg_Time
FROM WorstConditions GROUP BY Weather;