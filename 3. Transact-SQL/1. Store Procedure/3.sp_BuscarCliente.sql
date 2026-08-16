---- Procedimiento Almacenado con Parametros

CREATE OR ALTER PROCEDURE AGCS.sp_BuscarCliente
@dni varchar(8)
AS
BEGIN
	Select *
	From AGCS.persona p
	Where p.numero_documento = @dni
END;
Go

--Ejecutar
EXEC AGCS.sp_BuscarCliente '44444448';
go