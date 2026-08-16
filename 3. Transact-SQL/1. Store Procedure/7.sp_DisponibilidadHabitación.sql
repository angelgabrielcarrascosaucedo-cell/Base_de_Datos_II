-- Procedimiento Almanacenado con Condicionales IF-ELSE

CREATE OR ALTER PROCEDURE AGCS.sp_DisponibilidadHabitacion
@idhabitacion int
As
Begin
	IF EXISTS(
		Select 1 From AGCS.reserva_habitacion
		Where id_habitacion = @idhabitacion
	)
		print 'Habitacion Reservada';
	ELSE
		IF NOT EXISTS (
			Select 1 From AGCS.habitacion
			Where id_habitacion = @idhabitacion
			)
			print 'Habitación No Existe';
		ELSE
			print 'Habitacion Disponible';
End;
Go
--Ejecutar
EXEC AGCS.sp_DisponibilidadHabitacion 100;