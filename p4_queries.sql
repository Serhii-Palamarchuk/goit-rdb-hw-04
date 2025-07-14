-- Порахувати кількість рядків у JOIN-запиті
SELECT COUNT(*)
FROM order_details od
JOIN orders o ON od.order_id = o.id
JOIN customers c ON o.customer_id = c.id
JOIN products p ON od.product_id = p.id
JOIN categories cat ON p.category_id = cat.id
JOIN employees e ON o.employee_id = e.employee_id
JOIN shippers s ON o.shipper_id = s.id
JOIN suppliers sup ON p.supplier_id = sup.id;
