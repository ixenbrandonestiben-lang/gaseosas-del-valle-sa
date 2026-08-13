# Requerimientos para la base de datos de Gaseosas del Valle S.A.


## 1. Introducción


Este documento describe los requisitos funcionales, técnicos y de modelado que se utilizaron para trabajar la base de datos de la empresa distribuidora Gaseosas del Valle S.A. El proyecto fue desarrollado exclusivamente con MySQL y MySQL Workbench, con enfoque en la creación, validación y análisis de la estructura de la base de datos.


## 2. Objetivo del proyecto


Diseñar y documentar una base de datos relacional que permita:


- Registrar clientes y sus datos principales.
- Administrar el catálogo de productos y sus precios.
- Controlar las sedes de distribución y su capacidad de almacenamiento.
- Gestionar el inventario por sede y producto.
- Registrar pedidos y detalles de venta según la demanda por sede.
- Validar el stock antes de confirmar una venta.
- Mantener un historial de cambios de precios.
- Generar reportes operativos y alertas de inventario bajo.


## 3. Alcance funcional


### 3.1 Gestión de clientes


La base de datos debe permitir:


- Registrar clientes con identificación, dirección, teléfono, correo y estado.
- Validar la unicidad de la información principal de cada cliente.
- Consultar clientes activos e históricos por su estado.
- Realizar búsquedas por nombre, identificación o datos básicos.


### 3.2 Gestión de productos


Se debe controlar:


- Nombre del producto.
- Categoría del producto.
- Precio de venta.
- Volumen del producto.
- Estado del producto en el sistema.
- Registro del usuario responsable de la actualización.


El sistema debe permitir detectar cambios de precio y registrar la auditoría de cada modificación.


### 3.3 Gestión de sedes


Cada sede debe contar con:


- Nombre y ubicación.
- Capacidad de almacenamiento.
- Encargado responsable.
- Estado activo o inactivo.


Esto permite distribuir el inventario de manera operativa y conocer la capacidad real de cada punto de despacho.


### 3.4 Gestión de inventario


Se debe manejar el inventario por sede y producto, con:


- Stock actual.
- Stock mínimo requerido.
- Fecha de actualización.
- Restricción de cantidad no negativa.


La lógica debe prevenir ventas cuando el stock disponible no alcanza la cantidad solicitada.


### 3.5 Gestión de pedidos


El sistema debe permitir:


- Registrar pedidos asociados a un cliente y una sede.
- Definir la fecha del pedido.
- Calcular el total sin IVA y con IVA.
- Establecer estados como pendiente, procesado, entregado o cancelado.
- Mantener el detalle de productos por pedido, cantidad y subtotal.


### 3.6 Auditoría y trazabilidad


Se requiere:


- Guardar el cambio de precio anterior y nuevo en una tabla de auditoría.
- Registrar cuándo se realizó el cambio.
- Mantener mensajes de alertas ante inventario crítico.
- Evitar la pérdida de trazabilidad sobre decisiones de negocio.


## 4. Requisitos de integridad de datos


La base de datos debe garantizar consistencia mediante:


- Claves primarias en todas las tablas principales.
- Claves foráneas para relaciones entre clientes, productos, sedes, pedidos e inventario.
- Restricciones CHECK para cantidades positivas y capacidades válidas.
- Valores obligatorios en campos críticos.
- Unicidad de registros por combinación de sede y producto en inventario.


Se establecen validaciones básicas como:


- stock_actual >= 0
- stock_minimo >= 0
- capacidad_almacenamiento > 0
- cantidad_producto > 0
- precio_producto > 0
- estado del pedido y estado del cliente definidos por enumeraciones o valores controlados


## 5. Requisitos funcionales de negocio


### 5.1 Validación de stock


Antes de registrar un detalle de pedido, el sistema debe asegurar que:


- El producto exista en la sede indicada.
- El stock actual sea suficiente para cubrir la cantidad solicitada.
- Si no hay stock suficiente, el sistema debe rechazar la operación con un error claro.


### 5.2 Cálculo del total con IVA


Se requiere una función que calcule el total del pedido con IVA.


- El subtotal se obtiene de la suma de los detalles.
- El valor con IVA se aplica con una tasa del 12%.
- El cálculo debe entregarse con redondeo a dos decimales.


### 5.3 Alertas por stock mínimo


Cuando el stock actual es menor o igual al mínimo configurado, la base de datos debe generar una alerta o registro de revisión para que el área operativa tome acciones.


### 5.4 Auditoría de precio


Si el precio de un producto cambia, la base de datos debe guardar:


- ID del producto.
- Precio anterior.
- Precio nuevo.
- Fecha del cambio.


Esto permite revisar el impacto comercial y financiero de los ajustes.


## 6. Requisitos de MySQL y MySQL Workbench


### 6.1 Entorno recomendado


- MySQL Server 8.x o compatible.
- MySQL Workbench para modelado, administración y validación.
- Schemas y scripts SQL organizados por tipo de operación: DDL, DML y DQL.


### 6.2 Uso de MySQL Workbench


Con MySQL Workbench se debe:


- Crear el esquema `gaseosas_del_valle`.
- Diseñar el modelo entidad-relación (EER).
- Definir tablas, relaciones, restricciones y tipos de dato.
- Realizar forward engineering del modelo a la base de datos.
- Revisar la estructura de tablas, índices y restricciones.
- Validar el comportamiento de triggers, funciones y vistas.


### 6.3 Requerimientos para la implementación


El proyecto requiere:


- Script de creación de base de datos.
- Script de definición de tablas.
- Script de funciones almacenadas.
- Script de triggers.
- Script de vistas.
- Script de inserción de datos de prueba.
- Script de consultas de análisis y validación.


## 7. Entidades principales identificadas


Las tablas principales definidas para la solución son:


- clientes
- productos
- sedes
- inventario_sede
- pedidos
- detalle_pedido
- auditoria_precios
- log_stock_critico


## 8. Requisitos básicos para entrega del trabajo


Para entregar el trabajo correctamente, se debe contar con:


- Base de datos creada en MySQL.
- Modelo estructural documentado en MySQL Workbench.
- Scripts SQL organizados y ejecutables.
- Validación de relaciones e integridad.
- Ejecución de funciones, triggers y vistas.
- Carga inicial de datos de prueba.
- Consultas que respalden análisis operativo y financiero.


## 9. Resultado esperado


La base de datos debe permitir representar el flujo real de una distribuidora de gaseosas, desde la gestión de clientes y productos hasta la venta, el control de inventario y la trazabilidad de movimientos importantes. Su diseño debe apoyar decisiones operativas, reportes de ventas y control del stock con herramientas nativas de MySQL y MySQL Workbench.


