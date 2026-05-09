-- Identify the top 5 vendors who have handled the most line item quantity and calculate their average pack price.

SELECT vendor, SUM(line_item_quantity) AS total_quantiy, AVG(pack_price) AS avg_pack_price
FROM delivery_dataset
GROUP BY vendor
ORDER BY  SUM(line_item_quantity) DESC
LIMIT 5;
