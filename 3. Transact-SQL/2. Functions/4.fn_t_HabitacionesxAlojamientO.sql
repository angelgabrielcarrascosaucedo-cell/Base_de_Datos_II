-- Habitaciones por alojamiento

CREATE OR ALTER FUNCTION AGCS.fn_HabitacionesAlojamiento
(
	@IdAlojamiento int
)
RETURNS TABLE
RETURN
(
	SELECT
		h.id_alojamiento,
		H.numero_habitacion,
		TH.nombrehabitacion,
		tH.capacidad_personas,
		H.precio_noche,
		H.estado,
		H.descripcion
	FROM jllb.habitacion H INNER JOIN
	AGCS.tipo_habitacion TH ON
	H.id_tipo_habitacion = TH.id_tipo_habitacion
	where id_alojamiento = @IdAlojamiento
);
GO

SELECT *,
	GETDATE() as Fecha_Consulta,
	AGCS.fn_NombreCompletoPersona (104) as Estudiante
FROM AGCS.fn_HabitacionesAlojamiento (2);