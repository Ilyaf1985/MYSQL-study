-- Домашнее задание 9
-- ____________________________________
-- Транзакции, переменные
-- Задание #1

START TRANSACTION;
INSERT INTO sample.users SELECT * FROM shop.users 
WHERE id = 1; -- транзакция, перенос 1 строчки

DELETE FROM shop.users WHERE id = 1
LIMIT 1; -- удаление строки из прошлой таблицы
COMMIT; -- завершение операции

-- ____________________________________
-- Задание #2

CREATE OR REPLACE VIEW products_catalogs AS 
SELECT 
       p.name AS name_product,
       c.name AS name_catalog
FROM 
    products p
JOIN
    catalogs c
ON 
    p.catalog_id = c.id;
    
-- ____________________________________
-- Хранимые процедуры, функции
-- Задание #1    
    
   DELIMITER //
   CREATE FUNCTION hello()
   RETURNS INT NOT DETERMINISTIC
   BEGIN
   RETURN HOUR(NOW());
   END //
   
   CREATE FUNCTION hello()
   RETURNS TINYTEXT NOT DETERMINISTIC
   BEGIN
     DECLARE now_hour INT;
     SET now_hour = HOUR(NOW());
     CASE 
         WHEN now_hour BETWEEN 0 AND 5 THEN 
           RETURN "Доброй ночи";
		 WHEN now_hour BETWEEN 6 AND 11 THEN 
           RETURN "Доброе утро";
		 WHEN now_hour BETWEEN 12 AND 17 THEN 
           RETURN "Добрый день";
		 WHEN now_hour BETWEEN 18 AND 23 THEN 
           RETURN "Добрый вечер";
      END CASE;
   END //
   SELECT hello();
DELIMITER ;
    
-- ____________________________________
-- Задание #2       
    DELIMITER //
CREATE TRIGGER name_discription_insert BEFORE INSERT ON products
FOR EACH ROW BEGIN
IF NEW.name IS NULL AND NEW.discription IS NULL THEN
  SIGNAL SQLSTATE '45000'
  SET MESSAGE_TEXT = 'Оба поля имеют нулевое значение';
  END IF;
  END // -- Для команды INSERT
   
CREATE TRIGGER name_discription_update BEFORE UPDATE ON products
FOR EACH ROW BEGIN
IF NEW.name IS NULL AND NEW.discription IS NULL THEN
  SIGNAL SQLSTATE '45000'
  SET MESSAGE_TEXT = 'Оба поля имеют нулевое значение';
  END IF;
  END // -- Для команды UPDATE  
  DELIMITER ;