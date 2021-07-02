/****** Object:  StoredProcedure [dbo].[prcAuditoria_AceptarDocumento]    Script Date: 1/7/2021 21:00:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[prcAuditoria_AceptarDocumento](@idDocumento char(21), @usuarioAuditor varchar(10))
as
--@mensaje varchar(1000)OUTPUT
begin

	if (Select idEstado from Documentos where idDocumento = @idDocumento ) not in ('REV', 'REC')    
	begin
		update Documentos set idEstado = 'REV', FechaRevision = getDate(), usuarioAuditor = @usuarioAuditor
						 where idDocumento = @idDocumento
		--SET @mensaje = 'Se acepto el documento con exito'
	end
	/*ELSE
		BEGIN
			SET @mensaje = 'No se puede cambiar el estado de un documento si ya ha sido aceptado o rechazado. Debe crear uno nuevo'
		END*/
end