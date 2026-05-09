-- What is the average processing time for each managed by group?

SELECT managed_by, 
CONCAT(ROUND(AVG(DATEDIFF(po_sent_to_vendor_date, pq_first_sent_to_client_date)),0), ' days') AS avg_processing_time
FROM delivery_dataset
GROUP BY managed_by
HAVING AVG(DATEDIFF(po_sent_to_vendor_date, pq_first_sent_to_client_date)) IS NOT NULL
ORDER BY AVG(DATEDIFF(po_sent_to_vendor_date, pq_first_sent_to_client_date)) ASC;
