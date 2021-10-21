-- Домашнее задание 11

-- ОПТИМИЗАЦИЯ ЗАПРОСОВ
-- Задание 1

/*  Создайте таблицу logs типа Archive. Пусть при каждом создании записи в таблицах users, 
catalogs и products в таблицу logs помещается время и дата создания записи, название таблицы, 
идентификатор первичного ключа и содержимое поля name.
*/
USE vk;
DROP TABLE logs;
DROP TABLE users_1;
DROP TABLE products_1;
DROP TABLE catalogs_1;

CREATE TABLE logs (
name_table VARCHAR(100),
extenal_id INT COMMENT 'Первичный ключ',
name VARCHAR(100) COMMENT 'Поле имя таблицы name_table',
created_at DATETIME DEFAULT CURRENT_TIMESTAMP) COMMENT = 'Журнал интернет-магазина' ENGINE=ARCHIVE;

CREATE TABLE users_1 (
id INT,
name_us VARCHAR(100),
birthday DATE,
created_at DATETIME DEFAULT CURRENT_TIMESTAMP);
SELECT * FROM users_1;

CREATE TABLE catalogs_1 (
id INT PRIMARY KEY,
name_cat VARCHAR(100),
created_at DATETIME DEFAULT CURRENT_TIMESTAMP);
SELECT * FROM catalogs_1;

CREATE TABLE products_1 (
id INT,
name_prod VARCHAR(100),
discription TEXT,
price FLOAT,
catalog_1_id INT,
created_at DATETIME DEFAULT CURRENT_TIMESTAMP);
SELECT * FROM catalogs_1;
ALTER TABLE products_1 ADD CONSTRAINT products_1_catalog_1_id FOREIGN KEY (catalog_1_id) REFERENCES catalogs_1(id);
ALTER TABLE products_1 DROP CONSTRAINT products_1_catalog_1_id;

DELIMITER //
CREATE TRIGGER log_after_insert_to_users 
AFTER INSERT ON users_1 
FOR EACH ROW
BEGIN
   INSERT INTO logs (name_table, extenal_id, name) 
   VALUES ('users_1', NEW.id, NEW.name_us);
END //
DROP TRIGGER log_after_insert_to_users// 

INSERT INTO users_1 (id, name_us, birthday) VALUES (2, 'Иван', '2000-10-12')// 
SELECT * FROM logs//

CREATE TRIGGER log_after_insert_to_catalogs_1
AFTER INSERT ON catalogs_1 
FOR EACH ROW
BEGIN
   INSERT INTO logs (name_table, extenal_id, name) 
   VALUES ('catalogs_1', NEW.id, NEW.name_cat);
END //
DROP TRIGGER log_after_insert_to_catalogs_1// 


CREATE TRIGGER log_after_insert_to_products_1
AFTER INSERT ON products_1
FOR EACH ROW
BEGIN
   INSERT INTO logs (name_table, extenal_id, name) 
   VALUES ('products_1', NEW.id, NEW.name_prod);
END //
DROP TRIGGER log_after_insert_to_products_1// 

INSERT INTO catalogs_1 (id, name_cat) VALUES 
(1, 'Телега'),
(2, 'Лонадь'),
(3, 'Извозчик')// 
SELECT * FROM logs//

INSERT INTO products_1 (id, name_prod, discription, price, catalog_1_id) VALUES 
(1, 'Телега усиленная', 'Бронированная', 10000.00, 1),
(2, 'Лошадь хромая', 'На обе ноги', 2000.00, 2)// 
SELECT * FROM logs//

DELETE FROM logs WHERE name_table = 'products_1' AND extenal_id = 2//
DELIMITER ;


-- Задание 2 ------------------

-- Создайте SQL-запрос, который помещает в таблицу users миллион записей

CREATE TABLE samples (
id SERIAL PRIMARY KEY,
name VARCHAR(100),
birthday DATE,
created_at DATETIME DEFAULT CURRENT_TIMESTAMP);
SELECT * FROM samples;

INSERT INTO samples (id, name, birthday) VALUES
(1, 'Носорог', '2008-01-01'),
(2, 'Бегемот', '2010-01-01'),
(3, 'Черепаха', '2005-01-01'),
(4, 'Слон', '2017-01-01'),
(5, 'Верблюд', '2011-01-01'),
(6, 'Жираф', '2012-01-01'),
(7, 'Медведь', '2013-01-01'),
(8, 'Курица', '2014-01-01'),
(9, 'Тигр', '2015-01-01'),
(10, 'Лев', '2019-01-01');

SELECT count(*) FROM 
samples AS fg,
samples AS fh,
samples AS fd,
samples AS hj,
samples AS sd,
samples AS kj;

INSERT INTO users_1 (id, name_us, birthday) 
SELECT fg.id, fg.name, fg.birthday
FROM
samples AS fg,
samples AS fh,
samples AS fd,
samples AS hj,
samples AS sd,
samples AS kj;

SELECT count(*) FROM users_1;
SELECT * FROM users_1 LIMIT 15;