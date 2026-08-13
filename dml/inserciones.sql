use gaseosas_del_valle;


INSERT INTO productos
(id_producto, nombre_producto, categoria_producto, precio_producto,
 volumen_ml, estado_producto, usuario_registro)
VALUES
(1,'Cola Clásica','Cola',5.00,355,'activo','ADMIN'),
(2,'Cola Original','Cola',6.00,500,'activo','ADMIN'),
(3,'Cola Tradicional','Cola',7.00,600,'activo','ADMIN'),
(4,'Cola Familiar','Cola',12.00,1000,'activo','ADMIN'),
(5,'Cola 500ml','Cola',18.00,1500,'activo','ADMIN'),

(6,'Cola Zero','Cola Zero',7.00,2500,'activo','ADMIN'),
(7,'Cola Zero Familiar','Cola Zero',15.00,355,'activo','ADMIN'),
(8,'Cola Zero 600ml','Cola Zero',8.00,500,'activo','ADMIN'),
(9,'Cola Zero 1.5L','Cola Zero',20.00,600,'activo','ADMIN'),
(10,'Cola Zero 2.5L','Cola Zero',30.00,1500,'activo','ADMIN'),

(11,'Limonada Natural','Limonada',5.00,2500,'activo','ADMIN'),
(12,'Limonada Familiar','Limonada',14.00,355,'activo','ADMIN'),
(13,'Limonada 600ml','Limonada',8.00,500,'activo','ADMIN'),
(14,'Limonada 1.5L','Limonada',20.00,600,'activo','ADMIN'),
(15,'Limonada Light','Limonada',9.00,1500,'activo','ADMIN'),

(16,'Naranja Clásica','Naranja',5.00,2500,'activo','ADMIN'),
(17,'Naranja Familiar','Naranja',14.00,355,'activo','ADMIN'),
(18,'Naranja 600ml','Naranja',8.00,500,'activo','ADMIN'),
(19,'Naranja 1.5L','Naranja',20.00,600,'activo','ADMIN'),
(20,'Naranja Zero','Naranja',22.00,1500,'activo','ADMIN'),

(21,'Uva Clásica','Uva',5.00,2500,'activo','ADMIN'),
(22,'Uva Familiar','Uva',14.00,355,'activo','ADMIN'),
(23,'Uva 600ml','Uva',8.00,500,'activo','ADMIN'),
(24,'Uva 1.5L','Uva',20.00,600,'activo','ADMIN'),
(25,'Uva Light','Uva',22.00,1500,'activo','ADMIN'),

(26,'Manzana Clásica','Manzana',5.00,2500,'activo','ADMIN'),
(27,'Manzana Familiar','Manzana',14.00,355,'activo','ADMIN'),
(28,'Manzana 600ml','Manzana',8.00,500,'activo','ADMIN'),
(29,'Manzana 1.5L','Manzana',20.00,600,'activo','ADMIN'),
(30,'Manzana Light','Manzana',22.00,1500,'activo','ADMIN'),

(31,'Té Limón','Té',10.00,2500,'activo','ADMIN'),
(32,'Té Durazno','Té',10.00,355,'activo','ADMIN'),
(33,'Té Verde','Té',10.00,500,'activo','ADMIN'),
(34,'Té Frutos Rojos','Té',11.00,500,'activo','ADMIN'),
(35,'Té Melocotón','Té',10.00,500,'activo','ADMIN'),

(36,'Agua Pura 500ml','Agua',3.00,500,'activo','ADMIN'),
(37,'Agua Pura 1L','Agua',5.00,1000,'activo','ADMIN'),
(38,'Agua Pura 1.5L','Agua',7.00,1500,'activo','ADMIN'),
(39,'Agua Pura 2.5L','Agua',12.00,2500,'activo','ADMIN'),
(40,'Agua Pura 5L','Agua',20.00,5000,'activo','ADMIN'),

(41,'Energizante Original','Energizante',12.00,355,'activo','ADMIN'),
(42,'Energizante Tropical','Energizante',12.00,355,'activo','ADMIN'),
(43,'Energizante Zero','Energizante',12.00,355,'activo','ADMIN'),
(44,'Energizante Citrus','Energizante',12.00,355,'activo','ADMIN'),
(45,'Energizante Frutos Rojos','Energizante',12.00,355,'activo','ADMIN'),

(46,'Frutal Mango','Frutal',9.00,355,'activo','ADMIN'),
(47,'Frutal Piña','Frutal',9.00,500,'activo','ADMIN'),
(48,'Frutal Fresa','Frutal',9.00,500,'activo','ADMIN'),
(49,'Frutal Tropical','Frutal',9.00,500,'activo','ADMIN'),
(50,'Frutal Cítrico','Frutal',9.00,500,'activo','ADMIN');


