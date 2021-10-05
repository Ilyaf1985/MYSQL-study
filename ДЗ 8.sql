-- ____________________________________
-- Задание #1

SELECT
  CONCAT(u.first_name, ' ', u.last_name) AS 'Имя отправителя',
  CONCAT(us.first_name, ' ', us.last_name) AS 'Имя получателя',
  COUNT(*) AS 'Количество сообщений'
FROM vk.messages AS m
JOIN vk.users AS u ON u.id = m.from_user_id
JOIN vk.users AS us ON us.id = m.to_user_id
WHERE to_user_id = 16 -- 16 пользователь Zula Paucek
GROUP BY from_user_id; 
-- LIMIT 1; Оставил тк их двое

-- ____________________________________
-- Задание #2

SELECT
COUNT(*) AS 'Количество лайков'
FROM vk.users_likes AS ul
JOIN vk.users AS u ON u.id = ul.to_user_id
WHERE YEAR(CURDATE()) - YEAR(birthday) < 10; -- младше 10 лет

-- ____________________________________
-- Задание #3

/*SELECT gender, COUNT(*)
FROM vk.users_likes AS ul
JOIN vk.users u ON ul.from_user_id = u.id 
group by gender
ORDER BY COUNT(*) DESC; -- Количество лайков пользователей

SELECT gender, COUNT(*)
FROM vk.media_likes AS m
JOIN vk.users u ON m.user_id = u.id 
group by gender
ORDER BY COUNT(*) DESC;
*/ -- Количество лайков медиа

SELECT gender, count(*)
FROM (
SELECT gender
FROM vk.users_likes AS ul
JOIN vk.users AS u ON ul.from_user_id = u.id
UNION ALL
SELECT gender
FROM vk.media_likes AS m
JOIN vk.users AS us ON m.user_id = us.id) AS rerry
group by gender
ORDER BY COUNT(*) DESC
LIMIT 1;
