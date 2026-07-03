# Ejercicio 6

Una institución educativa requiere gestionar la información de su comunidad académica y administrativa.

> **De cada alumno se almacena:**
>
> - Matrícula
> - Nombre (Nombre de pila, Apellido paterno, Apellido materno)
> - Correo
> - Teléfono (pueden ser varios)

> **De cada credencial se almacena:**
>
> - Número de credencial
> - Fecha de inscripción

> **De cada materia se almacena:**
>
> - Clave de la materia
> - Nombre de la materia
> - Total de materias

> **De cada profesor se almacena:**
>
> - ID del profesor
> - Nombre (Nombre de pila, Apellido paterno, Apellido materno)

> **De cada proyecto se almacena:**
>
> - Número de proyecto
> - Nombre del proyecto
> - Presupuesto

> **De cada departamento (DEPTO) se almacena:**
>
> - Número de departamento
> - Nombre
> - Edificio

> **De cada dependiente se almacena:**
>
> - Nombre
> - Fecha de nacimiento
> - Parentesco

> **Reglas del negocio:**
>
> 1. Un alumno posee exactamente una credencial y esta pertenece a un único alumno. No existe alumno sin credencial ni credencial sin alumno.
> 2. Un alumno puede cursar muchas materias y una materia puede ser cursada por muchos alumnos. Todo alumno debe cursar al menos una materia y toda materia debe tener alumnos inscritos.
> 3. De la inscripción de un alumno en una materia se debe registrar: la fecha de inscripción y la calificación final.
> 4. Un profesor puede impartir varias materias, pero una materia solamente puede ser impartida por un profesor. Puede haber profesores que no impartan materias, pero toda materia debe tener un profesor asignado.
> 5. Un profesor puede participar en muchos proyectos y un proyecto puede contar con muchos profesores. Todo profesor debe estar asignado a un proyecto y todo proyecto debe tener profesores colaboradores.
> 6. De la participación del profesor en el proyecto se registra: el rol y la fecha de inicio.
> 7. Un profesor pertenece obligatoriamente a un único departamento, mientras que un departamento puede tener muchos profesores adscritos o ninguno actualmente.
> 8. Un profesor puede tener muchos dependientes asociados o ninguno. Cada dependiente pertenece a un solo profesor y no puede existir en el sistema si el profesor no está registrado.

> **Qué se debe realizar:**
>
> - Identificar las entidades.
> - Identificar los atributos.
> - Dibujar las relaciones.
> - Determinar la cardinalidad.
> - Determinar la participación de cada entidad.

![Imagen diagrama 6](../img/ER/ejercicio6BaseDatos.drawio.png)
