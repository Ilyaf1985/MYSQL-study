-- ____________________________________
-- Задание #1
USE vk1;
DESCRIBE users;
SELECT * FROM users;
SELECT * FROM orders;
SELECT * FROM products;
DROP TABLE catalogs_1;
CREATE TABLE orders (
  order_id SERIAL PRIMARY KEY,
  user_id BIGINT,
  product VARCHAR(100)
  );

INSERT INTO orders (user_id, product)
VALUES (2, 'картина'),           
	   (4, 'корзина'),  
       (6, 'картонка');  

SELECT u.id, u.first_name, u.last_name
FROM users AS u
JOIN orders AS o
ON u.id = o.user_id;

-- ____________________________________
-- Задание #2

CREATE TABLE products (
  id SERIAL PRIMARY KEY,
  name_p VARCHAR(100),
  price BIGINT,
  catalog_id VARCHAR(100)
  );

CREATE TABLE catalogs_1 (
  id SERIAL PRIMARY KEY,
  name_c VARCHAR(100)
  );
 INSERT INTO catalogs_1 VALUES
 (1, 'Животные'),
 (2, 'Для дома'),
 (3, 'Разное');
 
 INSERT INTO products (id, name_p, price, catalog_id)
VALUES (1, 'картина', 100, 2),           
	   (2, 'корзина', 50, 3),  
       (3, 'картонка', 10, 3),
	   (4, 'собачонка', 200, 1),
	   (5, 'тарелка', 20, 2);  
       
SELECT p.id, p.name_p, p.price, c.name_c AS name_catalog
FROM products AS p
JOIN catalogs_1 AS c
ON p.catalog_id = c.id;