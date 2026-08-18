CREATE OR ALTER FUNCTION agcs.fn_MT_ResumenHabitacionesAlojamiento
(
    @IdAlojamiento INT
)
RETURNS @Resultado TABLE
(
    NumeroHabitacion VARCHAR(50),
    TipoHabitacion VARCHAR(100),
    Capacidad INT,
    PrecioNoche MONEY,
    EstadoHabitacion VARCHAR(50)
)
AS
BEGIN
    INSERT INTO @Resultado
    SELECT 
        H.numero_habitacion,
        TH.nombrehabitacion,
        TH.capacidad_personas,
        H.precio_noche,
        H.estado
    FROM agcs.habitacion H
    INNER JOIN agcs.tipo_habitacion TH ON H.id_tipo_habitacion = TH.id_tipo_habitacion
    WHERE H.id_alojamiento = @IdAlojamiento;

    RETURN;
END;
GO

-- Ejecutar función
SELECT 
    *,
    GETDATE() AS Fecha_Consulta,
    agcs.fn_NombreCompletoPersona(104) AS Estudiante
FROM agcs.fn_MT_ResumenHabitacionesAlojamiento(1);