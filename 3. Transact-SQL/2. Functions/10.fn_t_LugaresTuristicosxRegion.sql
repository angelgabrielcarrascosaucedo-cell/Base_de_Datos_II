-- Función corregida: Lugares turísticos por región
CREATE OR ALTER FUNCTION agcs.fn_LugaresTuristicosPorRegion
(
    @NombreRegion VARCHAR(100)
)
RETURNS TABLE
AS
RETURN
(
    SELECT 
        LT.id_lugarturistico AS [Codigo Lugar],
        LT.nombre AS [Nombre Lugar],
        LT.descripcion AS [Descripcion],
        LT.precio_entrada AS [Precio Entrada],
        LT.calificacion AS [Calificacion],
        R.nombreregion AS [Region]
    FROM agcs.lugar_turistico LT
    INNER JOIN agcs.region R ON LT.id_lugarturistico = R.id_region
    WHERE R.nombreregion LIKE '%' + @NombreRegion + '%'
);
GO

-- Ejemplo de ejecución de la función
SELECT 
    *,
    GETDATE() AS Fecha_Consulta,
    agcs.fn_NombreCompletoPersona(104) AS Estudiante
FROM agcs.fn_LugaresTuristicosPorRegion('Cusco');