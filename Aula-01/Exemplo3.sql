/*
EXEMPLOS DE CONSULTA
SQL
*/

/*LEFT JOIN*/
SELECT customers.id, customers.name
FROM customers
LEFT JOIN locations ON customers.id = locations.id_customers
WHERE locations.id_customers IS NULL;

/*INNER JOIN E UMA CONDIÇÃO*/
SELECT products.name, providers.name
FROM products
INNER JOIN providers ON products.id_providers = providers.id
WHERE providers.name = 'Ajax SA';

/*INNER JOIN E DUAS CONDIÇÕES*/
SELECT products.name, providers.name, categories.name
FROM products 
INNER JOIN providers ON providers.id = products.id_providers
INNER JOIN categories ON categories.id = products.id_categories
WHERE providers.name = 'Sansul SA' AND categories.name = 'Imported';

/*INNER JOIN E DUAS CONDIÇÕES*/
SELECT products.name, providers.name, products.price
FROM products
INNER JOIN providers ON providers.id = products.id_providers 
INNER JOIN categories ON categories.id = products.id_categories
WHERE products.price > 1000 AND categories.name = 'Super Luxury'

/*USANDO BETWEEN E DATA*/
SELECT customers.name, orders.id
FROM customers
INNER JOIN orders ON orders.id_customers = customers.id
WHERE orders.orders_date BETWEEN '2016-01-01' AND '2016-06-30';

/*USANDO BETWEEN E LIKE*/
SELECT products.name
FROM products 
INNER JOIN providers ON providers.id = products.id_providers
WHERE products.amount BETWEEN 10 AND 20 AND providers.name LIKE 'P%';

/*USANDO UNION*/
SELECT name, customers_number
FROM lawyers
WHERE customers_number = (SELECT MAX(customers_number) FROM lawyers)
UNION ALL
SELECT name, customers_number
FROM lawyers
WHERE customers_number = (SELECT MIN(customers_number) FROM lawyers)
UNION ALL
SELECT 'Average' AS name, CAST(AVG(customers_number) AS INT) AS customers_number
FROM lawyers;

/*PEGANDO O DIA DA DATA*/
SELECT loan.name, CAST(EXTRACT('Day' FROM loan.payday) AS int) AS day
FROM loan;
