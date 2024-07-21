CREATE TABLE form (id INT AUTO_INCREMENT NOT NULL, name VARCHAR(255) NOT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB;
CREATE TABLE schoolclass (id INT AUTO_INCREMENT NOT NULL, form_id INT NOT NULL, name VARCHAR(255) NOT NULL, color VARCHAR(255) NOT NULL, is_archived TINYINT(1) NOT NULL, INDEX IDX_F146B6695FF69B7D (form_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB;
CREATE TABLE students (id INT AUTO_INCREMENT NOT NULL, class_id INT NOT NULL, lastname VARCHAR(255) NOT NULL, firstname VARCHAR(255) NOT NULL, INDEX IDX_A4698DB2EA000B10 (class_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB;
CREATE TABLE test (id INT AUTO_INCREMENT NOT NULL, schoolclass_id INT NOT NULL, date DATE NOT NULL, trimester INT NOT NULL, description VARCHAR(255) NOT NULL, scale INT NOT NULL, coefficient INT NOT NULL, INDEX IDX_D87F7E0CC67D8F5 (schoolclass_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB;
CREATE TABLE user (id INT AUTO_INCREMENT NOT NULL, username VARCHAR(180) NOT NULL, roles JSON NOT NULL, password VARCHAR(255) NOT NULL, UNIQUE INDEX UNIQ_IDENTIFIER_USERNAME (username), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB;
ALTER TABLE schoolclass ADD CONSTRAINT FK_F146B6695FF69B7D FOREIGN KEY (form_id) REFERENCES form (id);
ALTER TABLE students ADD CONSTRAINT FK_A4698DB2EA000B10 FOREIGN KEY (class_id) REFERENCES schoolclass (id);
ALTER TABLE test ADD CONSTRAINT FK_D87F7E0CC67D8F5 FOREIGN KEY (schoolclass_id) REFERENCES schoolclass (id);

INSERT INTO `user` (`username`, `roles`, `password`) VALUES ('a_pierrepont', '[]', '$2y$13$f8wB7blFJ.hBfvbo/YKAuuiJFn2QHakIYYw2ChZmtwK240kRF9iJy');

INSERT INTO `form` (`name`) VALUES ('2ND'), ('1G'), ('1HLP'), ('1STMG'), ('BTS');

INSERT INTO `schoolclass` (`id`, `name`, `color`, `is_archived`, `form_id`) 
VALUES ('2D5', 'red', 0, 1),  
(1, '1G4', 'blue', 0, 2), 
(2, '1HLP1', 'green', 0, 3), 
(3, '1STMG2', 'yellow', 0, 4),
(4, 'BTS1', 'pink', 0, 5);

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