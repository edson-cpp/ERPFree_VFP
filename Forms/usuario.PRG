******************************************************************************
*! Classe USUARIO
*!
*! Copyright (c) 2010 Cybersis Informática Ltda.
*! Rua Porto Rico, 377
*! Cep: 81.925-415 Curitiba - Pr
*!
*! Autor: Edson Aguiar
*! Função: Cadastro de Usuários
******************************************************************************

*! Carrega configurações do formulário
Local _Config As Custom
_Config = Createobject("config")

Public _Usuario As Form

*! Cria objeto
_Usuario = Createobject("usuario")
_Usuario.Visible = .T.

*! Classe que contém informações sobre o formulário para verificações do sistema
Define Class config As Custom
	*! Itens obrigatórios
	Caption = 'Dados do Administrador'
	Name = 'USUARIO'
	Pagetb = ''
	AdicTool = .F.
	AdicDesk = .F.
	AdicInFrm = .F.
	Icon = 'imagens\cgs.ico'
Enddefine

**********************************************************************************************
*! Define Classe Form
**********************************************************************************************
Define Class usuario As MyForm Of 'C:\Dados\Projetos\Common\Class\base.prg'
	Caption = _Config.Caption
	Name = _Config.Name
	Icon = _Config.Icon
	Height = 186
	Width = 336
	DoCreate = .T.
	KeyPreview = .T.
	MaxButton = .F.
	MinButton = .F.
	AutoCenter = .T.
	ShowWindow = 2
	Add Object txtLogin As txtLogin
	Add Object txtSenha As txtSenha
	Add Object txtConfSenha As txtConfSenha
	Add Object txtNome As txtNome
	Add Object txtCpf As txtCpf
	Add Object labLogin As labLogin
	Add Object labSenha As labSenha
	Add Object labConfSenha As labConfSenha
	Add Object labNome As labNome
	Add Object labCpf As labCpf
	Add Object btnSalvar As btnSalvar
	Add Object btnFechar As btnFechar

	Procedure Init
		Nodefault
		This.txtNome.TabIndex = 1
		This.txtCpf.TabIndex = 2
		This.txtLogin.TabIndex = 3
		This.txtSenha.TabIndex = 4
		This.txtConfSenha.TabIndex = 5
		Thisform.txtNome.Value = 'ADMINISTRADOR'
	Endproc

	Procedure Load
		Nodefault
	Endproc

	Procedure Unload
		Nodefault
	Endproc

	Procedure Activate
		Nodefault
	Endproc

	Procedure Destroy
		Nodefault
	Endproc
Enddefine

**********************************************************************************************
*! Define Classes
**********************************************************************************************

**********************************************************************************************
*! Define Classes Button
**********************************************************************************************
Define Class btnSalvar As MyButton Of 'C:\Dados\Projetos\Common\Class\base.prg'
	Left = 180
	Top = 150
	Name = "btnSalvar"
	Caption = '\<Salvar'

	Procedure Click
		If Empty(Thisform.txtNome.Value) Or Empty(Thisform.txtCpf.Value) Or Empty(Thisform.txtLogin.Value);
				Or Empty(Thisform.txtSenha.Value) Or Empty(Thisform.txtConfSenha.Value) Then
			Messagebox('Todos os campos devem ser preenchidos.', 16, 'Dados obrigatórios!')
			Return
		Endif
		Local _Error As Boolean
		_Error = .F.
		Try
			Select id From usugru Where Alltrim(descricao) == 'ADMINISTRADOR' Into Cursor cUsuGruServidor
			Insert Into usuario(login, senha, unome, cpf, idusugru) Values (;
				Thisform.txtLogin.Value, Thisform.txtSenha.Value, Thisform.txtNome.Value, Thisform.txtCpf.Value, cUsuGruServidor.Id;
				)
		Catch To oErr
			_Error = .T.
			Do ErrHand With oErr, Thisform.Caption
		Endtry
		If _Error Then
			Return
		Endif
		Thisform.Release
		Messagebox('PARABÉNS! O CGS está agora instalado em seu sistema.' + Chr(13) + 'Esperamos que tenha uma boa experiência no uso.' + Chr(13) +;
			'Queremos vê-lo em breve para formarmos uma parceria na evolução da gestão de sua empresa.', 64, 'Informação importante!')
		Declare Integer ShellExecute In shell32.Dll Integer hndWin, String cAction, String cFileName, String cParams, String cDir, Integer nShowWin
		ShellExecute(0, 'Open', '&SYSTEM_PATH.cgs.exe', '', 0, 1)
		On Shutdown
		Quit
	Endproc
