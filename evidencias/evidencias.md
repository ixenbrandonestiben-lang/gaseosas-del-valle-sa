
# Evidencias del trabajo de base de datos


## 1. Estado general


Se desarrolló la base de datos de la empresa distribuidora Gaseosas del Valle S.A. siguiendo un enfoque de modelado relacional en MySQL y MySQL Workbench, con scripts para DDL, DML y DQL.


## 2. Componentes implementados


### Base de datos


- Nombre del esquema: `gaseosas_del_valle`
- Creación del esquema con eliminación previa si existía.


### Tablas principales


- `clientes`
- `productos`
- `sedes`
- `inventario_sede`
- `pedidos`
- `detalle_pedido`
- `auditoria_precios`
- `log_stock_critico`


### Funciones


- `fn_calcular_total_con_iva`
- `fn_validar_stock`


Estas funciones permiten calcular el total con IVA y validar si la cantidad solicitada puede atenderse según el stock disponible.


### Triggers


- `tr_actualizar_stock`
- `tr_auditar_cambio_precio`


Los triggers cubren la reducción del inventario al registrar un pedido y la auditoría del cambio de precio de un producto.


### Vistas


- `vista_resumen_pedidos_por_sede`
- `vista_productos_bajo_stock`
- `vista_cliente_activos`


Estas vistas sirven para reportes rápidos sobre ventas por sede, productos con bajo stock y clientes activos.


## 3. Datos de prueba


Se cargó información inicial de:


- Productos del catálogo.
- Sedes operativas.
- Clientes registrados.
- Inventario por producto y sede.
- Pedidos y detalle de pedido.


## 4. Consultas de validación


El proyecto incluye consultas para:


- Revisar productos bajo el mínimo de stock.
- Consultar pedidos por rango de fechas.
- Identificar productos más vendidos.
- Contar pedidos por cliente.
- Buscar clientes por nombre parcial.
- Agrupar ventas por sede.


## 5. Conclusión


La evidencia del trabajo confirma que la base de datos cumple con un flujo operativo básico de una distribuidora de bebidas: gestión de clientes, catálogo, inventario, ventas y trazabilidad de cambios de precio. La solución quedó organizada para ejecutarse en MySQL y ser visualizada y administrada en MySQL Workbench.
