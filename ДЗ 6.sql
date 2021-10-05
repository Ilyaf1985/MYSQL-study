-- ____________________________________
-- Задание #1
-- Проанализировал)) не знаю что добавить

-- ____________________________________
-- Задание #2

-- Оставил сообщения от пользователей,тк от друзей нет сообщений

SELECT COUNT(id) AS 'Количество сообщений', 
CONCAT(
(SELECT first_name FROM vk.users WHERE id = messages.to_user_id), ' ', (SELECT last_name FROM vk.users WHERE id = messages.to_user_id)) AS 'ФИО Получателя', 
CONCAT(
(SELECT first_name FROM vk.users WHERE id = messages.from_user_id), ' ', (SELECT last_name FROM vk.users WHERE id = messages.from_user_id)) AS 'ФИО Отправителя'
FROM vk.messages
WHERE to_user_id = 16 -- 16 пользователь Zula Paucek
GROUP BY from_user_id; 
-- LIMIT 1; Оставил тк их двое

-- ____________________________________
-- Задание #3

SELECT id FROM vk.users
ORDER BY birthday DESC 
LIMIT 10;

SELECT COUNT(*)
FROM vk.users_likes -- таблица лайков пользователей
WHERE to_user_id IN (
SELECT id FROM vk.users
ORDER BY birthday DESC 
LIMIT 10);

-- ____________________________________
-- Задание #4
-- У меня три таблицы лайков. Таблицу лайков постов не добавлял, тк нет типов статусов постов и она не заполнена
-- По аналогии добавить нужно в серединку

/*SELECT gender, count(*)
from (
select 
from_user_id AS user, 
(SELECT gender
from vk.users
where id = user) AS gender from vk.users_likes) AS dimmy
GROUP BY gender;
-- количество лайков пользователей


SELECT gender, count(*)
from (
select 
user_id AS user, 
(SELECT gender
from vk.users
where id = user) AS gender from vk.media_likes) AS dimmy
GROUP BY gender;
-- количество лайков медиа
*/

SELECT gender, count(*)
FROM (
SELECT 
from_user_id AS user, 
(SELECT gender
FROM vk.users
WHERE id = user) AS gender FROM vk.users_likes
UNION
SELECT 
user_id AS user, 
(SELECT gender
FROM vk.users
WHERE id = user) AS gender FROM vk.media_likes
) AS rerry
GROUP BY gender
LIMIT 1;

-- ____________________________________
-- Задание #5

SELECT (
SELECT
CONCAT(first_name, ' ', last_name)
FROM vk.users AS us
WHERE us.id = u.id) AS user_name,
((
SELECT 
COUNT(1)
FROM vk.users_likes AS ul
WHERE ul.from_user_id = u.id) 
+ 
(SELECT  
COUNT(1)
FROM vk.media_likes AS ml
WHERE ml.user_id = u.id)
+
(SELECT  
COUNT(1)
FROM vk.messages AS mes
WHERE mes.from_user_id = u.id)) AS activ
FROM vk.users AS u
ORDER BY activ
LIMIT 10;