INSERT INTO sedes
(id_sede, nombre_sede, ubicacion, capacidad_almacenamiento,
 encargado_sede, estado_sede)
VALUES
(1,'Sede Zona 6',
 'Calzada José Milla Vidaurre, zona 6, Ciudad de Guatemala',
 5000,
 'Carlos Pérez',
 'activo'),

(2,'Sede Zona 13',
 'Avenida Las Américas, zona 13, Ciudad de Guatemala',
 6000,
 'María Gómez',
 'activo'),

(3,'Sede Zona 21',
 'Avenida Petapa, zona 21, Ciudad de Guatemala',
 4500,
 'Luis Hernández',
 'activo');


INSERT INTO clientes
(id_cliente, nombre_completo_cliente, identificacion_cliente,
 direccion_cliente, telefono_cliente, correo_electronico_cliente,
 estado_cliente)
VALUES
(1,'Carlos Pérez López','1000000000','Avenida 1, zona 6, Ciudad de Guatemala','51000000','cliente1@ejemplo.com','activo'),
(2,'María Gómez Morales','1000000001','Avenida 2, zona 13, Ciudad de Guatemala','51000001','cliente2@ejemplo.com','activo'),
(3,'José Hernández García','1000000002','Avenida 3, zona 21, Ciudad de Guatemala','51000002','cliente3@ejemplo.com','activo'),
(4,'Ana Ramírez Castillo','1000000003','Avenida 4, zona 6, Ciudad de Guatemala','51000003','cliente4@ejemplo.com','activo'),
(5,'Luis Mendoza López','1000000004','Avenida 5, zona 13, Ciudad de Guatemala','51000004','cliente5@ejemplo.com','activo'),
(6,'Sofía Cifuentes Pérez','1000000005','Avenida 6, zona 21, Ciudad de Guatemala','51000005','cliente6@ejemplo.com','activo'),
(7,'Miguel López Morales','1000000006','Avenida 7, zona 6, Ciudad de Guatemala','51000006','cliente7@ejemplo.com','activo'),
(8,'Daniel García Hernández','1000000007','Avenida 8, zona 13, Ciudad de Guatemala','51000007','cliente8@ejemplo.com','activo'),
(9,'Andrea Chávez Díaz','1000000008','Avenida 9, zona 21, Ciudad de Guatemala','51000008','cliente9@ejemplo.com','activo'),
(10,'Jorge Morales Rivera','1000000009','Avenida 10, zona 6, Ciudad de Guatemala','51000009','cliente10@ejemplo.com','activo'),

(11,'Paola Vásquez Pérez','1000000010','Avenida 1, zona 13, Ciudad de Guatemala','51000010','cliente11@ejemplo.com','activo'),
(12,'Edwin Castillo Gómez','1000000011','Avenida 2, zona 21, Ciudad de Guatemala','51000011','cliente12@ejemplo.com','activo'),
(13,'Karla Lemus García','1000000012','Avenida 3, zona 6, Ciudad de Guatemala','51000012','cliente13@ejemplo.com','activo'),
(14,'Kevin Estrada López','1000000013','Avenida 4, zona 13, Ciudad de Guatemala','51000013','cliente14@ejemplo.com','activo'),
(15,'Claudia Marroquín Pérez','1000000014','Avenida 5, zona 21, Ciudad de Guatemala','51000014','cliente15@ejemplo.com','activo'),
(16,'Ricardo Santos Morales','1000000015','Avenida 6, zona 6, Ciudad de Guatemala','51000015','cliente16@ejemplo.com','activo'),
(17,'Gabriela Fuentes López','1000000016','Avenida 7, zona 13, Ciudad de Guatemala','51000016','cliente17@ejemplo.com','activo'),
(18,'Fernando Méndez García','1000000017','Avenida 8, zona 21, Ciudad de Guatemala','51000017','cliente18@ejemplo.com','activo'),
(19,'Alejandra Pineda Castillo','1000000018','Avenida 9, zona 6, Ciudad de Guatemala','51000018','cliente19@ejemplo.com','activo'),
(20,'Óscar Rodas Hernández','1000000019','Avenida 10, zona 13, Ciudad de Guatemala','51000019','cliente20@ejemplo.com','activo'),

