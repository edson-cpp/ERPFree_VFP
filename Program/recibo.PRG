******************************************************************************
*! recibo.PRG - Imprimir Recibo de Venda
*!
*! Copyright (c) 2007 Salisoft Ltda.
*! Rua Nova Aurora, 292
*! Cep: 81.925-300 Curitiba - Pr
*!
*! Autor: Edson Gon�alves de Aguiar
*! Fun��o: Imprimir recibo de venda
******************************************************************************

Lparameters Produtos As Cursor, DadosCliente(5) As Cursor, DadosOperacao(5) As Cursor
Local _FontFace As String
Local _FontSize As Single
Local _Total As String
Local _EspacosAntesDoTotal As Integer
Local _TotalBruto As Double
Local _NumbRows As Integer
Local _Row As Integer
Local _Rodape As Integer
Local i As Integer
Local j As Integer
Local _Copias As Integer
_Rodape = 21
_Copias = 1
_Row = 0
i = 0
j = 0

If Alltrim(ReadWriteFileIni.ReadFileIni(SYSTEM_PATH + 'Config.ini', 'Local Config', 'TipoImpressoraReciboVenda')) == '2' Then
	_FontFace = 'Courier New'
	_FontSize = Round(Val(StartCgs.ReadGlobalConfig('FonteImpressaoRecibo')), 1)
	_NumbRows = 60
Else
	_FontFace = 'Draft 10cpi'
	_FontSize = 10
	_NumbRows = 59
Endif

If DadosOperacao(1) == 'OR�AMENTO' Then
	_EspacosAntesDoTotal = 63
	_Total = 'TOTAL: ' + Transform(DadosOperacao(4), '999,999.99')
Else
	_TotalBruto = DadosOperacao(4) + DadosOperacao(5)
	_EspacosAntesDoTotal = 12
	_Total = 'TOTAL BRUTO: ' + Transform(_TotalBruto, '999,999.99') + '    ' +;
		+ 'DESCONTO: ' + Transform(DadosOperacao(5), '999,999.99') + '    ' +;
		+ 'TOTAL: ' + Transform(DadosOperacao(4), '999,999.99')
Endif

If StartCgs.ReadGlobalConfig('DuasCopiasPorPagina') == '1' And Alen(Produtos, 1) < 12 Then
	_Copias = 2
Endif

Try
	Set Console Off
	Set Device To Printer
	_ImpressoraReciboVenda = Alltrim(ReadWriteFileIni.ReadFileIni(SYSTEM_PATH + 'Config.ini', 'Local Config', 'ImpressoraReciboVenda'))
	If Isnull(_ImpressoraReciboVenda) Then
		Set Printer To Default
	Else
		If _ImpressoraReciboVenda == '' Then
			Set Printer To Default
		Else
			Set Printer To Name Alltrim((_ImpressoraReciboVenda))
		Endif
	Endif
	Set Printer Font _FontFace, _FontSize

	Printjob
		For j = 1 To _Copias
			If j = 2 Then
				@ Prow() + 1, 1 Say Replicate(' ', 79) Font _FontFace, _FontSize Color N
				@ Prow() + 1, 1 Say Replicate('*', 79) Font _FontFace, _FontSize Color N
				@ Prow() + 1, 1 Say Replicate(' ', 79) Font _FontFace, _FontSize Color N
				@ Prow() + 1, 1 Say Replicate('-', 79) Font _FontFace, _FontSize Color N
				_Rodape = 51
			Else
				@ 0, 1 Say Replicate('-', 79) Font _FontFace, _FontSize Color N
			EndIf
			@ Prow() + 1, 1 Say Padr(StartCgs.ReadGlobalConfig('CabecaLinha1'), 79) Font _FontFace, _FontSize Color N
			@ Prow() + 1, 1 Say Padr(StartCgs.ReadGlobalConfig('CabecaLinha2'), 79) Font _FontFace, _FontSize Color N
			@ Prow() + 1, 1 Say Replicate('-', 79) Font _FontFace, _FontSize Color N
			@ Prow() + 1, 1 Say DadosOperacao(1) + ': ' + Alltrim(Str(DadosOperacao(2))) + '  EMISSAO: ' + Dtoc(DadosOperacao(3)) Font _FontFace, _FontSize Color N
			@ Prow() + 1, 1 Say 'CLIENTE: ' + Alltrim(Str(DadosCliente(1))) + ' - ' + Alltrim(DadosCliente(2)) Font _FontFace, _FontSize Color N
			@ Prow() + 1, 1 Say 'ENDERE�O: ' + Alltrim(DadosCliente(3)) + ' - ' + Alltrim(DadosCliente(4)) Font _FontFace, _FontSize Color N
			@ Prow() + 1, 1 Say 'CIDADE: ' + Alltrim(DadosCliente(5)) Font _FontFace, _FontSize Color N
			@ Prow() + 1, 1 Say Replicate('-',79) Font _FontFace, _FontSize Color N
			@ Prow() + 1, 1 Say Padr('CODIGO', 13, '.') + ' ' + Padr('DESCRI��O', 37) + Padl('QTDE.', 7) + ' ' + Padl('VLR UNIT.', 9) + ' ' + Padl('SUBTOTAL', 10) Font _FontFace, _FontSize Color N
			@ Prow() + 1, 1 Say Replicate('-',79) Font _FontFace, _FontSize Color N
			For i = 1 To Alen(Produtos, 1)
				If Prow() > _NumbRows Then
					_Row = 0
					Eject
				Else
					_Row = Prow() + 1
				EndIf
				@ _Row, 1 Say Padl(Alltrim(Produtos(i,1)), 13) + ' ' + Padr(Alltrim(Produtos(i,2)), 36);
					+ ' ' + Padl(Alltrim(Str(Produtos(i,3), 7, 2)), 7);
					+ ' ' + Padl(Alltrim(Transform(Produtos(i,4), '#,###9.99')), 9);
					+ ' ' + Padl(Alltrim(Transform(Produtos(i,5), '#,###9.99')), 10) Font _FontFace, _FontSize Color N
			Endfor
			If Prow() > _Rodape Then
				@ Prow() + 1, 1 Say Replicate('-', 79) Font _FontFace, _FontSize Color N
			Else
				@ _Rodape + 1, 1 Say Replicate('-', 79) Font _FontFace, _FontSize Color N
			Endif
			@ Prow() + 1, _EspacosAntesDoTotal Say _Total Font _FontFace, _FontSize Color N
			@ Prow() + 1, 1 Say Replicate('-', 79) Font _FontFace, _FontSize Color N
			@ Prow() + 1, 1 Say Padr(StartCgs.ReadGlobalConfig('RodapeLinha1'), 79) Font _FontFace, _FontSize Color N
			@ Prow() + 1, 1 Say Padr(StartCgs.ReadGlobalConfig('RodapeLinha2'), 79) Font _FontFace, _FontSize Color N
		EndFor
	Endprintjob
	Set Device To Screen
	Set Console On
	Set Printer To Default
Catch To oErr
	Do TrataErro With oErr, 'Recibo.PRG'
Endtry
