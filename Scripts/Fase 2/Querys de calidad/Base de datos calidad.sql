--CREATE TABLE Dimension(
--	ID VARCHAR(50) PRIMARY KEY,
--	Nombre VARCHAR(100),
--	Descripcion VARCHAR(MAX),
--	SugeridoPor VARCHAR(100)
--);

--CREATE TABLE Factor(
--	ID VARCHAR(50) PRIMARY KEY,
--	IDDimension VARCHAR(50),
--	Nombre VARCHAR(100),
--	Descripcion VARCHAR(MAX),
--	Representa VARCHAR(100),
--	FOREIGN KEY (IDDimension) REFERENCES Dimension(ID)
--);

--CREATE TABLE Metrica(
--	ID VARCHAR(50) PRIMARY KEY,
--	IDFactor VARCHAR(50),
--	Nombre VARCHAR(100),
--	Descripcion VARCHAR(MAX),
--	Granularidad VARCHAR(50),
--	DominioResultado VARCHAR(50),
--	FOREIGN KEY (IDFactor) REFERENCES Factor(ID)
--);

--CREATE TABLE Metodo(
--	ID VARCHAR(50) PRIMARY KEY,
--	IDMetrica VARCHAR(50),
--	Nombre VARCHAR(100),
--	Descripcion VARCHAR(MAX),
--	Usa VARCHAR(100),
--	TipoDatoEntrada VARCHAR(100),
--	TipoDatoSalida VARCHAR(100),
--	Algoritmo VARCHAR(MAX),
--	FOREIGN KEY (IDMetrica) REFERENCES Metrica(ID)
--);

--CREATE TABLE MetodoAplicado(
--	ID VARCHAR(50) PRIMARY KEY,
--	IDMetodo VARCHAR(50),
--	Tipo VARCHAR(50),
--	Descripcion VARCHAR(MAX),
--	ApplicaA VARCHAR(MAX),
--	FOREIGN KEY (IDMetodo) REFERENCES Metodo(ID)
--);

--CREATE TABLE ResultadoEjecucion(
--	ID VARCHAR(50) PRIMARY KEY,
--	IDMetodoAplicado VARCHAR(50),
--	Fecha DATETIME,
--	FOREIGN KEY (IDMetodoAplicado) REFERENCES MetodoAplicado(ID)
--);

--CREATE TABLE ResultadoEjecucionTabla(
--	IDEjecucion VARCHAR(50),
--	NombreTabla VARCHAR(100),
--	Valor VARCHAR(100),
--	Concepto VARCHAR(100),
--	FOREIGN KEY (IDEjecucion) REFERENCES ResultadoEjecucion(ID)
--);

--CREATE TABLE ResultadoEjecucionColumna(
--	IDEjecucion VARCHAR(50),
--	NombreTabla VARCHAR(100),
--	NombreColumna VARCHAR(100),
--	Valor VARCHAR(100),
--	Concepto VARCHAR(100),
--	FOREIGN KEY (IDEjecucion) REFERENCES ResultadoEjecucion(ID)
--);

--CREATE TABLE ResultadoEjecucionCeldaFila(
--	IDEjecucion VARCHAR(50),
--	NombreTabla VARCHAR(100),
--	NombreAtributo VARCHAR(100),
--	IDFila VARCHAR(100),	
--	Valor VARCHAR(100),
--	Concepto VARCHAR(100),
--	FOREIGN KEY (IDEjecucion) REFERENCES ResultadoEjecucion(ID)
--);

--CREATE TABLE TemporalConsistenciaRatings(
--)

--CREATE TABLE TemporalConsistenciaFechas(
--	ISBN VARCHAR(100),
--	ReviewTime DATETIME,
--	BookTime DATETIME
--);

--CREATE TABLE TemporalMissingRatingBooks(
--	ISBN VARCHAR(100),
--	IsValid INT
--);

--CREATE TABLE TemporalCheckEdades(
--	ID VARCHAR(100),
--	Edad VARCHAR(100),
--	IsValid INT
--)