Enddefine

Define Class btnFechar As MyButton Of 'C:\Dados\Projetos\Common\Class\base.prg'
	Left = 252
	Top = 150
	Name = "btnFechar"
	Caption = '\<Fechar'

	Procedure Click
		If Empty(_vfp.StartMode) Then
			Thisform.Release
		Else
			Clear Events
			Quit
		Endif
	Endproc
Enddefine

**********************************************************************************************
*! Define Classes Textbox
**********************************************************************************************
Define Class txtLogin As MyText Of 'C:\Dados\Projetos\Common\Class\base.prg'
	Left = 72
	Top = 72
	Width = 144
	Name = "txtLogin"
Enddefine

Define Class txtSenha As MyText Of 'C:\Dados\Projetos\Common\Class\base.prg'
	Left = 72
	Top = 96
	Width = 84
	PasswordChar = "*"
	Name = "txtSenha"
Enddefine

Define Class txtConfSenha As MyText Of 'C:\Dados\Projetos\Common\Class\base.prg'
	Left = 72
	Top = 120
	Width = 84
	PasswordChar = "*"
	Name = "txtConfSenha"
Enddefine

Define Class txtNome As MyText Of 'C:\Dados\Projetos\Common\Class\base.prg'
	Left = 72
	Top = 24
	Width = 252
	Name = "txtNome"
	Format = '!'
	Enabled = .F.
Enddefine

Define Class txtCpf As MyText Of 'C:\Dados\Projetos\Common\Class\base.prg'
	InputMask = "999.999.999-99"
	Left = 72
	Top = 48
	Width = 108
	Name = "txtCpf"

	Procedure LostFocus
		If !Util.ValidaCnpj(This.Value) Then
			Nodefault
			This.SelStart = 0
			This.SelLength = Len(Alltrim(This.Value))
		Endif
	Endproc
Enddefine

**********************************************************************************************
*! Define Classes Label
**********************************************************************************************
Define Class labSenha As MyLabel Of 'C:\Dados\Projetos\Common\Class\base.prg'
	FontBold = .T.
	Caption = "Senha:"
	Height = 15
	Left = 12
	Top = 99
	Width = 42
	Name = "labSenha"
Enddefine

Define Class labConfSenha As MyLabel Of 'C:\Dados\Projetos\Common\Class\base.prg'
	FontBold = .T.
	Caption = "Confirmar:"
	Height = 15
	Left = 12
	Top = 123
	Width = 59
	Name = "labConfSenha"
Enddefine

Define Class labLogin As MyLabel Of 'C:\Dados\Projetos\Common\Class\base.prg'
	FontBold = .T.
	Caption = "Login:"
	Height = 15
	Left = 12
	Top = 75
	Width = 37
	Name = "labLogin"
Enddefine

Define Class labNome As MyLabel Of 'C:\Dados\Projetos\Common\Class\base.prg'
	FontBold = .T.
	Caption = "Nome:"
	Height = 15
	Left = 12
	Top = 27
	Width = 38
	Name = "labNome"
Enddefine

Define Class labCpf As MyLabel Of 'C:\Dados\Projetos\Common\Class\base.prg'
	FontBold = .T.
	Caption = "CPF:"
	Height = 15
	Left = 12
	Top = 51
	Width = 29
	Name = "labCpf"
Enddefine

Define Class labObs As MyLabel Of 'C:\Dados\Projetos\Common\Class\base.prg'
	FontBold = .T.
	Caption = "Observação Importante Campo login:"
	Height = 15
	Left = 228
	Top = 120
	Width = 211
	Name = "labObs"
Enddefine

Define Class labDescricaoObs As MyLabel Of 'C:\Dados\Projetos\Common\Class\base.prg'
	WordWrap = .T.
	Caption = "Maiúsculas e minúsculas são diferentes neste campo. Ex. Jose é diferente de jose."
	Height = 28
	Left = 228
	Top = 134
	Width = 217
	Name = "labDescricaoObs"
Enddefine

Define Class labInfo As MyLabel Of 'C:\Dados\Projetos\Common\Class\base.prg'
	FontBold = .T.
	Height = 72
	Left = 228
	Top = 120
	Width = 96
	ForeColor = Rgb(255,0,0)
	Name = "labInfo"
	WordWrap = .T.
	Caption = 'Informe o CPF, Login e Senha do usuário administrador, ';
		+ 'estas informações poderão ser alteradas posteriormente através do cadastro de usuários no menu arquivos.'
Enddefine
