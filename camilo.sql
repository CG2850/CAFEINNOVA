select * from customers 
where CustomerID >= 50
and CustomerID < 55
and not Country = 'germany';


select * from customers 
where CustomerID >= 50
and not Country = 'germany'
LIMIT 5; 

select * from products 
where not CategoryID=6 
and 
not SupplierID = 1;

select * from products 
where CategoryID != 6 
and SupplierID != 1
and Price <= 30
order by rand()
limit 3;

select * from products
 where Price between 2 and 6 
and ProductName like 'K%';

select round(avg(price),2 )
from products;

select SupplierID, round(avg(price)) as promedio
from products
group by SupplierID
order by promedio desc;

select SupplierID, round(avg(price)) as promedio
from products
where ProductName is not null
group by SupplierID
having promedio>40
order by promedio desc;

select ProductID, sum(Quantity) as total_vendido, 
(select price from products where orderdetails.ProductID=ProductID) as precio,
(select ProductName from products where orderdetails.ProductID=ProductID) as nombre,
SUM(Quantity*(select price from products where orderdetails.ProductID=ProductID)) as ganancias
from orderdetails
group by ProductID
order by ganancias asc;

select FirstName, LastName, rewards, mes from employees e 
left join rewards r on e.EmployeeID = r.employeeID;

select SupplierID, count(SupplierID) as cantidad from products
group by SupplierID 
having SupplierID between 5 and 10;

select 	id, ProductName, 
		(select count(ProductID) 
		 from orderdetails 
         where products.id=ProductID 
         group by products.id) as cantidad 
from products;

select products.id, products.ProductName, count(orderdetails.ProductID) from orderdetails
inner join  products on products.id = orderdetails.ProductID
group by products.id;

CREATE TABLE Empleados (
  ID_Empleado INT PRIMARY KEY AUTO_INCREMENT,
  Nombre VARCHAR(50),
  Cargo VARCHAR(50),
  Fecha_Creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  Fecha_Actualizacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);


DROP DATABASE IF EXISTS school;

DROP DATABASE IF EXISTS school;
CREATE DATABASE school;
USE school;

CREATE TABLE teachers(
	id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(20),
    crate_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    update_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE subjects(
	id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(20),
    crate_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    update_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE teachers_subjects(
	id_teachers INT,
    id_subjects INT,
    PRIMARY KEY (id_teachers, id_sebjects),
    FOREIGN KEY (id_teachers) REFERENCES teachers (id),
    FOREIGN KEY (id_subjects) REFERENCES subjects (id)
);

CREATE TABLE update_teacher(
    id_update INT AUTO_INCREMENT PRIMARY KEY,
    id_teacher INT,
    event_type VARCHAR(20),
    event_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

DELIMITER//
CREATE PROCEDURE infoteacher (IN id_teacher INT)
BEGIN
    SELECT * FROM teacher WHERE id = id_teacher
END //
DELIMITER;

--Para llamar el procedimiento almacenmado utilizamos el sigueinte codigo:
CALL infoteacher(2)
--Nombre del PROCEDURE y el valor del parametro



DELIMITER //
CREATE TRIGGER update_teachers
AFTER UPDATE
ON teachers
FOR EACH ROW
BEGIN
    INSERT INTO update_teacher (id_teacher, event_type)
    VALUES (OLD.id, 'UPDATE')
END //
DELIMITER;


ALTER TABLE `update_teacher` CHANGE `id_teacher` `id_updated` INT NULL DEFAULT NULL;
ALTER TABLE update_teacher RENAME TO updates; 

CREATE TRIGGER insert_teachers
AFTER INSERT
ON teachers
FOR EACH ROW
BEGIN
	INSERT INTO updates (tabla, id_updated, event_type)
    VALUES ('teachers', OLD.id, 'INSERT')
END

CREATE TRIGGER venta_producto AFTER INSERT ON venta FOR EACH ROW
	BEGIN 
    	INSERT INTO venta_producto (id_venta, id_producto)
        VALUES (venta.id, producto.id)
    END


    --OPCION DE LLAVE FORANEA EN ACTUALIZACION O ELIMINACION 
    
    -- Creación de la tabla de Usuarios
CREATE TABLE Usuarios (
    id_usuario INT PRIMARY KEY,
    nombre VARCHAR(50)
);

-- Creación de la tabla de Pedidos con clave foránea
CREATE TABLE Pedidos (
    id_pedido INT PRIMARY KEY,
    id_usuario INT,
    total DECIMAL(10, 2),
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario)
        ON UPDATE CASCADE
        ON DELETE SET NULL
);



DROP DATABASE IF EXISTS pruebaa;
CREATE DATABASE pruebaa;
USE pruebaa;

CREATE TABLE users(
	id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR,
    apellido VARCHAR,
    create_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
INSERT INTO users (nombre, apellido)VALUES ("Camilo",'Grisales');  
INSERT INTO users (nombre, apellido)VALUES ("Gustavo","Grisales");
INSERT INTO users (nombre, apellido)VALUES ('Mateo','Grisales')

CREATE VIEW vista_ventas AS
SELECT ventas.fecha, productos.nombre, ventas.cantidad
FROM ventas
INNER JOIN productos ON ventas.producto_id = productos.id;


DECLARE cursor_nombre CURSOR FOR SELECT columna1, columna2 FROM tabla;
OPEN cursor_nombre;
FETCH cursor_nombre INTO @valor1, @valor2;
WHILE @@FETCH_STATUS = 0 DO
    -- Realizar alguna acción con @valor1 y @valor2
    -- ...
    FETCH cursor_nombre INTO @valor1, @valor2;
END WHILE;
CLOSE cursor_nombre;
SELECT nombre, apellido, COUNT(compra.id_usuario) as conteo FROM users
INNER JOIN compra ON compra.id_usuario = users.id GROUP BY compra.id_usuario;





BEGIN
	DECLARE n_stock INT;
    DECLARE id_stock INT;
    
    SELECT cantidad INTO n_stock FROM compra WHERE id=NEW.id;
    SELECT id_producto INTO id_stock FROM compra WHERE id=NEW.id;
    
    UPDATE productos SET stock=stock-n_stock WHERE id=id_stock;
END