--CREATE TABLE TemporalCheckPrice(
--	ISBN VARCHAR(100),
--	Price VARCHAR(100),
--	IsValid INT
--)

--CREATE TABLE TemporalDateFormatPublisher(
--	ISBN VARCHAR(100),
--	PublisherDate VARCHAR(100),
--	IsValid INT
--)

--CREATE TABLE TemporalDateFormatReview(
--	ISBN VARCHAR(100),
--	review_time VARCHAR(100),
--	IsValid INT
--)

--CREATE TABLE TemporalValidISBN(
--	ISBN VARCHAR(100),
--	IsValid INT
--)


--CREATE CLUSTERED INDEX IndiceISBN ON TemporalConsistenciaFechas(ISBN)
--CREATE NONCLUSTERED INDEX IndiceIBSN ON TemporalConsistenciaRatings(ISBN)
--CREATE NONCLUSTERED INDEX IndiceIBSN ON TemporalMissingRatingBooks(ISBN)
--CREATE NONCLUSTERED INDEX IndiceID ON TemporalCheckEdades(ID)
--CREATE NONCLUSTERED INDEX IndiceISBN ON TemporalCheckPrice(ISBN)
--CREATE NONCLUSTERED INDEX IndiceDateBook ON TemporalDateFormatPublisher(ISBN)
--CREATE NONCLUSTERED INDEX IndiceDateReview ON TemporalDateFormatReview(ISBN)
--CREATE NONCLUSTERED INDEX IndiceTemporalValidISBN ON TemporalValidISBN(ISBN)

