Do decvar && Declara variáveis globais do sistema
Agetfileversion(CgsVersion, Sys(16))
Public StartCgs
StartCgs = Createobject("_StartCgs")
Do ReadWriteFileIni && cria objeto ReadWriteFileIni para leitura e gravação do arquivo .ini
StartCgs.ReadConfig()
Do crypto && cria objeto csCrypt para criptografia
Do hdSerial && cria objeto hdSerial para leitura do número serial do hd
Do Localizar && cria objeto VarLoc para abrir a tela de localização
Do SmallFunc && Inicia classe de pequenas funções
Do Util &&Inicia classe de pequenas funções padrão
Do Permissoes && Define permissões de acesso às telas do sistema
Do Parametros In ArrumaGrid && Define os parâmetros da grid

Do Case
	Case !File(SYSTEM_PATH + 'dados\cgs.dbc')
		Messagebox("Bem-Vindo ao CGS - Sistema de Gestão Comercial." + Chr(13);
			+ "Em apenas alguns passos seu sistema estará no ar." + Chr(13);
			+ "Apenas informe o CNPJ ou CPF do emitente." + Chr(13);
			+ "A seguir informe o CPF, nome de usuário e senha de administrador." + Chr(13);
			+ "Os dados do administrador poredão ser alterados posteriormente" + Chr(13);
			+ "através do cadastro de usuários no menu arquivo." + Chr(13);
			+ "Desejamos uma boa experiência no uso do sistema." + Chr(13);
			+ "Clique OK para continuar.", 48, "Configurar Servidor!")
		_Screen.WindowState = 2
		Do Form servidor With .T.
		_Screen.Visible = .T.
		Activate Window Screen
		Read Events
	Otherwise
		StartCgs.OpenDB()
		Try
			Select * From usuario Into Cursor cTemp
		Catch To oErr
			Do TrataErro With oErr, 'Inicio.prg'
			On Shutdown
			Quit
		Endtry
		If _Tally = 0 Then
			_Screen.WindowState = 2
			_Screen.Visible = .T.
			Activate Window Screen
			Do usuario
			Read Events
		Else
			StartCgs.Start()
		Endif
Endcase

