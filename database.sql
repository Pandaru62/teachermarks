CREATE DATABASE teachermarks;

USE teachermarks;

CREATE TABLE `user` (
    `id` INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY, 
    `pseudo` VARCHAR(255) NOT NULL,
    `password` VARCHAR(255) NOT NULL
);

CREATE TABLE `form` (
    `id` INT(11) NOT NULL AUTO_INCREMENT  PRIMARY KEY, 
    `name` VARCHAR(255) NOT NULL
);

CREATE TABLE `schoolclass` (
    `id` INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY, 
    `name` VARCHAR(255) NOT NULL,
    `color` VARCHAR(255) NOT NULL, 
    `is_archived` BOOLEAN NOT NULL, 
    `form_id` INT(11) NOT NULL,
    CONSTRAINT `fk_class_form` FOREIGN KEY (`form_id`) REFERENCES `form` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE `students` (
    `id` INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY, 
    `lastname` VARCHAR(255) NOT NULL,
    `firstname` VARCHAR(255) NOT NULL, 
    `class_id` INT(11) NOT NULL,
    CONSTRAINT `fk_student_class` FOREIGN KEY (`class_id`) REFERENCES `schoolclass` (`id`) ON DELETE CASCADE ON UPDATE CASCADE

);

CREATE TABLE `test` (
    `id` INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY, 
    `date` DATE NOT NULL,
    `trimester` INT(1) NOT NULL, 
    `description` VARCHAR(255) NOT NULL,
    `scale` INT(11) NOT NULL,
    `coefficient` INT(11) NOT NULL,
    `class_id` INT(11) NOT NULL,
    CONSTRAINT `fk_test_form` FOREIGN KEY (`class_id`) REFERENCES `schoolclass` (`id`) ON DELETE CASCADE ON UPDATE CASCADE

);

CREATE TABLE `test-student` (
    `id` INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY, 
    `mark` INT(11) NOT NULL,
    `skill1` INT(1),
    `skill2` INT(1),
    `skill3` INT(1),
    `skill4` INT(1),
    `skill5` INT(1),
    `student_id` INT(11) NOT NULL, 
    `test_id` INT(11) NOT NULL,
    CONSTRAINT `fk_student_test` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `fk_test_student` FOREIGN KEY (`test_id`) REFERENCES `test` (`id`) ON DELETE CASCADE ON UPDATE CASCADE


);

/* Inserting data */

INSERT INTO `form` (`name`) VALUES ('2ND'), ('1G'), ('1HLP'), ('1STMG'), ('BTS');

INSERT INTO `schoolclass` (`id`, `name`, `color`, `is_archived`, `form_id`) 
VALUES (1, '2D5', 'red', 0, 1),  
(2, '1G4', 'blue', 0, 2), 
(3, '1HLP1', 'green', 0, 3), 
(4, '1STMG2', 'yellow', 0, 4),
(5, 'BTS1', 'pink', 0, 5);

INSERT INTO `students` (`firstname`, `lastname`, `class_id`)
VALUES 
('John', 'Doe', 1),
('Jane', 'Smith', 2),
('Alice', 'Johnson', 3),
('Bob', 'Brown', 4),
('Carol', 'Davis', 5),
('Daniel', 'Miller', 1),
('Emma', 'Wilson', 2),
('Frank', 'Moore', 3),
('Grace', 'Taylor', 4),
('Henry', 'Anderson', 5),
('Ivy', 'Thomas', 1),
('Jack', 'Jackson', 2),
('Kara', 'White', 3),
('Liam', 'Harris', 4),
('Mia', 'Martin', 5),
('Noah', 'Thompson', 1),
('Olivia', 'Garcia', 2),
('Paul', 'Martinez', 3),
('Quinn', 'Robinson', 4),
('Ruby', 'Clark', 5);
