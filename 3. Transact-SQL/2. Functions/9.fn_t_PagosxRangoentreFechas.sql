-- Crear o alterar la función de tabla para pagos por rango de fechas
CREATE OR ALTER FUNCTION agcs.fn_PagosPorRangoFechas
(
    @FechaInicio DATE,
    @FechaFin DATE
)
RETURNS TABLE
AS
RETURN
(
    SELECT 
        id_pago AS [Codigo Pago],
        id_reserva AS [Codigo Reserva],
        monto AS [Monto Pagado],
        fecha_pago AS [Fecha de Pago]
    FROM agcs.pago
    WHERE fecha_pago BETWEEN @FechaInicio AND @FechaFin
);
GO

-- Ejemplo de ejecución de la función
SELECT 
    *,
    GETDATE() AS Fecha_Consulta,
    agcs.fn_NombreCompletoPersona(104) AS Estudiante
FROM agcs.fn_PagosPorRangoFechas('2026-01-01', '2026-12-31');