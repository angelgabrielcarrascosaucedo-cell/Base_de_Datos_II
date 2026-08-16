CREATE OR ALTER PROCEDURE AGCS.sp_ListarPersonas
AS
BEGIN
    Select id_persona, tipo_persona,nombres, apaterno,amaterno, estado
    From AGCS.persona
END
GO