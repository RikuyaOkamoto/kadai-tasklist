CREATE DATABASE tasks DEFAULT CHARACTER SET utf8;
CREATE USER 'mesuser'@'localhost' IDENTIFIED BY 'mespass';
GRANT ALL PRIVILEGES ON tasks.* TO 'mesuser'@'localhost';