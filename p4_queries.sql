USE hw03;

-- 1. Порахувати кількість рядків у JOIN-запиті
SELECT COUNT(*)
FROM order_details od
JOIN orders o ON od.order_id = o.id
JOIN customers c ON o.customer_id = c.id
JOIN products p ON od.product_id = p.id
JOIN categories cat ON p.category_id = cat.id
JOIN employees e ON o.employee_id = e.employee_id
JOIN shippers s ON o.shipper_id = s.id
JOIN suppliers sup ON p.supplier_id = sup.id;

-- 2. Замінити INNER JOIN на LEFT JOIN
-- Я використав LEFT JOIN замість INNER JOIN. Результат не змінився, 
-- бо всі записи з таблиці order_details мають відповідності в зв’язаних таблицях (orders, products, categories тощо). 
-- Це означає, що LEFT JOIN не додає нових (null) рядків, тому кількість рядків не змінилася.*/
SELECT COUNT(*)
FROM order_details od
LEFT JOIN orders o ON od.order_id = o.id
LEFT JOIN customers c ON o.customer_id = c.id
LEFT JOIN products p ON od.product_id = p.id
LEFT JOIN categories cat ON p.category_id = cat.id
LEFT JOIN employees e ON o.employee_id = e.employee_id
LEFT JOIN shippers s ON o.shipper_id = s.id
LEFT JOIN suppliers sup ON p.supplier_id = sup.id;

-- 3. employee_id > 3 AND ≤ 10
SELECT *
FROM order_details od
JOIN orders o ON od.order_id = o.id
JOIN customers c ON o.customer_id = c.id
JOIN products p ON od.product_id = p.id
JOIN categories cat ON p.category_id = cat.id
JOIN employees e ON o.employee_id = e.employee_id
JOIN shippers s ON o.shipper_id = s.id
JOIN suppliers sup ON p.supplier_id = sup.id
WHERE o.employee_id > 3 AND o.employee_id <= 10;

