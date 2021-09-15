DROP DATABASE vk;
CREATE DATABASE vk;

SHOW DATABASES;
USE vk;
CREATE TABLE users (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT 'Идентификатор строки', -- исскуственный ключ
  first_name VARCHAR(100) NOT NULL COMMENT 'Имя пользователя',
  last_name VARCHAR(100) NOT NULL COMMENT 'Фамилия пользователя',
  birthday DATE NOT NULL COMMENT 'Дата рождения',
  gender CHAR(1) NOT NULL COMMENT 'Пол',
  email VARCHAR(100) NOT NULL UNIQUE COMMENT 'Email пользователя', -- почта и телефон - натуральный ключ
  phone CHAR(11) NOT NULL UNIQUE COMMENT 'Телефон пользователя',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT 'Дата создания строки',
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE NOW() DEFAULT CURRENT_TIMESTAMP COMMENT 'Дата изменения строки'
  ) COMMENT 'Таблица пользователей';

CREATE TABLE profiles (
  user_id INT UNSIGNED NOT NULL PRIMARY KEY COMMENT 'Идентификатор строки',
  city VARCHAR(100) COMMENT 'Город проживания',
  country VARCHAR(100) COMMENT 'Страна проживания',
  created_at DATETIME COMMENT 'Дата создания строки',
  updated_at DATETIME COMMENT 'Дата изменения строки',
  `status` VARCHAR(10) COMMENT 'Текущий статус'
) COMMENT "Таблица профилей"; 

ALTER TABLE profiles ADD CONSTRAINT profiles_user_id FOREIGN KEY (user_id) REFERENCES users(id);

CREATE TABLE friendship (
 user_id INT UNSIGNED NOT NULL COMMENT 'ссылка на инициатора дружеских отношений',
 friend_id INT UNSIGNED NOT NULL COMMENT 'ссылка на получателя запроса о дружбе',
 request_type VARCHAR(10) COMMENT 'тип запроса',
 requested_at DATETIME COMMENT 'время отправки приглашения',
 confirned_at DATETIME COMMENT 'время подтверждения приглашения',
 created_at DATETIME COMMENT 'Дата и время создания строки',
 updated_at DATETIME COMMENT 'Дата и время изменения строки',
 PRIMARY KEY (user_id, friend_id) COMMENT 'составной первичный ключ'
);

ALTER TABLE friendship ADD CONSTRAINT friendship_user_id FOREIGN KEY (user_id) REFERENCES users(id);
ALTER TABLE friendship ADD CONSTRAINT friendship_friend_id FOREIGN KEY (friend_id) REFERENCES users(id);

CREATE TABLE friendship_request_types (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор строки",
  name VARCHAR(150) NOT NULL UNIQUE COMMENT "Название статуса",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",  
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"  
) COMMENT "Типы запроса на дружбы";