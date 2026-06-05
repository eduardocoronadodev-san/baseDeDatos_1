# Persistencia de Datos en Docker (MariaDB, PostgreSQL y SQL Server 2022)

Cuando ejecutas bases de datos en contenedores Docker, la **persistencia de datos** es crucial. Por defecto, los contenedores son efímeros: si el contenedor se elimina o se actualiza, todos los datos se pierden. 

Para mantener los datos a salvo, se mapea un directorio de la máquina host utilizando el parámetro `-v`.

---

## 📋 Tabla Resumen

| Motor de Base de Datos | Imagen Oficial / Registro | Ruta de Datos Interna (Contenedor) | Puerto por Defecto |
| :--- | :--- | :--- | :--- |
| **MariaDB** | `mariadb` | `/var/lib/mysql` | `3306` |
| **PostgreSQL** | `postgres` | `/var/lib/postgresql/data` | `5432` |
| **SQL Server 2022** | `mcr.microsoft.com/mssql/server:2022-latest` | `/var/opt/mssql` | `1433` |

---

## 🚀 Comandos de Despliegue con Persistencia

A continuación se presentan los comandos estructurados para desplegar cada tecnología asegurando la persistencia en una carpeta local (`/tu/ruta/local/...`).

### 1. MariaDB
```bash
docker run -d \
  --name contenedor-mariadb \
  -v /tu/ruta/local/mariadb_data:/var/lib/mysql \
  -e MARIADB_ROOT_PASSWORD=mi_clave_secreta \
  -p 3306:3306 \
  mariadb:latest

  docker run -d \
  --name contenedor-postgres \
  -v /tu/ruta/local/postgres_data:/var/lib/postgresql/data \
  -e POSTGRES_PASSWORD=mi_clave_secreta \
  -p 5432:5432 \
  postgres:latest

  docker run -d \
  --name contenedor-sqlserver2022 \
  -v /tu/ruta/local/sql_data:/var/opt/mssql \
  -e "ACCEPT_EULA=Y" \
  -e "MSSQL_SA_PASSWORD=ClaveFuerte_2026!" \
  -p 1433:1433 \
  [mcr.microsoft.com/mssql/server:2022-latest](https://mcr.microsoft.com/mssql/server:2022-latest)