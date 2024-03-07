-- Registros para la tabla Usuario
INSERT INTO PROYECTO.Usuario (Nombre, Telefono, Correo, Sexo, Edad) VALUES
('Juan Perez', 123456789, 'juan@email.com', 'Hombre', 25),
('Maria Rodriguez', 987654321, 'maria@email.com', 'Mujer', 30),
('Luisa Martinez', 555123789, 'luisa@email.com', 'Mujer', 28),
('Pedro Gomez', 789456123, 'pedro@email.com', 'Hombre', 35),
('Ana Ramirez', 321654987, 'ana@email.com', 'Mujer', 22),
('Carlos Herrera', 456789321, 'carlos@email.com', 'Hombre', 40),
('Laura Torres', 987123654, 'laura@email.com', 'Mujer', 31),
('Javier Lopez', 321789654, 'javier@email.com', 'Hombre', 27),
('Isabel Garcia', 654321987, 'isabel@email.com', 'Mujer', 33),
('Gabriel Rodriguez', 123987456, 'gabriel@email.com', 'Hombre', 29);

-- Registros para la tabla Rol
INSERT INTO PROYECTO.Rol (User, Password, TipoRol, IDusuario) VALUES
('juan_usuario', 'password123', 'Cliente', 1),
('admin_usuario', 'adminpass', 'Admin', 1),
('luisa_usuario', 'luisapass', 'Cliente', 3),
('pedro_admin', 'admin123', 'Admin', 4),
('ana_usuario', 'anapass', 'Cliente', 5),
('carlos_admin', 'admin456', 'Admin', 6),
('laura_usuario', 'laurapass', 'Cliente', 7),
('javier_admin', 'admin789', 'Admin', 8),
('isabel_usuario', 'isabelpass', 'Cliente', 9),
('gabriel_admin', 'admin987', 'Admin', 10),
('laura_admin', 'lauraadmin', 'Admin', 7);

-- Registros para la tabla Promocion
INSERT INTO PROYECTO.Promocion (Fecha_inicion, Fecha_final, Descripcion, Tipo) VALUES
('2024-03-01', '2024-03-15', 'Descuento de primavera', 'grupal'),
('2024-04-01', '2024-04-10', 'Oferta individual', 'individual'),
('2024-04-15', '2024-04-30', 'Descuento de primavera', 'grupal'),
('2024-05-01', '2024-05-10', 'Oferta individual', 'individual'),
('2024-06-01', '2024-06-15', 'Verano especial', 'grupal');

-- Registros para la tabla Talla
INSERT INTO PROYECTO.Talla (nombre) VALUES
('XS'),
('S'),
('M'),
('L'),
('XL');

-- Registros para la tabla Producto
INSERT INTO PROYECTO.Producto (Nombre, Precio, Categoria, Descripcion, Imagen, Tipo, Genero) VALUES
('Camiseta Azul', 19.99, 'Camiseta', 'Camiseta de algodon azul', 'Estampado1', 'Personalizado', 'Hombres'),
('Chaqueta Deportiva', 59.99, 'Chaqueta', 'Chaqueta impermeable para deportes', 'Estampado2', 'Deportivo', 'Hombres'),
('Buzo Gris', 39.99, 'Buzos', 'Buzo de algodon gris', 'Estampado3', 'Personalizado', 'Hombres'),
('Sudadera Roja', 49.99, 'Sudaderas', 'Sudadera comoda en color rojo', 'Estampado4', 'Deportivo', 'Mujeres'),
('Camiseta Blanca', 15.99, 'Camiseta', 'Camiseta clasica en color blanco', 'Estampado5', 'Personalizado', 'Mujeres'),
('Chaqueta Negra', 69.99, 'Chaqueta', 'Chaqueta impermeable en color negro', 'Estampado6', 'Deportivo', 'Hombres'),
('Buzo Rosa', 45.99, 'Buzos', 'Buzo de algodon rosa', 'Estampado7', 'Personalizado', 'Mujeres'),
('Sudadera Azul', 54.99, 'Sudaderas', 'Sudadera comoda en color azul', 'Estampado8', 'Deportivo', 'Mujeres'),
('Chaqueta Verde', 34.99, 'Chaqueta', 'Chaqueta ligera en color verde', 'Estampado9', 'Deportivo', 'Hombres'),
('Camiseta Amarilla', 22.99, 'Camiseta', 'Camiseta vibrante en color amarillo', 'Estampado10', 'Personalizado', 'Niños');

