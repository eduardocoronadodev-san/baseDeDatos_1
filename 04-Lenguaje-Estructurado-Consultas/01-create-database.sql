/*==================================================================
DQL (Data Query Language)
Base de datos: comercial_db
Descripccion: Crea la base de datos para la practica del lenguaje
==================================================================*/
USE master;
GO 

IF DB_ID('comercial_db')IS NOT NULL
BEGIN 
    ALTER DATABASE comercial_db
    SET SINGLE_USER 
    WITH ROLLBACK IMMEDIATE;

    DROP DATABASE comercial_db;
END;
GO

CREATE DATABASE comercial_db;
GO

USE comercial_db;
GO

PRINT('DATABASE CREADA CORRECTAMENTE ')

