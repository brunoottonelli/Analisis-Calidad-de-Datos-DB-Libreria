CREATE OR ALTER PROCEDURE check_RN1(@Respuesta NUMERIC(20,5) OUTPUT)
AS
BEGIN
	DECLARE @ValoresTotales INT, @ValoresNull INT
	
	SELECT @ValoresTotales = COUNT(*) FROM PruebaLocal2.dbo.NL_BOOKS
	SELECT @ValoresNull = COUNT(*) FROM PruebaLocal2.dbo.NL_BOOKS 
	WHERE (ISBN IS NULL OR LEN(RTRIM(ISBN)) = 0) OR
		  (BookTitle IS NULL OR LEN(RTRIM(BookTitle)) = 0) OR
		  (AuthorID IS NULL OR LEN(RTRIM(AuthorID)) = 0) OR
		  (PublisherID IS NULL OR LEN(RTRIM(PublisherID)) = 0) 

	IF(@ValoresTotales > 0)
		SET @Respuesta = CAST(@ValoresNull AS NUMERIC(20,5)) / CAST(@ValoresTotales  AS NUMERIC(20,5))
	ELSE
		SET @Respuesta = 0
END


