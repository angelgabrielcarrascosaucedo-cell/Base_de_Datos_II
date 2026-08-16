--Procedimiento Almacenado con OUTPUT

CREATE OR ALTER PROCEDURE AGCS.sp_TotalReservas
@total int output
as
Begin
	Select 
	@total=count(*)
	From AGCS.reserva;
End;
Go

--Ejecutar
Declare @cantidad int EXEC AGCS.sp_TotalReservas @cantidad output;

Select @cantidad as Total_Reservas;