Local i As Integer
Local sair As Boolean
sair = .T.
For i = 3 To Application.Forms.Count
	If Wexist(Application.Forms(i).Name)
		sair = .F.
		Exit
	Endif
Endfor
If sair = .F.
	Agetfileversion(cgs, "cgs.exe")
	Messagebox("Não é possivel finalizar o sistema, feche todas as janelas.",64,"CGS v" + cgs(4))
Else
	If Messagebox("Sair do sistema?",36,"Sair") = 6
		Clear Events
		Quit
	Endif
Endif
