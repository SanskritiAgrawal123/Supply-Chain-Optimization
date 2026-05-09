-- Calculate the average freight cost in usd per kilogram for each country.
-- Which 3 countries are the most expensive to ship to?

SELECT country, SUM(weight_in_kgs) AS total_weight_in_kgs, SUM(freight_cost_in_usd) AS total_freight_cost_in_usd,
ROUND(SUM(freight_cost_in_usd) / NULLIF(SUM(weight_in_kgs), 0), 3) AS avg_freight_cost_in_usd_per_kg
FROM delivery_dataset
GROUP BY country
ORDER BY avg_freight_cost_in_usd_per_kg DESC
LIMIT 3;

SELECT country, managed_by, fulfill_via, shipment_mode, vendor
FROM delivery_dataset
WHERE country = 'Guinea'; 
SELECT country, managed_by, fulfill_via, shipment_mode, vendor
FROM delivery_dataset
WHERE country = 'Mali'; 
SELECT country, managed_by, fulfill_via, shipment_mode, vendor
FROM delivery_dataset
WHERE country = 'Liberia';
