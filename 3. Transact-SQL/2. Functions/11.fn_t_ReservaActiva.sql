-- Crear o alterar la función de tabla para clientes con reservas activas
CREATE OR ALTER FUNCTION agcs.fn_ClientesReservasActivas()
RETURNS TABLE
AS
RETURN
(
    SELECT DISTINCT
        C.id_persona AS [Codigo Cliente],
        AGCS.fn_NombreCompletoPersona(C.id_persona) AS [Nombre Cliente],
        R.id_reserva AS [Codigo Reserva],
        R.fecha_reserva AS [Fecha Reserva],
        ER.nombre AS [Estado Reserva]
    FROM agcs.cliente C
    INNER JOIN agcs.reserva R ON C.id_persona = R.id_cliente
    INNER JOIN agcs.estado_reserva ER ON R.id_estado_reserva = ER.id_estado_reserva
    WHERE ER.nombre IN ('En Proceso', 'Confirmada', 'Parcialmente Pagada')
);
GO

-- Ejemplo de ejecución de la función
SELECT 
    *,
    GETDATE() AS Fecha_Consulta,
    agcs.fn_NombreCompletoPersona(104) AS Estudiante
FROM agcs.fn_ClientesReservasActivas();