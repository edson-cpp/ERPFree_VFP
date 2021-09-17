******************************************************************************
*! Impord.PRG - Imprimir Ordem de Serviço
*!
*! Copyright (c) 2007 Cybersis Informática Ltda.
*! Rua Odinir Polydoro, 175
*! Cep: 81.935-317 Curitiba - Pr
*!
*! Autor: Edson Gonçalves de Aguiar
*! Função: Imprimir ordem de serviço
******************************************************************************

Lparameters _NumeroOS As Integer
Local _FontFace As String
Local _FontSize As Integer
Local _FontEfect As String
Local _Eject As Boolean
Local _ImpressoraOrdemServico As String
Local i As Integer
Local _Model As String
Local _Cor As String
Local _Placa As String
Local _Total As Double
Local _Servicos As Integer
Local _LinhaServicos As Integer
Local _Historico As Integer
Local _LinhaHistorico As Integer
Local _Subtotal As Double

i = 0
_Total = 0
_Servicos = 0
_Historico = 0
_LinhaServicos = 1
_LinhaHistorico = 1
_Subtotal = 0

*! Verifica se a impressora é matricial e define a fonte correta para o tipo
**************************************************************************
If Alltrim(ReadWriteFileIni.ReadFileIni(SYSTEM_PATH + 'Config.ini', 'Local Config', 'TipoImpressoraOrdemServico')) == '2' Then
	_FontFace = 'Courier New'
	_FontSize = 12
	_FontEfect = ''
*	_FontEfect = 'Color N'
Else
	_FontFace = 'Draft 10cpi'
	_FontSize = 10
	_FontEfect = ''
Endif
_Eject = .F.
**************************************************************************

Set Console Off
Set Device To Printer
_ImpressoraOrdemServico = Alltrim(ReadWriteFileIni.ReadFileIni(SYSTEM_PATH + 'Config.ini', 'Local Config', 'ImpressoraOrdemServico'))

If IsNull(_ImpressoraOrdemServico) Then
	MessageBox('Não foi possível selecionar a impressora,' + Chr(13);
		+ 'por favor verifique a impressora instalada' + Chr(13);
		+ 'e a configuração local do sistema.', 16, 'Salisoft Sistemas!')
	Return
EndIf

If _ImpressoraOrdemServico == '' Then
	MessageBox('Não foi possível selecionar a impressora,' + Chr(13);
		+ 'por favor verifique a impressora instalada' + Chr(13);
		+ 'e a configuração local do sistema.', 16, 'Salisoft Sistemas!')
	Return
Endif

If StartCgs.ReadGlobalConfig('Mecanica') == '0' Then
	_Model = 'MODELO: '
	_Cor = 'COR: '
	_Placa = 'PLACA: '
Else
	_Model = 'EQUIPAMENTO: '
	_Cor = 'MODELO: '
	_Placa = 'SÉRIE: '
EndIf

