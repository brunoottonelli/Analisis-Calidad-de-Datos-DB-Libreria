# Caso de estudio de calidad de la base de datos resultante de la unificación de dos librerias.

Este caso de estudio se presenta como proyecto final para el curso de Calidad de Datos e Información de la Facultad de Ingeniería, UdelaR.

Para este análisis de la calidad de los datos, se seguirá el modelo CaDQM.

Trabajo realizado en colaboración con Gabriel Rode.

## Realidad planteada
El trabajo estará enfocado en la calidad de datos acerca de libros y conceptos relacionados con éstos.

Consideremos una librería que tiene la necesidad de gestionar la calidad de sus datos. Esta librería es el resultado de la unificación de dos librerías que eran totalmente independientes hasta que la más grande compró a la más pequeña, transformándose en una única librería. Cada una de las librerías originales tenía sus bases de datos y uno de los desafíos que enfrenta la nueva librería es la unificación de todos los datos.

Los encargados de la librería saben que los datos tienen muchos problemas de calidad y que éstos se verán potenciados por la integración de los datasets provenientes de ambas librerías, pero no saben cómo enfrentar estos problemas. Nuestro trabajo es evaluar la calidad de los datos de la base de datos integrada y dejar un conjunto de especificaciones que permitan la mejora de la calidad de los datos actuales y futuros.

De ahora en más, nos referiremos a cada una de las librerías que serán integradas como L1 y L2, mientras que la nueva librería será nombrada como NL. En este trabajo, asumiremos que los datos de L1 son los datasets books_data.csv y books_rating.csv. Mientras que los datos de L2 son los datasets books.csv,
ratings.csv y users.csv. Estas fuentes de datos pueden ser descargadas desde los siguientes enlaces: [1] para L1 y [2] para L2. En estos mismos enlaces también es posible obtener información descriptiva de los datos.

En la NL cada libro deberá tener asociado un ISBN, un título, al menos un autor y un editor. Por otro lado, en esta librería pretenden tener al menos 500 libros y el 20% de ellos debe ser parte de la lista de los 100 mejores libros, la cual se encuentra publicada en el sitio Web Goodreads [3].

Se sabe que en la NL trabajarán 3 usuarios: un administrador, un publicista digital y un analista de datos. El administrador se encargará de la gestión de los datos de la librería, el publicista realizará tareas de recomendación y promoción de libros en el sitio Web, y el analista se encargará del análisis de los datos buscando estudiar comportamientos, preferencias y relaciones entre los clientes.

Desde ya se sabe que el usuario administrador realizará, con mucha frecuencia, ciertas consultas a la base de datos. Por ejemplo, le interesará conocer los libros cuya publicación sea del año actual, los libros de la editorial Wiley, o el top 3 de los libros con mayor score, según el rating de los lectores.

Para que las tareas del publicista puedan ser realizadas correctamente es necesario que la base de datos de la NL sea actualizada todos los viernes. Además, este usuario realiza sus tareas esperando que el 60% de los libros tengan al menos un score mayor o igual a 5. Un detalle no menor es que al menos el 80% de los usuarios que califican los libros deben ser mayores de 18 años. De otra forma, el usuario publicista podrá realizar recomendaciones que sean lo suficientemente representativas.

Por otro lado, para la efectividad de las tareas del analista de datos se especifica que al menos el 95% de los libros debe tener ISBN, sus títulos deben estar correctamente escritos y para los nombres de los autores debe
aparecer al menos un nombre y un apellido.

Finalmente, se destaca que los tiempos de respuesta del sitio Web de la NL no puede superar los 3 segundos.


## Alcance del estudio

Este estudio sigue el método CaDQM y se enfoca en la construcción del Modelo de Contexto, necesario para la gestión de la calidad de los datos, tomando como punto de partida la realidad planteada anteriormente y otros elementos considerados relevantes, que surjen del dominio de aplicación. También se realiza la especificación de un Modelo de Calidad de los datos, teniendo en cuenta el Modelo de Contexto mencionado.

Luego, se realiza una medición y evaluación de la calidad de los datos, ejecutando las métricas definidas en el Modelo de Calidad.

Para finalizar se incluye una propuesta de mejora de la calidad, que se definirá en base a los resultados obtenidos en la evaluación de la calidad de los datos.




