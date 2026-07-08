# Construcción de base de datos en SQL Server, MySQL/MariaDB y PostgreSQL

Para la construcción de objetos dentro de una base de datos se utilizará el lenguaje **SQL** (**Structured Query Language**), el cual se divide en **5 grandes categorías**.

---

## SQL

SQL se divide en:

- **DDL**: Data Definition Language
- **DML**: Data Manipulation Language
- **DQL**: Data Query Language
- **DCL**: Data Control Language
- **TCL**: Transaction Control Language

---

# SQL-DDL

## Lenguaje de definición de datos

El **DDL** se utiliza para **crear y modificar la estructura de una base de datos**.

Con DDL trabajamos sobre los objetos de la base de datos, como:

- Base de datos
- Tablas
- Vistas
- Índices
- Restricciones
- Esquemas
- Procedimientos almacenados
- Funciones
- Triggers o disparadores

---

## Comandos principales de DDL

| Comando | Función |
|:---|:---|
| `CREATE` | Crear objetos |
| `ALTER` | Modificar objetos |
| `DROP` | Eliminar objetos |
| `TRUNCATE` | Vaciar una tabla |
| `RENAME` | Renombrar objetos, según el sistema gestor de base de datos |

---

# SQL-DML

## Lenguaje de manipulación de datos

El **DML** sirve para **trabajar con la información almacenada** en las tablas.

> **Nota:**  
> DML no cambia la estructura de la base de datos, solo modifica los registros.

---

## Comandos principales de DML

| Comando | Función |
|:---|:---|
| `INSERT` | Inserta registros |
| `UPDATE` | Actualiza registros |
| `DELETE` | Elimina registros |

---

# SQL-DQL

## Lenguaje de consulta de datos

El **DQL** sirve para **consultar información** almacenada en la base de datos.

---

## Comando principal de DQL

| Comando | Función |
|:---|:---|
| `SELECT` | Consultar información |

---

## Elementos comunes en consultas SQL

Generalmente, `SELECT` se combina con:

- `WHERE`
- `ORDER BY`
- `GROUP BY`
- `HAVING`
- `JOIN`
  - `LEFT JOIN`
  - `RIGHT JOIN`
  - `INNER JOIN`
  - `CROSS JOIN`
  - `FULL JOIN`
- `DISTINCT`
- `TOP` / `LIMIT`
- Funciones de agregado
- Funciones de ventana

---

# SQL-DCL

## Lenguaje de control de datos

El **DCL** se utiliza para **controlar los permisos y accesos** dentro de una base de datos.

---

## Comandos principales de DCL

| Comando | Función |
|:---|:---|
| `GRANT` | Otorga permisos |
| `REVOKE` | Quita permisos |
| `DENY` | Niega permisos, principalmente en SQL Server |

---

# SQL-TCL

## Lenguaje de control de transacciones

El **TCL** se utiliza para **controlar transacciones** dentro de una base de datos.

Una transacción es un conjunto de operaciones que deben ejecutarse correctamente como una unidad.

---

## Comandos principales de TCL

| Comando | Función |
|:---|:---|
| `COMMIT` | Confirma los cambios realizados |
| `ROLLBACK` | Deshace los cambios realizados |
| `SAVEPOINT` | Crea un punto de restauración dentro de una transacción |

---

# Nomenclatura de construcción

Para la construcción de la base de datos se utilizará la nomenclatura **snake_case**.

---

## Convenciones generales

| Objeto | Convención | Ejemplo |
|:---|:---|:---|
| Base de datos | `snake_case` | `control_escolar` |
| Esquema | `snake_case` | `ventas`, `rh`, `seguridad` |
| Tabla | Singular en `snake_case` | `cliente`, `pedido`, `detalle_pedido` |
| Columna | `snake_case` | `cliente_id`, `fecha_registro`, `correo_electronico` |
| PK | `tabla_id` | `cliente_id`, `producto_id` |
| FK | Igual que la PK referenciada | `cliente_id`, `categoria_id` |
| Tabla puente | `<tabla1>_<tabla2>` | `alumno_curso`, `producto_proveedor` |

---

# Nomenclatura de restricciones

Las restricciones deben tener nombres claros para identificar fácilmente su función dentro de la base de datos.

---

## Convenciones para restricciones

| Restricción | Convención | Ejemplo |
|:---|:---|:---|
| Primary Key | `pk_nombre_tabla` | `pk_cliente` |
| Foreign Key | `fk_tabla_origen_tabla_referenciada` | `fk_pedido_cliente` |
| Unique | `uq_tabla_columna` | `uq_cliente_correo_electronico` |
| Check | `ck_tabla_columna` | `ck_producto_precio` |
| Default | `df_tabla_columna` | `df_cliente_activo` |

---

## Ejemplos de restricciones

```sql
pk_cliente
fk_pedido_cliente
uq_cliente_correo_electronico
ck_producto_precio
df_cliente_activo
    ```
### DDL en SQL SERVER  CREATE, ALTER Y DROP PARA LA CREACION Y MODIFICACION DE TABLAS 

**Sintaxis de creacion de tablas**
```sql
    CREATE  TABLE nombre_tabla
    (
        columna tipo_dato restricciones,
        columna tipo_dato restricciones,
    )
    ```

## SQL SERVER




```sql
CREATE 
ALTER 
DROP
```
