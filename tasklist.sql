CREATE DATABASE tasklist DEFAULT CHARACTER SET utf8;
CREATE USER 'mesuser'@'localhost' IDENTIFIED BY 'mespass';
GRANT ALL PRIVILEGES ON tasklist.* TO 'mesuser'@'localhost';