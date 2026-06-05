# Documentacion de Contenedores Docker de Sistemas Gestores de Base de Datos
![docker image](./img/DOCKER2.png)

## Contenedor del DBMS MariaDB 
docker pull mariadb:lts-ubi9
## contenedor de MariaDB sin volumen 
docker run --name ServerMariaDBG2 -e MARIADB_ROOT_PASSWORD=123456 \
-d -p 3345:3306 e0236
## contenedor de tutorial de docker 
docker run -d -p 80:80 docker/getting-started 

docker run -d -p (puertos)


## comandos
- -d detach (el proceso de contenedor se ejecutaen background)
- -p (por or publish  y mapea el puerto (todas las imagenes tienen un pueto que exponen)) 
- docker/getting-started (nombre de la imagen)

## comando de instalacion de postgres
- docker pull postgres:14.22-trixie

## contenedor de MariDB con volumen 
docker run --name ServerMariaDBG2 -e MARIADB_ROOT_PASSWORD=123456 \
-d -v  v-MariaDB:/var/lib/mysql -p 3345:3306 e0236

**comando para hacer contenedor**
- docker pull docker/getting-started

| Comando      | Descripción  |
|-----------    |----------    |
| docker pull    | nombre_imagen    | 
[docker hub ](https://hub.docker.com/)  |**Descarga una imagen de docker hub** 
| docker images     | **visualizar imagenes que se encuentran en docker**     |

docker ps -a **visualiza todos los contenedores que estan ensendidos o/y apagados**
docker p **visuaklisa contenedores encendidos y apagados**
docker stop id(contenedor) o nombre de contenedor **detiene un contenedor**
docker start idcontenedor o nombrecontenedor **enciende el contenedor**
docker rm id de contenedor **borra contenedor solo si esta apagado** 
docker rm -f id de contenedor **borra forzadamente un contenedor este o no encendido**
docker volume **da opciones de volumenes**
docker volume create v-MariaDBG2

## contenbedor de postgres con volumen 
docker run --name ServerPostgressG2 -e POSTGRES_PASSWORD=123456 \
-d -p 5457:5432 -v v-PostgresG2:/var/lib/postgresql/data \
eba8d
- hacer conexion postgresg2
b201b

## contenedor con volumen de microsoftsql server 2022
docker run -e "ACCEPT_EULA=Y" -e "MSSQL_SA_PASSWORD=P@ssw0rd" \
   -u 0 \
   -p 1452:1433 --name SQLServerG2 \
   -d -v v-sqlServer:/var/opt/mssql/data \
   d01cc

