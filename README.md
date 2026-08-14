Gaseosas del Valle S.A.

## Descripción

Sistema de base de datos para la gestión operativa de una empresa distribuidora de bebidas gaseosas. El proyecto está orientado a modelar, documentar y validar la información relacionada con clientes, productos, sedes, inventario, pedidos, auditoría de precios y consultas analíticas.

## Objetivos

- Diseñar una base de datos relacional en MySQL para la gestión empresarial.
- Centralizar la información de clientes, productos, sedes e inventarios.
- Registrar y controlar pedidos y detalles de venta.
- Validar el stock disponible antes de procesar ventas.
- Mantener trazabilidad de cambios de precios mediante auditoría.
- Generar consultas y reportes para análisis operativo.
- Documentar la solución con estructura clara para MySQL Workbench y scripts SQL.

## Tecnologías usadas

- MySQL
- MySQL Workbench
- Visual Studio Code
- GitHub

## Estructura del proyecto

```text
gaseosas-del-valle-sa/
├── analisis/
│   ├── requerimientos.md
│   └── imagenes/
├── ddl/
│   ├── tables.sql
│   ├── funciones.sql
│   ├── triggers.sql
│   ├── views.sql
│   └── eventos.sql
├── dml/
│   └── inserciones.sql
├── dql/
│   └── consultas.sql
├── evidencias/
│   ├── evidencias.md
│   ├── imagenes-consultas-basicas/
│   ├── imagenes-funciones/
│   ├── imagenes-vistas/
│   └── imagenes-eventos-triggers/
├── README.md
└── .gitignore
```

## Alcance general

Este proyecto incluye la creación de la base de datos, la definición de tablas, validaciones de integridad, funciones almacenadas, triggers, vistas, inserción de datos de prueba y consultas para análisis y validación del funcionamiento del sistema.

## Documentación relacionada

- Requerimientos básicos: `analisis/requerimientos.md`
- Evidencias y validaciones: `evidencias/evidencias.md