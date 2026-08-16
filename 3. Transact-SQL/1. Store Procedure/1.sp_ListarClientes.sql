-- Procedimiento Almacenado sin Parametros

CREATE OR ALTER PROCEDURE AGCS.sp_ListarClientes
AS
BEGIN
	Select *
	From AGCS.persona p
	inner join AGCS.cliente c
	on p.id_persona = c.id_persona
END

--Ejecutar
EXEC AGCS.sp_ListarClientes;