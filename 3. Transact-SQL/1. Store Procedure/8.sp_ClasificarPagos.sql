--Procedimiento Almacenado con CASE
CREATE OR ALTER PROCEDURE AGCS.sp_clasificarpagos
as
Begin
	Select 
		monto,
		CASE
			WHEN monto < 0 then 'Nota Credito'
			WHEN monto < 1000 then 'Bajo'
			When monto < 2500 then 'Medio'
		Else 'Alto'
		end Nivel
	From AGCS.pago;
End;
Go

--Ejecutar
EXEC AGCS.sp_clasificarpagos;
Go