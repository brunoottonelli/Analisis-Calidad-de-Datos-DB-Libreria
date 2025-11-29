CREATE OR ALTER PROCEDURE duplicated_authors(@Respuesta NUMERIC(20,5) OUTPUT)
AS
BEGIN
	DECLARE @TotalAuthors INT, @Duplicados INT

	SELECT @TotalAuthors = COUNT(*) FROM PruebaLocal2.dbo.NL_BOOKS
	SELECT @Duplicados = COUNT(*) FROM PruebaLocal2.dbo.NL_BOOKS bok WHERE bok.AuthorID LIKE '%,%'

	IF @TotalAuthors > 0
		SET @Respuesta = CAST(@Duplicados AS NUMERIC(20,5)) / CAST(@TotalAuthors  AS NUMERIC(20,5))
	ELSE
		SET @Respuesta = 0
END

