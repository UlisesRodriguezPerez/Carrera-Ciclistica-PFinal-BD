USE [ProyectoFinal_BD]
GO
/****** Object:  StoredProcedure [dbo].[SPSimulacion]    Script Date: 31/1/2021 08:18:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE  OR ALTER PROCEDURE [dbo].[SPSimulacion]
AS

BEGIN
	SET NOCOUNT ON


	DECLARE @tablaLlegadas AS [dbo].[LlegadaDeEtapas];
	DECLARE @TablaPremiosMontana AS [dbo].[PremiosMontana];
	DECLARE @TablaSanciones AS [dbo].[Sanciones];
	--DECLARE @TablaEstadosDeCuenta AS [dbo].[TablaEstadosDeCuenta];
	--DECLARE @TablaBeneficiarios AS [dbo].[BeneficiarioPerTrigger];
	DECLARE @AnioDeOperacion INT

	DECLARE @IdGiro INT
	DECLARE @CodigoInstancia VARCHAR(50)
	DECLARE @FechaInicio DATE
	DECLARE @FechaFin DATE
	

	DECLARE @InstanciasPorIterar TABLE
		(
			 iterador INT IDENTITY(1,1) PRIMARY KEY
		    ,idGiro INT
			,codigoInstancia VARCHAR(50)
			,fechaInicio DATE
			,fechaFin DATE
			,anio INT
		)

	-- Tabla para almacenas las fechas según el XML.
	DECLARE @FechasPorIterar TABLE
		(
			 iterador INT IDENTITY(1,1) PRIMARY KEY
			,anio INT
		)

	-- Sección para cargar las fechas desde el XML y parsearlo antes.

	BEGIN TRY
		--Parsear el XML e insertar datos en la tabla
		DECLARE 
				@DocumentoXML XML;
	
		SELECT 
			@DocumentoXML = DXML
		FROM 
			OPENROWSET(BULK 'C:\Users\ulirp\Desktop\BAses\Carrera-Ciclistica-PFinal-BD\Base_de_Datos\XML\DatosFinales.xml', SINGLE_BLOB) AS DocumentoXML(DXML);
		
		INSERT 
			@FechasPorIterar (anio)

		SELECT 
			f.value('@Id','INT')
		FROM 
			@DocumentoXML.nodes('/Year')AS t(f);

	END TRY

	BEGIN CATCH
		EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50015, @Descripcion = 'ERROR AL parsear el archivo de la simulación  ([dbo].[SPSimulacion])'
			PRINT 'ERROR AL PARSEAR EL XML EN LA SIMULACIÓN.'
			--RETURN @@ERROR;
	END CATCH


	
	
	

	-- Sección donde vamos a declarar las variables para poder iterar por día.
	DECLARE @primerAnio INT
	DECLARE @ultimoAnio INT
	DECLARE @anioMinimo INT
	DECLARE @anioMaximo INT
	DECLARE @anioNodo INT

	DECLARE @primerInstancia INT
	DECLARE @ultimaInstancia INT
	DECLARE @instanciaMinima INT
	DECLARE @instanciaMaxima INT
	DECLARE @instanciaNodo INT




	-- Asignamos las fechas a cada variable con MIN y MAX (funciones agregadas)
	BEGIN TRY
		SELECT 
			 @anioMinimo = MIN(F.anio)
			,@anioMaximo = MAX(F.anio)
		FROM @FechasPorIterar F
	
		-- Inicializamos las variables inicio y fin de fechas con las cuales se va a recorrer la simulación.
		SELECT 
			@primerAnio = F.iterador
		FROM
			@FechasPorIterar F
		WHERE
			F.anio = @anioMinimo
	
		SELECT 
			@ultimoAnio = F.iterador
		FROM
			@FechasPorIterar F
		WHERE
			F.anio = @anioMaximo


	
		-- Inicializamos las variables inicio y fin de fechas con las cuales se va a recorrer la simulación.
		--SELECT 
		--	@primerAnio = F.iterador
		--FROM
		--	@FechasPorIterar F
		--WHERE
		--	F.anio = @anioMinimo
	
		--SELECT 
		--	@ultimoAnio = F.iterador
		--FROM
		--	@FechasPorIterar F
		--WHERE
		--	F.anio = @anioMaximo
	END TRY
	BEGIN CATCH
		EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50016, @Descripcion = 'ERROR AL inicializar las variable principales para recorrer la simulación ([dbo].[SPSimulacion])'
		--RETURN @@ERROR;
	END CATCH
		--SELECT * FROM @FechasPorIterar
		-- Comezamo la simulación con un WHILE iniciando desde @primerDia hasta @ultimoDia.
		WHILE 
			@primerAnio <= @ultimoAnio

			BEGIN
				BEGIN TRY
					SELECT 
						@AnioDeOperacion = F.anio
					FROM
						@FechasPorIterar F
					WHERE 
						iterador = @primerAnio

					SET @anioNodo = @DocumentoXML.value('(/Year/@Id)[1]','INT')

				END TRY
				BEGIN CATCH
					EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50017, @Descripcion = 'ERROR AL obtener el anio para ir iterando Simulación ([dbo].[SPSimulacion])'
					--RETURN @@ERROR;
				END CATCH

				BEGIN TRY
					INSERT INTO [dbo].[InstanciaGiro]
								(
									 [IdGiro]
									,[Año]
									,[FechaInicio]
									,[FechaFinal]
									,[CodigoInstacia]
								)
					SELECT	                                                                
								d.value('@IdGiro', 'INT')
								,YEAR(d.value('@FechaInicio', 'DATE'))
								,d.value('@FechaInicio', 'DATE')
								,d.value('@FechaFin', 'DATE')
								,d.value('@CodigoInstancia','VARCHAR(50)')

							
					FROM 
							@DocumentoXML.nodes('/Year[@Id eq sql:variable("@AnioDeOperacion")]/InstanciaGiro') AS t(d)
				END TRY
				BEGIN CATCH
						EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50018, @Descripcion = 'ERROR AL insertar InstanciaGiro en simulación  ([dbo].[SPSimulacion])'
							--RETURN @@ERROR;
				END CATCH

				BEGIN TRY
					INSERT 
						@InstanciasPorIterar 
							(
								 idGiro
								,codigoInstancia
								,fechaInicio
								,fechaFin
								,anio
							)
					SELECT 
						 f.value('@IdGiro','INT')
						,f.value('@CodigoInstancia','VARCHAR(50)')
						,f.value('@FechaInicio','DATE')
						,f.value('@FechaFin','DATE')
						,YEAR(f.value('@FechaInicio', 'DATE'))
					FROM 
						@DocumentoXML.nodes('/Year[@Id eq sql:variable("@AnioDeOperacion")]/InstanciaGiro')AS t(f);
					
				END TRY
				BEGIN CATCH
					EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50020, @Descripcion = 'ERROR AL insertar datos tabla instancias temporal a la simulación  ([dbo].[SPSimulacion])'
								--PENDIENTE revisar codigo error
					--RETURN @@ERROR;
				END CATCH

				
				
				--VAriables instancias
				SELECT 
					 @instanciaMinima = MIN(I.iterador)
					,@instanciaMaxima = MAX(I.iterador)
				FROM @InstanciasPorIterar I
				

				
				WHILE  --Inicio del while de las instancias por anio.
					@instanciaMinima <= @instanciaMaxima
					BEGIN
						--SELECT iterador,codigoInstancia FROM @InstanciasPorIterar
						BEGIN TRY
							SELECT 
								 @CodigoInstancia = codigoInstancia
								,@IdGiro = idGiro
								,@FechaInicio = fechaInicio
								,@FechaFin = fechaFin
							FROM
								@InstanciasPorIterar
							WHERE
								iterador = @instanciaMinima


						END TRY
						BEGIN CATCH
							EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50021, @Descripcion = 'ERROR AL obtener la instancia para ir iterando Simulación ([dbo].[SPSimulacion])'
							--RETURN @@ERROR;
						END CATCH
						-- COMENZAMOS A PROCESAR LOS NODOS PRINCIPALES.
				
						 

						BEGIN TRY
							INSERT INTO [dbo].[InstanciaDeGiroPorEquipo]
									(
										 [IdInstanciaGiro]
										,[IdEquipo]
										,[TotalTiempo]
										,[TotalPuntos]
										,CodigoInstanciaGiro
											
									)
							SELECT	                                                                
									  IG.Id
									 ,E.Id
									 ,'0:00:00:00'
									 ,0
									 ,@CodigoInstancia
							 

							
							FROM 
									@DocumentoXML.nodes('/Year[@Id eq sql:variable("@AnioDeOperacion")]/InstanciaGiro[@CodigoInstancia eq sql:variable("@CodigoInstancia")]/GiroXEquipo') AS t(d)
							
									INNER JOIN [dbo].[InstanciaGiro] IG ON t.d.value('@CodigoInstanciaGiro', 'VARCHAR(50)') = IG.CodigoInstacia
									INNER JOIN [dbo].[Equipo] E ON t.d.value('@Equipo', 'INT') = E.Id
							ORDER BY 
								E.Id
							
						END TRY

						BEGIN CATCH
								EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50019, @Descripcion = 'ERROR AL insertar InstanciaDeGiroPorEquipo en simulación  ([dbo].[SPSimulacion])'
									--RETURN @@ERROR;
						END CATCH

						BEGIN TRY
							INSERT INTO [dbo].[InstaciaDeGiroPorEquipoPorCorredor]
									(
										 [IdInstanciaDeGiroPorEquipo]
										,[IdCorredor]
										,[SumaTiempo]
										,[SumaPuntosRegularidad]
										,[SumaPuntosMontaña]
										,[NumeroCamisa]
											
									)
							SELECT	                                                                
									  IGE.Id
									 ,d.value('@Corredor', 'INT')
									 ,'00:00:00'
									 ,0
									 ,0
									 ,d.value('@NumeroCamisa', 'INT')
							 

							
							FROM 
									@DocumentoXML.nodes('/Year[@Id eq sql:variable("@AnioDeOperacion")]/InstanciaGiro[@CodigoInstancia eq sql:variable("@CodigoInstancia")]/CorredoresEnEquipoEnGiro') AS t(d)
							
									INNER JOIN [dbo].[Corredor] C ON t.d.value('@Corredor', 'INT') = C.Id
									INNER JOIN [dbo].[Giro] G ON G.Id = @IdGiro
									INNER JOIN [dbo].[InstanciaGiro] IG ON t.d.value('@CodigoInstanciaGiro', 'VARCHAR(50)') = IG.CodigoInstacia AND IG.IdGiro = G.Id
									INNER JOIN [dbo].[InstanciaDeGiroPorEquipo] IGE ON t.d.value('@Equipo', 'INT') = IGE.IdEquipo AND IG.Id = IGE.IdInstanciaGiro	
							ORDER BY
								C.Id

						END TRY
						BEGIN CATCH
								EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50022, @Descripcion = 'ERROR AL insertar InstanciaDeGiroPorEquipoPorCorredor en simulación  ([dbo].[SPSimulacion])'
									--RETURN @@ERROR;
						END CATCH

						BEGIN TRY
							INSERT INTO [dbo].[Carrera]
									(
										 [IdEtapa]
										,[Fecha]
										,[HoraIncio]
										,[CodigoCarrera]	
									)
							SELECT	                                                                
									  ET.Id
									 ,d.value('@FechaCarrera', 'DATE')
									 ,d.value('@HoraInicio', 'TIME(0)')
									 ,d.value('@CodigoCarrera', 'VARCHAR(50)')
							FROM 
									@DocumentoXML.nodes('/Year[@Id eq sql:variable("@AnioDeOperacion")]/InstanciaGiro[@CodigoInstancia eq sql:variable("@CodigoInstancia")]/Carrera') AS t(d)
							
									INNER JOIN [dbo].[Giro] G ON G.Id = @IdGiro
									INNER JOIN [dbo].[InstanciaGiro] IG ON t.d.value('@CodigoInstanciaGiro', 'VARCHAR(50)') = IG.CodigoInstacia AND IG.IdGiro = G.Id
									INNER JOIN [dbo].[Etapa] ET ON t.d.value('@IdEtapa', 'INT') = ET.Id AND IG.IdGiro = G.Id
							ORDER BY
								FechaInicio
						END TRY

						BEGIN CATCH
								EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50023, @Descripcion = 'ERROR AL insertar Carrera en simulación  ([dbo].[SPSimulacion])'
									--RETURN @@ERROR;
						END CATCH


						BEGIN TRY
							DELETE @tablaLlegadas
							INSERT @tablaLlegadas
									(
										 
										 [idCarrera]
										,[idCorredor]
										,[horaFin]
										,[idGiro]
										,[codigoInstancia]
									)
							SELECT	                                                                
									  CA.Id
									 ,CO.Id
									 ,d.value('@HoraLlegada', 'TIME(0)')
									 ,G.Id
									 ,@CodigoInstancia
									 --,ET.Puntos
									 --,@IdGiro
					
									
							FROM 
									@DocumentoXML.nodes('/Year[@Id eq sql:variable("@AnioDeOperacion")]/InstanciaGiro[@CodigoInstancia eq sql:variable("@CodigoInstancia")]/FinalCorredoresEnCarrera') AS t(d)
							
									INNER JOIN [dbo].[Giro] G ON G.Id = @IdGiro
									INNER JOIN [InstanciaGiro] IG ON IG.CodigoInstacia = @CodigoInstancia AND IG.IdGiro = G.Id
									INNER JOIN [InstanciaDeGiroPorEquipo] IGE ON IGE.IdInstanciaGiro = IG.Id
									INNER JOIN [Corredor] CO ON t.d.value('@NumeroCamisa', 'INT') = CO.Id
									
									INNER JOIN [dbo].[Carrera] CA ON t.d.value('@CodigoCarrera', 'VARCHAR(50)') = CA.CodigoCarrera --AND CA.IdEtapa = ET.Id
									INNER JOIN [dbo].[InstaciaDeGiroPorEquipoPorCorredor] IGEC ON t.d.value('@NumeroCamisa', 'INT') = IGEC.NumeroCamisa AND IGEC.IdInstanciaDeGiroPorEquipo = IGE.Id
									INNER JOIN [dbo].[Etapa] ET ON CA.IdEtapa = ET.Id AND ET.IdGiro = G.Id

							EXEC [SPLlegadasSimulacion] @tablaLlegadas;
						END TRY

						BEGIN CATCH
								EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50024, @Descripcion = 'ERROR AL insertar Llegadas en tabla aux en simulación  ([dbo].[SPSimulacion])'
									--RETURN @@ERROR;
						END CATCH

						BEGIN TRY
							DELETE @TablaPremiosMontana
							INSERT @TablaPremiosMontana
									(
										 
										 [idCarrera]
										,[idCorredor]
										,[idPremioMontana]
										,[idGiro]
										,[codigoInstancia]
										,[idEtapa]
										,[puntosPorPremio]
										,[fecha]
									)
							SELECT	                                                                
									  CA.Id
									 ,CO.Id
									 ,PM.Id
									 ,G.Id
									 ,@CodigoInstancia
									 ,PM.IdEtapa
									 ,PM.Puntos
									 ,CA.Fecha
									 
					
									
							FROM 
									@DocumentoXML.nodes('/Year[@Id eq sql:variable("@AnioDeOperacion")]/InstanciaGiro[@CodigoInstancia eq sql:variable("@CodigoInstancia")]/GanadorPremioMontanaEnCarrera') AS t(d)
							
									INNER JOIN [dbo].[Giro] G ON G.Id = @IdGiro
									INNER JOIN [InstanciaGiro] IG ON IG.CodigoInstacia = @CodigoInstancia AND IG.IdGiro = G.Id
									INNER JOIN [InstanciaDeGiroPorEquipo] IGE ON IGE.IdInstanciaGiro = IG.Id
									INNER JOIN [Corredor] CO ON t.d.value('@NumeroCamisa', 'INT') = CO.Id
									INNER JOIN [PremioMontana] PM ON t.d.value('@NombrePremio', 'VARCHAR(50)') = PM.Nombre
									INNER JOIN [dbo].[Carrera] CA ON t.d.value('@CodigoCarrera', 'VARCHAR(50)') = CA.CodigoCarrera --AND CA.IdEtapa = ET.Id
									INNER JOIN [dbo].[InstaciaDeGiroPorEquipoPorCorredor] IGEC ON t.d.value('@NumeroCamisa', 'INT') = IGEC.NumeroCamisa AND IGEC.IdInstanciaDeGiroPorEquipo = IGE.Id
									INNER JOIN [dbo].[Etapa] ET ON CA.IdEtapa = ET.Id AND ET.IdGiro = G.Id

							EXEC [SPPremiosMontana] @TablaPremiosMontana;
						END TRY

						BEGIN CATCH
								EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50024, @Descripcion = 'ERROR AL insertar Llegadas en tabla aux en simulación  ([dbo].[SPSimulacion])'
									--RETURN @@ERROR;
						END CATCH


						BEGIN TRY
							DELETE @TablaSanciones
							INSERT @TablaSanciones
									(
										 
										 [idCarrera]
										,[idCorredor]
										,[idJuez]
										,[idGiro]
										,[codigoInstancia]
										,[idEtapa]
										,[minutosCastigo]
										,[descripción]
									)
							SELECT	                                                                
									  CA.Id
									 ,CO.Id
									 ,J.Id
									 ,G.Id
									 ,@CodigoInstancia
									 ,ET.Id
									 ,d.value('@MinutosCastigo', 'INT')
									 ,d.value('@CodigoCarrera', 'VARCHAR(50)')
									 
					
									
							FROM 
									@DocumentoXML.nodes('/Year[@Id eq sql:variable("@AnioDeOperacion")]/InstanciaGiro[@CodigoInstancia eq sql:variable("@CodigoInstancia")]/SancionCarrera') AS t(d)
							
									INNER JOIN [dbo].[Giro] G ON G.Id = @IdGiro
									INNER JOIN [InstanciaGiro] IG ON IG.CodigoInstacia = @CodigoInstancia AND IG.IdGiro = G.Id
									INNER JOIN [InstanciaDeGiroPorEquipo] IGE ON IGE.IdInstanciaGiro = IG.Id
									INNER JOIN [Corredor] CO ON t.d.value('@NumeroCamisa', 'INT') = CO.Id
									INNER JOIN [dbo].[Carrera] CA ON t.d.value('@CodigoCarrera', 'VARCHAR(50)') = CA.CodigoCarrera --AND CA.IdEtapa = ET.Id
									INNER JOIN [dbo].[InstaciaDeGiroPorEquipoPorCorredor] IGEC ON t.d.value('@NumeroCamisa', 'INT') = IGEC.NumeroCamisa AND IGEC.IdInstanciaDeGiroPorEquipo = IGE.Id
									INNER JOIN [dbo].[Etapa] ET ON CA.IdEtapa = ET.Id AND ET.IdGiro = G.Id
									INNER JOIN Juez J ON J.Id = t.d.value('@IdJuez', 'INT')

							EXEC [SPSancionesSimulacion] @tablaSanciones;
						END TRY

						BEGIN CATCH
								EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50036, @Descripcion = 'ERROR AL insertar sanciones en tabla aux en simulación  ([dbo].[SPSimulacion])'
									--RETURN @@ERROR;
						END CATCH


					SET @instanciaMinima = @instanciaMinima + 1
					--SET @primerAnio = 10
				END --Fin del while interno

				DELETE @InstanciasPorIterar
				--DBCC CHECKIDENT ('[@InstanciasPorIterar]', RESEED, 0) --para los identity

			SET @primerAnio = @primerAnio + 1;

		END --Fin WHILE

		

END