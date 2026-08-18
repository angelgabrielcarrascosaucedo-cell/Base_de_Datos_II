-- Reporte de clientes frecuentes
CREATE OR ALTER FUNCTION agcs.fn_MT_ReporteClientesFrecuentes()
RETURNS @Resultado TABLE
(
    IdCliente INT,
    TotalReservas INT,
    TotalPagado MONEY,
    ClasificacionCliente VARCHAR(50)
)
AS
BEGIN
    INSERT INTO @Resultado (IdCliente, TotalReservas, TotalPagado)
    SELECT 
        C.id_persona,
        COUNT(DISTINCT R.id_reserva),
        ISNULL(SUM(P.monto), 0)
    FROM agcs.cliente C
    INNER JOIN agcs.reserva R ON C.id_persona = R.id_cliente
    LEFT JOIN agcs.pago P ON R.id_reserva = P.id_reserva
    GROUP BY C.id_persona;

    UPDATE @Resultado
    SET ClasificacionCliente = CASE 
        WHEN TotalReservas > 15 THEN 'Cliente VIP'
        WHEN TotalReservas > 5 THEN 'Cliente Frecuente'
        ELSE 'Cliente Nuevo'
    END;

    RETURN;
END;
GO

--EJECUCIÓN 
SELECT 
    *,
    GETDATE() AS Fecha_Consulta,
    agcs.fn_NombreCompletoPersona(104) AS Estudiante 
FROM agcs.fn_MT_ReporteClientesFrecuentes()