(21,'Diego Orellana Pérez','1000000020','Avenida 1, zona 21, Ciudad de Guatemala','51000020','cliente21@ejemplo.com','activo'),
(22,'Valeria Chinchilla López','1000000021','Avenida 2, zona 6, Ciudad de Guatemala','51000021','cliente22@ejemplo.com','activo'),
(23,'Juan Cabrera Morales','1000000022','Avenida 3, zona 13, Ciudad de Guatemala','51000022','cliente23@ejemplo.com','activo'),
(24,'Lucía González García','1000000023','Avenida 4, zona 21, Ciudad de Guatemala','51000023','cliente24@ejemplo.com','activo'),
(25,'Marco Alvarado Pérez','1000000024','Avenida 5, zona 6, Ciudad de Guatemala','51000024','cliente25@ejemplo.com','activo'),
(26,'Diana Barrios López','1000000025','Avenida 6, zona 13, Ciudad de Guatemala','51000025','cliente26@ejemplo.com','activo'),
(27,'Cristian Maldonado Rivera','1000000026','Avenida 7, zona 21, Ciudad de Guatemala','51000026','cliente27@ejemplo.com','activo'),
(28,'Mónica Escobar García','1000000027','Avenida 8, zona 6, Ciudad de Guatemala','51000027','cliente28@ejemplo.com','activo'),
(29,'Héctor Reyes Morales','1000000028','Avenida 9, zona 13, Ciudad de Guatemala','51000028','cliente29@ejemplo.com','activo'),
(30,'Natalia Duarte Pérez','1000000029','Avenida 10, zona 21, Ciudad de Guatemala','51000029','cliente30@ejemplo.com','activo'),

(31,'Esteban Velásquez López','1000000030','Avenida 1, zona 6, Ciudad de Guatemala','51000030','cliente31@ejemplo.com','activo'),
(32,'Patricia Quintanilla García','1000000031','Avenida 2, zona 13, Ciudad de Guatemala','51000031','cliente32@ejemplo.com','activo'),
(33,'Víctor Arriola Pérez','1000000032','Avenida 3, zona 21, Ciudad de Guatemala','51000032','cliente33@ejemplo.com','activo'),
(34,'Camila Salazar López','1000000033','Avenida 4, zona 6, Ciudad de Guatemala','51000033','cliente34@ejemplo.com','activo'),
(35,'Byron Aguilar Morales','1000000034','Avenida 5, zona 13, Ciudad de Guatemala','51000034','cliente35@ejemplo.com','activo'),
(36,'Isabel Recinos García','1000000035','Avenida 6, zona 21, Ciudad de Guatemala','51000035','cliente36@ejemplo.com','activo'),
(37,'Álvaro Solórzano Pérez','1000000036','Avenida 7, zona 6, Ciudad de Guatemala','51000036','cliente37@ejemplo.com','activo'),
(38,'Rosa Mazariegos López','1000000037','Avenida 8, zona 13, Ciudad de Guatemala','51000037','cliente38@ejemplo.com','activo'),
(39,'Julio Cardona Pérez','1000000038','Avenida 9, zona 21, Ciudad de Guatemala','51000038','cliente39@ejemplo.com','activo'),
(40,'Melissa Tobar García','1000000039','Avenida 10, zona 6, Ciudad de Guatemala','51000039','cliente40@ejemplo.com','activo'),

(41,'Sergio Samayoa López','1000000040','Avenida 1, zona 13, Ciudad de Guatemala','51000040','cliente41@ejemplo.com','activo'),
(42,'Wendy Barrera Morales','1000000041','Avenida 2, zona 21, Ciudad de Guatemala','51000041','cliente42@ejemplo.com','activo'),
(43,'Manuel Ixcoy Pérez','1000000042','Avenida 3, zona 6, Ciudad de Guatemala','51000042','cliente43@ejemplo.com','activo'),
(44,'Giselle Coy García','1000000043','Avenida 4, zona 13, Ciudad de Guatemala','51000043','cliente44@ejemplo.com','activo'),
(45,'Francisco Ajú López','1000000044','Avenida 5, zona 21, Ciudad de Guatemala','51000044','cliente45@ejemplo.com','activo'),
(46,'Regina Tzul Pérez','1000000045','Avenida 6, zona 6, Ciudad de Guatemala','51000045','cliente46@ejemplo.com','activo'),
(47,'Roberto Choc Morales','1000000046','Avenida 7, zona 13, Ciudad de Guatemala','51000046','cliente47@ejemplo.com','activo'),
(48,'Elena Canil García','1000000047','Avenida 8, zona 21, Ciudad de Guatemala','51000047','cliente48@ejemplo.com','activo'),
(49,'Andrés Chub López','1000000048','Avenida 9, zona 6, Ciudad de Guatemala','51000048','cliente49@ejemplo.com','activo'),
(50,'Beatriz Pop Pérez','1000000049','Avenida 10, zona 13, Ciudad de Guatemala','51000049','cliente50@ejemplo.com','activo');


