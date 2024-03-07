-- Cliente Principal por Gasto
SELECT u.nombre, COUNT(cm.IDcompra) AS numCompras, SUM(cm.Total) AS dineroGastado 
FROM usuario AS u 
JOIN compra AS cm USING (IDusuario)
GROUP BY cm.IDusuario
HAVING COUNT(cm.IDusuario) = (
    SELECT MAX(numeroCompras)
    FROM (
        SELECT cm.IDusuario, COUNT(cm.idCompra) AS numeroCompras
        FROM compra AS cm
        GROUP BY cm.IDusuario
    ) AS usuarioMayorCompras
);

-- Producto Más Popular
SELECT producto.Nombre, SUM(carrito_compra.Cantidad) AS cantidad_vendida 
FROM carrito_compra 
JOIN producto USING (idproducto) 
GROUP BY carrito_compra.IDproducto 
HAVING SUM(carrito_compra.Cantidad) = (
    SELECT MAX(suma_cantidad) 
    FROM (
        SELECT carrito_compra.IDproducto, SUM(carrito_compra.Cantidad) AS suma_cantidad 
        FROM carrito_compra 
        GROUP BY carrito_compra.IDproducto
    ) AS maximo_producto
);

-- Clientes con Múltiples Cuentas
SELECT usuario.nombre AS nombre 
FROM usuario 
JOIN rol USING (idusuario)
GROUP BY nombre 
HAVING COUNT(idusuario) > 1;

-- Producto con Más Promociones y Promedio de Descuento
SELECT 
    pp.IDproducto,
    COUNT(pp.IDpromocion) AS TotalPromociones,
    AVG(pp.Descuento) AS PromedioDescuento
FROM 
    Promocion_producto pp
GROUP BY 
    pp.IDproducto
HAVING 
    COUNT(pp.IDpromocion) = (
        SELECT MAX(TotalPromociones) FROM (
            SELECT 
                IDproducto, 
                COUNT(IDpromocion) AS TotalPromociones
            FROM 
                Promocion_producto
            GROUP BY 
                IDproducto
        ) AS SubConsulta
    );

-- Cliente con Más Reseñas y Calificación Promedio
SELECT 
    usuario.Nombre AS nombre_usuario, 
    COUNT(opinion.IDopinion) AS cantidad_opiniones, 
    AVG(opinion.Calificacion) AS promedio_calificacion 
FROM 
    usuario 
JOIN opinion USING (idusuario)
GROUP BY 
    usuario.Nombre 
HAVING 
    cantidad_opiniones = (
        SELECT MAX(cantidad_opiniones) FROM (
            SELECT 
                usuario.Nombre, 
                COUNT(opinion.IDopinion) AS cantidad_opiniones 
            FROM 
                usuario 
            JOIN opinion USING (idusuario)
            GROUP BY 
                usuario.Nombre
        ) AS maxima_cantidad
    );
    
    
-- Calificación por producto
SELECT p.nombre AS producto, AVG(o.Calificacion) AS Promedio_Calificacion
FROM producto as p JOIN opinion as o USING (IDproducto)
GROUP BY p.Nombre;


-- genero mas vendido


SELECT producto.Genero , sum(carrito_compra.cantidad) as cantidad_ventas from producto join carrito_compra using
(idproducto) group by producto.Genero having cantidad_ventas = (SELECT max(cantidad_ventas) from (SELECT producto.Genero , sum(carrito_compra.cantidad) as cantidad_ventas from producto join carrito_compra using
(idproducto) group by producto.Genero) as maximo);

-- ciudad en mas detalles de envio


SELECT Ciudad.nombre, COUNT(Detalle_envio.IDciudad) AS NumeroEnvios
FROM Detalle_envio
JOIN Ciudad ON Detalle_envio.IDciudad = Ciudad.IDciudad
GROUP BY  Ciudad.nombre having NumeroEnvios = (select max(NumeroEnvios) from (SELECT Ciudad.nombre, COUNT(Detalle_envio.IDciudad) AS NumeroEnvios
FROM Detalle_envio
JOIN Ciudad ON Detalle_envio.IDciudad = Ciudad.IDciudad
GROUP BY  Ciudad.nombre) as maximo_envios);



-- Hombres por encima de 30 años que mas compras han hecho

SELECT u.nombre AS Usuario, COUNT(c.IDcompra) AS Numero_Compras
FROM usuario AS u
JOIN compra AS c ON u.IDusuario = c.IDusuario
WHERE u.sexo = 'Hombre' AND u.edad >= 30
GROUP BY u.nombre;


-- selecciona todas las personas que no ha comprado ningún producto

SELECT u.nombre AS Usuario
FROM usuario as u
LEFT JOIN compra as c ON u.IDusuario = c.IDusuario
WHERE c.IDcompra IS NULL;

-- Producto sin stock
SELECT p.nombre AS Producto, t.nombre AS Talla
FROM producto as p 
JOIN stock_talla as stck USING (idProducto)
JOIN talla as t USING (idTalla)
WHERE stck.stock = 0;