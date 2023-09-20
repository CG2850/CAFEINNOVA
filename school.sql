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

CREATE TABLE groups_g(
	id INT PRIMARY KEY AUTO_INCREMENT,
    name CHAR(1),
    create_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    update_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE classroom(
	id INT PRIMARY KEY AUTO_INCREMENT,
    id_grade INT,
    id_group INT, 
    FOREIGN KEY (id_group) REFERENCES groups_g (id),
    FOREIGN KEY (id_grade) REFERENCES grades (id),
    create_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    update_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE students(
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(30),
    lastname VARCHAR(30),
    dni CHAR(10),
    id_classroom INT,
    FOREIGN KEY (id_classroom) REFERENCES classroom (id),
    create_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    update_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);


INSERT INTO teachers (name, lastname, dni)
VALUES
    ('John', 'Smith', '123456789A'),
    ('Jane', 'Doe', '987654321B'),
    ('Michael', 'Johnson', '543216789C'),
    ('Emily', 'Williams', '654321987D'),
    ('David', 'Brown', '123987456E'),
    ('Sarah', 'Davis', '789654123F'),
    ('Daniel', 'Miller', '456321987G'),
    ('Jennifer', 'Wilson', '321654987H'),
    ('James', 'Moore', '789123456I'),
    ('Olivia', 'Anderson', '654789123J'),
    ('Robert', 'Lee', '987456321K'),
    ('Ava', 'Martinez', '456789123L'),
    ('William', 'Taylor', '321789456M'),
    ('Sophia', 'Thomas', '987123654N'),
    ('Joseph', 'Harris', '654987321O');


INSERT INTO subjects (name)
VALUES
    ('Matemáticas'),
    ('Lengua Española'),
    ('Ciencias Naturales'),
    ('Historia'),
    ('Geografía'),
    ('Educación Física'),
    ('Arte'),
    ('Música'),
    ('Inglés'),
    ('Tecnología');

-- Insertar relaciones entre profesores y materias que imparten
INSERT INTO imparte (id_subject, id_teacher)
VALUES
    (1, 1),  -- Profesor John Smith imparte Matemáticas
    (2, 2),  -- Profesora Jane Doe imparte Lengua Española
    (3, 3),  -- Profesor Michael Johnson imparte Ciencias Naturales
    (4, 4),  -- Profesora Emily Williams imparte Historia
    (5, 5),  -- Profesor David Brown imparte Geografía
    (6, 6),  -- Profesora Sarah Davis imparte Educación Física
    (7, 7),  -- Profesor Daniel Miller imparte Arte
    (8, 8),  -- Profesora Jennifer Wilson imparte Música
    (9, 9),  -- Profesor James Moore imparte Inglés
    (10, 10),  -- Profesora Olivia Anderson imparte Tecnología
    (1, 11),
    (2, 12),
    (3, 13),
    (4, 14),
    (5, 15);


INSERT INTO grades (name)
VALUES
    ('Primero'),
    ('Segundo'),
    ('Tercero'),
    ('Cuarto'),
    ('Quinto'),
    ('Sexto'),
    ('Séptimo'),
    ('Octavo'),
    ('Noveno'),
    ('Décimo'),
    ('Undécimo');

INSERT INTO groups_g (name)
VALUES
    ('A'),
    ('B'),
    ('C');



-- Grado Primero
INSERT INTO subjects_grades (id_subject, id_grade)
VALUES
    (1, 1),  -- Matemáticas
    (2, 1),  -- Lengua Española
    (3, 1),  -- Ciencias Naturales
    (4, 1),  -- Historia
    (5, 1),  -- Geografía
    (6, 1),  -- Educación Física
    (7, 1),  -- Arte
    (8, 1);  -- Música

-- Grado Segundo
INSERT INTO subjects_grades (id_subject, id_grade)
VALUES
    (1, 2),  -- Matemáticas
    (2, 2),  -- Lengua Española
    (9, 2),  -- Inglés
    (3, 2),  -- Ciencias Naturales
    (10, 2), -- Tecnología
    (6, 2),  -- Educación Física
    (7, 2),  -- Arte
    (8, 2);  -- Música

-- Grado Tercero
INSERT INTO subjects_grades (id_subject, id_grade)
VALUES
    (1, 3),  -- Matemáticas
    (2, 3),  -- Lengua Española
    (9, 3),  -- Inglés
    (3, 3),  -- Ciencias Naturales
    (4, 3),  -- Historia
    (6, 3),  -- Educación Física
    (7, 3),  -- Arte
    (8, 3);  -- Música

-- Grado Cuarto
INSERT INTO subjects_grades (id_subject, id_grade)
VALUES
    (1, 4),  -- Matemáticas
    (2, 4),  -- Lengua Española
    (9, 4),  -- Inglés
    (3, 4),  -- Ciencias Naturales
    (5, 4),  -- Geografía
    (6, 4),  -- Educación Física
    (7, 4),  -- Arte
    (8, 4);  -- Música

-- Grado Quinto
INSERT INTO subjects_grades (id_subject, id_grade)
VALUES
    (1, 5),  -- Matemáticas
    (2, 5),  -- Lengua Española
    (9, 5),  -- Inglés
    (3, 5),  -- Ciencias Naturales
    (4, 5),  -- Historia
    (6, 5),  -- Educación Física
    (7, 5),  -- Arte
    (8, 5);  -- Música

-- Grado Sexto
INSERT INTO subjects_grades (id_subject, id_grade)
VALUES
    (1, 6),  -- Matemáticas
    (2, 6),  -- Lengua Española
    (9, 6),  -- Inglés
    (3, 6),  -- Ciencias Naturales
    (4, 6),  -- Historia
    (5, 6),  -- Geografía
    (6, 6),  -- Educación Física
    (7, 6);  -- Arte

-- Grado Séptimo
INSERT INTO subjects_grades (id_subject, id_grade)
VALUES
    (1, 7),  -- Matemáticas
    (2, 7),  -- Lengua Española
    (9, 7),  -- Inglés
    (3, 7),  -- Ciencias Naturales
    (4, 7),  -- Historia
    (5, 7),  -- Geografía
    (6, 7),  -- Educación Física
    (7, 7);  -- Arte

-- Grado Octavo
INSERT INTO subjects_grades (id_subject, id_grade)
VALUES
    (1, 8),  -- Matemáticas
    (2, 8),  -- Lengua Española
    (9, 8),  -- Inglés
    (3, 8),  -- Ciencias Naturales
    (4, 8),  -- Historia
    (5, 8),  -- Geografía
    (6, 8),  -- Educación Física
    (11, 8);  -- Tecnologia

-- Grado Noveno
INSERT INTO subjects_grades (id_subject, id_grade)
VALUES
    (1, 9),  -- Matemáticas
    (2, 9),  -- Lengua Española
    (9, 9),  -- Inglés
    (3, 9),  -- Ciencias Naturales
    (4, 9),  -- Historia
    (5, 9),  -- Geografía
    (6, 9),  -- Educación Física
    (11, 9);  -- Tecnologia

-- Grado Décimo
INSERT INTO subjects_grades (id_subject, id_grade)
VALUES
    (1, 10),  -- Matemáticas
    (2, 10),  -- Lengua Española
    (9, 10),  -- Inglés
    (3, 10),  -- Ciencias Naturales
    (4, 10),  -- Historia
    (5, 10),  -- Geografía
    (6, 10),  -- Educación Física
    (10, 10);  -- Tecnologia

-- Grado Undécimo
INSERT INTO subjects_grades (id_subject, id_grade)
VALUES
    (1, 11),  -- Matemáticas
    (2, 11),  -- Lengua Española
    (9, 11),  -- Inglés
    (3, 11),  -- Ciencias Naturales
    (4, 11),  -- Historia
    (5, 11),  -- Geografía
    (6, 11),  -- Educación Física
    (10, 11);  -- Tecnologia


-- Grado Primero
INSERT INTO classroom (id_grade, id_group)
VALUES
    (1, 1),  -- Grado Primero, Grupo A
    (1, 2),  -- Grado Primero, Grupo B
    (1, 3);  -- Grado Primero, Grupo C

-- Grado Segundo
INSERT INTO classroom (id_grade, id_group)
VALUES
    (2, 1),  -- Grado Segundo, Grupo A
    (2, 2),  -- Grado Segundo, Grupo B
    (2, 3);  -- Grado Segundo, Grupo C

-- Grado Tercero
INSERT INTO classroom (id_grade, id_group)
VALUES
    (3, 1),  -- Grado Tercero, Grupo A
    (3, 2),  -- Grado Tercero, Grupo B
    (3, 3);  -- Grado Tercero, Grupo C

-- Grado Cuarto
INSERT INTO classroom (id_grade, id_group)
VALUES
    (4, 1),  -- Grado Cuarto, Grupo A
    (4, 2),  -- Grado Cuarto, Grupo B
    (4, 3);  -- Grado Cuarto, Grupo C

-- Grado Quinto
INSERT INTO classroom (id_grade, id_group)
VALUES
    (5, 1),  -- Grado Quinto, Grupo A
    (5, 2),  -- Grado Quinto, Grupo B
    (5, 3);  -- Grado Quinto, Grupo C

-- Continúa para los grados desde Sexto hasta Undécimo
-- Grado Sexto
INSERT INTO classroom (id_grade, id_group)
VALUES
    (6, 1),  -- Grado Sexto, Grupo A
    (6, 2),  -- Grado Sexto, Grupo B
    (6, 3);  -- Grado Sexto, Grupo C

-- Grado Séptimo
INSERT INTO classroom (id_grade, id_group)
VALUES
    (7, 1),  -- Grado Séptimo, Grupo A
    (7, 2),  -- Grado Séptimo, Grupo B
    (7, 3);  -- Grado Séptimo, Grupo C

-- Grado Octavo
INSERT INTO classroom (id_grade, id_group)
VALUES
    (8, 1),  -- Grado Octavo, Grupo A
    (8, 2),  -- Grado Octavo, Grupo B
    (8, 3);  -- Grado Octavo, Grupo C

-- Grado Noveno
INSERT INTO classroom (id_grade, id_group)
VALUES
    (9, 1),  -- Grado Noveno, Grupo A
    (9, 2),  -- Grado Noveno, Grupo B
    (9, 3);  -- Grado Noveno, Grupo C

-- Grado Décimo
INSERT INTO classroom (id_grade, id_group)
VALUES
    (10, 1),  -- Grado Décimo, Grupo A
    (10, 2),  -- Grado Décimo, Grupo B
    (10, 3);  -- Grado Décimo, Grupo C

-- Grado Undécimo
INSERT INTO classroom (id_grade, id_group)
VALUES
    (11, 1),  -- Grado Undécimo, Grupo A
    (11, 2),  -- Grado Undécimo, Grupo B
    (11, 3);  -- Grado Undécimo, Grupo C


-- Insertar 50 estudiantes ficticios (aleatorios)
INSERT INTO students (name, lastname, dni, id_classroom)
VALUES
    ('Emma', 'Johnson', '1234567890', 1),
    ('Liam', 'Smith', '9876543210', 2),
    ('Olivia', 'Brown', '5432167890', 3),
    ('Noah', 'Wilson', '6543219870', 4),
    ('Ava', 'Davis', '1239874560', 5),
    ('Isabella', 'Martinez', '7896541230', 6),
    ('Sophia', 'Garcia', '4563219870', 7),
    ('Mia', 'Anderson', '3216549870', 8),
    ('Charlotte', 'Miller', '7891234560', 9),
    ('Amelia', 'Lee', '6547891230', 10),
    ('Harper', 'Moore', '9874563210', 1),
    ('Evelyn', 'Taylor', '4567891230', 2),
    ('Abigail', 'Thomas', '3217894560', 3),
    ('Emily', 'Harris', '9871236540', 4),
    ('Elizabeth', 'White', '6549873210', 5),
    ('Sofia', 'Clark', '7893216540', 6),
    ('Avery', 'Walker', '1234567891', 7),
    ('Ella', 'Anderson', '9876543211', 8),
    ('Madison', 'Moore', '6543219871', 9),
    ('Scarlett', 'Johnson', '1234567892', 10),
    ('Victoria', 'Hall', '9876543212', 1),
    ('Grace', 'Williams', '5432167893', 2),
    ('Chloe', 'Jones', '6543219874', 3),
    ('Penelope', 'Brown', '1239874565', 4),
    ('Lily', 'Davis', '7896541236', 5),
    ('Nora', 'Smith', '4563219877', 6),
    ('Zoe', 'Hernandez', '3216549878', 7),
    ('Hazel', 'Gonzalez', '7891234569', 8),
    ('Riley', 'Perez', '6547891230', 9),
    ('Aria', 'Lopez', '9874563210', 10),
    ('Luna', 'King', '4567891231', 1),
    ('Eleanor', 'Sanchez', '3217894562', 2),
    ('Savannah', 'Torres', '9871236543', 3),
    ('Layla', 'Ramirez', '6549873214', 4),
    ('Claire', 'Fisher', '7893216545', 5),
    ('Stella', 'Baker', '1234567896', 6),
    ('Aubrey', 'Harrison', '9876543217', 7),
    ('Leah', 'Reyes', '5432167898', 8),
    ('Violet', 'Wood', '6543219879', 9),
    ('Natalie', 'Watson', '1239874560', 10),
    ('Zoey', 'Gray', '7896541231', 1),
    ('Hannah', 'Barnes', '4563219872', 2),
    ('Bella', 'Coleman', '3216549873', 3);