INSERT INTO inventario_sede
(id_inventario,id_sede,id_producto,stock_actual,stock_minimo)
VALUES
(1,1,1,107,23),
(2,2,2,114,26),
(3,3,3,121,29),
(4,1,4,128,32),
(5,2,5,135,35),
(6,3,6,142,38),
(7,1,7,149,41),
(8,2,8,156,44),
(9,3,9,163,47),
(10,1,10,170,50),

(11,2,11,177,53),
(12,3,12,184,56),
(13,1,13,191,59),
(14,2,14,198,62),
(15,3,15,205,65),
(16,1,16,212,68),
(17,2,17,219,71),
(18,3,18,226,74),
(19,1,19,233,77),
(20,2,20,240,80),

(21,3,21,247,83),
(22,1,22,254,86),
(23,2,23,261,89),
(24,3,24,268,92),
(25,1,25,275,95),
(26,2,26,282,98),
(27,3,27,289,101),
(28,1,28,296,104),
(29,2,29,303,107),
(30,3,30,310,110),

(31,1,31,317,113),
(32,2,32,324,116),
(33,3,33,331,119),
(34,1,34,338,122),
(35,2,35,345,125),
(36,3,36,352,128),
(37,1,37,359,131),
(38,2,38,366,134),
(39,3,39,373,137),
(40,1,40,380,140),

(41,2,41,387,143),
(42,3,42,394,146),
(43,1,43,401,149),
(44,2,44,408,152),
(45,3,45,415,155),
(46,1,46,422,158),
(47,2,47,429,161),
(48,3,48,436,164),
(49,1,49,443,167),
(50,2,50,450,170);


INSERT INTO pedidos
(id_pedido,id_cliente,id_sede,total_sin_iva,total_con_iva,estado_pedido)
VALUES
(1,2,1,18.00,20.16,'completado'),
(2,3,2,41.00,45.92,'completado'),
(3,4,3,64.00,71.68,'completado'),
(4,5,1,92.00,103.04,'completado'),
(5,6,2,97.00,108.64,'completado'),
(6,7,3,39.00,43.68,'completado'),
(7,8,1,88.00,98.56,'completado'),
(8,9,2,96.00,107.52,'completado'),
(9,10,3,140.00,156.80,'completado'),
(10,11,1,49.00,54.88,'completado'),

(11,12,2,32.00,35.84,'completado'),
(12,13,3,80.00,89.60,'completado'),
(13,14,1,80.00,89.60,'completado'),
(14,15,2,147.00,164.64,'completado'),
(15,16,3,38.00,42.56,'completado'),
(16,17,1,29.00,32.48,'completado'),
(17,18,2,72.00,80.64,'completado'),
(18,19,3,100.00,112.00,'completado'),
(19,20,1,208.00,232.96,'completado'),
(20,21,2,49.00,54.88,'completado'),

(21,22,3,43.00,48.16,'completado'),
(22,23,1,80.00,89.60,'completado'),
(23,24,2,120.00,134.40,'completado'),
(24,25,3,142.00,159.04,'completado'),
(25,26,1,54.00,60.48,'completado'),
(26,27,2,57.00,63.84,'completado'),
(27,28,3,88.00,98.56,'completado'),
(28,29,1,60.00,67.20,'completado'),
(29,30,2,164.00,183.68,'completado'),
(30,31,3,74.00,82.88,'completado'),

(31,32,1,70.00,78.40,'procesando'),
(32,33,2,50.00,56.00,'procesando'),
(33,34,3,72.00,80.64,'procesando'),
(34,35,1,96.00,107.52,'procesando'),
(35,36,2,32.00,35.84,'procesando'),
(36,37,3,14.00,15.68,'procesando'),
(37,38,1,34.00,38.08,'procesando'),
(38,39,2,71.00,79.52,'procesando'),
(39,40,3,152.00,170.24,'procesando'),
(40,41,1,52.00,58.24,'procesando'),

(41,42,2,60.00,67.20,'pendiente'),
(42,43,3,84.00,94.08,'pendiente'),
(43,44,1,108.00,120.96,'pendiente'),
(44,45,2,84.00,94.08,'pendiente'),
(45,46,3,42.00,47.04,'pendiente'),
(46,47,1,54.00,60.48,'pendiente'),
(47,48,2,72.00,80.64,'pendiente'),
(48,49,3,54.00,60.48,'pendiente'),
(49,50,1,72.00,80.64,'pendiente'),
(50,1,2,33.00,36.96,'pendiente');
