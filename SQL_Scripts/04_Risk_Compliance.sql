-- For shipments valued over $50000, what is the average insurance cost? 
-- Are there any high value shipments with zero insurance recorded?

SELECT line_item_value, (pack_price*line_item_quantity) AS liv,
line_item_insurance_in_usd
FROM delivery_dataset
WHERE (pack_price*line_item_quantity) != line_item_value;

SELECT ROUND(AVG(line_item_insurance_in_usd), 2) AS avg_insurance_cost 
FROM delivery_dataset 
WHERE line_item_value > 50000;

SELECT id, line_item_value, line_item_insurance_in_usd
FROM delivery_dataset
WHERE line_item_value > 50000 AND (line_item_insurance_in_usd IS NULL OR line_item_insurance_in_usd = 0)
ORDER BY line_item_value DESC;
