C:\Users\Илья>mysql
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 91
Server version: 8.0.26 MySQL Community Server - GPL

Copyright (c) 2000, 2021, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> create database example;
Query OK, 1 row affected (0.01 sec)

mysql> create database sample;
Query OK, 1 row affected (0.00 sec)

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| example            |
| information_schema |
| mysql              |
| performance_schema |
| sample             |
| sys                |
+--------------------+
6 rows in set (0.00 sec)

mysql> use example;
Database changed

mysql> create table if not exists users (id SERIAL, name VARCHAR(100) NOT NULL UNIQUE);
Query OK, 0 rows affected (0.03 sec)

mysql> show tables;
+-------------------+
| Tables_in_example |
+-------------------+
| users             |
+-------------------+
1 row in set (0.00 sec)

mysql> exit
Bye

C:\Users\Илья>mysqldump -u root -p example > example.sql
Enter password: ****

C:\Users\Илья>mysql -u root -p sample < example.sql
Enter password: ****

C:\Users\Илья>mysql
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 94
Server version: 8.0.26 MySQL Community Server - GPL

Copyright (c) 2000, 2021, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> use sample;
Database changed
mysql> show tables;
+------------------+
| Tables_in_sample |
+------------------+
| users            |
+------------------+
1 row in set (0.01 sec)

mysql> exit
Bye

C:\Users\Илья>mysqldump -u root -p mysql help_keyword --where='TRUE LIMIT 100' > helpkey.sql
Enter password: ****
mysqldump: Couldn't find table: "LIMIT"

C:\Users\Илья>