# Diccionario de Datos de la Base de Datos: Control Escolar

## 1. Información General

| Elemento | Valor |
| :--- | :--- |
| **Proyecto** | Control Escolar |
| **Versión** | 1.0 |
| **Fecha** | Junio 2026 |
| **Elaboró** | Ing. Eduardo Coronado Santana |
| **SGBD** | SQL Server |

---

## 2. Descripción de la Base de Datos

La base de datos administra las siguientes entidades:

* Carrera
* Alumno
* Profesor
* Materia
* Grupo
* Inscripción
* Paciente
* Expediente

Permite controlar la oferta académica, la inscripción de estudiantes y la gestión de expedientes clínicos asociados.

---

## 3. Catálogo de Restricciones Utilizadas

| Catálogo | Significado |
| :--- | :--- |
| **PK** | Primary Key (Clave Primaria) |
| **FK** | Foreign Key (Clave Foránea) |
| **NN** | Not Null (No Nulo) |
| **UQ** | Unique (Único) |
| **AI** | Autoincrement o Identity (Autoincrementable) |
| **CK** | Check (Restricción de Validación) |
| **DF** | Default (Valor por Defecto) |

---

## 4. Diccionario de Datos

### **Tabla:** *Carrera*
**Descripción:** Almacena las carreras ofertadas por la universidad.

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| `id_carrera` | INT | - | PK, AI, NN | Identificador único de la carrera. |
| `nombre` | VARCHAR | 100 | UQ, NN | Nombre de la carrera. |
| `duracion_cuatrimestre` | INT | - | NN, CK (>0) | Duración de la carrera en cuatrimestres. |

---

### **Tabla:** *Alumno*
**Descripción:** Almacena la información de los estudiantes inscritos.

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| `id_alumno` | INT | - | PK, AI, NN | Identificador único del alumno. |
| `matricula` | VARCHAR | 10 | UQ, NN | Matrícula institucional del alumno. |
| `nombre` | VARCHAR | 50 | NN | Nombre(s) del alumno. |
| `apellido_paterno` | VARCHAR | 50 | NN | Apellido paterno del alumno. |
| `apellido_materno` | VARCHAR | 50 | *Null* | Apellido materno del alumno (opcional). |
| `correo` | VARCHAR | 100 | UQ, NN | Correo electrónico institucional. |
| `fecha_nacimiento` | DATE | - | NN | Fecha de nacimiento del alumno. |
| `id_carrera` | INT | - | FK, NN | Carrera a la que pertenece el alumno. |

---

### **Tabla:** *Paciente*
**Descripción:** Almacena los datos de identificación personal de los pacientes.

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| `num_paciente` | INT | - | PK, AI, NN | Identificador único del paciente. |
| `nombre` | VARCHAR | 50 | NN | Nombre(s) del paciente. |
| `apellido_paterno` | VARCHAR | 50 | NN | Apellido paterno del paciente. |
| `apellido_materno` | VARCHAR | 50 | *Null* | Apellido materno del paciente (opcional). |
| `fecha_nacimiento` | DATE | - | NN | Fecha de nacimiento del paciente. |

---

### **Tabla:** *Expediente*
**Descripción:** Almacena el registro médico e historial clínico asignado a un paciente.

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| `num_expediente` | INT | - | PK, AI, NN | Número de folio único del expediente. |
| `fecha_apertura` | DATE | - | NN | Fecha en la que se aperturó el expediente. |
| `tipo_sangre` | VARCHAR | 5 | NN | Grupo sanguíneo y factor Rh (ej. O+, A-). |
| `num_paciente` | INT | - | FK, UQ, NN | Enlace exclusivo al paciente (Relación 1:1). |

---

## 5. Relaciones en la Base de Datos

| Relación | Cardinalidad | Descripción |
| :--- | :--- | :--- |
| Carrera -> Alumno | 1:N | Una carrera tiene muchos alumnos. |
| Carrera -> Materia | 1:N | Una carrera tiene muchas materias. |
| Profesor -> Grupo | 1:N | Un profesor puede impartir clases en varios grupos. |
| Grupo -> Inscripción | 1:N | Un grupo puede tener muchos alumnos inscritos. |
| Alumno -> Inscripción | 1:N | Un alumno puede tener varias inscripciones. |
| Paciente -> Expediente | 1:1 | Un paciente posee un único expediente y viceversa. |

---

## 6. Matriz de Claves Foráneas (FK)

| Tabla | Campo FK | Tabla / Campo de Referencia |
| :--- | :--- | :--- |
| Alumno | `id_carrera` | Carrera(`id_carrera`) |
| Materia | `id_carrera` | Carrera(`id_carrera`) |
| Grupo | `id_profesor` | Profesor(`id_profesor`) |
| Grupo | `id_materia` | Materia(`id_materia`) |
| Inscripción | `id_alumno` | Alumno(`id_alumno`) |
| Inscripción | `id_grupo` | Grupo(`id_grupo`) |
| Expediente | `num_paciente` | Paciente(`num_paciente`) |

---

## 7. Integridad Referencial

| Clave | Regla |
| :--- | :--- |
| **IR-01** | No se puede registrar un alumno con una carrera inexistente. |
| **IR-02** | No se puede crear un grupo para una materia inexistente. |
| **IR-03** | No se puede crear un grupo para un profesor inexistente. |
| **IR-04** | No se puede generar un expediente para un paciente inexistente. |

---

## 8. Reglas de Negocio

| Clave | Regla |
| :--- | :--- |
| **RN-01** | Un alumno pertenece a una sola carrera a la vez. |
| **RN-02** | Una carrera puede albergar a múltiples alumnos. |
| **RN-03** | Una carrera está compuesta por múltiples materias según su plan de estudios. |
| **RN-04** | Un profesor puede ser asignado a diferentes grupos en el periodo escolar. |
| **RN-05** | Todo expediente clínico debe estar asociado obligatoria y únicamente a un paciente vivo registrado. |

---


