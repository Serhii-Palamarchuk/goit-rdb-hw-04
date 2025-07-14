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

 -- 4. Групуємо за category_name, рахуємо кількість і середню кількість товару
SELECT cat.name AS category_name,
       COUNT(*) AS row_count,
       AVG(od.quantity) AS avg_quantity
FROM order_details od
JOIN orders o ON od.order_id = o.id
JOIN customers c ON o.customer_id = c.id
JOIN products p ON od.product_id = p.id
JOIN categories cat ON p.category_id = cat.id
JOIN employees e ON o.employee_id = e.employee_id
JOIN shippers s ON o.shipper_id = s.id
JOIN suppliers sup ON p.supplier_id = sup.id
WHERE o.employee_id > 3 AND o.employee_id <= 10
GROUP BY cat.name;

 -- 5. Фільтруємо, де avg_quantity > 21
SELECT cat.name AS category_name,
       COUNT(*) AS row_count,
       AVG(od.quantity) AS avg_quantity
FROM order_details od
JOIN orders o ON od.order_id = o.id
JOIN customers c ON o.customer_id = c.id
JOIN products p ON od.product_id = p.id
JOIN categories cat ON p.category_id = cat.id
JOIN employees e ON o.employee_id = e.employee_id
JOIN shippers s ON o.shipper_id = s.id
JOIN suppliers sup ON p.supplier_id = sup.id
WHERE o.employee_id > 3 AND o.employee_id <= 10
GROUP BY cat.name
HAVING AVG(od.quantity) > 21;

 -- 6. Сортуємо за row_count (кількість рядків у категорії)
SELECT cat.name AS category_name,
       COUNT(*) AS row_count,
       AVG(od.quantity) AS avg_quantity
FROM order_details od
JOIN orders o ON od.order_id = o.id
JOIN customers c ON o.customer_id = c.id
JOIN products p ON od.product_id = p.id
JOIN categories cat ON p.category_id = cat.id
JOIN employees e ON o.employee_id = e.employee_id
JOIN shippers s ON o.shipper_id = s.id
JOIN suppliers sup ON p.supplier_id = sup.id
WHERE o.employee_id > 3 AND o.employee_id <= 10
GROUP BY cat.name
HAVING AVG(od.quantity) > 21
ORDER BY row_count DESC;

 -- 7. Пропускаємо 1 рядок, виводимо 4 наступні
SELECT cat.name AS category_name,
       COUNT(*) AS row_count,
       AVG(od.quantity) AS avg_quantity
FROM order_details od
JOIN orders o ON od.order_id = o.id
JOIN customers c ON o.customer_id = c.id
JOIN products p ON od.product_id = p.id
JOIN categories cat ON p.category_id = cat.id
JOIN employees e ON o.employee_id = e.employee_id
JOIN shippers s ON o.shipper_id = s.id
JOIN suppliers sup ON p.supplier_id = sup.id
WHERE o.employee_id > 3 AND o.employee_id <= 10
GROUP BY cat.name
HAVING AVG(od.quantity) > 21
ORDER BY row_count DESC
LIMIT 4 OFFSET 1;


