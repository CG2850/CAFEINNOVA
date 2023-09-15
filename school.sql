DROP DATABASE IF EXISTS university;

CREATE DATABASE university;

USE university;

CREATE TABLE teachers(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    last_name VARCHAR(50),
    dni INT UNIQUE,
    create_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    update_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE subjects(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    create_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    update_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE teachers_subjects(
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_teacher INT,
    id_subject INT,
    FOREIGN KEY (id_teacher) REFERENCES teachers (id),
    FOREIGN KEY (id_subject) REFERENCES subjects (id),
    create_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    update_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE grades(
    id INT PRIMARY KEY AUTO_INCREMENT,
    grade VARCHAR(50),
    
    create_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    update_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);


CREATE TABLE groups(
    id INT PRIMARY KEY AUTO_INCREMENT,
    grade VARCHAR(50),
    group VARCHAR(50),
    create_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    update_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE students(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50), INDEX idx_name (name),
    last_name VARCHAR(50), INDEX idx_last_name (last_name),
    dni INT UNIQUE,
    id_grade INT,
    FOREIGN KEY (id_grade) REFERENCES grades (id),
    create_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    update_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE students_subjects(
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_student INT,
    id_subject INT,
    FOREIGN KEY (id_student) REFERENCES students (id),
    FOREIGN KEY (id_subject) REFERENCES subjects (id),
    create_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    update_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE grades_teachers(
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_grade INT,
    id_teacher INT,
    FOREIGN KEY (id_grade) REFERENCES grades (id),
    FOREIGN KEY (id_teacher) REFERENCES teachers (id),
    create_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    update_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE grades_subjects(
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_grade INT,
    id_subject INT,
    FOREIGN KEY (id_grade) REFERENCES grades (id),
    FOREIGN KEY (id_subject) REFERENCES subjects (id),
    create_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    update_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);



--CORRECCION

DROP DATABASE IF EXISTS university;

CREATE DATABASE university;

USE university;

CREATE TABLE teachers(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    last_name VARCHAR(50),
    dni INT UNIQUE,
    create_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    update_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE subjects(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    create_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    update_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE teachers_subjects(
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_teacher INT,
    id_subject INT,
    FOREIGN KEY (id_teacher) REFERENCES teachers (id),
    FOREIGN KEY (id_subject) REFERENCES subjects (id),
    create_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    update_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE grades(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    id_group INT,
    create_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    update_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (id_group) REFERENCES groups (id)
);


CREATE TABLE groups(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    create_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    update_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE students(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50), INDEX idx_name (name),
    last_name VARCHAR(50), INDEX idx_last_name (last_name),
    dni INT UNIQUE,
    id_grade INT,
    FOREIGN KEY (id_grade) REFERENCES grades (id),
    create_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    update_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE students_subjects(
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_student INT,
    id_subject INT,
    FOREIGN KEY (id_student) REFERENCES students (id),
    FOREIGN KEY (id_subject) REFERENCES subjects (id),
    create_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    update_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE grades_teachers(
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_grade INT,
    id_teacher INT,
    FOREIGN KEY (id_grade) REFERENCES grades (id),
    FOREIGN KEY (id_teacher) REFERENCES teachers (id),
    create_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    update_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);







--final



DROP DATABASE IF EXISTS university;

CREATE DATABASE university;

USE university;

CREATE TABLE teachers(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    last_name VARCHAR(50),
    dni INT UNIQUE,
    create_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    update_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE subjects(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    create_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    update_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE teachers_subjects(
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_teacher INT,
    id_subject INT,
    FOREIGN KEY (id_teacher) REFERENCES teachers (id),
    FOREIGN KEY (id_subject) REFERENCES subjects (id),
    create_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    update_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE groups_g(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    create_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    update_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE grades(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    id_group INT,
    create_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    update_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (id_group) REFERENCES groups_g (id)
);

CREATE TABLE students(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50), INDEX idx_name (name),
    last_name VARCHAR(50), INDEX idx_last_name (last_name),
    dni INT UNIQUE,
    id_grade INT,
    FOREIGN KEY (id_grade) REFERENCES grades (id),
    create_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    update_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE students_subjects(
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_student INT,
    id_subject INT,
    FOREIGN KEY (id_student) REFERENCES students (id),
    FOREIGN KEY (id_subject) REFERENCES subjects (id),
    create_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    update_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE grades_teachers(
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_grade INT,
    id_teacher INT,
    FOREIGN KEY (id_grade) REFERENCES grades (id),
    FOREIGN KEY (id_teacher) REFERENCES teachers (id),
    create_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    update_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);


---final final

CREATE DATABASE school;

USE school;

CREATE TABLE teachers(
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(30),
    lastname VARCHAR(30),
    dni CHAR(10),
    create_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    update_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE 			CURRENT_TIMESTAMP
);

CREATE TABLE subjects(
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(30),
    create_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    update_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE 			CURRENT_TIMESTAMP
);

CREATE TABLE imparte(
	id INT PRIMARY KEY AUTO_INCREMENT,
    id_subject INT,
    id_teacher INT,
    FOREIGN KEY (id_subject) REFERENCES subjects (id),
    FOREIGN KEY (id_teacher) REFERENCES teachers (id),
    create_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    update_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE 			CURRENT_TIMESTAMP
);

CREATE TABLE grades(
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(30),
    create_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    update_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE subjects_grades(
	id INT PRIMARY KEY AUTO_INCREMENT,
    id_subject INT,
    id_grade INT, 
    FOREIGN KEY (id_subject) REFERENCES subjects (id),
    FOREIGN KEY (id_grade) REFERENCES grades (id),
    create_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    update_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE groups(
	id INT PRIMARY KEY AUTO_INCREMENT,
    name CHAR(1),
    create_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    update_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE classroom(
	id INT PRIMARY KEY AUTO_INCREMENT,
    id_grade INT,
    id_group INT, 
    FOREIGN KEY (id_group) REFERENCES groups (id),
    FOREIGN KEY (id_grade) REFERENCES grades (id),
    create_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    update_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE students(
	id INT,
    name VARCHAR(30),
    lastname VARCHAR(30),
    dni CHAR(10),
    id_classroom INT,
    FOREIGN KEY (id_classroom) REFERENCES classroom (id),
    create_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    update_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);









