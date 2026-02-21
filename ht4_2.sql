USE goit_rdb_hw3;

SELECT count(*) FROM 
	orders o INNER JOIN customers cus ON o.customer_id = cus.id
		INNER JOIN employees e ON o.employee_id = e.employee_id
        INNER JOIN shippers sh ON o.shipper_id = sh.id
        INNER JOIN order_details od ON o.id = od.order_id
        INNER JOIN products p ON od.product_id = p.id        
        INNER JOIN suppliers sup ON p.supplier_id = sup.id
        INNER JOIN categories cat ON p.category_id = cat.id;

# Змініть декілька операторів INNER на LEFT чи RIGHT. Визначте, що відбувається з кількістю рядків. 
# Чому? Напишіть відповідь у текстовому файлі.        
# LEFT/RIGHT JOIN зберігають рядки з однієї сторони, INNER JOIN вимагає збіг з обох.
SELECT count(*) FROM 
	orders o INNER JOIN customers cus ON o.customer_id = cus.id
		INNER JOIN employees e ON o.employee_id = e.employee_id
        INNER JOIN shippers sh ON o.shipper_id = sh.id
        INNER JOIN order_details od ON o.id = od.order_id
        LEFT JOIN products p ON od.product_id = p.id        
        LEFT JOIN suppliers sup ON p.supplier_id = sup.id
        LEFT JOIN categories cat ON p.category_id = cat.id;

# На основі запита з пункта 3 виконайте наступне: оберіть тільки ті рядки, де employee_id > 3 та ≤ 10.
SELECT count(*) FROM 
	orders o INNER JOIN customers cus ON o.customer_id = cus.id
		INNER JOIN employees e ON o.employee_id = e.employee_id
        INNER JOIN shippers sh ON o.shipper_id = sh.id
        INNER JOIN order_details od ON o.id = od.order_id
        LEFT JOIN products p ON od.product_id = p.id        
        LEFT JOIN suppliers sup ON p.supplier_id = sup.id
        LEFT JOIN categories cat ON p.category_id = cat.id
	WHERE e.employee_id > 3 AND e.employee_id <= 10;
        
# Згрупуйте за іменем категорії, порахуйте кількість рядків у групі, 
# середню кількість товару (кількість товару знаходиться в order_details.quantity)        
# Відфільтруйте рядки, де середня кількість товару більша за 21.
SELECT cat.name, count(*), avg(od.quantity) as avg_q FROM 
	orders o INNER JOIN customers cus ON o.customer_id = cus.id
		INNER JOIN employees e ON o.employee_id = e.employee_id
        INNER JOIN shippers sh ON o.shipper_id = sh.id
        INNER JOIN order_details od ON o.id = od.order_id
        LEFT JOIN products p ON od.product_id = p.id        
        LEFT JOIN suppliers sup ON p.supplier_id = sup.id
        LEFT JOIN categories cat ON p.category_id = cat.id
	GROUP BY cat.name
    HAVING avg(od.quantity) > 21
    ORDER BY 3 DESC;

# Виведіть на екран (оберіть) чотири рядки з пропущеним першим рядком ??? не зрозуміло



    
    