-- Registros para la tabla Stock_talla
INSERT INTO PROYECTO.Stock_talla (IDproducto, IDtalla, Stock) VALUES
(1, 3, 50),  -- Camiseta Azul - M
(2, 4, 30),  -- Chaqueta Deportiva - L
(3, 4, 20),  -- Buzo Gris - L
(4, 3, 15),  -- Sudadera Roja - M
(5, 2, 30),  -- Camiseta Blanca - S
(6, 5, 25),  -- Chaqueta Negra - XL
(7, 3, 18),  -- Buzo Rosa - M
(8, 2, 12),  -- Sudadera Azul - S
(9, 4, 28),  -- Chaqueta Verde - L
(10, 1, 35); -- Camiseta Amarilla - XS

-- Registros para la tabla Promocion_producto
INSERT INTO PROYECTO.Promocion_producto (IDproducto, IDpromocion, Descuento) VALUES
(1, 1, 10),
(2, 2, 15),
(3, 3, 12),
(4, 4, 18),
(5, 5, 10),
(6, 5, 15),
(7, 1, 20),
(8, 1, 25),
(9, 3, 15),
(10, 5, 30);


-- Registros para la tabla Opinion
INSERT INTO PROYECTO.Opinion (Comentario, Calificacion, Fecha, IDproducto, IDusuario) VALUES
('¡Me encanta esta camiseta!', '5', '2024-03-02 10:30:00', 1, 1),
('La chaqueta es perfecta para correr', '4', '2024-03-03 12:45:00', 2, 2),
('El buzo gris es muy abrigador', '4', '2024-03-10 09:15:00', 3, 1),
('Me encanta la sudadera roja, muy comoda', '5', '2024-03-12 14:30:00', 4, 2),
('La camiseta blanca es basica y perfecta', '4', '2024-03-15 11:00:00', 5, 5),
('La chaqueta negra es ideal para deportes', '5', '2024-03-18 13:45:00', 6, 6),
('El buzo rosa es muy lindo y femenino', '4', '2024-03-20 10:20:00', 7, 2),
('La sudadera azul es mi favorita para correr', '5', '2024-03-22 16:00:00', 8, 10),
('La chaqueta verde es ligera y comoda', '4', '2024-03-25 12:10:00', 9, 9),
('La camiseta amarilla resalta muy bien', '5', '2024-03-28 10:45:00', 10, 10),
('La chaqueta verde es muy fea', '1', '2024-02-29 9:50:00', 9, 2),
('La camiseta blanca es linda, pero no muy comoda', '3', '2024-01-18 10:00:00', 5, 8),
('La chaqueta verde es muy incomoda', '1', '2024-02-10 8:50:00', 9, 1);

-- Registros para la tabla Compra
INSERT INTO PROYECTO.Compra (fecha, Hora, Total, metodoPago, IDusuario) VALUES
('2024-03-05', '14:20:00', 39.98, 'Tarjeta', 1),
('2024-03-07', '16:45:00', 59.99, 'PayPal', 2),
('2024-04-05', '15:20:00', 39.99, 'Tarjeta', 3);

-- Registros para la tabla Carrito_compra
INSERT INTO PROYECTO.Carrito_compra (IDcompra, IDproducto, Cantidad) VALUES
(1, 1, 2),
(2, 2, 1),
(3, 3, 1);

-- Registros para la tabla Departamento
INSERT INTO PROYECTO.Departamento (nombre) VALUES
('Antioquia'),
('Bogota'),
('Valle del Cauca'),
('Santander');

-- Registros para la tabla Ciudad
INSERT INTO PROYECTO.Ciudad (nombre, IDdepartamento) VALUES
('Medellin', 1),
('Bogota', 2),
('Cali', 3),
('Bucaramanga', 4);

-- Registros para la tabla Detalle_envio
INSERT INTO PROYECTO.Detalle_envio (codigoPostal, Direccion, Barrio, estado, IDcompra, IDciudad) VALUES
(5001, 'Calle 123', 'Barrio A', 'en proceso', 1, 1),
(11001, 'Av. Principal 456', 'Barrio B', 'enviado', 2, 2),
(76001, 'Carrera 45 #67-89', 'Barrio C', 'en proceso', 3, 3);