-- Crear o alterar la función para clasificar al cliente
CREATE OR ALTER FUNCTION agcs.fn_ClasificarCliente
(
    @IdCliente INT
)
RETURNS VARCHAR(50)
AS
BEGIN
    DECLARE @TotalReservas INT;
    DECLARE @Clasificacion VARCHAR(50);

    -- Obtenemos el total de reservas del cliente usando la lógica anterior
    SELECT @TotalReservas = COUNT(*)
    FROM agcs.reserva
    WHERE id_cliente = @IdCliente;

    -- Evaluamos las condiciones de clasificación
    IF @TotalReservas > 15
        SET @Clasificacion = 'Cliente VIP';
    ELSE IF @TotalReservas > 5
        SET @Clasificacion = 'Cliente Frecuente';
    ELSE
        SET @Clasificacion = 'Cliente Nuevo';

    RETURN @Clasificacion;
END;
GO

-- ejecución
SELECT 
    agcs.fn_NombreCompletoPersona(104) AS Estudiante,
    2 AS IdCliente,
    agcs.fn_CantidadReservasCliente(2) AS TotalReservas,
    agcs.fn_ClasificarCliente(2) AS Clasificacion,
    GETDATE() AS Fecha_Consulta;