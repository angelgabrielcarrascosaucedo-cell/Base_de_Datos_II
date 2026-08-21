
CREATE OR ALTER VIEW agcs.vw_pagosmayores500
AS
SELECT 
	id_pago,
	id_reserva,
	monto,
	MP.nombre AS [Medio ed Pago],
	GETDATE() AS Fecha_Consulta,
	agcs.fn_NombreCompletoPersona(104) as Estudiante
FROM agcs.pago p
INNER JOIN AGCS.medio_pago MP ON 
p.id_medio_pago = MP.id_medio_pago
where monto>500;

SELECT *
FROM AGCS.vw_pagosmayores500;