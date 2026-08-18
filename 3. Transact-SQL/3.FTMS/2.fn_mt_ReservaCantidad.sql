--Clasificar Reservas 
CREATE OR ALTER FUNCTION agcs.fn_MT_ClasificarReservasCliente
(
    @IdCliente INT
)
RETURNS @Resultado TABLE
(
    IdCliente INT,
    TotalReservas INT,
    Clasificacion VARCHAR(50)
)
AS
BEGIN
    DECLARE @Total INT;
    DECLARE @Clase VARCHAR(50);
    SELECT @Total = COUNT(*)
    FROM agcs.reserva
    WHERE id_cliente = @IdCliente;
    SET @Total = ISNULL(@Total, 0);
    IF @Total > 15
        SET @Clase = 'Cliente VIP';
    ELSE IF @Total > 5
        SET @Clase = 'Cliente Frecuente';
    ELSE
        SET @Clase = 'Cliente Nuevo';
    INSERT INTO @Resultado (IdCliente, TotalReservas, Clasificacion)
    VALUES (@IdCliente, @Total, @Clase);

    RETURN;
END;
GO

-- Ejecutar función
SELECT 
    *,
    GETDATE() AS Fecha_Consulta,
    agcs.fn_NombreCompletoPersona(98) AS Estudiante
FROM agcs.fn_MT_ClasificarReservasCliente(20);