Try
	Set Printer To Name Alltrim((_ImpressoraOrdemServico))
	Set Printer Font _FontFace, _FontSize

	*! Seleciona os dados das tabelas de acordo com o número da ordem passado como parâmetro
	**********************************************************************************************
	Select id, cnome From colab Where cargo = 1 Into Cursor cTecnicoImpord
	Select id, cnome From colab Where cargo = 2 Into Cursor cAtendenteImpord
	
	Select ordserv.Id, ordserv.idcliente, ordserv.idendereco, ordserv.idatend, ordserv.idtec, ordserv.dataent,;
		ordserv._status, ordserv.modelo, ordserv.marca, ordserv.cor, ordserv.placa, ordserv.defeito,;
		ordserv.servicos, ordserv.totpro, ordserv.totserv, ordserv.datasai, ordserv.relatorio, ordserv.historico,;
		cliente.razao, cliente.cnpj, cliente.inscest,;
		Alltrim(Iif(IsNull(endereco.endereco), Space(50), endereco.endereco)) + ',';
		+ Alltrim(Iif(IsNull(endereco.numero), Space(50), endereco.numero)) + ' ';
		+ Alltrim(Iif(IsNull(endereco.complemento), Space(50), endereco.complemento)) As endereco,;
		Iif(IsNull(endereco.bairro), Space(50), endereco.bairro) As bairro,;
		Iif(IsNull(endereco.cep), Space(50), endereco.cep) As cep,;
		Iif(IsNull(endereco.cidade), Space(50), endereco.cidade) As cidade,;
		Iif(IsNull(endereco.fone), Space(50), endereco.fone) As fone,;
		Iif(IsNull(endereco.estado), Space(50), endereco.estado) As estado,;
		Iif(IsNull(endereco.contato), Space(50), endereco.contato) As contato,;
		Iif(IsNull(cTecnicoImpord.cnome), Space(50), cTecnicoImpord.cnome) As tecnico,;
		Iif(IsNull(cAtendenteImpord.cnome), Space(50), cAtendenteImpord.cnome) As atendente;
		From ordserv;
		Left Join cliente On ordserv.idcliente = cliente.id;
		Left Join endereco On ordserv.idendereco = endereco.id;
		Left Join cTecnicoImpord On ordserv.idtec = cTecnicoImpord.id;
		Left Join cAtendenteImpord On ordserv.idatend = cAtendenteImpord.id;
		Where ordserv.id = _NumeroOS Into Cursor cOrdServImpord

	Select ICase(StartCgs.ReadGlobalConfig('CodigoPadrao') == '1',;
		Iif(proord.idproduto > 0, Str(produto.Id, 15), Str(proord.idproduto)),;
		StartCgs.ReadGlobalConfig('CodigoPadrao') == '2',;
		Iif(proord.idproduto > 0, produto.interno, Str(proord.idproduto)),;
		StartCgs.ReadGlobalConfig('CodigoPadrao') == '3',;
		Iif(proord.idproduto > 0, Str(produto.barras, 15), Str(proord.idproduto))) As codigo,;
		Iif(proord.idproduto > 0, produto.descricao, proncad.descricao) As descricao,;
		 proord.qtde, proord.preco, (proord.qtde * proord.preco) As subtotal;
		From proord;
		Left Join produto On produto.id = proord.idproduto;
		Left Join proncad On proncad.id = proord.idproncad;
		Where proord.idordserv = cOrdservImpord.id Into Cursor cProdutosImpord
	
	_Servicos = Memlines(cOrdServImpord.servicos)
	**********************************************************************************************

	*! Inicia o processo de impressão
	**********************************************************************************************
	Printjob
		Do While .T.
			*! Cabeçalho
			**********************************************************************************************
			@          0,1 Say Replicate('-', 79) Font _FontFace, _FontSize &_FontEfect
			@ Prow() + 1,1 Say Padr(StartCgs.ReadGlobalConfig('CabecaLinha1'), 79) Font _FontFace, _FontSize &_FontEfect
			@ Prow() + 1,1 Say Padr(StartCgs.ReadGlobalConfig('CabecaLinha2'), 79) Font _FontFace, _FontSize &_FontEfect
			@ Prow() + 1,1 Say Replicate('-', 79) Font _FontFace, _FontSize &_FontEfect
			@ Prow() + 1,1 Say 'ORDEM DE SERVIÇO Nº: ' + Alltrim(Str(_NumeroOS)) + Space(5) + 'ENTRADA: ' + Dtoc(cOrdservImpord.dataent) Font _FontFace, _FontSize &_FontEfect

			*! Cliente
			**********************************************************************************************
			@ Prow() + 1,1 Say 'CLIENTE: ' + Alltrim(Str(cOrdservImpord.idcliente)) + ' - ' + Alltrim(cOrdservImpord.razao) Font _FontFace, _FontSize &_FontEfect
			@ Prow() + 1,1 Say 'ENDEREÇO: ' + Alltrim(cOrdservImpord.endereco) + ' - ' + Alltrim(cOrdservImpord.bairro) Font _FontFace, _FontSize &_FontEfect
			@ Prow() + 1,1 Say Padr('CIDADE: ' + Alltrim(cOrdservImpord.cidade) + '/' + Alltrim(cOrdservImpord.estado), 30, ' ') + ' - CEP: ' + Padr(Alltrim(cOrdservImpord.cep), 10, ' ') + ' - FONE: ' + Alltrim(cOrdservImpord.fone) Font _FontFace, _FontSize &_FontEfect
			@ Prow() + 1,1 Say 'CNPJ: ' + Padr(Alltrim(cOrdservImpord.cnpj), 18, ' ') + '  IE: ' + Padr(Alltrim(cOrdservImpord.inscest), 12, ' ') + '  CONTATO: ' + Alltrim(cOrdservImpord.contato) Font _FontFace, _FontSize &_FontEfect
			@ Prow() + 1,1 Say Replicate('-',79) Font _FontFace, _FontSize &_FontEfect

			*! Equipamento
			**********************************************************************************************
			@ Prow() + 1,1 Say _Model + Padr(Alltrim(cOrdservImpord.modelo), 30, ' ') + '  MARCA: ' + Alltrim(cOrdservImpord.marca) Font _FontFace, _FontSize &_FontEfect
			@ Prow() + 1,1 Say _Cor + Padr(Alltrim(cOrdservImpord.cor), 20, ' ') + '  ' + _Placa + Alltrim(cOrdservImpord.placa) Font _FontFace, _FontSize &_FontEfect
			@ Prow() + 1,1 Say StartCgs.ReadGlobalConfig('TextoResponsabilidadeSobreEquipamentoOS') Font _FontFace, 8 &_FontEfect
			@ Prow() + 1,1 Say Replicate('-',79) Font _FontFace, _FontSize &_FontEfect

			*! Atendente / Defeito
			**********************************************************************************************
			@ Prow() + 1,1 Say 'ATENDENTE: ' + Alltrim(cOrdservImpord.atendente) Font _FontFace, _FontSize &_FontEfect
			For i = 1 To Memlines(cOrdservImpord.defeito)
				Do Case
					Case i = 1
						@ Prow() + 1,1 Say 'DEFEITO: ' + Alltrim(Mline(cOrdservImpord.defeito, 1)) Font _FontFace, _FontSize &_FontEfect
					Case i = 5
						Exit
					Otherwise
						@ Prow() + 1,10 Say + Alltrim(Mline(cOrdservImpord.defeito, i)) Font _FontFace, _FontSize &_FontEfect
				EndCase
			EndFor
			@ Prow() + (6 - i),1 Say Replicate('-',79) Font _FontFace, _FontSize &_FontEfect
		
			*! Produtos
			**********************************************************************************************
			@ Prow() + 1,1 Say Padr('CODIGO', 13, '.') + ' ' + Padr('DESCRIÇÃO DOS PRODUTOS', 37) + Padl('QTDE.', 7) + ' ' + Padl('VLR UNIT.', 9) + ' ' + Padl('SUBTOTAL', 10) Font _FontFace, _FontSize &_FontEfect
			@ Prow() + 1,1 Say Replicate('-',79) Font _FontFace, _FontSize &_FontEfect
			i = 0
			_Total = 0
			Select cProdutosImpord
			Do While !Eof()
				i = i + 1
				_Total = _Total + cProdutosImpord.subtotal
				@ Prow() + 1,1 Say Alltrim(cProdutosImpord.codigo) + ' ' Font _FontFace, _FontSize
				@ Prow(), 15 Say Alltrim(cProdutosImpord.descricao) + ' ' Font _FontFace, _FontSize
				@ Prow(), 51 Say Padl(Alltrim(Str(cProdutosImpord.qtde, 8, 3)), 8, ' ') Font _FontFace, _FontSize
				@ Prow(), 59 Say Padl(Alltrim(Str(cProdutosImpord.preco, 10, 2)), 10, ' ') Font _FontFace, _FontSize
				@ Prow(), 70 Say Padl(Alltrim(Str(cProdutosImpord.subtotal, 10, 2)), 10, ' ') Font _FontFace, _FontSize
				Skip
				If i = 5 Then
					Exit
				EndIf
			EndDo
			@ Prow() + (6 - i),1 Say Replicate('-',79) Font _FontFace, _FontSize &_FontEfect
			@ Prow() + 1,63 Say 'TOTAL: ' + Padl(Alltrim(Str(_Total, 10, 2)), 10, ' ') Font _FontFace, _FontSize &_FontEfect
			_Subtotal = _Total
			
			*! Serviços
			**********************************************************************************************
			@ Prow() + 1,1 Say ' ' Font _FontFace, _FontSize &_FontEfect
			@ Prow() + 1,1 Say Padr('DESCRIÇÃO DOS SERVIÇOS', 68) + ' ' + Padl('VLR UNIT.', 10, ' ') Font _FontFace, _FontSize &_FontEfect
			@ Prow() + 1,1 Say Replicate('-',79) Font _FontFace, _FontSize &_FontEfect
			_Total = 0
			For i = _LinhaServicos To _LinhaServicos + 3
				_Servicos = Iif(_Servicos = 0, 0, _Servicos - 1)
				_Total = _Total + Val(Substr(Mline(cOrdservImpord.servicos, i), 67))
				@ Prow() + 1,1 Say Alltrim(Substr(Mline(cOrdservImpord.servicos, i), 1, 66)) Font _FontFace, _FontSize
				@ Prow(), 69 Say Padl(Alltrim(Substr(Mline(cOrdservImpord.servicos, i), 67)), 11, ' ') Font _FontFace, _FontSize
			EndFor
			@ Prow() + 1,1 Say Replicate('-',79) Font _FontFace, _FontSize &_FontEfect
			@ Prow() + 1,63 Say 'TOTAL: ' + Padl(Alltrim(Str(_Total, 10, 2)), 10, ' ') Font _FontFace, _FontSize &_FontEfect
			_Subtotal = _Subtotal + _Total
			_LinhaServicos = _LinhaServicos + 4
			
			*! Histórico
			**********************************************************************************************
			@ Prow() + 1,1 Say ' ' Font _FontFace, _FontSize &_FontEfect
			@ Prow() + 1,1 Say 'HISTÓRICO' Font _FontFace, _FontSize &_FontEfect
			@ Prow() + 1,1 Say Replicate('-',79) Font _FontFace, _FontSize &_FontEfect
			For i = _LinhaHistorico To _LinhaHistorico + 3
				_Historico = Iif(_Historico = 0, 0, _Historico - 1)
				@ Prow() + 1,1 Say Alltrim(Mline(cOrdservImpord.Historico, i)) Font _FontFace, _FontSize
			EndFor
			_LinhaHistorico = _LinhaHistorico + 3
			@ Prow() + 1,1 Say Replicate('-',79) Font _FontFace, _FontSize &_FontEfect
			
			*! Data de saída / Técnico / Relatório
			**********************************************************************************************
			@ Prow() + 1,1 Say 'DATA DE SAÍDA: ' + Padr(Dtoc(cOrdservImpord.datasai), 10, ' ') + ' - TÉCNICO: ' + Padr(Alltrim(cOrdservImpord.tecnico), 21, ' ') Font _FontFace, _FontSize &_FontEfect
			@ Prow()    ,59 Say ' - GARANTIA: ' + Padl(StartCgs.ReadGlobalConfig('GarantiaOS'), 3, ' ') + ' DIAS' Font _FontFace, _FontSize &_FontEfect
			@ Prow() + 1,1 Say 'RELATÓRIO: ' + Alltrim(Mline(cOrdservImpord.relatorio, 1)) Font _FontFace, _FontSize &_FontEfect
			For i = 2 To 4
				@ Prow() + 1, 10 Say Alltrim(Mline(cOrdservImpord.relatorio, i)) Font _FontFace, _FontSize
			EndFor
			@ Prow() + 1,1 Say Replicate('-',79) Font _FontFace, _FontSize &_FontEfect
			@ Prow() + 1,32 Say 'SUBTOTAL: ' + Padl(Alltrim(Str(_Subtotal, 10, 2)), 10, ' ') Font _FontFace, _FontSize &_FontEfect
			@ Prow()    ,57 Say 'TOTAL GERAL: ' + Padl(Alltrim(Str(cOrdServImpord.totserv + cOrdServImpord.totpro, 10, 2)), 10, ' ') Font _FontFace, _FontSize &_FontEfect
			@ Prow() + 1,1 Say Replicate(' ', 79) Font _FontFace, _FontSize &_FontEfect
		
			*! Canhoto
			**********************************************************************************************
			@ Prow() + 1,1 Say Replicate('=', 79) Font _FontFace, _FontSize &_FontEfect
			@ Prow() + 1,1 Say Padr(StartCgs.ReadGlobalConfig('CabecaLinha1'), 79) Font _FontFace, _FontSize &_FontEfect
			@ Prow() + 1,1 Say Padr(StartCgs.ReadGlobalConfig('CabecaLinha2'), 79) Font _FontFace, _FontSize &_FontEfect
			@ Prow() + 1,1 Say Replicate('-', 79) Font _FontFace, _FontSize &_FontEfect
			@ Prow() + 1,1 Say 'ORDEM DE SERVIÇO Nº: ' + Alltrim(Str(_NumeroOS)) + Space(5) + 'ENTRADA: ' + Dtoc(cOrdservImpord.dataent) Font _FontFace, _FontSize &_FontEfect

			*! Finaliza o processo de impressão caso não haja mais produtos ou serviços a serem impressos
			**********************************************************************************************
			Select cProdutosImpord
			If Eof() And _Servicos = 0 And _Historico = 0 Then
				Exit
			EndIf
		EndDo
	Endprintjob
	Set Device To Screen
	Set Console On
	Set Printer To Default
Catch To oErr
	Do TrataErro With oErr, 'Impord.PRG'
Endtry
