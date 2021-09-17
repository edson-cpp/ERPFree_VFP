PUBLIC hndWin as Integer
PUBLIC cAction as String
PUBLIC cFileName as String
PUBLIC cParams as String
PUBLIC cDir as String
PUBLIC nShowWin as Integer
Declare Integer ShellExecute In shell32.Dll ;
INTEGER hndWin, ;
STRING cAction, ;
STRING cFileName, ;
STRING cParams, ;
STRING cDir, ;
INTEGER nShowWin
cAction = "open"
cFileName = "cgs.chm"
cDir = ''

Public CHAVE1 As String
Public CHAVE2 As String
Public CHAVE3 As String

Public COMPUTERS_NUMBER As String
Public ID_USUARIO As Integer
Public NOME_USUARIO As String
Public SYSTEM_PATH As String

Public NOVO As String
Public ALTERAR As String
Public CANCELAR As String
Public SALVAR As String
Public CONSULTAR As String
Public EXCLUIR As String
Public PRIMEIRO As String
Public ANTERIOR As String
Public PROXIMO As String
Public ULTIMO As String
Public FECHAR As String
Public BAIXAR As String
Public OK As String
Public UNIAO As String
Public DETALHES As String
Public REMOVER As String
Public ORCAMENTOS As String
Public PREVENDA As String
Public PREVENDA_SAVE As String

Public TOOL_TIP_TOP As Integer
Public TOOL_TIP_LEFT As Integer
Public TOOL_TIP_HEIGTH As Integer
Public TOOL_TIP_WIDTH As Integer

Public SHAPE_TOP As Integer
Public SHAPE_LEFT As Integer
Public SHAPE_HEIGHT As Integer
Public SHAPE_WIDTH As Integer

Public TEXTBOX_TOP As Integer
Public TEXTBOX_LEFT As Integer
Public TEXTBOX_HEIGHT As Integer
Public TEXTBOX_WIDTH As Integer

Public DRAFT10CPI_COLUNA As Double
Public DRAFT20CPI_COLUNA As Double
Public DRAFT10CPI_LINHA As Double
Public DRAFT20CPI_LINHA As Double

Public nomebd1 As String
Public campo1 As String
Public campo2 As String
Public tituloc As String
Public ToolTip As String
Public picForm As String
Public picFrame As String
Public txtBorderColor As Integer
Public txtBackColor As Integer
Public txtForeColor As Integer
Public lblForeColor As Integer
Public txtDisableForeColor As Integer
Public txtDisableBackColor As Integer
Public txtFocuBorderColor As Integer
Public pgFrameBackColor As Integer
Public ret_janela As Integer
Public btnBorderColor As Integer
Public backForm As Integer
Public backColorbtn As Integer
Public shapeBorderColor As Integer
Public shapeBorberWidth As Integer
Public shapeCurvatura As Integer
Public btnLabelForecolor As Integer
Public tooltipBorderColor As Integer
Public codvend As Integer
Public DefineBarMenu As Integer
Public retorno As Boolean
Public _enabled1 As Boolean
Public _enabled2 As Boolean
Public _enabled2 As Boolean
Public _enabled4 As Boolean
Public _enabled5 As Boolean
Public _enabled6 As Boolean
Public frmPicture
Public janela
Public DETALHES
Public Array aCgsForms(1,2)
Public Array CgsVersion(1)

Store "_19021721" To CHAVE1
Store "_20L031VU" To CHAVE2
Store "_20L033OH" To CHAVE3

Store "1" To COMPUTERS_NUMBER
Store 0 To ID_USUARIO
Store "" To NOME_USUARIO
If _vfp.StartMode = 0 Then
	Store Sys(5) + Curdir() To SYSTEM_PATH
Else
	Store Addbs(Justpath(_vfp.ServerName)) To SYSTEM_PATH
Endif

Store 100 To TOOL_TIP_TOP
Store 200 To TOOL_TIP_LEFT
Store 80 To TOOL_TIP_HEIGTH
Store 200 To TOOL_TIP_WIDTH

Store 1 To SHAPE_TOP
Store 1 To SHAPE_LEFT
Store 98 To SHAPE_HEIGHT
Store 198 To SHAPE_WIDTH

Store 0 To TEXTBOX_TOP
Store 0 To TEXTBOX_LEFT
Store 80 To TEXTBOX_HEIGHT
Store 200 To TEXTBOX_WIDTH

Store 2.538556 To DRAFT10CPI_COLUNA
Store 1.270693 To DRAFT20CPI_COLUNA
Store 4.242222 To DRAFT10CPI_LINHA
Store 4.252414 To DRAFT20CPI_LINHA

Store "Novo" To NOVO
Store "Alterar" To ALTERAR
Store "Cancelar" To CANCELAR
Store "Salvar" To SALVAR
Store "Localizar - F5" To CONSULTAR
Store "Excluir" To EXCLUIR
Store "Primeiro - Ctrl + Home" To PRIMEIRO
Store "Anterior - Ctrl + Page Up" To ANTERIOR
Store "Próximo - Ctrl + Page Down" To PROXIMO
Store "Último - Ctrl + End" To ULTIMO
Store "Fechar..." To FECHAR
Store "Baixar" To BAIXAR
Store "Ok" To OK
Store "União de registros" To UNIAO
Store "Detalhes" To DETALHES
Store "Remover" To REMOVER
Store "Orçamentos" To ORCAMENTOS
Store "Pré-Venda" To PREVENDA
Store "Salvar Pré-Venda" To PREVENDA_SAVE

Store "" To m.nomebd1
Store "" To m.campo1
Store "" To m.campo2
Store "" To m.tituloc
Store "" To m.tooltip
Store .T. To m.retorno
Store .T. To m._enabled1
Store .T. To m._enabled2
Store .T. To m._enabled3
Store .T. To m._enabled4
Store .T. To m._enabled5
Store .T. To m._enabled6
Store 0 To ret_janela
Store 0 To m.codvend
Store 4 To DefineBarMenu

&&Define o picture e as cores do formulário
Store "" To m.picForm
Store Rgb(255,255,255) To m.backForm

&&Frames
Store "" To picFrame
Store Rgb(192,192,192) To m.pgFrameBackColor

&&Cores
Store Rgb ( 128,128,128 ) To m.txtBorderColor
Store Rgb ( 255,255,255 ) To m.txtBackColor
Store Rgb ( 0,0,0) To m.txtForeColor
Store Rgb ( 0,0,160 ) To m.txtDisableForeColor
Store Rgb (210,210,210) To m.txtDisableBackColor
Store Rgb ( 0,0,255 ) To m.txtFocuBorderColor
Store Rgb ( 0,128,192 ) To m.lblForeColor
Store Rgb ( 128,128,128 ) To m.shapeBorderColor

&&Botoes
Store 1 To m.shapeBorberWidth
Store 1 To m.shapeCurvatura
Store Rgb ( 238,238,238 ) To m.backColorbtn
Store Rgb ( 0,0,255 ) To m.btnBorderColor
Store Rgb(0,0,0) To m.btnLabelForecolor

_Screen.BackColor = Rgb( 255,255,255 )
