****************************************************************
*! AUTOR: Edson Gonçalves de Aguiar
*! ARQUIVO: SmallFunc.PRG
*! FUNÇÃO: Executar pequenas funções que se repetem no sistema
****************************************************************
Public UtilEF
UtilEF = Createobject("_SmallFunc")

Define Class _SmallFunc As Custom
	Function Init
	Endfunc

	Function CalcularTotalCredito
		Lparameters _Data As Date
		Local _TotalCalculado As Double
		_TotalCalculado = 0
		If cBaixaCred.datadesc = {} Or cBaixaCred.datadesc < _Data Then
			Do Case
				Case _Data - cBaixaCred.vencimento = 0 Or _Data - cBaixaCred.vencimento < 0
				Case cBaixaCred.vlratraso != 0 And cBaixaCred.vlrjuros != 0
					_TotalCalculado = (cBaixaCred.vlrjuros * (_Data - cBaixaCred.vencimento)) + cBaixaCred.vlratraso
				Case cBaixaCred.vlratraso != 0 And cBaixaCred.perjuros != 0
					_TotalCalculado = (((cBaixaCred.perjuros / 100) * cBaixaCred.valor) * (_Data - cBaixaCred.vencimento)) + cBaixaCred.vlratraso
				Case cBaixaCred.peratraso != 0 And cBaixaCred.vlrjuros != 0
					_TotalCalculado = (cBaixaCred.vlrjuros * (_Data - cBaixaCred.vencimento)) + ((cBaixaCred.peratraso / 100) * cBaixaCred.valor)
				Case cBaixaCred.peratraso != 0 And cBaixaCred.perjuros != 0
					_TotalCalculado = (((cBaixaCred.perjuros / 100) * cBaixaCred.valor) * (_Data - cBaixaCred.vencimento)) + ((cBaixaCred.peratraso / 100) * cBaixaCred.valor)
			Endcase
			_TotalCalculado = cBaixaCred.valor + _TotalCalculado
		Else
			If cBaixaCred.vlrdesc = 0
				_TotalCalculado = (1 - (cBaixaCred.perdesc / 100)) * cBaixaCred.valor
			Else
				_TotalCalculado = cBaixaCred.valor - cBaixaCred.vlrdesc
			Endif
		Endif
		Return _TotalCalculado
	Endfunc

	Function CalcularTotalDebito
		Lparameters _Data As Date
		Local _TotalCalculado As Double
		_TotalCalculado = 0
		If cBaixaDeb.datadesc = {} Or cBaixaDeb.datadesc < _Data Then
			Do Case
				Case _Data - cBaixaDeb.vencimento = 0 Or _Data - cBaixaDeb.vencimento < 0
				Case cBaixaDeb.vlratraso != 0 And cBaixaDeb.vlrjuros != 0
					_TotalCalculado = (cBaixaDeb.vlrjuros * (_Data - cBaixaDeb.vencimento)) + cBaixaDeb.vlratraso
				Case cBaixaDeb.vlratraso != 0 And cBaixaDeb.perjuros != 0
					_TotalCalculado = (((cBaixaDeb.perjuros / 100) * cBaixaDeb.valor) * (_Data - cBaixaDeb.vencimento)) + cBaixaDeb.vlratraso
				Case cBaixaDeb.peratraso != 0 And cBaixaDeb.vlrjuros != 0
					_TotalCalculado = (cBaixaDeb.vlrjuros * (_Data - cBaixaDeb.vencimento)) + ((cBaixaDeb.peratraso / 100) * cBaixaDeb.valor)
				Case cBaixaDeb.peratraso != 0 And cBaixaDeb.perjuros != 0
					_TotalCalculado = (((cBaixaDeb.perjuros / 100) * cBaixaDeb.valor) * (_Data - cBaixaDeb.vencimento)) + ((cBaixaDeb.peratraso / 100) * cBaixaDeb.valor)
			Endcase
			_TotalCalculado = cBaixaDeb.valor + _TotalCalculado
		Else
			If cBaixaDeb.vlrdesc = 0 Then
				_TotalCalculado = (1 - (cBaixaDeb.perdesc / 100)) * cBaixaDeb.valor
			Else
				_TotalCalculado = cBaixaDeb.valor - cBaixaDeb.vlrdesc
			Endif
		Endif
		Return _TotalCalculado
	Endfunc

	Function AbreBackup
		Do AbreForms In SmallFunc With 'BACKUP'
	Endfunc

	Function ConfBol
		Lparameters _Descricao As String, _Retorno As Integer
		Local i As Integer
		Local _Valor As Double
		For i = 1 To Alen(aConfbol, 1)
			If Alltrim(aConfbol(i, 1)) == Alltrim(_Descricao) Then
				_Valor = aConfbol(i, _Retorno)
				Exit
			Endif
		Endfor
		Return _Valor
	Endfunc

	Function Localizar(_Cadastro As String, _Campo As TextBox, _Filtro As Boolean)
		Local _Retorno As Integer
		Do Case
			Case _Cadastro == 'Cliente'
				If _Filtro Then
					VarLoc.CondicaoSelect = VarLoc.CondicaoSelect + ' And Alltrim(situ) == "Ativo"'
				Endif
				If StartCgs.ReadGlobalConfig('Mecanica') == '0' Then
					Try
						Select cliente.Id, cliente.razao, cliente.nabrev, cliente.cnpj, cliente.inscest, cliente.situ,;
							Iif(Isnull(veiculo.placa), Space(50), veiculo.placa) As placa;
							From cliente Left Join veiculo On veiculo.idcliente = cliente.Id;
							Into Cursor cClienteSmallFunc
						_Retorno = VarLoc.Abrir('TTTTTT',;
							'\<Código;\<Nome/Razao;Nome \<Abrev;Cn\<pj;\<Inscrição;Placa \<Veic.',;
							'id;razao;nabrev;cnpj;inscest;placa', 'NCCCCC', 'cClienteSmallFunc;Localizar Clientes',;
							'60;244;166;104;105;105', _Campo.Value)
					Catch To oErr
						Do TrataErro With oErr, 'PRG: SMALLFUNC'
					Endtry
				Else
					_Retorno = VarLoc.Abrir('TTTTTT',;
						'\<Código;\<Nome/Razao;Nome \<Abrev;Cn\<pj;\<Inscrição;\<Telefone',;
						'id;razao;nabrev;cnpj;inscest;fone', 'NCCCCC', 'cliente;Localizar Clientes',;
						'60;244;166;104;105;105', _Campo.Value)
				Endif
		Endcase
		_Campo.Value = _Retorno
		_Campo.InteractiveChange
	Endfunc

	Function Bool(_Valor As String)
		Return Evaluate('.' + _Valor + '.')
	Endfunc

	Function ScreenResize
		If _vfp.StartMode # 0 Then
			_vfp.Forms.Item('FRMMAIN').Width = _Screen.Width - 250
			_vfp.Forms.Item('FRMMAIN').Height = _Screen.Height
			_vfp.Forms.Item('FRMMAIN').lvwMain.Refresh
			_vfp.Forms.Item('BANNER').Height = _Screen.Height
			_vfp.Forms.Item('BANNER').Left = _vfp.Forms.Item('FRMMAIN').Width
			_vfp.Forms.Item('BANNER').Top = 0
		Endif
	Endfunc

	Function DownFiles
		Try
			Wait Windows 'Executando verificação de rotina, por favor aguarde!' Nowait
			Local _Link As String
			Local _Qtde As Integer
			If !Directory('banner') Then
				Mkdir banner
			Endif

			*! Download banners central
			_Qtde = 1
			Do While .T.
				_Link = ReadWriteFileIni.ReadFileIni(SYSTEM_PATH + 'banner.ini', 'banner-meio-imagem', 'banner-meio-imagem_' + Alltrim(Str(_Qtde)))
				If Isnull(_Link) Or Empty(_Link) Then
					Exit
				Else
					Util.Download(_Link, 'banner\banner-meio-' + Alltrim(Str(_Qtde)) + '.' + Justext(_Link))
					_Qtde = _Qtde + 1
				Endif
			Enddo

			*! Download banners rodapé
			_Qtde = 1
			Do While .T.
				_Link = ReadWriteFileIni.ReadFileIni(SYSTEM_PATH + 'banner.ini', 'banner-rodape-imagem', 'banner-rodape-imagem_' + Alltrim(Str(_Qtde)))
				If Isnull(_Link) Or Empty(_Link) Then
					Exit
				Else
					Util.Download(_Link, 'banner\banner-rodape-' + Alltrim(Str(_Qtde)) + '.' + Justext(_Link))
					_Qtde = _Qtde + 1
				Endif
			Enddo

			*! Download banners sistema
			Select linkac From config Into Cursor cTemp
			If Util.Download(Alltrim(cTemp.linkac), 'cgs.ini') Then
				_Link = ReadWriteFileIni.ReadFileIni(SYSTEM_PATH + 'cgs.ini', 'banner', 'sb_img')
				Util.Download(_Link, 'banner\banner-sistema-sb.jpg')
				_Link = ReadWriteFileIni.ReadFileIni(SYSTEM_PATH + 'cgs.ini', 'banner', 'std_img')
				Util.Download(_Link, 'banner\banner-sistema-std.jpg')
				_Link = ReadWriteFileIni.ReadFileIni(SYSTEM_PATH + 'cgs.ini', 'banner', 'fiscal_img')
				Util.Download(_Link, 'banner\banner-sistema-fiscal.jpg')
			Endif
			Wait Windows 'Verificação de rotina concluída!' Nowait
		Catch To oErr
			Do TrataErro With oErr, 'Smallfunc.prg'
		Endtry
	Endfunc
Enddefine

Function AbreForms(_Form As String)
	Local nForm As Integer
	For nForm = _Screen.FormCount To 1 Step -1
		If _Screen.Forms(nForm).Name == _Form
			_Screen.Forms(nForm).Show
			Return .T.
		Endif
	Endfor
	If Substr(Permissoes.ObtemPermissao(_Form), 1, 1) != 'T' Then
		Messagebox('Acesso negado, por favor consulte o administrador.', 16, 'Acesso negado!')
		Return .T.
	Endif
	Do Form &_Form.
Endfunc
