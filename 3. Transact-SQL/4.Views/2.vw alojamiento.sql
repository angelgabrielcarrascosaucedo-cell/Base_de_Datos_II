USE TURISMOPERU_AGCS
CREATE OR ALTER VIEW agcs.vw_alojamientos
AS
SELECT 
	nombre,
	TA.Nombre_Tipo,
	TA.Descripcion,
	GETDATE() AS Fecha_Consulta,
	agcs.fn_NombreCompletoPersona(104) as Estudiante
FROM agcs.alojamiento A
INNER JOIN AGCS.tipo_alojamiento TA ON 
A.id_tipoalojamiento = TA.id_tipoalojamiento;

SELECT *
FROM AGCS.vw_alojamientos;