AGetFileVersion(CgsVer, 'cgs.exe')
If MessageBox("Este programa atualiza o CGS para a versão " + CgsVer(4) + Chr(13);
	+ "Recomendamos que faça um backup dos seus dados antes de atualizar." + Chr(13);
	+ "Clique em OK para continuar ou Cancelar para sair sem atualizar.", 65,;
	"Atualização do CGS v" + CgsVer(4)) = 2 Then
	Return
EndIf
Set Safety Off
Public _Database As String
Public _SystemPath As String
Public Array CgsVersion(1)
Public _Retorno As Boolean
Local _UpdatePath As String
Local _Computer As String
_UpdatePath = Sys(5) + Curdir()
_Retorno = .F.
Do ReadWriteFileIni && cria objeto ReadWriteFileIni para leitura e gravação do arquivo .ini
DO crypto && cria objeto csCrypt para criptografia
DO hdSerial && cria objeto hdSerial para leitura do número serial do hd

WSHShell = CreateObject("WScript.Shell")
_SystemPath = WSHShell.RegRead("HKCU\Software\Salisoft\Cgs\InstallDir")
_Database = ReadWriteFileIni.ReadFileIni(_SystemPath + 'Config.ini', 'Database', 'cgs_base_connector')
_Computer = ReadWriteFileIni.ReadFileIni(_SystemPath + 'Config.ini', 'Computer', 'cgs_computer')
Set Path To &_UpdatePath; &_SystemPath
Agetfileversion(CgsVersion, _SystemPath + 'cgs.exe')

Do _Exec In BaseUpd With "0." + Alltrim(Str(Val(Substr(CgsVer(4), 3, 1)) - 2)) + ".999"
If _Retorno Then
	MessageBox('Versão instalada incompatível com esta atualização.' + Chr(13);
		+ 'Atualização compatível com CGS v0.' + Alltrim(Str(Val(Substr(CgsVer(4), 3, 1)) - 1)) + ' ou superior.', 16, 'Cybersis develop!')
	On Shutdown
	Quit
EndIf

Try
	If _Computer == 'Server' Then
		*! Se o sistema for instalado em uma pasta como por exemplo:
		*! c:\Arquivos de programas\cgs evita que o sistema retorne
		*! erro devido aos espaços na pasta "Arquivos de programas"
		***********************************************************
		x = '"' + _Database + '"'
		***********************************************************
		If !Directory(_SystemPath + 'CopiaDados') Then
			MkDir &_SystemPath.CopiaDados
		Endif
		Copy File &_SystemPath.dados\*.* To &_SystemPath.CopiaDados
		Open Database &x Exclusive && Abre o banco de dados
	EndIf
Catch To oErr
	Local _Stop As Boolean
	_Stop = .T.
	Do Case
		Case oErr.ErrorNo = 3
			If MessageBox('Não foi possível criar uma cópia de segurança dos seus dados, deseja continuar sem backup?', 36, 'Falha na cópia de segurança!') = 6 Then
				_Stop = .F.
			EndIf
		Case oErr.ErrorNo = 1705
			Messagebox('O programa de atualização precisa ser executado em modo exclusivo,' + Chr(13);
				+ 'por favor feche todas as conexões do sistema e tente novamente,' + Chr(13);
				+ 'se o problema persistir, reinicie o computador e tente mais uma vez.' + Chr(13);
				+ 'Se ainda assim o problema persistir, entre em contato com o suporte técnico.' + Chr(13);
				+ 'Fone: (41)3289-5784, Email: suporte@cybersis.com.br',;
				16, 'Cybersis develop!')
	EndCase
	If _Stop Then
		On Shutdown
		Quit
	EndIf
Endtry

Try
	If _Computer == 'Server' Then
		Chdir Justpath(_Database)
		Do BaseUpd
		Chdir &_SystemPath
	EndIf
	Delete File _SystemPath + "MiniAjuda\*.html"
	If !Directory(_SystemPath + 'Imagens') Then
		MkDir &_SystemPath.Imagens
	Endif
	If !Directory(_SystemPath + 'Imagens\jpg') Then
		MkDir &_SystemPath.Imagens\jpg
	EndIf
	AGetFileVersion(VerInst, _SystemPath + 'cgs.exe')
	Copy File _SystemPath + "Cgs.exe" To _SystemPath + "Cgs_" + VerInst(4) + ".exe"
	Copy File _UpdatePath + "Cgs.exe" To _SystemPath + "Cgs.exe"
	Copy File _UpdatePath + "MiniAjuda\*.html" To _SystemPath + "MiniAjuda\*.html"
	Copy File _UpdatePath + "Imagens\jpg\logo_cybersis.jpg" To _SystemPath + "Imagens\jpg\logo_cybersis.jpg"
	Messagebox("Atualização Concluída.",64,"Atualização!")
Catch To oErr
	Messagebox([  Error: ] + Str(oErr.ErrorNo) + Chr(13) +;
		[  LineNo: ] + Str(oErr.Lineno) + Chr(13) +;
		[  Message: ] + oErr.Message + Chr(13) +;
		[  Procedure: ] + oErr.Procedure + Chr(13) +;
		[  Details: ] + oErr.Details + Chr(13) +;
		[  StackLevel: ] + Str(oErr.StackLevel) + Chr(13) +;
		[  LineContents: ] + oErr.LineContents)
	On Shutdown
	Quit
Endtry
