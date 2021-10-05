DROP DATABASE vk;
CREATE DATABASE vk;

SHOW DATABASES;
USE vk;

-- rename table ... to ....;
-- alter table ... drop constraint ...;

CREATE TABLE users (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT 'Идентификатор строки', -- исскуственный ключ
  first_name VARCHAR(100) NOT NULL COMMENT 'Имя пользователя',
  last_name VARCHAR(100) NOT NULL COMMENT 'Фамилия пользователя',
  birthday DATE NOT NULL COMMENT 'Дата рождения',
  gender CHAR(1) NOT NULL COMMENT 'Пол',
  email VARCHAR(100) NOT NULL UNIQUE COMMENT 'Email пользователя', -- почта и телефон - натуральный ключ
  phone VARCHAR(11) NOT NULL UNIQUE COMMENT 'Телефон пользователя',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT 'Дата создания строки',
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE NOW() DEFAULT CURRENT_TIMESTAMP COMMENT 'Дата изменения строки'
  ) COMMENT 'Таблица пользователей';
  
  SELECT REGEXP_LIKE('+79991234567', '^\\+7[0-9]{10}$');
  
  ALTER TABLE users MODIFY created_at DATETIME DEFAULT CURRENT_TIMESTAMP;
  ALTER TABLE users MODIFY updated_at DATETIME DEFAULT CURRENT_TIMESTAMP;
  ALTER TABLE users MODIFY gender ENUM('M','F') NOT NULL COMMENT 'Пол';
  ALTER TABLE users MODIFY phone VARCHAR(12) NOT NULL UNIQUE COMMENT 'Телефон пользователя';
  ALTER TABLE users DROP CONSTRAINT check_phone;
  ALTER TABLE users ADD CONSTRAINT check_phone CHECK (REGEXP_LIKE(phone, '^\\+7[0-9]{10}$')); -- пользовательское правило
 
 DESCRIBE users;
 
CREATE TABLE profiles (
  user_id INT UNSIGNED NOT NULL PRIMARY KEY COMMENT 'Идентификатор строки',
  city VARCHAR(100) COMMENT 'Город проживания',
  country VARCHAR(100) COMMENT 'Страна проживания',
  `status` VARCHAR(10) COMMENT 'Текущий статус',
  created_at DATETIME COMMENT 'Дата создания строки',
  updated_at DATETIME COMMENT 'Дата изменения строки'
) COMMENT "Таблица профилей"; 

ALTER TABLE profiles MODIFY `status` ENUM('Online','Offline', 'Inaactive') NOT NULL;

ALTER TABLE profiles ADD CONSTRAINT profiles_user_id FOREIGN KEY (user_id) REFERENCES users(id);
show tables;

CREATE TABLE friendship (
 user_id INT UNSIGNED NOT NULL COMMENT 'ссылка на инициатора дружеских отношений',
 friend_id INT UNSIGNED NOT NULL COMMENT 'ссылка на получателя запроса о дружбе',
 request_type INT UNSIGNED NOT NULL COMMENT 'тип запроса',
 requested_at DATETIME COMMENT 'время отправки приглашения',
 confirned_at DATETIME COMMENT 'время подтверждения приглашения',
 created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT 'Дата и время создания строки',
 updated_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT 'Дата и время изменения строки',
 PRIMARY KEY (user_id, friend_id) COMMENT 'составной первичный ключ'
);

ALTER TABLE friendship ADD CONSTRAINT friendship_user_id FOREIGN KEY (user_id) REFERENCES users(id);
ALTER TABLE friendship ADD CONSTRAINT friendship_friend_id FOREIGN KEY (friend_id) REFERENCES users(id);

ALTER TABLE friendship DROP COLUMN request_type;
ALTER TABLE friendship ADD COLUMN request_type_id INT UNSIGNED NOT NULL COMMENT 'тип запроса';

ALTER TABLE friendship MODIFY requested_at DATETIME NOT NULL COMMENT 'время отправки приглашения';

DESCRIBE friendship;

CREATE TABLE friendship_request_types (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор строки",
  name VARCHAR(150) NOT NULL UNIQUE COMMENT "Название статуса",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",  
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"  
) COMMENT "Типы запроса на дружбы";

ALTER TABLE friendship ADD CONSTRAINT friendship_request_type_id FOREIGN KEY (request_type_id) REFERENCES friendship_request_types(id);

CREATE TABLE communities (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор строки",
  name VARCHAR(150) NOT NULL UNIQUE COMMENT "Название группы",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",  
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"  
) COMMENT "Группы";

