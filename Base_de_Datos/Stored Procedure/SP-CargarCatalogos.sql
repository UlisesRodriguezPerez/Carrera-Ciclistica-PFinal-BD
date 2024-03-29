USE [ProyectoFinal_BD]
GO
/****** Object:  StoredProcedure [dbo].[SPCargar_Catalogos]    Script Date: 29/1/2021 21:45:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


ALTER    PROCEDURE [dbo].[SPCargar_Catalogos]
AS
BEGIN

	BEGIN TRY 
		/*    Parsear el XML e insertar datos en la tabla    */
		DECLARE 
				@DocumentoXML XML;
		SELECT 
				@DocumentoXML = DXML
		FROM 
				OPENROWSET(BULK 'C:\Users\ulirp\Desktop\BAses\Carrera-Ciclistica-PFinal-BD\Base_de_Datos\XML\Catalogo-TareaFinal.xml', SINGLE_BLOB) AS DocumentoXML(DXML);
	END TRY

	BEGIN CATCH
		EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50001, @Descripcion = 'Problemas al parsear XML (SPCargar_Catalogo)'
		--RETURN 'Error 50001'
		RETURN @@Error
	END CATCH

	BEGIN TRY
					/* Inserta en las siguientes tablas sus valores correspondientes, según el XML.*/
			INSERT INTO [dbo].[Pais](
														 [Id]
														 ,[Nombre]
													  )
			SELECT	
					  d.value('@Id', 'INT')
					, d.value('@Nombre', 'VARCHAR(50)')
			FROM 
					@DocumentoXML.nodes('/Catalogos/Paises/Pais') AS t(d)
	END TRY

	BEGIN CATCH
		EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50002, @Descripcion = 'ERROR AL INSERTAR DATOS EN LA TABLA [Pais] (SPCargar_Catalogo)'
			--RETURN 'Error 50002'
			RETURN @@Error
	END CATCH


	BEGIN TRY 
			INSERT INTO [dbo].[Giro](
											 [Id]
											 ,[Nombre]
											 ,[IdPais]
										  )
			SELECT	
					  d.value('@Id', 'INT')
					, d.value('@Nombre', 'VARCHAR(100)')
					, d.value('@IdPais', 'INT')
			FROM 
					@DocumentoXML.nodes('/Catalogos/Giros/Giro') AS t(d)
	END TRY

	BEGIN CATCH
		EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50003, @Descripcion = 'ERROR AL INSERTAR DATOS EN LA TABLA [Giro] (SPCargar_Catalogo)'
			--RETURN 'Error 50003'
			RETURN @@Error
	END CATCH


	BEGIN TRY
			INSERT INTO [dbo].[Etapa](
										 [Id]
										,[Nombre]
										,[IdGiro]
										,[Puntos]
									)
			SELECT	
					  d.value('@Id', 'INT')
					, d.value('@Nombre', 'VARCHAR(50)')
					,d.value('@IdGiro', 'INT')
					,d.value('@Puntos', 'INT')
			FROM 
					@DocumentoXML.nodes('/Catalogos/Etapas/Etapa') AS t(d)
	END TRY

	BEGIN CATCH
		EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50004, @Descripcion = 'ERROR AL INSERTAR DATOS EN LA TABLA [Etapa] (SPCargar_Catalogo)'
			--RETURN 'Error 50004'
			RETURN @@Error
	END CATCH


	BEGIN TRY
				INSERT INTO [dbo].[PremioMontana](
													 --[Id]
													 [Nombre]
													,[Puntos]
													,[IdGiro]
													,[IdEtapa]
													
													
												)
				SELECT	
						  --d.value('@Id', 'INT')
						  d.value('@Nombre', 'VARCHAR(50)')
						, d.value('@Puntos', 'INT')
						, d.value('@IdGiro', 'INT')
						, d.value('@IdEtapa', 'INT')
						
				FROM 
						@DocumentoXML.nodes('/Catalogos/PremiosMontana/PremioMontana') AS t(d)
	END TRY

	BEGIN CATCH
		EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50005, @Descripcion = 'ERROR AL INSERTAR DATOS EN LA TABLA [PremioMontraña] (SPCargar_Catalogo)'
			--RETURN 'Error 50005'
		  	RETURN @@Error
	END CATCH


	BEGIN TRY
				INSERT INTO [dbo].[Equipo](
													 [Id]
													,[Nombre]
													

												)
				SELECT	
						  d.value('@Id', 'INT')
						, d.value('@Nombre', 'VARCHAR(50)')

				FROM 
						@DocumentoXML.nodes('/Catalogos/Equipos/Equipo') AS t(d)
	END TRY

	BEGIN CATCH
		EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50006, @Descripcion = 'ERROR AL INSERTAR DATOS EN LA TABLA [Equipo] (SPCargar_Catalogo)'
			--RETURN 'Error 50006'
			RETURN @@Error
	END CATCH

	BEGIN TRY
				INSERT INTO [dbo].[Corredor](
													 [Id]
													,[Nombre]
	

												)
				SELECT	
						  d.value('@Id', 'INT')
						, d.value('@Nombre', 'VARCHAR(50)')


				FROM 
						@DocumentoXML.nodes('/Catalogos/Corredores/Corredor') AS t(d)
	END TRY

	BEGIN CATCH
		EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50007, @Descripcion = 'ERROR AL INSERTAR DATOS EN LA TABLA [Corredor] (SPCargar_Catalogo)'
			--RETURN 'Error 50007'
			RETURN @@Error
	END CATCH


		BEGIN TRY
				INSERT INTO [dbo].[Juez](
													 [Id]
													,[Nombre]
	

												)
				SELECT	
						  d.value('@Id', 'INT')
						, d.value('@Nombre', 'VARCHAR(50)')


				FROM 
						@DocumentoXML.nodes('/Catalogos/Jueces/Juez') AS t(d)
	END TRY

	BEGIN CATCH
		EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50008, @Descripcion = 'ERROR AL INSERTAR DATOS EN LA TABLA [Juez] (SPCargar_Catalogo)'
			--RETURN 'Error 50008'
			RETURN @@Error
	END CATCH
	
	BEGIN TRY
			INSERT INTO [dbo].[TipoMovimientoTiempo]
							(
								 [Id]
								,[Nombre]
							)
				SELECT	
						  d.value('@Id', 'INT')
						, d.value('@Nombre', 'VARCHAR(50)')


				FROM 
						@DocumentoXML.nodes('/Catalogos/TiposMovimientoTiempo/TipoMovimientoTiempo') AS t(d)
	END TRY

	BEGIN CATCH
		EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50009, @Descripcion = 'ERROR AL INSERTAR DATOS EN LA TABLA [TipoMovimientoTiempo] (SPCargar_Catalogo)'
			--RETURN 'Error 50009'
			RETURN @@Error
	END CATCH

	BEGIN TRY
			INSERT INTO [dbo].[TipoMovimientosPuntosRegular]
							(
								 [Id]
								,[Nombre]
							)
				SELECT	
						  d.value('@Id', 'INT')
						, d.value('@Nombre', 'VARCHAR(50)')


				FROM 
						@DocumentoXML.nodes('/Catalogos/TiposMovimientosPuntosRegularidad/TipoMovimientosPuntosRegularidad') AS t(d)
	END TRY

	BEGIN CATCH
		EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50010, @Descripcion = 'ERROR AL INSERTAR DATOS EN LA TABLA [TipoMovimientosPuntosRegular] (SPCargar_Catalogo)'
			--RETURN 'Error 50010'
			RETURN @@Error
	END CATCH


	BEGIN TRY
			INSERT INTO [dbo].[TipoMovimientoPuntosMontaña]
							(
								 [Id]
								,[Nombre]
							)
				SELECT	
						  d.value('@Id', 'INT')
						, d.value('@Nombre', 'VARCHAR(50)')


				FROM 
						@DocumentoXML.nodes('/Catalogos/TiposMovimientoPuntosMontana/TipoMovimientoPuntosMontana') AS t(d)
	END TRY

	BEGIN CATCH
		EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50011, @Descripcion = 'ERROR AL INSERTAR DATOS EN LA TABLA [TipoMovimientoPuntosMontaña] (SPCargar_Catalogo)'
			--RETURN 'Error 50011'
			RETURN @@Error
	END CATCH


END
