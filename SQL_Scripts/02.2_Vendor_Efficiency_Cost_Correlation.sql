SELECT country, vendor, ROUND(SUM(freight_cost_in_usd) / NULLIF(SUM(weight_in_kgs), 0), 3) AS avg_cost_per_kg
FROM delivery_dataset
WHERE country IN ('Guinea', 'Mali', 'Liberia') AND 
vendor IN ('Orgenics, Ltd', 'Orasure Technologies Inc.', 'Standard Diagnostics, Inc.', 'Trinity Biotech, Plc')
GROUP BY country, vendor
ORDER BY country, avg_cost_per_kg DESC;

SELECT country, vendor, weight_in_kgs,
ROUND(SUM(freight_cost_in_usd) / NULLIF(SUM(weight_in_kgs), 0), 3) AS avg_cost_per_kg
FROM delivery_dataset
WHERE weight_in_kgs IS NOT NULL
GROUP BY country, vendor, shipment_mode, weight_in_kgs
HAVING country = 'Mali'
ORDER BY vendor, weight_in_kgs ASC; 

SELECT country, vendor, weight_in_kgs,
ROUND(SUM(freight_cost_in_usd) / NULLIF(SUM(weight_in_kgs), 0), 3) AS avg_cost_per_kg
FROM delivery_dataset
WHERE weight_in_kgs IS NOT NULL
GROUP BY country, vendor, shipment_mode, weight_in_kgs
HAVING country = 'Liberia'
ORDER BY country, weight_in_kgs ASC; 