CREATE TABLE communities_users (
  community_id INT UNSIGNED NOT NULL COMMENT "ссылка на группу",
  user_id INT UNSIGNED NOT NULL COMMENT "ссылка на пользователя",
  PRIMARY KEY (community_id, user_id) COMMENT "составной первичный ключ",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"
) COMMENT "Участники групп, связь между пользователями и группами";

ALTER TABLE communities_users ADD CONSTRAINT communities_users_community_id FOREIGN KEY (community_id) REFERENCES communities(id);
ALTER TABLE communities_users ADD CONSTRAINT communities_users_user_id FOREIGN KEY (user_id) REFERENCES users(id);

CREATE TABLE messages (
 id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор строки",
 from_user_id INT UNSIGNED NOT NULL COMMENT 'ссылка на отправителя сообщения',
 to_user_id INT UNSIGNED NOT NULL COMMENT 'ссылка на получателя сообщения',
 body TEXT NOT NULL COMMENT 'текст сообщения',
 is_important BOOLEAN COMMENT 'признак важности',
 is_delivered BOOLEAN COMMENT 'признак доставки',
 created_at DATETIME DEFAULT NOW() COMMENT 'время создания строки',
 updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Время обновления строки'
) COMMENT "Сообщения";

ALTER TABLE messages ADD CONSTRAINT messages_from_user_id FOREIGN KEY (from_user_id) REFERENCES users(id);
ALTER TABLE messages ADD CONSTRAINT messages_to_user_id FOREIGN KEY (to_user_id) REFERENCES users(id);

CREATE TABLE media (
id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор строки",
filename VARCHAR(255) NOT NULL COMMENT "Полный путь к файлу",
media_type_id INT UNSIGNED NOT NULL COMMENT "ссылка на тип файла",
metadata JSON NOT NULL COMMENT "Метаданные файла",
user_id INT UNSIGNED NOT NULL COMMENT "ссылка на пользователя",
created_at DATETIME DEFAULT NOW() COMMENT 'время создания строки',
updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Время обновления строки'
) COMMENT "Медиафайлы";

CREATE TABLE media_types (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор строки",
  name VARCHAR(150) NOT NULL UNIQUE COMMENT "Название типа",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",  
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"  
) COMMENT "Типы медиафайлов";

ALTER TABLE media ADD CONSTRAINT media_media_type_id FOREIGN KEY (media_type_id) REFERENCES media_types(id);
ALTER TABLE media ADD CONSTRAINT media_user_id FOREIGN KEY (user_id) REFERENCES users(id);


/* 
размер длительность разрешение кодек

{
   "size":"...",
   "extension":"...",
   "resolution":"...",
   "time":"..."
}
*/

SELECT JSON_OBJECT('size', 123, 'extension', 'jpeg', 'resolution', '32x32') AS 'JSON';
/*SELECT JSON_OBJECT('size', 123, 'extension', 'jpeg', 'resolution', '32x32')->"$.size";*/

CREATE TABLE test_json (body JSON);

INSERT test_json (body) VALUES (JSON_OBJECT('size', 123, 'extension', 'jpeg', 'resolution', '32x32'));
SELECT * FROM test_json;
SELECT body FROM test_json;
SELECT body->"$.size" FROM test_json;

INSERT test_json (body) VALUES (JSON_OBJECT('size', 123, 'extension', 'jpeg', 'resolution', '32x32'));

/*
1+1
"1" +"1" = 2
"Hello" + 1 = 1
*/

SELECT * FROM test_json;
DELETE FROM test_json WHERE 1=1 AND body = JSON_OBJECT('size', 123);
INSERT test_json (body) VALUES ('{"size":123,"extension": "jpeg", "resolution": "32x32"}');

CREATE TABLE like_table (line varchar(100));
INSERT INTO like_table (line) value ('+7(999)111-22-33');
SELECT * FROM like_table WHERE line = '+7(999)111-22-33';
SELECT * FROM like_table WHERE line LIKE '+7(999)%';
INSERT INTO like_table (line) value ('Иванов Петр Борисович');
SELECT * FROM like_table WHERE line LIKE '%Петр%';
SELECT * FROM like_table;
SELECT * FROM like_table WHERE line LIKE '%П_тр%';

SELECT REGEXP_LIKE('+79991234567', '^\\+7[0-9]{10}$');
/*
^ - начало строки
$ - конец строки
[0-9] - перечисление
[a-z] - перечисление
{10} - сколько раз
* - любое количество любых символов
. - один любой символ
+ - более одного символа
\\ - экранирование
\\+ - слэш просто
*/