-- Задание на тему Операторы 
-- ____________________________________
-- Задание #1

CREATE DATABASE vk1; -- БД для ДЗ, чтобы в vk изменения не вносить
show databases;
USE vk1;
CREATE TABLE users (
  id SERIAL PRIMARY KEY COMMENT 'Идентификатор строки', -- исскуственный ключ
  first_name VARCHAR(100) NOT NULL COMMENT 'Имя пользователя',
  last_name VARCHAR(100) NOT NULL COMMENT 'Фамилия пользователя',
  birthday DATE NOT NULL COMMENT 'Дата рождения',
  gender CHAR(1) NOT NULL COMMENT 'Пол',
  created_at DATETIME COMMENT 'Дата создания строки',
  updated_at DATETIME COMMENT 'Дата изменения строки'
  ) COMMENT 'Таблица пользователей';

DESCRIBE users;
SELECT * FROM users;

INSERT INTO users (first_name, last_name, birthday, gender)
SELECT first_name, last_name, birthday, gender
FROM vk.users ; -- Копирование данных из другой таблицы


UPDATE users SET created_at = NOW(), updated_at = NOW()
WHERE id > 0; -- Обновление времени

-- ____________________________________
-- Задание # 2

DROP TABLE users;
CREATE TABLE users (
  id SERIAL PRIMARY KEY COMMENT 'Идентификатор строки', -- исскуственный ключ
  first_name VARCHAR(100) NOT NULL COMMENT 'Имя пользователя',
  last_name VARCHAR(100) NOT NULL COMMENT 'Фамилия пользователя',
  birthday DATE NOT NULL COMMENT 'Дата рождения',
  gender CHAR(1) NOT NULL COMMENT 'Пол'
  ) COMMENT 'Таблица пользователей';

ALTER TABLE users ADD COLUMN created_at VARCHAR(255) NOT NULL;
ALTER TABLE users ADD COLUMN updated_at VARCHAR(255) NOT NULL;

INSERT INTO users (`id`, `first_name`, `last_name`, `birthday`, `gender`, `created_at`, `updated_at`) VALUES
(1, 'Tyrell', 'Erdman', '1992-02-08', 'M', '2003-05-01 11:12', '2003-07-23 03:31'),
(2, 'Russ', 'Ullrich', '1988-01-11', 'F', '2001-03-03 02:56', '2015-06-15 07:50'),
(3, 'Stephan', 'Nikolaus', '2010-05-26', 'F', '1993-07-08 15:17', '2000-02-03 00:23'),
(4, 'Adriana', 'Douglas', '2016-04-18', 'M', '1971-01-02 04:05', '1987-09-21 05:26'),
(5, 'Dario', 'Hettinger', '1991-08-02', 'F', '1995-02-08 23:57', '1984-11-30 06:18'),
(6, 'Virgie', 'Legros', '1998-11-23', 'F', '1979-08-05 14:07', '1983-12-22 21:45'),
(7, 'Ruth', 'Kling', '1971-07-01', 'F', '1985-04-12 06:28', '1980-03-28 15:08'),
(8, 'Brittany', 'Ruecker', '2011-07-27', 'F', '2019-06-06 12:08', '2020-06-13 14:50');

ALTER TABLE users ADD COLUMN created_at_1 DATETIME;
ALTER TABLE users ADD COLUMN updated_at_1 DATETIME;

SELECT STR_TO_DATE(created_at, '%Y-%m-%d %k:%i') from users;
UPDATE users SET 
created_at_1 = STR_TO_DATE(created_at, '%Y-%m-%d %k:%i'),
updated_at_1 = STR_TO_DATE(updated_at,'%Y-%m-%d %k:%i')
WHERE id > 0;

ALTER TABLE users DROP COLUMN created_at;
ALTER TABLE users DROP COLUMN updated_at;
 
 ALTER TABLE users RENAME COLUMN created_at_1 TO created_at;
 ALTER TABLE users RENAME COLUMN updated_at_1 TO updated_at;

 -- _________________________________________________
 -- Задание # 3
 
 CREATE TABLE storehouses_products (
 id SERIAL PRIMARY KEY,
 `value` INT UNSIGNED
 );
 
 INSERT INTO storehouses_products VALUES
 (1, 0),
 (2, 2500),
 (3, 0),
 (4, 30),
 (5, 500),
 (6, 1);
 
 SELECT * FROM storehouses_products ORDER BY IF(`value` > 0, 1, 0) DESC, `value`;
 
 -- _________________________________________________
 -- Задание # 4
 
 SELECT * FROM vk.users
 WHERE DATE_FORMAT(birthday, '%M') IN ('May', 'August');
 
 -- _________________________________________________
 -- Задание # 5
 
 CREATE TABLE catalogs (
 id SERIAL PRIMARY KEY,
 product INT UNSIGNED
 );
 
 INSERT INTO catalogs VALUES
 (1, 5),
 (2, 4),
 (3, 3),
 (4, 2),
 (5, 1);
 
 SELECT * FROM catalogs 
 WHERE id IN (1, 2, 5)
 ORDER BY CASE
 WHEN id = 5 THEN 0
 WHEN id = 1 THEN 1
 WHEN id = 2 THEN 2
 END;
 
 -- Задание на тему Агрегация данных 
-- ____________________________________
-- Задание #1
 
 SELECT AVG (TIMESTAMPDIFF(YEAR, birthday, NOW())) AS average
 FROM vk.users;
 -- или
 SELECT AVG (TO_DAYS(NOW()) - TO_DAYS(birthday))/365,25 AS average
 FROM vk.users; -- если считать в днях
 
 -- ____________________________________
-- Задание #2
 
 SELECT DATE(CONCAT(YEAR(NOW()), '-', MONTH(birthday), '-', DAY(birthday))) AS `day month` FROM vk.users;
 SELECT DATE_FORMAT (DATE(CONCAT(YEAR(NOW()), '-', MONTH(birthday), '-', DAY(birthday))), '%W') AS `day month` FROM vk.users
 GROUP BY `day month`;

SELECT DATE_FORMAT (DATE(CONCAT(YEAR(NOW()), '-', MONTH(birthday), '-', DAY(birthday))), '%W') AS `day month`, 
COUNT(*) AS SUMMA
FROM vk.users
 GROUP BY `day month`
 ORDER BY CASE
 WHEN `day month` = 'Sunday' THEN 1
 WHEN `day month` = 'Monday' THEN 2
 WHEN `day month` = 'Tuesday' THEN 3
 WHEN `day month` = 'Thursday' THEN 4
 WHEN `day month` = 'Wednesday' THEN 5
 WHEN `day month` = 'Friday' THEN 6
 WHEN `day month` = 'Saturday' THEN 7
 END;