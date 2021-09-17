******************************************************************************
*! Relatorio.PRG - Imprimir Relatório
*!
*! Copyright (c) 2007 Salisoft Ltda.
*! Rua Nova Aurora, 292
*! Cep: 81.925-300 Curitiba - Pr
*!
*! Autor: Edson Gonçalves de Aguiar
*! Função: Converter os dados do cursor cPrnRel para o formato selecionado.
******************************************************************************

Procedure Impressora
	Lparameters Rotulo as String, Rotulo2 as String
	Local _FontFace As String
	Local _FontSize As String
	Local _Eject As Boolean
	Local _NumbRows As Integer

	If Alltrim(ReadWriteFileIni.ReadFileIni(SYSTEM_PATH + 'Config.ini', 'Local Config', 'TipoImpressoraRelatorio')) == '2' Then
		_FontFace = 'Courier New'
		_FontSize = 12
		_NumbRows = 60
	Else
		_FontFace = 'Draft 10cpi'
		_FontSize = 10
		_NumbRows = 59
	Endif
	_Eject = .F.
	Set Console Off
	Set Device To Printer
	_ImpressoraRelatorio = Alltrim(ReadWriteFileIni.ReadFileIni(SYSTEM_PATH + 'Config.ini', 'Local Config', 'ImpressoraRelatorio'))
	If Isnull(_ImpressoraRelatorio) Then
		Set Printer To Default
	Else
		If _ImpressoraRelatorio == '' Then
			Set Printer To Default
		Else
			Set Printer To Name Alltrim((_ImpressoraRelatorio))
		Endif
	Endif
	Set Printer Font _FontFace, _FontSize
	Try
		Printjob
			@          0,1 Say Replicate('-', 79) Font _FontFace, _FontSize Color N
			@ Prow() + 1,1 Say Padr(StartCgs.ReadGlobalConfig('CabecaLinha1'), 79) Font _FontFace, _FontSize Color N
			@ Prow() + 1,1 Say Padr(StartCgs.ReadGlobalConfig('CabecaLinha2'), 79) Font _FontFace, _FontSize Color N
			@ Prow() + 1,1 Say Replicate('-', 79) Font _FontFace, _FontSize Color N
			Select cPrnRel
			Scan
				If Prow() > _NumbRows Then
					_row = 0
					_Eject = .T.
					Eject Page
					If StartCgs.ReadGlobalConfig('ReimprimirRotulo') == '1' Then
						If Alltrim(Rotulo) != '' Then
							@ 0,1 Say Rotulo Font _FontFace, _FontSize Color N
							_row = Prow() + 1
						Endif
						If Alltrim(Rotulo2) != '' Then
							@ 0,1 Say Rotulo2 Font _FontFace, _FontSize Color N
							_row = Prow() + 1
						Endif
					Endif
				Else
					_row = Prow() + 1
				Endif
				@ _row, 1 Say cPrnRel.linha Font _FontFace, _FontSize Color N
			Endscan
			@ Prow() + 1,1 Say Replicate('-', 79) Font _FontFace, _FontSize Color N
			@ Prow() + 1,1 Say Padr(StartCgs.ReadGlobalConfig('RodapeLinha1'), 79) Font _FontFace, _FontSize Color N
			@ Prow() + 1,1 Say Padr(StartCgs.ReadGlobalConfig('RodapeLinha2'), 79) Font _FontFace, _FontSize Color N
		Endprintjob
		Use In cPrnRel
	Catch To oErr
		Do TrataErro With oErr, 'PRG: RELATORIO - IMPRESSORA'
	Endtry
	Set Device To Screen
	Set Console On
	Set Printer To Default
Endproc

Procedure Tela
	Try
		Select cPrnRel
		Go Top
		Browse Fields;
			linha :150 :H = 'Linha de Relatório';
			In Screen Normal Preference VisualizarRelatorio;
			Title "Visualizar Relatório" Norgrid Noedit Font 'Courier New', 11
		Use In cPrnRel
	Catch To oErr
		Do TrataErro With oErr, 'PRG: RELATORIO - TELA'
	Endtry
Endproc

Procedure Html
	Lparameters Titulo as String
	Try
		arqHtml = Putfile('','','html')
		If arqHtml != '' Then
			_Arq = Fcreate(arqHtml)
			Fputs(_Arq, "<html>")
			Fputs(_Arq, "<head>")
			Fputs(_Arq, "<title>" + Titulo + "</title>")
			Fputs(_Arq, "</head>")
			Fputs(_Arq, "<body>")
			Fputs(_Arq, "	<pre><font size='4' face='Courier New'>")
			GravaDadosNoArquivo()
			Fputs(_Arq, "	</font></pre>")
			Fputs(_Arq, "</body>")
			Fputs(_Arq, "</html>")
			Fclose(_Arq)
			Use In cPrnRel
			Messagebox('Arquivo ' + arqHtml + ' criado.', 64, 'Concluído!')
		Endif
	Catch To oErr
		Fclose(_Arq)
		Do TrataErro With oErr, 'PRG: RELATORIO - HTML'
	Endtry
Endproc

Procedure Txt
	Try
		arqTxt = Putfile('','','txt')
		If arqTxt != '' Then
			_Arq = Fcreate(arqTxt)
			GravaDadosNoArquivo()
			Fclose(_Arq)
			Use In cPrnRel
			Messagebox('Arquivo ' + arqTxt + ' criado.', 64, 'Concluído!')
		Endif
	Catch To oErr
		Fclose(_Arq)
		Do TrataErro With oErr, 'PRG: RELATORIO - TXT'
	Endtry
Endproc

Procedure _Xls
	Try
		arqXls = Putfile('','','xls')
		If !Empty(arqXls) Then
			Select cPrnRel
			Go Top
			Export To &arqXls. Type xls
			Use In cPrnRel
			Messagebox('Arquivo ' + arqXls + ' criado.', 64, 'Concluído!')
		Endif
	Catch To oErr
		Do TrataErro With oErr, 'PRG: RELATORIO - XLS'
	Endtry
Endproc

Procedure GravaDadosNoArquivo
	Select cPrnRel
	Go Top
	Fputs(_Arq, Replicate('-', 79))
	Fputs(_Arq, Padr(StartCgs.ReadGlobalConfig('CabecaLinha1'), 79))
	Fputs(_Arq, Padr(StartCgs.ReadGlobalConfig('CabecaLinha2'), 79))
	Fputs(_Arq, Replicate('-', 79))
	Scan
		Fputs(_Arq, cPrnRel.linha)
	Endscan
	Fputs(_Arq, Replicate('-', 79))
	Fputs(_Arq, Padr(StartCgs.ReadGlobalConfig('RodapeLinha1'), 79))
	Fputs(_Arq, Padr(StartCgs.ReadGlobalConfig('RodapeLinha2'), 79))
EndProc
