<h1 align="center">Proyecto de Almacenamiento</h1>

<p align="center">
  <img src="Images/mysqlworkbench.png" width="200" alt="Descripción de la imagen">
</p>

# SportTrend

En el proyecto se ha diseñado e implementado un sistema de almacenamiento para respaldar una aplicación web de venta y personalización de ropa deportiva. Se han creado las tablas necesarias en la base de datos, se han ingresado valores de muestra en estas tablas y se han realizado consultas para verificar el funcionamiento del sistema.
# Índice


1. [Plantear La Base De Datos](#plantear-la-base-de-datos)
2. [Tablas y Registros](#tablas-y-registros)
    - [Tabla Usuario](#tabla-usuario)
    - [Tabla Rol](#tabla-rol)
    - [Tabla Promoción](#tabla-promoción)
    - [Tabla Producto](#tabla-producto)
    - [Tabla Talla](#tabla-talla)
    - [Tabla Stock_Talla](#tabla-stock-talla)
    - [Tabla Promoción_producto](#tabla-promocion-producto)
    - [Tabla Opinion](#tabla-opinion)
    - [Tabla Compra](#tabla-compra)
    - [Tabla Carrito_compra](#tabla-carrito_compra)
    - [Tabla Departamento](#tabla-departamento)
    - [Tabla Ciudad](#tabla-ciudad)
    - [Tabla Detalle_envio](#tabla-detalle_envio)
3. [Consultas para Análisis de Valor](#consultas-para-análisis-de-valor)



## Plantear La Base De Datos


Para esta tarea, primero se realizó un modelo de entidad-relación para visualizar las relaciones entre las entidades. Luego, se implementó un modelo relacional basado en el modelo de entidad-relación para representar la estructura de la base de datos.
### Modelo Entidad-Relacion

![Texto Alternativo](Images/MER.drawio.png)

### Modelo de Entidad

![Texto Alternativo](Images/MR.drawio.png)


## Tablas y Registros

Algunas tablas y registros hechos para el proyecto a base del modelo relacional son los siguiente:

### Tabla Usuario

#### Ejemplo de Inserción de Registro

```sql
INSERT INTO PROYECTO.Usuario (Nombre, Telefono, Correo, Sexo, Edad) VALUES
('Juan Perez', 123456789, 'juan@email.com', 'Hombre', 25);
```

| IDusuario | Nombre          | Telefono   | Correo           | Sexo   | Edad |
|-----------|-----------------|------------|------------------|--------|------|
| 1         | Juan Perez      | 123456789  | juan@email.com   | Hombre | 25   |
| 2         | Maria Rodriguez | 987654321  | maria@email.com  | Mujer  | 30   |
| ...       | ...             | ...        | ...              | ...    | ...  |


### Ejemplo de Inserción de Registro En Tabla Rol
```sql
INSERT INTO PROYECTO.Rol (User, Password, TipoRol, IDusuario) VALUES
('juan_usuario', 'password123', 'Cliente', 1);

```
### Tabla Rol

| IDrol | User           | Password   | TipoRol | IDusuario |
|-------|----------------|------------|---------|-----------|
| 1     | juan_usuario   | password123| Cliente | 1         |
| 2     | admin_usuarioz | adminpass  | Admin   | 1         |
| ...   | ...            | ...        | ...     | ...       |


### Tabla Promoción

```sql
INSERT INTO PROYECTO.Promocion (Fecha_inicion, Fecha_final, Descripcion, Tipo) VALUES
('2024-03-01', '2024-03-15', 'Descuento de primavera', 'grupal');

```
| IDpromocion | Fecha_inicion | Fecha_final | Descripcion          | Tipo   |
|-------------|---------------|-------------|----------------------|--------|
| 1           | 2024-03-01    | 2024-03-15  | Descuento de primavera | grupal |
| 2           | 2024-04-01    | 2024-04-10  | Oferta individual     | individual |
| ...         | ...           | ...         | ...                  | ...    |



### Tabla Producto
```sql
INSERT INTO PROYECTO.Producto (Nombre,  Precio, Categoria, Descripcion, Imagen, Tipo,Genero) VALUES
('Camiseta Azul', 19.99, 'Camiseta', 'Camiseta de algodon azul', 'Estampado1', 'Personalizado','Hombres');

```



| IDproducto | Nombre              | Precio | Categoria  | Descripcion                      | Imagen       | Tipo          | Genero   |
|------------|---------------------|--------|------------|----------------------------------|--------------|---------------|----------|
| 1          | Camiseta Azul       | 19.99  | Camiseta   | Camiseta de algodon azul        | Estampado1   | Personalizado | Hombres  |
| 2          | Chaqueta Deportiva  | 59.99  | Chaqueta   | Chaqueta impermeable para deportes | Estampado2 | Deportivo     | Hombres  |
| ...        | ...                 | ...    | ...        | ...                              | ...          | ...           | ...      |


### Tabla Talla
```sql
INSERT INTO PROYECTO.Talla (nombre) VALUES
('XS');


```
| IDtalla | nombre |
|---------|--------|
| 1       | XS     |
| 2       | S      |
| 3       | M      |


### Tabla Stock Talla

```sql
INSERT INTO PROYECTO.Stock_talla (IDproducto, IDtalla, Stock) VALUES
(1, 3, 50);

```

| IDproducto | IDtalla | Stock |
|------------|---------|-------|
| 1          | 3       | 50    |
| 2          | 4       | 30    |
| ...        | ...     | ...   |


### Tabla Promocion Producto

```sql
INSERT INTO PROYECTO.Promocion_producto (IDproducto, IDpromocion, Descuento) VALUES
(1, 1, 10);
```
| IDproducto | IDpromocion | Descuento |
|------------|-------------|-----------|
| 1          | 1           | 10        |
| 2          | 2           | 15        |
| ...        | ...         | ...       |


### Tabla opinion
```sql
INSERT INTO PROYECTO.Opinion (Comentario, Calificacion, Fecha, IDproducto, IDusuario) VALUES
('¡Me encanta esta camiseta!', '5', '2024-03-02 10:30:00', 1, 1);

```

| IDopinion | Comentario                                   | Calificacion | Fecha                 | IDproducto | IDusuario |
|-----------|----------------------------------------------|--------------|-----------------------|------------|-----------|
| 1         | ¡Me encanta esta camiseta!                  | 5            | 2024-03-02 10:30:00  | 1          | 1         |
| 2         | La chaqueta es perfecta para correr         | 4            | 2024-03-03 12:45:00  | 2          | 2         |
| ...       | ...                                          | ...          | ...                   | ...        | ...       |


###  Tabla Compra
```sql
INSERT INTO PROYECTO.Compra (fecha, Hora, Total, metodoPago, IDusuario) VALUES
('2024-03-05', '14:20:00', 39.98, 'Tarjeta', 1);

```

| IDcompra | fecha       | Hora      | Total | metodoPago | IDusuario |
|----------|-------------|-----------|-------|------------|-----------|
| 1        | 2024-03-05  | 14:20:00  | 39.98 | Tarjeta    | 1         |
| 2        | 2024-03-07  | 16:45:00  | 59.99 | PayPal     | 2         |
| ...      | ...         | ...       | ...   | ...        | ...       |


### Tabla Carrito_compra

```sql
INSERT INTO PROYECTO.Carrito_compra (IDcompra, IDproducto, Cantidad) VALUES
(1, 1, 2);

```

| IDcompra | IDproducto | Cantidad |
|----------|------------|----------|
| 1        | 1          | 2        |
| 2        | 2          | 1        |
| ...      | ...        | ...      |


### Tabla Departamento
```sql
INSERT INTO PROYECTO.Departamento (nombre) VALUES
('Antioquia');
```

| IDdepartamento | nombre          |
|----------------|-----------------|
| 1              | Antioquia       |
| 2              | Bogota          |
| ...            | ...             |


### Tabla Ciudad

```sql
INSERT INTO PROYECTO.Ciudad (nombre, IDdepartamento) VALUES
('Medellin', 1);

```

| IDciudad | nombre       | IDdepartamento |
|----------|--------------|-----------------|
| 1        | Medellin      | 1               |
| 2        | Bogota        | 2               |
| ...      | ...          | ...             |


### Tabla Detalle_envio
```sql
INSERT INTO PROYECTO.Detalle_envio (codigoPostal, Direccion, Barrio, estado, IDcompra, IDciudad) VALUES
(5001, 'Calle 123', 'Barrio A', 'en proceso', 1, 1);


```

| IDenvio | codigoPostal | Direccion           | Barrio  | estado           | IDcompra | IDciudad |
|---------|--------------|---------------------|---------|------------------|----------|----------|
| 1       | 5001         | Calle 123           | Barrio A| en proceso       | 1        | 1        |
| 2       | 11001        | Av. Principal 456   | Barrio B| enviado          | 2        | 2        |
| ...     | ...          | ...                 | ...     | ...              | ...      | ...      |



## Consultas para Análisis de Valor

Se realizaron consultas para responder a preguntas clave que podrían proporcionar insights valiosos para el negocio:

1. **Cliente Principal por Gasto:**
   - ¿Quién es el cliente que ha realizado la mayor cantidad de compras y cuánto ha gastado en total?
       ```sql
        SELECT u.nombre, count(cm.IDcompra) as numCompras, sum(cm.Total) as dineroGastado FROM usuario as u JOIN compra as cm USING (IDusuario)
        GROUP BY cm.IDusuario
        HAVING count(cm.IDusuario) = (SELECT max(numeroCompras)
        FROM (SELECT cm.IDusuario, count(cm.idCompra) as numeroCompras
        FROM compra as cm
        GROUP BY cm.IDusuario) as usuarioMayorCompras);
      ```
     


2. **Producto Más Popular:**
   - ¿Cuál es el producto que se ha vendido en mayor cantidad?
       ```sql
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
      ```
3. **Clientes con Múltiples Cuentas:**
   - ¿Cuáles son los nombres de las personas que tienen más de una cuenta registrada?
       ```sql
      SELECT usuario.nombre AS nombre 
      FROM usuario 
      JOIN rol USING (idusuario)
      GROUP BY nombre 
      HAVING COUNT(idusuario) > 1;

      ```
       
4. **Producto con Más Promociones y Promedio de Descuento:**
   - ¿Qué producto tiene la mayor cantidad de promociones y cuál es el promedio de descuento para esas promociones?
       ```sql
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

      ```
5. **Cliente con Más Reseñas y Calificación Promedio:**
   - ¿Quién es la persona que ha realizado la mayor cantidad de reseñas y cuál es la calificación promedio que ha asignado?

     ```sql
      SELECT usuario.Nombre AS nombre_usuario, COUNT(opinion.IDopinion) AS cantidad_opiniones, AVG(opinion.Calificacion) AS promedio_calificacion 
      FROM usuario 
      JOIN opinion USING (idusuario)
      GROUP BY usuario.Nombre 
      HAVING cantidad_opiniones = (SELECT MAX(cantidad_opiniones) FROM 
          (SELECT usuario.Nombre, COUNT(opinion.IDopinion) AS cantidad_opiniones FROM usuario 
          JOIN opinion USING (idusuario)
          GROUP BY usuario.Nombre) AS maxima_cantidad);

      ```

