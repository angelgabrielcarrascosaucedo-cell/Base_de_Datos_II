-- Crear o alterar la función para contar reservas por cliente
CREATE OR ALTER FUNCTION agcs.fn_CantidadReservasCliente
(
    @IdCliente INT
)
RETURNS INT
AS
BEGIN
    DECLARE @TotalReservas INT;

    SELECT @TotalReservas = COUNT(*)
    FROM agcs.reserva
    where id_cliente = @IdCliente;

    RETURN ISNULL(@TotalReservas, 0);
END;
GO

-- Ejemplo de ejecución de la función
SELECT 
    agcs.fn_NombreCompletoPersona(104) AS Estudiante,
    agcs.fn_CantidadReservasCliente(2) AS CantidadReservas,
    GETDATE() AS Fecha_Consulta;