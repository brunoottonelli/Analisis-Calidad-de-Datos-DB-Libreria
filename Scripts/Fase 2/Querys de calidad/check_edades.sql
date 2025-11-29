CREATE OR ALTER PROCEDURE check_edades
AS
BEGIN
	DELETE FROM TemporalCheckEdades

	INSERT INTO TemporalCheckEdades(ID,Edad,IsValid)
	SELECT
		usu.ID,
		usu.Age,
		CASE WHEN LEN(TRIM(usu.Age)) = 0 OR TRY_CAST(usu.Age AS Float) IS NULL THEN 0 ELSE 1 END IsValid
	FROM 
		PruebaLocal2.dbo.NL_USERS usu
END

