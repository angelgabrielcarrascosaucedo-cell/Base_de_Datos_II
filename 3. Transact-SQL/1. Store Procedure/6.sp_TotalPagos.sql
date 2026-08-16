--Procedimiento Almacenado con Variables Locales

CREATE OR ALTER PROCEDURE AGCS.sp_TotalPagos
as
Begin
	Declare @total money;
	Select 
	@total=sum(monto)
	from AGCS.pago;
	Select @total as Total_Pagos;
end;
Go
--Ejecutar
EXEC AGCS.sp_TotalPagos;
Go