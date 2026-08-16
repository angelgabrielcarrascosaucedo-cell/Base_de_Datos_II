CREATE OR ALTER PROCEDURE AGCS.sp_ListarClientes
AS
BEGIN
    Select p.id_persona, p.tipo_persona,nombres, apaterno,amaterno, estado
    From AGCS.persona p
    inner join AGCS.cliente c
    on p.id_persona = c.id_persona
END
GO