CREATE OR ALTER PROCEDURE duplicate_ratio(@Tabla VARCHAR(100), @Columna VARCHAR(100), @Respuesta NUMERIC(20,5) OUTPUT)
AS
BEGIN
	DECLARE @ValoresTotales INT, @ValoresDuplicados INT
	
	DECLARE @Consulta NVARCHAR(MAX) = 'SELECT @Salida = COUNT(*) FROM ' + @Tabla 
	EXEC sp_executesql  @Consulta,N'@Salida INT OUTPUT', @Salida = @ValoresTotales OUTPUT
	--EXEC(@Consulta)

	SET @Consulta = 'SELECT @Salida2 = COUNT(DISTINCT ' + @Columna + ') FROM ' + @Tabla 
	EXEC sp_executesql  @Consulta,N'@Salida2 INT OUTPUT', @Salida2 = @ValoresDuplicados OUTPUT
	--EXEC(@Consulta)
	--SET @Respuesta = ((@ValoresTotales - @ValoresDuplicados) * 100) / @ValoresTotales
	IF(@ValoresTotales > 0)
		SET @Respuesta = CAST(@ValoresDuplicados AS NUMERIC(20,5)) / CAST(@ValoresTotales  AS NUMERIC(20,5))
	ELSE
		SET @Respuesta = 0
END


