******************************************************************************
*! Impordmp.PRG - Imprimir Ordem de Serviço Meia Página
*!
*! Copyright (c) 2007 Salisoft Ltda.
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
Local _CondicoesEquipamento As String
Local _Orcamento As String
Local _TipoServico As String
Local _Emitente As String

i = 0

*! Verifica se a impressora é matricial e define a fonte correta para o tipo
**************************************************************************
If Alltrim(ReadWriteFileIni.ReadFileIni(SYSTEM_PATH + 'Config.ini', 'Local Config', 'TipoImpressoraOrdemServico')) == '2' Then
	_FontFace = 'Courier New'
	_FontSize = 8
	_FontEfect = 'Color N'
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
	
	Select ordserv.Id, ordserv.idcliente, ordserv.idendereco, ordserv.idtec, ordserv.dataent,;
		ordserv.modelo, ordserv.marca, ordserv.cor, ordserv.placa, ordserv.totpro,;
		ordserv.totserv, ordserv.condeq, ordserv.orcame, ordserv.tiposerv,;
		ordserv.aprovpor, cliente.razao, cliente.cnpj, cliente.inscest,;
		Alltrim(Iif(IsNull(endereco.endereco), Space(50), endereco.endereco)) + ',';
		+ Alltrim(Iif(IsNull(endereco.numero), Space(50), endereco.numero)) + ' ';
		+ Alltrim(Iif(IsNull(endereco.complemento), Space(50), endereco.complemento)) As endereco,;
		Iif(IsNull(endereco.bairro), Space(50), endereco.bairro) As bairro,;
		Iif(IsNull(endereco.cep), Space(50), endereco.cep) As cep,;
		Iif(IsNull(endereco.cidade), Space(50), endereco.cidade) As cidade,;
		Iif(IsNull(endereco.fone), Space(50), endereco.fone) As fone,;
		Iif(IsNull(endereco.estado), Space(50), endereco.estado) As estado,;
		Iif(IsNull(endereco.contato), Space(50), endereco.contato) As contato,;
		Iif(IsNull(colab.cnome), Space(50), colab.cnome) As tecnico;
		From ordserv;
		Left Join cliente On ordserv.idcliente = cliente.id;
		Left Join endereco On ordserv.idendereco = endereco.id;
		Left Join colab On ordserv.idtec = colab.id;
		Where ordserv.id = _NumeroOS Into Cursor cOrdServImpord
		
	_CondicoesEquipamento = ICase(cOrdservImpord.condeq = 1, 'RUIM', cOrdservImpord.condeq = 2, 'REGULAR',;
		cOrdservImpord.condeq = 3, 'BOM', cOrdservImpord.condeq = 4, 'EXCELENTE')
	_Orcamento = ICase(cOrdservImpord.orcame = 1, 'AGUARDANDO', cOrdservImpord.orcame = 2, 'APROVADO',;
		cOrdservImpord.orcame = 3, 'RECUSADO')
	_TipoServico = ICase(cOrdservImpord.tiposerv = 1, 'MANUTENÇÃO', cOrdservImpord.tiposerv = 2, 'GARANTIA DE FÁBRICA',;
		cOrdservImpord.tiposerv = 3, 'GARANTIA DA LOJA')
		
	If Used('cademp') Then
		Use In cademp
	EndIf
	Select 0
	Use cademp
	_Emitente = Alltrim(cademp.razao)
	Use
	**********************************************************************************************

	*! Inicia o processo de impressão
	**********************************************************************************************
	Printjob
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

		*! Equipamento / Atendente
		**********************************************************************************************
		@ Prow() + 1,1 Say Padr(_Model + Padr(Alltrim(cOrdservImpord.modelo), 30, ' '), 45, ' ') + 'MARCA: ' + Alltrim(cOrdservImpord.marca) Font _FontFace, _FontSize &_FontEfect
		@ Prow() + 1,1 Say Padr(_Cor + Padr(Alltrim(cOrdservImpord.cor), 20, ' '), 45, ' ') + _Placa + Alltrim(cOrdservImpord.placa) Font _FontFace, _FontSize &_FontEfect
		@ Prow() + 1,1 Say 'CONDIÇÕES DO EQUIPAMENTO: ' + Padr(_CondicoesEquipamento, 9, ' ') + '  SERVIÇO: ' + _TipoServico Font _FontFace, _FontSize &_FontEfect
		@ Prow() + 1,1 Say StartCgs.ReadGlobalConfig('TextoResponsabilidadeSobreEquipamentoOS') Font _FontFace, 8 &_FontEfect
		@ Prow() + 1,1 Say Replicate('-',79) Font _FontFace, _FontSize &_FontEfect

		*! Autorização
		**********************************************************************************************
		@ Prow() + 1,1 Say 'AUTORIZO A ' + Padc(_Emitente, 17, ' ') + ' RETIRAR E REALIZAR' Font _FontFace, _FontSize &_FontEfect
		@ Prow() + 1,1 Say 'O ORÇAMENTO DO EQUIPAMENTO DESCRITO.' + Padl(Replicate('.', 30), 43, ' ') Font _FontFace, _FontSize &_FontEfect
		@ Prow() + 1,1 Say Padl(Padc('ASSINATURA DO RESPONSÁVEL', 30, ' '), 79, ' ') Font _FontFace, _FontSize &_FontEfect
		@ Prow() + 1,1 Say 'EU,' + Replicate('.', 34) + 'DECLARO' Font _FontFace, _FontSize &_FontEfect
		@ Prow() + 1,1 Say 'QUE RETIREI O EQUIPAMENTO' + Padl(Replicate('.', 30), 54, ' ') Font _FontFace, _FontSize &_FontEfect
		@ Prow() + 1,1 Say 'DESCRITO EM ORÇAMENTO NO DIA ..../..../........' + Padl(Padc('ASSINATURA DO RESPONSÁVEL', 30, ' '), 32, ' ') Font _FontFace, _FontSize &_FontEfect
		@ Prow() + 1,1 Say Replicate('-',79) Font _FontFace, _FontSize &_FontEfect

		*! Data de saída / Técnico
		**********************************************************************************************
		@ Prow() + 1,1 Say 'ORÇAMENTO: ' + Padr(_Orcamento, 10, ' ') + '  APROVADO POR: ' + Alltrim(cOrdservImpord.aprovpor) Font _FontFace, _FontSize &_FontEfect
		@ Prow() + 1,1 Say 'TÉCNICO: ' + Padr(Alltrim(cOrdservImpord.tecnico), 21, ' ') Font _FontFace, _FontSize &_FontEfect
		@ Prow()    ,31 Say ' - GARANTIA: ' + Padl(StartCgs.ReadGlobalConfig('GarantiaOS'), 3, ' ') + ' DIAS' Font _FontFace, _FontSize &_FontEfect
		@ Prow()    ,60 Say 'TOTAL OS: ' + Padl(Alltrim(Str(cOrdServImpord.totserv + cOrdServImpord.totpro, 10, 2)), 10, ' ') Font _FontFace, _FontSize &_FontEfect
		@ Prow() + 1,1 Say Replicate(' ', 79) Font _FontFace, _FontSize &_FontEfect
	
		*! Canhoto
		**********************************************************************************************
		@ Prow() + 1,1 Say Replicate('=', 79) Font _FontFace, _FontSize &_FontEfect
		@ Prow() + 1,1 Say Padr(StartCgs.ReadGlobalConfig('CabecaLinha1'), 79) Font _FontFace, _FontSize &_FontEfect
		@ Prow() + 1,1 Say Padr(StartCgs.ReadGlobalConfig('CabecaLinha2'), 79) Font _FontFace, _FontSize &_FontEfect
		@ Prow() + 1,1 Say Replicate('-', 79) Font _FontFace, _FontSize &_FontEfect
		@ Prow() + 1,1 Say 'ORDEM DE SERVIÇO Nº: ' + Alltrim(Str(_NumeroOS)) + Space(5) + 'ENTRADA: ' + Dtoc(cOrdservImpord.dataent) Font _FontFace, _FontSize &_FontEfect

		*! Finaliza o processo de impressão
		**********************************************************************************************
	Endprintjob
	Set Device To Screen
	Set Console On
	Set Printer To Default
Catch To oErr
	Do TrataErro With oErr, 'Impordmp.PRG'
Endtry
