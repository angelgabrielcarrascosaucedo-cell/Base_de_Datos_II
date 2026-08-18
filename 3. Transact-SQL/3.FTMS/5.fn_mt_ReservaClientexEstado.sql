-- Función de reservas por cliente y por estado
CREATE OR ALTER FUNCTION agcs.fn_MT_ReservasClientePorEstado
(
    @IdCliente INT,
    @EstadoReserva VARCHAR(100) 
)
RETURNS @Resultado TABLE
(
    IdReserva INT,
    FechaReserva DATE,
    EstadoReserva VARCHAR(100)
)
AS
BEGIN
    IF @EstadoReserva IS NULL OR LTRIM(RTRIM(@EstadoReserva)) = ''
    BEGIN
        INSERT INTO @Resultado (IdReserva, FechaReserva, EstadoReserva)
        SELECT 
            R.id_reserva,
            R.fecha_reserva,
            ER.nombre
        FROM agcs.reserva R
        INNER JOIN agcs.estado_reserva ER ON R.id_estado_reserva = ER.id_estado_reserva
        WHERE R.id_cliente = @IdCliente;
    END
    ELSE
    BEGIN
        INSERT INTO @Resultado (IdReserva, FechaReserva, EstadoReserva)
        SELECT 
            R.id_reserva,
            R.fecha_reserva,
            ER.nombre
        FROM agcs.reserva R
        INNER JOIN agcs.estado_reserva ER ON R.id_estado_reserva = ER.id_estado_reserva
        WHERE R.id_cliente = @IdCliente 
          AND ER.nombre = @EstadoReserva;
    END

    RETURN;
END;
GO

-- EJEMPLO DE EJECUCIÓN 1
SELECT 
    *,
    GETDATE() AS Fecha_Consulta,
    agcs.fn_NombreCompletoPersona(104) AS Estudiante
FROM agcs.fn_MT_ReservasClientePorEstado(35, NULL);

-- EJECUCIÓN 2
SELECT 
   *,
   GETDATE() AS Fecha_Consulta,
   agcs.fn_NombreCompletoPersona(104) AS Estudiante
FROM agcs.fn_MT_ReservasClientePorEstado(35, 'Pendiente');