CREATE OR ALTER VIEW agcs.vw_personas
AS
SELECT
	p.apaterno,
	p.amaterno,
	p.nombres,
	case
		when p.tipo_persona = 'N' then 'Natural'
		when p.tipo_persona = 'J' then 'Juridica'
	end as [tipo Persona],
	estado,
	getdate() Fecha_Consulta,
	agcs.fn_NombreCompletoPersona(104) as Estudiante
FROM agcs.persona p

Select *
From agcs.vw_personas
