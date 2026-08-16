-- Reserva de un cliente
CREATE OR ALTER FUNCTION AGCS.fn_ReservaCliente
(
	@IdCliente int
)
RETURNS TABLE
RETURN
(
	SELECT
		id_reserva AS [Codigo Reserva],
		fecha_reserva,
		ER.nombre as [Estado Reserva]
	FROM jllb.reserva R inner join
	AGCS.estado_reserva ER on
	ER.id_estado_reserva = R.id_estado_reserva
	where R.id_cliente=@IdCliente
);
GO

-- Ejecutar Funcion Tabla
Select 
	*,
	GETDATE() as Fecha_Consulta,
	AGCS.fn_NombreCompletoPersona (104) AS Estudiante
from AGCS.fn_ReservaCliente (2);