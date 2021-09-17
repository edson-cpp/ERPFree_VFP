PUBLIC ReadWriteFileIni
ReadWriteFileIni = CREATEOBJECT("_ReadWriteFileIni")

DEFINE CLASS _ReadWriteFileIni as Custom
	FUNCTION WriteFileIni(tcFileName, tcSection, tcEntry, tcValue)
		*----------------------------------------------------
		* Escribe un valor de un archivo INI.
		* Si no existe el archivo, la sección o la entrada, la crea.
		* Retorna .T. si tuvo éxito
		* PARAMETROS:
		* tcFileName = Nombre y ruta completa del archivo.INI
		* tcSection = Sección del archivo.INI
		* tcEntry = Entrada del archivo.INI
		* tcValue = Valor de la entrada
		* USO: WriteFileIni("C:\MiArchivo.ini","Default","Port","2")
		* RETORNO: Logico
		*----------------------------------------------------
		DECLARE INTEGER WritePrivateProfileString ;
		IN WIN32API ;
		STRING cSection, STRING cEntry, STRING cEntry,;
		STRING cFileName

		RETURN IIF(WritePrivateProfileString(tcSection, tcEntry, tcValue, tcFileName) = 1, .T., .F.)
	ENDFUNC

	FUNCTION ReadFileIni(tcFileName, tcSection, tcEntry)
		*----------------------------------------------------
		* Lee un valor de un archivo INI.
		* Si no existe el archivo, la sección o la entrada, retorna .NULL.
		* PARAMETROS:
		* tcFileName = Nombre y ruta completa del archivo.INI
		* tcSection = Sección del archivo.INI
		* tcEntry = Entrada del archivo.INI
		* USO: ReadFileIni("C:\MiArchivo.ini","Default","Port")
		* RETORNO: Caracter
		*----------------------------------------------------
		LOCAL lcIniValue, lnResult, lnBufferSize
		DECLARE INTEGER GetPrivateProfileString ;
		IN WIN32API ;
		STRING cSection,;
		STRING cEntry,;
		STRING cDefault,;
		STRING @cRetVal,;
		INTEGER nSize,;
		STRING cFileName
		lnBufferSize = 255
		lcIniValue = SPACE(lnBufferSize)
		lnResult = GetPrivateProfileString(tcSection, tcEntry, "*NULL*",;
		@lcIniValue, lnBufferSize, tcFileName)
		lcIniValue = SUBSTR(lcIniValue, 1, lnResult)
		IF lcIniValue = "*NULL*"
			lcIniValue = .NULL.
		ENDIF
		RETURN lcIniValue
	ENDFUNC
ENDDEFINE
