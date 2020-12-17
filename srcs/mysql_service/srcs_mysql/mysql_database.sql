CREATE DATABASE IF NOT EXISTS gkarina_database DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
CREATE USER IF NOT EXISTS 'gkarina_user'@'%' IDENTIFIED BY 'gkarina42';
GRANT ALL PRIVILEGES ON gkarina_database.* TO 'gkarina_user'@'%';
FLUSH PRIVILEGES;
QUIT
