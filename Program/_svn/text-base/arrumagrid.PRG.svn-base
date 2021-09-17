****************************************************************
*! AUTOR: Edson Gonçalves de Aguiar
*! ARQUIVO: ArrumaGrid.prg
*! FUNÇÃO: Definir as funcionalidades padrão para grids
****************************************************************
Lparameters _Grid as Grid, nCols(_Grid.ColumnCount) as Cursor
Local i as Integer
For i = 1 To Alen(nCols, 1)
	_Grid.Columns(i).DynamicBackColor = DefineParamGrid.ColumnDynamicBackColor
	_Grid.Columns(i).DynamicForeColor = DefineParamGrid.ColumnDynamicForeColor
	_Grid.Columns(i).FontName = DefineParamGrid.ColumnFontName
	_Grid.Columns(i).FontSize = DefineParamGrid.ColumnFontSize
	_Grid.Columns(i).ForeColor = DefineParamGrid.ColumnForeColor
	_Grid.Columns(i).Width = nCols(i, 3)
	_Grid.Columns(i).ReadOnly = DefineParamGrid.ColumnReadOnly
	_Grid.Columns(i).ControlSource = _Grid.RecordSource + '.' + nCols(i, 1)
	_Grid.Columns(i).Header1.BackColor = DefineParamGrid.ColumnHeaderBackColor
	_Grid.Columns(i).Header1.FontBold = DefineParamGrid.ColumnHeaderFontBold
	_Grid.Columns(i).Header1.FontName = DefineParamGrid.ColumnHeaderFontName
	_Grid.Columns(i).Header1.ForeColor = DefineParamGrid.ColumnHeaderForeColor
	_Grid.Columns(i).Header1.Caption = nCols(i, 2)
	_Grid.Columns(i).Text1.FontName = DefineParamGrid.ColumnTextFontName
	_Grid.Columns(i).Text1.FontSize = DefineParamGrid.ColumnTextFontSize
	_Grid.Columns(i).Text1.ForeColor = DefineParamGrid.ColumnTextForeColor
	_Grid.Columns(i).Text1.Margin = DefineParamGrid.ColumnTextMargin
	_Grid.Columns(i).Text1.ReadOnly = DefineParamGrid.ColumnTextReadOnly
	_Grid.Columns(i).Text1.SelectedBackColor = DefineParamGrid.ColumnTextSelectedBackColor
	_Grid.Columns(i).Text1.SelectedForeColor = DefineParamGrid.ColumnTextSelectedForeColor
	_Grid.Columns(i).Text1.MousePointer = DefineParamGrid.ColumnTextMousePointer
	_Grid.MousePointer = DefineParamGrid.GridMousePointer
EndFor

Do Parametros In ArrumaGrid
Function Parametros
	Public DefineParamGrid
	DefineParamGrid = Createobject("_DefineParamGrid")

	Define Class _DefineParamGrid As Custom
		ColumnDynamicBackColor = 'Iif(Mod(Recno(), 2) = 0, Rgb(192,223,255), Rgb(244,253,255))'
		ColumnDynamicForeColor = '0,64,128'
		ColumnFontName = 'MS Sans Serif'
		ColumnFontSize = 8
		ColumnForeColor = Rgb(0,64,128)
		ColumnReadOnly = .T.
		ColumnHeaderBackColor = Rgb(0,64,128)
		ColumnHeaderFontBold = .T.
		ColumnHeaderFontName = 'MS Sans Serif'
		ColumnHeaderForeColor = Rgb(255,255,255)
		ColumnTextFontName = 'MS Sans Serif'
		ColumnTextFontSize = 8
		ColumnTextForeColor = Rgb(0,64,128)
		ColumnTextMargin = 0
		ColumnTextReadOnly = .T.
		ColumnTextSelectedBackColor = Rgb(255,255,120)
		ColumnTextSelectedForeColor = Rgb(0,0,0)
		ColumnTextMousePointer = 1
		GridMousePointer = 1
	EndDefine
