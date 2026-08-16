--Procedimiento Almacenado con varios parametros

CREATE OR ALTER PROCEDURE AGCS.sp_ReservaFecha
@inicio date,
@fin date
as
Begin
	Select *
	From AGCS.reserva r
	where r.fecha_reserva
	between @inicio and @fin
End;
Go

--Ejecutar
EXEC AGCS.sp_ReservaFecha '2026-01-01', '2026-01-31';
Go