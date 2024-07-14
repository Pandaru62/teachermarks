CREATE DATABASE teachermarks;

CREATE TABLE `teachermarks`.`user` (
    `id` INT(11) NOT NULL AUTO_INCREMENT , 
    `pseudo` VARCHAR(255) NOT NULL, 
    `password` VARCHAR(255) NOT NULL,
    PRIMARY KEY (`id`)
);

CREATE TABLE `teachermarks`.`form` (
    `id` INT(11) NOT NULL AUTO_INCREMENT , 
    `name` VARCHAR(255) NOT NULL, 
);

CREATE TABLE `teachermarks`.`schoolclass` (
    `id` INT(11) NOT NULL AUTO_INCREMENT , 
    `name` VARCHAR(255) NOT NULL,
    `color` VARCHAR(255) NOT NULL, 
    `is_archived` BOOLEAN NOT NULL, 
    `form_id` INT(11) NOT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`form_id`) REFERENCES `form`(`id`) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE `teachermarks`.`students` (
    `id` INT(11) NOT NULL AUTO_INCREMENT , 
    `lastname` VARCHAR(255) NOT NULL,
    `firstname` VARCHAR(255) NOT NULL, 
    `class_id` INT(11) NOT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`class_id`) REFERENCES `class`(`id`) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE `teachermarks`.`test` (
    `id` INT(11) NOT NULL AUTO_INCREMENT , 
    `date` DATE NOT NULL,
    `trimester` INT(1) NOT NULL, 
    `description` VARCHAR(255) NOT NULL,
    `scale` INT(11) NOT NULL,
    `coefficient` INT(11) NOT NULL,
    `class_id` INT(11) NOT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`class_id`) REFERENCES `class`(`id`) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE `teachermarks`.`test-student` (
    `id` INT(11) NOT NULL AUTO_INCREMENT , 
    `mark` INT(11) NOT NULL,
    `skill1` INT(1),
    `skill2` INT(1),
    `skill3` INT(1),
    `skill4` INT(1),
    `skill5` INT(1),
    `student_id` INT(11) NOT NULL, 
    `test_id` INT(11) NOT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`student_id`) REFERENCES `student`(`id`) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (`test_id`) REFERENCES `test`(`id`) ON DELETE CASCADE ON UPDATE CASCADE
);

/* Inserting data */

INSERT INTO `form` (`name`) VALUES ('2ND'), ('1G'), ('1HLP'), ('1STMG'), ('BTS');

INSERT INTO `schoolclass` (`name`, `color`, `is_archived`, `form_id`) 
VALUES ('2D5', 'red', 0, 1),  
('1G4', 'blue', 0, 2), 
('1HLP1', 'green', 0, 3), 
('1STMG2', 'yellow', 0, 4),
('BTS1', 'pink', 0, 5);

INSERT INTO `teachermarks`.`student` (`firstname`, `lastname`, `class_id`)
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


