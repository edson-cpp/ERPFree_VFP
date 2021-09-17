Public VarLoc
VarLoc = Createobject("_Localizar")

Define Class _Localizar as Custom
	HabilitaOptionGroup_1 = .F.
	HabilitaOptionGroup_2 = .F.
	HabilitaOptionGroup_3 = .F.
	HabilitaOptionGroup_4 = .F.
	HabilitaOptionGroup_5 = .F.
	HabilitaOptionGroup_6 = .F.
	SubtituloOptionGroup_1 = ''
	SubtituloOptionGroup_2 = ''
	SubtituloOptionGroup_3 = ''
	SubtituloOptionGroup_4 = ''
	SubtituloOptionGroup_5 = ''
	SubtituloOptionGroup_6 = ''
	SubtituloHeader_1 = ''
	SubtituloHeader_2 = ''
	SubtituloHeader_3 = ''
	SubtituloHeader_4 = ''
	SubtituloHeader_5 = ''
	SubtituloHeader_6 = ''
	CampoProcurado_1 = ''
	CampoProcurado_2 = ''
	CampoProcurado_3 = ''
	CampoProcurado_4 = ''
	CampoProcurado_5 = ''
	CampoProcurado_6 = ''
	TipoDadoProcurado_1 = ''
	TipoDadoProcurado_2 = ''
	TipoDadoProcurado_3 = ''
	TipoDadoProcurado_4 = ''
	TipoDadoProcurado_5 = ''
	TipoDadoProcurado_6 = ''
	LarguraColuna_1 = 0
	LarguraColuna_2 = 0
	LarguraColuna_3 = 0
	LarguraColuna_4 = 0
	LarguraColuna_5 = 0
	LarguraColuna_6 = 0
	DescricaoTabela = ''
	SubtituloJanela = ''
	CondicaoSelect = '.T.'
	************************************************************************
	*! Atribui os valores passados pelos parâmetros às propriedades
	*!----------------------------------------------------------------------
	*! @param - HabilitaOptionGroup: Habilita ou não os itens do OptionGroup
	*!		Valores: F para False e T para True
	*!		Sintaxe: 6 caracteres F ou T - Ex.: 'TTFFFF'
	*!
	*! @param - Subtitulo: Subtítulo dos itens OptionGroup e cabeçalhos da grid
	*!		Valores: Descrição dos campos de opção de procura e dos cabeçalhos
	*!			das colunas da grid
	*!		Sintaxe: 6 sequências de strings separadas por ;(ponto e vírgula)
	*!			Ex.: '\<Código;\<Descrição;N;N;N;N;' - N = Nulo
	*!
	*! @param - CampoProcurado: Campo do qual serão lidos os dados na tabela
	*!		Valores: Descrição dos campos da tabela
	*!		Sintaxe: 6 sequências de strings separadas por ;(ponto e vírgula)
	*!			Ex.: 'id;descricao;N;N;N;N;' - N = Nulo
	*!
	*! @param - TipoDadoProcurado: Tipo do campo da tabela
	*!		Valores: 1° caracter do tipo dos campos da tabela - Ex.: D = Date
	*!		Sintaxe: 6 caracteres - Ex.: 'NCCCCC'
	*!
	*! @param - DesTabelaSubJanela: Nome da tabela, título da janela e
	*!			filtros adicionais
	*!		Sintaxe: 3 sequências de strings separadas por ;(ponto e vírgula)
	*!			Ex.: 'produto;Localizar Produtos'
	*!
	*! @param - LarguraColuna: Largura das colunas da grid
	*!		Valores: Número de pixels da largura das colunas da grid
	*!		Sintaxe: 6 sequências de números separadas por ;(ponto e vírgula)
	*!			em formato caracter. Ex.: '60;244;0;0;0;0;'
	*!
	*! @param - ValorDoCampo: Valor do campo ao qual se dará a procura.
	************************************************************************
	Function Abrir
		Lparameters HabilitaOptionGroup as String,;
			Subtitulo as String,;
			CampoProcurado as String,;
			TipoDadoProcurado as String,;
			DesTabelaSubJanela as String,;
			LarguraColuna as String,;
			ValorDoCampo as Integer
		This.HabilitaOptionGroup_1 = Iif(Substr(HabilitaOptionGroup,1,1) == 'T', .T., .F.)
		This.HabilitaOptionGroup_2 = Iif(Substr(HabilitaOptionGroup,2,1) == 'T', .T., .F.)
		This.HabilitaOptionGroup_3 = Iif(Substr(HabilitaOptionGroup,3,1) == 'T', .T., .F.)
		This.HabilitaOptionGroup_4 = Iif(Substr(HabilitaOptionGroup,4,1) == 'T', .T., .F.)
		This.HabilitaOptionGroup_5 = Iif(Substr(HabilitaOptionGroup,5,1) == 'T', .T., .F.)
		This.HabilitaOptionGroup_6 = Iif(Substr(HabilitaOptionGroup,6,1) == 'T', .T., .F.)
		This.SubtituloOptionGroup_1 = Substr(Subtitulo, 1, At(';', Subtitulo, 1) - 1)
		This.SubtituloOptionGroup_2 = Substr(Subtitulo, At(';', Subtitulo, 1) + 1, At(';', Subtitulo, 2) - At(';', Subtitulo, 1) - 1)
		This.SubtituloOptionGroup_3 = Substr(Subtitulo, At(';', Subtitulo, 2) + 1, At(';', Subtitulo, 3) - At(';', Subtitulo, 2) - 1)
		This.SubtituloOptionGroup_4 = Substr(Subtitulo, At(';', Subtitulo, 3) + 1, At(';', Subtitulo, 4) - At(';', Subtitulo, 3) - 1)
		This.SubtituloOptionGroup_5 = Substr(Subtitulo, At(';', Subtitulo, 4) + 1, At(';', Subtitulo, 5) - At(';', Subtitulo, 4) - 1)
		This.SubtituloOptionGroup_6 = Substr(Subtitulo, At(';', Subtitulo, 5) + 1)
		This.SubtituloHeader_1 = Strtran(Substr(Subtitulo, 1, At(';', Subtitulo, 1) - 1),'\<','')
		This.SubtituloHeader_2 = Strtran(Substr(Subtitulo, At(';', Subtitulo, 1) + 1, At(';', Subtitulo, 2) - At(';', Subtitulo, 1) - 1),'\<','')
		This.SubtituloHeader_3 = Strtran(Substr(Subtitulo, At(';', Subtitulo, 2) + 1, At(';', Subtitulo, 3) - At(';', Subtitulo, 2) - 1),'\<','')
		This.SubtituloHeader_4 = Strtran(Substr(Subtitulo, At(';', Subtitulo, 3) + 1, At(';', Subtitulo, 4) - At(';', Subtitulo, 3) - 1),'\<','')
		This.SubtituloHeader_5 = Strtran(Substr(Subtitulo, At(';', Subtitulo, 4) + 1, At(';', Subtitulo, 5) - At(';', Subtitulo, 4) - 1),'\<','')
		This.SubtituloHeader_6 = Strtran(Substr(Subtitulo, At(';', Subtitulo, 5) + 1),'\<','')
		This.CampoProcurado_1 = Substr(CampoProcurado, 1, At(';', CampoProcurado, 1) - 1)
		This.CampoProcurado_2 = Substr(CampoProcurado, At(';', CampoProcurado, 1) + 1, At(';', CampoProcurado, 2) - At(';', CampoProcurado, 1) - 1)
		This.CampoProcurado_3 = Substr(CampoProcurado, At(';', CampoProcurado, 2) + 1, At(';', CampoProcurado, 3) - At(';', CampoProcurado, 2) - 1)
		This.CampoProcurado_4 = Substr(CampoProcurado, At(';', CampoProcurado, 3) + 1, At(';', CampoProcurado, 4) - At(';', CampoProcurado, 3) - 1)
		This.CampoProcurado_5 = Substr(CampoProcurado, At(';', CampoProcurado, 4) + 1, At(';', CampoProcurado, 5) - At(';', CampoProcurado, 4) - 1)
		This.CampoProcurado_6 = Substr(CampoProcurado, At(';', CampoProcurado, 5) + 1)
		This.TipoDadoProcurado_1 = Substr(TipoDadoProcurado,1,1)
		This.TipoDadoProcurado_2 = Substr(TipoDadoProcurado,2,1)
		This.TipoDadoProcurado_3 = Substr(TipoDadoProcurado,3,1)
		This.TipoDadoProcurado_4 = Substr(TipoDadoProcurado,4,1)
		This.TipoDadoProcurado_5 = Substr(TipoDadoProcurado,5,1)
		This.TipoDadoProcurado_6 = Substr(TipoDadoProcurado,6,1)
		This.LarguraColuna_1 = Val(Substr(LarguraColuna, 1, At(';', LarguraColuna, 1) - 1))
		This.LarguraColuna_2 = Val(Substr(LarguraColuna, At(';', LarguraColuna, 1) + 1, At(';', LarguraColuna, 2) - At(';', LarguraColuna, 1) - 1))
		This.LarguraColuna_3 = Val(Substr(LarguraColuna, At(';', LarguraColuna, 2) + 1, At(';', LarguraColuna, 3) - At(';', LarguraColuna, 2) - 1))
		This.LarguraColuna_4 = Val(Substr(LarguraColuna, At(';', LarguraColuna, 3) + 1, At(';', LarguraColuna, 4) - At(';', LarguraColuna, 3) - 1))
		This.LarguraColuna_5 = Val(Substr(LarguraColuna, At(';', LarguraColuna, 4) + 1, At(';', LarguraColuna, 5) - At(';', LarguraColuna, 4) - 1))
		This.LarguraColuna_6 = Val(Substr(LarguraColuna, At(';', LarguraColuna, 5) + 1))
		This.DescricaoTabela = Substr(DesTabelaSubJanela, 1, At(';', DesTabelaSubJanela, 1) - 1)
		This.SubtituloJanela = Substr(DesTabelaSubJanela, At(';', DesTabelaSubJanela, 1) + 1)
		Do Form Localizar With .T. To Retorno
		This.CondicaoSelect = '.T.'
		CampoDoValorRetornado = This.CampoProcurado_1
		Return Iif(Retorno, cCursor.&CampoDoValorRetornado., ValorDoCampo)
	Endfunc
Enddefine
