-- Which shipment mode has the highest percentage of late deliveries?

SET SQL_SAFE_UPDATES = 0; 
ALTER TABLE delivery_dataset ADD COLUMN late_deliveries INT;
UPDATE delivery_dataset SET 
late_deliveries = 1 WHERE scheduled_delivery_date<delivered_to_client_date;
UPDATE delivery_dataset SET 
late_deliveries = 0 WHERE scheduled_delivery_date>=delivered_to_client_date;
SET SQL_SAFE_UPDATES = 1; 
ALTER TABLE delivery_dataset MODIFY COLUMN late_deliveries INT AFTER delivery_recorded_date;
SELECT shipment_mode, SUM(late_deliveries) AS total_late_deliveries, COUNT(*) AS total_deliveries,
ROUND((SUM(late_deliveries)/COUNT(*))*100, 2) AS percentage_of_late_deliveries
FROM delivery_dataset
WHERE shipment_mode IS NOT NULL
GROUP BY shipment_mode
ORDER BY percentage_of_late_deliveries DESC;
