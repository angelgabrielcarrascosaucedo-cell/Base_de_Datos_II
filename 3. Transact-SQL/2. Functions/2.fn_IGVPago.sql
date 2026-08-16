-- Calcular el IGV de un Pago
CREATE OR ALTER FUNCTION AGCS.fn_CalcularIGVPago
(
	@monto money
)
RETURNS money
as
begin
	return @monto*0.18;
end;
go

Select AGCS.fn_CalcularIGVPago (459) as IGV,
GETDATE() as Fecha_Consulta;

Select 
monto,
AGCS.fn_CalcularIGVPago(monto) as IGV,
GETDATE() as Fecha_Consulta
from AGCS.pago
where monto >=0