Define Class _StartCgs As Custom
	Function Start
		Local _Qtde As Short
		Local _Meio As Short
		Local _Banner As String
		Local _Atu As String
		Local _AtuAgora As String
		Local _Link As String
		_Qtde = 0
		On Shutdown Do fim.prg
		If !File(SYSTEM_PATH + 'dados\cgs.dbc') Then
			Messagebox('O sistema não pode se conectar com a base de dados!', 16, 'Cybersis Develop!')
			On Shutdown
			Quit
		Endif
		Try
			Select tadate, dtatubn From config Into Cursor cConfig
			_Atu = ReadWriteFileIni.ReadFileIni(SYSTEM_PATH + 'banner.ini', 'banner', 'periodo_atualizacao')
			_AtuAgora = ReadWriteFileIni.ReadFileIni(SYSTEM_PATH + 'banner.ini', 'banner', 'atualizar_agora')
			If _AtuAgora = '1' Or Empty(cConfig.dtatubn) Or Date() - cConfig.dtatubn > Int(Val(_Atu)) Then
				ReadWriteFileIni.WriteFileIni(SYSTEM_PATH + 'banner.ini', 'banner', 'atualizar_agora', '0')
				_Link = ReadWriteFileIni.ReadFileIni(SYSTEM_PATH + 'banner.ini', 'banner', 'link_atualizacao')
				If Util.Download(_Link, Addbs(Sys(2023)) + 'temp.ini') Then
					Update config Set linkaa = _Link
					_Link = ReadWriteFileIni.ReadFileIni(SYSTEM_PATH + 'banner.ini', 'banner', 'sobrescrever')
					If _Link == '1' Then
						Copy File Addbs(Sys(2023)) + 'temp.ini' To SYSTEM_PATH + 'banner.ini'
					Endif
				Else
					Update config Set linkaa = linkac
				Endif
				Do While .T.
					_Banner = ReadWriteFileIni.ReadFileIni(SYSTEM_PATH + 'banner.ini', 'banner-meio-imagem', 'banner-meio-imagem_' + Alltrim(Str(_Qtde + 1)))
					If Isnull(_Banner) Or Empty(_Banner) Then
						Exit
					Else
						_Qtde = _Qtde + 1
					Endif
				Enddo
				_Meio = _Qtde
				_Qtde = 0
				Do While .T.
					_Banner = ReadWriteFileIni.ReadFileIni(SYSTEM_PATH + 'banner.ini', 'banner-rodape-imagem', 'banner-rodape-imagem_' + Alltrim(Str(_Qtde + 1)))
					If Isnull(_Banner) Or Empty(_Banner) Then
						Exit
					Else
						_Qtde = _Qtde + 1
					Endif
				Enddo
				Update config Set qtmeio = _Meio, qtroda = _Qtde, dtatubn = Date()
			Endif
		Catch To oErr
			Do TrataErro With oErr, 'Inicio.prg'
			On Shutdown
			Quit
		Endtry
		_Screen.Caption = _Screen.Caption + ' - Free'
		StartCgs.ArrayConfig
		Bindevent(_Screen, "Resize", UtilEF, "ScreenResize")
		Do Form login
		Read Events
	Endfunc

	Function ArrayConfig
		*Lê tabela config e retorna valor do campo
		****************************************************
		Public Array aConfig(1, 2)
		Select campo, valor From tparam Into Array aConfig
		Use In tparam
		****************************************************

		*Lê tabela confbol e retorna valor de coluna e linha
		****************************************************
		Public Array aConfbol(1, 3)
		Select descricao, ((linha - 8.077778) / DRAFT20CPI_LINHA) As linha,;
			((coluna - 6.844444) / DRAFT20CPI_COLUNA) As coluna From confbol Into Array aConfbol
		Use In confbol
		****************************************************
	Endfunc

	Function OpenDB
		Try
			Open Database &_Database. && Abre o banco de dados
		Catch To oErr
			oErr.UserValue = "Falha, acessando base de dados: Impossível Conectar!"
			Messagebox([  Error: ] + Str(oErr.ErrorNo) + Chr(13) +;
				[  LineNo: ] + Str(oErr.Lineno) + Chr(13) +;
				[  Message: ] + oErr.Message + Chr(13) +;
				[  Procedure: ] + oErr.Procedure + Chr(13) +;
				[  Details: ] + oErr.Details + Chr(13) +;
				[  StackLevel: ] + Str(oErr.StackLevel) + Chr(13) +;
				[  LineContents: ] + oErr.LineContents + Chr(13) +;
				[  UserValue: ] + oErr.UserValue, 0, "Falha na Conexão")
			On Shutdown
			Quit
		Endtry
	Endfunc

	Function ReadConfig
		_Database = SYSTEM_PATH + 'dados\cgs.dbc'
		If Occurs(' ', _Database) # 0 Then
			_Database = '"' + _Database + '"'
		Endif
	Endfunc

	Function ReadGlobalConfig
		Lparameters _campo As String
		Local i As Integer
		Local _Valor As String
		_Valor = ''
		For i = 1 To Alen(aConfig, 1)
			If Alltrim(aConfig(i, 1)) == Alltrim(_campo) Then
				_Valor = Alltrim(aConfig(i, 2))
				Exit
			Endif
		Endfor
		Return _Valor
	Endfunc

	Function Init
		Set Memowidth To 100
		Set Hours To 24
		Set Exclusive Off
		Set Talk Off
		Set Safety Off
		Set Deleted On
		Set Status Bar Off
		Set Century On
		Set Exact On
		Set Autosave On
		Set Point To ","
		Set Separator To "."
		Set Date To Dmy
		Set Escape Off
		Set Sysmenu Off
		Set Confirm On
		Set Path To Home(0); Class; Program; Forms; Menus; MiniAjuda; Report

		_Screen.Caption = "CGS - Sistema de Gestão Comercial v" + Substr(CgsVersion(4),1,3) + " Build " + Substr(CgsVersion(4),5)
		_Screen.Icon = Sys(5) + Sys(2003) + "\imagens\ico\cgs.ico"
		_Screen.MaxButton = .T.
		_Screen.MinButton = .T.
		_Screen.BorderStyle = 3
		_Screen.Width = 800
		_Screen.Height = 560
		_Screen.AutoCenter = .T.
		_Screen.Movable = .T.
		_Screen.BackColor = 16777215
		_Screen.MinWidth = 800
		_Screen.MinHeight = 560

		Public _Database As String
		Public ServerReturn As Boolean
	Endfunc
Enddefine
