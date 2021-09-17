If _Screen.FormCount > 1
	If Messagebox("Se houver processos em andamento, estes não serão salvos." + Chr(13) + "Deseja continuar?",33,"Fechar Todas as Janelas?") = 1
		Local nForm As Integer
		For nForm = _Screen.FormCount To 1 Step -1
			If _Screen.Forms(nForm).Name = "FRMMAIN" Then
				Loop
			Endif
			If _Screen.Forms(nForm).Name = "BANNER" Then
				Loop
			Endif
			_Screen.Forms(nForm).Release
		Endfor
	Endif
Endif
