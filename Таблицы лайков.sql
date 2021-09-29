USE vk;

CREATE TABLE posts (
id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT 'Идентификатор строки',
user_id INT UNSIGNED NOT NULL COMMENT 'ссылка на пользователя, кто оставил пост',
heading VARCHAR(100) NOT NULL COMMENT 'название заголовка поста',
body TEXT NOT NULL COMMENT 'текст поста',
created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания строки',
updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE NOW() DEFAULT CURRENT_TIMESTAMP COMMENT 'Время обновления строки'
) COMMENT 'Посты пользователей';

DESCRIBE posts;
show tables;

ALTER TABLE posts ADD CONSTRAINT posts_user_id FOREIGN KEY (user_id) REFERENCES users(id);

CREATE TABLE users_likes (
id INT UNSIGNED NOT NULL COMMENT 'Идентификатор строки',
from_user_id INT UNSIGNED NOT NULL COMMENT 'Ссылка на отправителя лайка',
to_user_id INT UNSIGNED NOT NULL COMMENT 'Ссылка на получателя лайка',
created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания строки',
updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE NOW() DEFAULT CURRENT_TIMESTAMP COMMENT 'Время обновления строки',
PRIMARY KEY (from_user_id, to_user_id) COMMENT 'Составной первичный ключ'
) COMMENT 'Лайки пользователей сети';

ALTER TABLE users_likes ADD CONSTRAINT users_likes_from_user_id FOREIGN KEY (from_user_id) REFERENCES users(id);
ALTER TABLE users_likes ADD CONSTRAINT users_likes_to_user_id FOREIGN KEY (to_user_id) REFERENCES users(id);

CREATE TABLE media_likes (
id INT UNSIGNED NOT NULL COMMENT 'Идентификатор строки',
user_id INT UNSIGNED NOT NULL COMMENT 'Ссылка на отправителя лайка',
media_id INT UNSIGNED NOT NULL COMMENT 'Ссылка на медиа',
like_type_id INT UNSIGNED NOT NULL COMMENT 'тип лайка',
created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания строки',
updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE NOW() DEFAULT CURRENT_TIMESTAMP COMMENT 'Время обновления строки',
PRIMARY KEY (user_id, media_id) COMMENT 'Составной первичный ключ'
) COMMENT 'Лайки медиа других пользователей сети';

ALTER TABLE media_likes ADD CONSTRAINT media_likes_user_id FOREIGN KEY (user_id) REFERENCES users(id);
ALTER TABLE media_likes ADD CONSTRAINT media_likes_media__id FOREIGN KEY (media_id) REFERENCES media(id);

CREATE TABLE posts_likes (
id INT UNSIGNED NOT NULL COMMENT 'Идентификатор строки',
user_id INT UNSIGNED NOT NULL COMMENT 'Ссылка на отправителя лайка',
post_id INT UNSIGNED NOT NULL COMMENT 'Ссылка на пост',
like_type_id INT UNSIGNED NOT NULL COMMENT 'тип лайка',
created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания строки',
updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE NOW() DEFAULT CURRENT_TIMESTAMP COMMENT 'Время обновления строки',
PRIMARY KEY (user_id, post_id) COMMENT 'Составной первичный ключ'
) COMMENT 'Лайки медиа других пользователей сети';

ALTER TABLE posts_likes ADD CONSTRAINT posts_likes_user_id FOREIGN KEY (user_id) REFERENCES users(id);
ALTER TABLE posts_likes ADD CONSTRAINT posts_likes_post_id FOREIGN KEY (post_id) REFERENCES posts(id);

CREATE TABLE likes_types (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор строки",
  name VARCHAR(30) NOT NULL UNIQUE COMMENT "Название лайка",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",  
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"  
) COMMENT "Типы лайков";

ALTER TABLE posts_likes ADD CONSTRAINT posts_likes_like_type_id FOREIGN KEY (like_type_id) REFERENCES likes_types(id);
ALTER TABLE media_likes ADD CONSTRAINT media_likes_like_type_id FOREIGN KEY (like_type_id) REFERENCES likes_types(id);