--INSERT INTO Dimension (ID, Nombre, Descripcion, SugeridoPor) VALUES ('D1_Exactitud', 'Exactitud', 'Concierne a la correctitud y la precisión con que los datos del mundo real son representados en un sistema de información.', 'RN1, RN2, RN4, RQ2, RQ3, RQ6, RQ11, F1');
--INSERT INTO Dimension (ID, Nombre, Descripcion, SugeridoPor) VALUES ('D2_Completitud', 'Completitud', 'Indica si el sistema de información contiene toda la información de interés.', 'RN1, RN2, RN5, RQ3, RQ7, F2');
--INSERT INTO Dimension (ID, Nombre, Descripcion, SugeridoPor) VALUES ('D3_Consistencia', 'Consistencia', 'Captura la satisfacción de reglas semánticas definidas sobre los datos.', 'RQ4, RQ6, RQ8, RQ11, F1, F3');
--INSERT INTO Dimension (ID, Nombre, Descripcion, SugeridoPor) VALUES ('D4_Unicidad', 'Unicidad', 'Evalúa si los registros en un conjunto de datos son únicos y no presentan duplicaciones no deseadas.', 'RN2, RN5');
--INSERT INTO Factor (ID, IDDimension, Nombre, Descripcion, Representa) VALUES ('F1_ExactSint', 'D1_Exactitud', 'Exactitud sintáctica', 'Indica qué tan libre de errores sintácticos están los datos.', 'RN1, RN2, RQ3, RN4, RQ2');
--INSERT INTO Factor (ID, IDDimension, Nombre, Descripcion, Representa) VALUES ('F3_Precision', 'D1_Exactitud', 'Exactitud precisión', 'Indica qué tan detallados son los datos.', 'RQ6, RQ11, F1');
--INSERT INTO Factor (ID, IDDimension, Nombre, Descripcion, Representa) VALUES ('F2_Dens', 'D2_Completitud', 'Densidad', 'Indica cuánta información se tiene y cuánta falta sobre las entidades del sistema de información.', 'RN1, RN2, RN5, RQ3, RQ7, F2');
--INSERT INTO Factor (ID, IDDimension, Nombre, Descripcion, Representa) VALUES ('513d0362-f402-48ae-8382-3461c6ebebd1', 'D3_Consistencia', 'Integridad inter-relación', 'Captura la satisfacción de reglas entre atributos de tablas distintas.', 'RQ4, RQ6, RQ8, RQ11, F1, F3');
--INSERT INTO Factor (ID, IDDimension, Nombre, Descripcion, Representa) VALUES ('b5921287-359a-4d92-812e-5296b5488529', 'D4_Unicidad', 'No duplicación', 'Porcentaje de datos que no están duplicados en forma exacta.', 'RN2, RN5');
--INSERT INTO Metrica (ID, IDFactor, Nombre, Descripcion, Granularidad, DominioResultado) VALUES ('M_duplicate_ratio', 'b5921287-359a-4d92-812e-5296b5488529', 'duplicate_ratio', 'Da el porcentaje de valores duplicados.', 'Columna', '[0...1]');
--INSERT INTO Metrica (ID, IDFactor, Nombre, Descripcion, Granularidad, DominioResultado) VALUES ('M_contar_nulls', 'F2_Dens', 'contar_nulls', 'Calcula el porcentaje de entradas vacías en una columna.', 'Columna', '{0, 1}');
--INSERT INTO Metrica (ID, IDFactor, Nombre, Descripcion, Granularidad, DominioResultado) VALUES ('M_check_RN1', 'F2_Dens', 'check_RN1', 'Da el porcentaje de entradas de la tabla que tienen al menos un campo vacío entre isbn, título, autor y editor.', 'Conjunto de columnas', '[0...1]');
--INSERT INTO Metrica (ID, IDFactor, Nombre, Descripcion, Granularidad, DominioResultado) VALUES ('M_consistencia_ratings', '513d0362-f402-48ae-8382-3461c6ebebd1', 'concistencia_ratings', 'Verifica que la cantidad de ratings entre las distintas tablas sea coherente.', 'Conjunto de columnas', '{0, 1}');
--INSERT INTO Metrica (ID, IDFactor, Nombre, Descripcion, Granularidad, DominioResultado) VALUES ('M_consistencia_fechas', '513d0362-f402-48ae-8382-3461c6ebebd1', 'concistencia_fechas', 'Verifica que la fecha de un rating sea posterior a la fecha de publicación del libro.', 'Conjunto de columnas', '{0, 1}');
--INSERT INTO Metrica (ID, IDFactor, Nombre, Descripcion, Granularidad, DominioResultado) VALUES ('M_missing_rating_books', '513d0362-f402-48ae-8382-3461c6ebebd1', 'missing_rating_books', 'Para ratings sobre libros, controla la existencia de estos en la base de datos.', 'Celda', '{0, 1}');
--INSERT INTO Metrica (ID, IDFactor, Nombre, Descripcion, Granularidad, DominioResultado) VALUES ('M_check_ISBN', 'F1_ExactSint', 'check_ISBN', 'Controla si el valor es un ISBN válido.', 'Celda', '{0, 1}');
--INSERT INTO Metrica (ID, IDFactor, Nombre, Descripcion, Granularidad, DominioResultado) VALUES ('M_check_edades', 'F1_ExactSint', 'check_edades', 'Controla si la edad es válida.', 'Celda', '{0, 1}');
--INSERT INTO Metrica (ID, IDFactor, Nombre, Descripcion, Granularidad, DominioResultado) VALUES ('M_check_price', 'F1_ExactSint', 'check_price', 'Controla si el precio es válido.', 'Celda', '{0, 1}');
--INSERT INTO Metrica (ID, IDFactor, Nombre, Descripcion, Granularidad, DominioResultado) VALUES ('M_duplicated_authors', 'F1_ExactSint', 'duplicated_authors', 'Indica cuántas tuplas nombran más de un autor.', 'Columna', '[0..1]');
--INSERT INTO Metrica (ID, IDFactor, Nombre, Descripcion, Granularidad, DominioResultado) VALUES ('M_date_format', 'F3_Precision', 'date_format', 'Controla el formato de fecha de todas las columnas tipo fecha.', 'Celda', '{0, 1}');
--INSERT INTO Metodo (ID, IDMetrica, Nombre, Descripcion, Usa, TipoDatoEntrada, TipoDatoSalida, Algoritmo) VALUES ('metodo_duplicate_ratio', 'M_duplicate_ratio', 'met_duplicate_ratio', 'Implementa la métrica duplicate_ratio sobre un atributo dado.', 'RN2, RN5', 'String', 'Float', 'def duplicate_ratio(data, column):
--    total = len(data)
--    duplicated = data.duplicated(subset=[column]).sum()
--    return duplicated / total');
--INSERT INTO Metodo (ID, IDMetrica, Nombre, Descripcion, Usa, TipoDatoEntrada, TipoDatoSalida, Algoritmo) VALUES ('metodo_contar_nulls', 'M_contar_nulls', 'met_contar_nulls', 'Implementa la métrica contar_nulls.', 'RN1, RN5, RQ3, RQ7, F2', 'String', 'Float', 'def porcentaje_nulos(atributo):
--    nulos = atributo.isnull()
--    contador_nulos = nulos.sum()
--    porcentaje = contador_nulos / len(atributo)
--    return porcentaje');
--INSERT INTO Metodo (ID, IDMetrica, Nombre, Descripcion, Usa, TipoDatoEntrada, TipoDatoSalida, Algoritmo) VALUES ('metodo_check_RN1', 'M_check_RN1', 'met_check_RN1', 'Implementa la métrica Check_RN1 sobre una tabla dada.', 'RN1, RN2, RQ3, RQ7, F2', 'String', 'Float', 'def Check_RN1(datos):
--    datos_relevantes = datos[[''isbn'', ''titulo'', ''autor'', ''editor'']]
--    incompletos = datos_relevantes.isnull().any(axis=1).sum()
--    return incompletos / len(datos)');
--INSERT INTO Metodo (ID, IDMetrica, Nombre, Descripcion, Usa, TipoDatoEntrada, TipoDatoSalida, Algoritmo) VALUES ('metodo_consistencia_ratings', 'M_consistencia_ratings', 'met_consistencia_ratings', 'Implementa la métrica concistencia_ratings comparando la cantidad de ratings con lo declarado.', 'RQ8', 'String', 'Boolean', 'def consistencia_ratings(libros, valid_isbn, ratings): ...');
--INSERT INTO Metodo (ID, IDMetrica, Nombre, Descripcion, Usa, TipoDatoEntrada, TipoDatoSalida, Algoritmo) VALUES ('metodo_consistencia_fechas', 'M_consistencia_fechas', 'met_consistencia_fechas', 'Implementa la métrica concistencia_fechas comparando fechas de reviews y publicaciones.', 'RQ6, RQ11, F1', 'String', 'Boolean', 'def consistencia_fechas(NL_reviews, NL_books): ...');
--INSERT INTO Metodo (ID, IDMetrica, Nombre, Descripcion, Usa, TipoDatoEntrada, TipoDatoSalida, Algoritmo) VALUES ('metodo_missing_rating_books', 'M_missing_rating_books', 'met_missing_rating_books', 'Implementa la métrica check_rating_books para verificar existencia de libros.', 'RQ4, RQ8, F3', 'String', 'Boolean', 'SELECT COUNT(*) FROM NL_Ratings WHERE NOT EXISTS(SELECT * FROM NL_Books WHERE NL_Ratings.ISBN = NL_Books.ISBN)');
--INSERT INTO Metodo (ID, IDMetrica, Nombre, Descripcion, Usa, TipoDatoEntrada, TipoDatoSalida, Algoritmo) VALUES ('metodo_check_ISBN', 'M_check_ISBN', 'met_check_ISBN', 'Implementa la métrica Check_ISBN teniendo en cuenta la estructura de un código ISBN.', 'RN1, RN2, RQ3', 'String', 'Boolean', 'def Check_ISBN(codigo): ...');
--INSERT INTO Metodo (ID, IDMetrica, Nombre, Descripcion, Usa, TipoDatoEntrada, TipoDatoSalida, Algoritmo) VALUES ('metodo_check_edades', 'M_check_edades', 'met_check_edades', 'Implementa la métrica Check_edades verificando si la edad tiene formato correcto y es un valor razonable.', 'RN4, RQ2', 'String', 'Boolean', 'IsNumeric(edad) AND edad > 0 AND edad < 100');
--INSERT INTO Metodo (ID, IDMetrica, Nombre, Descripcion, Usa, TipoDatoEntrada, TipoDatoSalida, Algoritmo) VALUES ('metodo_check_price', 'M_check_price', 'met_check_price', 'Implementa la métrica check_price verificando si el valor tiene formato correcto.', 'RN3', 'String', 'Boolean', 'IsNumeric(price) AND price >= 0');
--INSERT INTO Metodo (ID, IDMetrica, Nombre, Descripcion, Usa, TipoDatoEntrada, TipoDatoSalida, Algoritmo) VALUES ('metodo_duplicated_authors', 'M_duplicated_authors', 'met_duplicated_authors', 'Implementa la métrica duplicated_authors para obtener el porcentaje de tuplas que indican más de un autor.', 'RN1, RQ3', 'String', 'Double', 'SELECT COUNT(*) WHERE AuthorID LIKE ''%,%'' / TOTAL');
--INSERT INTO Metodo (ID, IDMetrica, Nombre, Descripcion, Usa, TipoDatoEntrada, TipoDatoSalida, Algoritmo) VALUES ('metodo_date_format', 'M_date_format', 'met_date_format', 'Implementa la métrica date_format para controlar que el formato de fecha sea correcto.', 'RQ6, RQ11, F1', 'String', 'Boolean', 'TRY_CONVERT(DATE,date,103)');
--INSERT INTO MetodoAplicado (ID, IDMetodo, Tipo, Descripcion, ApplicaA) VALUES ('MA_duplicate_ratio', 'metodo_duplicate_ratio', 'Medición', 'Dados los datos y el atributo, calcula el porcentaje de valores duplicados en ese atributo.', 'Atributos ⟪ISBN⟫, ⟪AuthorID⟫, ⟪PublisherID⟫, ⟪User_ID⟫ de la tabla NL_Books. Atributo ⟪ID⟫ de la tabla NL_USERS.');
--INSERT INTO MetodoAplicado (ID, IDMetodo, Tipo, Descripcion, ApplicaA) VALUES ('MA_contar_nulls', 'metodo_contar_nulls', 'Medición', 'Dado un atributo de una tabla, calcula el porcentaje de entradas vacías.', 'Cualquier atributo de cualquier tabla.');
--INSERT INTO MetodoAplicado (ID, IDMetodo, Tipo, Descripcion, ApplicaA) VALUES ('MA_check_RN1', 'metodo_check_RN1', 'Medición', 'Dada una tabla, calcula el porcentaje de entradas que tienen al menos un campo vacío entre los atributos isbn, título, autor y editor.', 'Tabla NL_Books');
--INSERT INTO MetodoAplicado (ID, IDMetodo, Tipo, Descripcion, ApplicaA) VALUES ('MA_consistencia_ratings', 'metodo_consistencia_ratings', 'Agregación', 'Dada una tabla de reviews y una tabla de libros, determina si hay congruencia entre lo registrado en ambas tablas sobre los ratings.', 'Conjunto de atributos (NL_ratings.ISBN, NL_books.ISBN, NL_books.Rating_Count)');
--INSERT INTO MetodoAplicado (ID, IDMetodo, Tipo, Descripcion, ApplicaA) VALUES ('MA_consistencia_fechas', 'metodo_consistencia_fechas', 'Medición', 'Dada una tabla de reviews y una tabla de libros, determina si la fecha de la review es posterior a la publicación del libro.', 'Conjunto de atributos ⟪NL_Reviews.review_time, NL_Books.PublisherDate⟫');
--INSERT INTO MetodoAplicado (ID, IDMetodo, Tipo, Descripcion, ApplicaA) VALUES ('MA_missing_rating_books', 'metodo_missing_rating_books', 'Medición', 'Verifica que el libro en NL_Ratings exista en NL_Books mediante una consulta SQL.', 'Conjunto de atributos ⟪ISBN⟫ en las tablas NL_Books y NL_Ratings');
--INSERT INTO MetodoAplicado (ID, IDMetodo, Tipo, Descripcion, ApplicaA) VALUES ('MA_check_ISBN', 'metodo_check_ISBN', 'Medición', 'Utiliza el algoritmo de cálculo de ISBN para verificar la validez del dato.', 'Atributo ⟪ISBN⟫ de la tabla NL_Books');
--INSERT INTO MetodoAplicado (ID, IDMetodo, Tipo, Descripcion, ApplicaA) VALUES ('MA_check_edades', 'metodo_check_edades', 'Medición', 'Verifica que tenga un valor numérico entre 1 y 99.', 'Atributo ⟪Age⟫ de la tabla NL_Users');
--INSERT INTO MetodoAplicado (ID, IDMetodo, Tipo, Descripcion, ApplicaA) VALUES ('MA_check_price', 'metodo_check_price', 'Medición', 'Verifica que tenga un valor numérico positivo con una consulta SQL.', 'Atributo ⟪Price⟫ de la tabla NL_Books');
--INSERT INTO MetodoAplicado (ID, IDMetodo, Tipo, Descripcion, ApplicaA) VALUES ('MA_duplicated_authors', 'metodo_duplicated_authors', 'Medición', 'Divide las tuplas que indican más de 1 autor sobre las tuplas totales.', 'Atributo ⟪AuthorID⟫ en la tabla NL_Books');
--INSERT INTO MetodoAplicado (ID, IDMetodo, Tipo, Descripcion, ApplicaA) VALUES ('MA_date_format', 'metodo_date_format', 'Medición', 'Verifica que el campo PublisherDate en Books y el campo review_time en Ratings respeten el formato correcto de fecha dd/mm/yyyy.', 'Atributo ⟪PublisherDate⟫ en la tabla NL_Books y atributo ⟪review_time⟫ en la tabla NL_Ratings');

--DROP TABLE IF EXISTS ResultadoEjecucionCeldaFila;
--DROP TABLE IF EXISTS ResultadoEjecucionColumna;
--DROP TABLE IF EXISTS ResultadoEjecucionTabla;
--DROP TABLE IF EXISTS ResultadoEjecucion;
--DROP TABLE IF EXISTS MetodoAplicado;
--DROP TABLE IF EXISTS Metodo;
--DROP TABLE IF EXISTS Metrica;
--DROP TABLE IF EXISTS Factor;
--DROP TABLE IF EXISTS Dimension;

----duplicate ratio
--DECLARE @Res NUMERIC(20,2)
--EXEC dbo.duplicate_ratio 'PruebaLocal2.dbo.NL_BOOKS','ISBN',@Respuesta = @Res OUTPUT
--SELECT 1 - @Res


----contar nulls
--DECLARE @Res NUMERIC(20,2)
--EXEC dbo.contar_nulls 'PruebaLocal2.dbo.NL_BOOKS','ISBN',@Respuesta = @Res OUTPUT
--SELECT 1 - @Res

--consistencia rating
--exec consistencia_ratings 

--select 
--	*, CASE WHEN CantidadRatingBooks = CantidadRatingRating THEN 1 ELSE 0 END 
--from 
--	TemporalConsistenciaRatings
--ORDER BY 4

--consistencia fechas

----exec consistencia_fechas
--SELECT 
--	ISBN, ReviewTime, BookTime, CASE WHEN ReviewTime IS NULL OR BookTime IS NULL THEN 1 WHEN BookTime > ReviewTime THEN 1 ELSE 0 END
--FROM
--	TemporalConsistenciaFech


--missing rating books

----exec missing_rating_books
--select * from TemporalMissingRatingBooks


--check edades

----exec check_edades
--select * from TemporalCheckEdades


--check price

----exec check_price
--select * from TemporalCheckPrice


--duplicated authors

--DECLARE @Res NUMERIC(20,2)
--EXEC duplicated_authors @Respuesta = @Res OUTPUT
--SELECT @Res


--date format

--exec check_date_format
--select * from TemporalDateFormatPublisher
--select * from TemporalDateFormatReview


--check isbn

--exec check_isbn
--select * from TemporalValidISBN
