******************************************************************************
*! Impvos.PRG - Imprimir Visual OS
*!
*! Copyright (c) 2010 Cybersis Informática Ltda.
*! Rua Porto Rico, 377
*! Cep: 81.925-415 Curitiba - Pr
*!
*! Autor: Edson Aguiar
*! Função: Carrega os dados para imprimir ordem de serviço visual
******************************************************************************

Lparameters _NumeroOS As Integer
*_NumeroOS = 8
Local _ImpressoraOrdemServico As String
Local i As Integer
Local _Model As String
Local _Cor As String
Local _Placa As String
Local _Servicos As Integer
Local _LinhaServicos As String

i = 0
_Servicos = 0
_LinhaServicos = ''

Set Console Off
Set Device To Printer
_ImpressoraOrdemServico = Alltrim(ReadWriteFileIni.ReadFileIni(SYSTEM_PATH + 'Config.ini', 'Local Config', 'ImpressoraOrdemServico'))

If IsNull(_ImpressoraOrdemServico) Or _ImpressoraOrdemServico == '' Then
	MessageBox('Não foi possível selecionar a impressora,' + Chr(13);
		+ 'por favor verifique a impressora instalada' + Chr(13);
		+ 'e a configuração local do sistema.', 16, 'Cybersis Develop!')
	Return
EndIf

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
		Where ordserv.id = _NumeroOS Into Cursor cOrdServImpord ReadWrite

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
		Where proord.idordserv = cOrdservImpord.id Into Cursor cProdutosImpord ReadWrite
	
	_Servicos = Memlines(cOrdServImpord.servicos)
	**********************************************************************************************

	*! Serviços
	**********************************************************************************************
	Select 0
	Create Cursor cServicosImpord (servico Varchar(100), valor Float(12,4))
	For i = 1 To _Servicos
		If i > 1 Then
			_LinhaServicos = _LinhaServicos + Chr(13)
		EndIf
		Insert Into cServicosImpord (servico, valor) Values (;
			Alltrim(Substr(Mline(cOrdservImpord.servicos, i), 1, 61)), Val(Substr(Mline(cOrdservImpord.servicos, i), 67));
		)
		_LinhaServicos = _LinhaServicos + Substr(Mline(cOrdservImpord.servicos, i), 1, 63) + Padl(Alltrim(Substr(Mline(cOrdservImpord.servicos, i), 67)), 18, ' ')
	Endfor
	Update cOrdServImpord Set servicos = _LinhaServicos

	Select cProdutosImpord
	If cOrdServImpord.totpro = 0 Then
		Insert Into cProdutosImpord(descricao) Values(Replicate('-', 50))
	EndIf
	Report Form ordserv.frx Preview && Noeject Noconsole To Printer

	Use In cServicosImpord
	Use In cOrdServImpord
	Use In cProdutosImpord
	Set Device To Screen
	Set Console On
	Set Printer To Default
Catch To oErr
	Do TrataErro With oErr, 'Impvos.PRG'
Endtry
