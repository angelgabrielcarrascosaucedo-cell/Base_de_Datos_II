CREATE OR ALTER PROCEDURE AGCS.sp_ListarHabitacionesDisponible
@estado Nvarchar(11)
As
Begin
	if (@estado = 'Disponible')
		Select * From AGCS.habitacion
		Where estado = @estado;
End;
Go
--Ejecutar
EXEC AGCS.sp_ListarHabitacionesDisponible 'Disponible';