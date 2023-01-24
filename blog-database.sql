DROP DATABASE IF EXISTS Blog;
CREATE DATABASE Blog DEFAULT CHAR SET UTF8;
USE Blog;
CREATE TABLE `Tag`(
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL
);
ALTER TABLE
    `Tag` ADD UNIQUE `tag_name_unique`(`name`);

CREATE TABLE `Post`(
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `title` VARCHAR(255) NOT NULL,
    `content` TEXT NOT NULL,
    `created` TIMESTAMP NOT NULL DEFAULT current_timestamp,
    `updated` TIMESTAMP NOT NULL DEFAULT current_timestamp,
    `draft` TINYINT(1) NOT NULL DEFAULT 1,
    `category_id` INT NOT NULL,
    `blog_id` INT NOT NULL
);
CREATE TABLE `Category`(
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL
);
ALTER TABLE
    `Category` ADD UNIQUE `category_name_unique`(`name`);
CREATE TABLE `Post_Tag`(
    `post_id` INT NOT NULL,
    `tag_id` INT NOT NULL
);
ALTER TABLE
    `Post_Tag` ADD PRIMARY KEY (`post_id`, `tag_id`);
CREATE TABLE `Comment`(
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `text` TEXT NOT NULL,
    `created` TIMESTAMP NOT NULL DEFAULT current_timestamp,
    `post_id` INT NOT NULL,
    `updated` TIMESTAMP NOT NULL DEFAULT current_timestamp,
    `user_id` INT NULL
);
CREATE TABLE `User`(
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `username` VARCHAR(255) NOT NULL,
    `password` VARCHAR(255) NOT NULL,
    `first_name` VARCHAR(255) NOT NULL,
    `last_name` VARCHAR(255) NOT NULL,
    `email` VARCHAR(255) NOT NULL,
    `is_active` TINYINT(1) NOT NULL DEFAULT '1',
    `is_expired` TINYINT(1) NOT NULL,
    `created` TIMESTAMP NOT NULL DEFAULT current_timestamp,
    `updated` TIMESTAMP NOT NULL DEFAULT current_timestamp
);
ALTER TABLE
    `User` ADD UNIQUE `user_username_unique`(`username`);
ALTER TABLE
    `User` ADD UNIQUE `user_email_unique`(`email`);
CREATE TABLE `Author`(
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `user_id` INT NOT NULL,
    `avatar` BLOB NULL,
    `created` TIMESTAMP NOT NULL DEFAULT current_timestamp,
    `updated` TIMESTAMP NOT NULL DEFAULT current_timestamp
);
CREATE TABLE `Blog`(
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `owner_id` INT NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `description` TEXT NULL,
    `created` TIMESTAMP NOT NULL DEFAULT current_timestamp,
    `updated` TIMESTAMP NOT NULL DEFAULT current_timestamp
);
ALTER TABLE
    `Blog` ADD UNIQUE `blog_name_unique`(`name`);
CREATE TABLE `Role`(
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL
);
ALTER TABLE
    `Role` ADD UNIQUE `role_name_unique`(`name`);
CREATE TABLE `User_Role`(
    `user_id` INT NOT NULL,
    `role_id` INT NOT NULL
);
ALTER TABLE
    `User_Role` ADD PRIMARY KEY `user_role_user_id_role_id_primary`(`user_id`, `role_id`);
ALTER TABLE
    `Post_Tag` ADD CONSTRAINT `post_tag_post_id_foreign` FOREIGN KEY(`post_id`) REFERENCES `Post`(`id`);
ALTER TABLE
    `Comment` ADD CONSTRAINT `comment_post_id_foreign` FOREIGN KEY(`post_id`) REFERENCES `Post`(`id`);
ALTER TABLE
    `Post` ADD CONSTRAINT `post_category_id_foreign` FOREIGN KEY(`category_id`) REFERENCES `Category`(`id`);
ALTER TABLE
    `Post` ADD CONSTRAINT `post_blog_id_foreign` FOREIGN KEY(`blog_id`) REFERENCES `Blog`(`id`);
ALTER TABLE
    `Post_Tag` ADD CONSTRAINT `post_tag_tag_id_foreign` FOREIGN KEY(`tag_id`) REFERENCES `Tag`(`id`);
ALTER TABLE
    `Comment` ADD CONSTRAINT `comment_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `User`(`id`);
ALTER TABLE
    `Author` ADD CONSTRAINT `author_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `User`(`id`);
ALTER TABLE
    `Blog` ADD CONSTRAINT `blog_owner_id_foreign` FOREIGN KEY(`owner_id`) REFERENCES `Author`(`id`);
ALTER TABLE
    `User_Role` ADD CONSTRAINT `user_role_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `User`(`id`);
ALTER TABLE
    `User_Role` ADD CONSTRAINT `user_role_role_id_foreign` FOREIGN KEY(`role_id`) REFERENCES `Role`(`id`);
