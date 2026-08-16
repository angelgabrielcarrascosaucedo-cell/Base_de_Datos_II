-- Sintaxis Funcion Tabla Multiples Sentencias
CREATE OR ALTER FUNCTION AGCS.fn_nombrefuncion
(
	--@Parametro TipoDato
	@edad int
)
RETURNS @Resultado TABLE
(
	Columna1 tipodato,
	Columna2 tipodato,
	Columna3 tipodato
)
AS
BEGIN
	-- Instrucciones SQL
	RETURN;
END;
go