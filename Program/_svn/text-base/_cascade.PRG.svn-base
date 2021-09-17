Local lnHorizOff, lnVertOff, lnNewWidth, lnNewHeight
Local lnNewLeft, lnNewTop, lnFmIdx

lnHorizOff = Sysmetric(9) && horizontal offset
lnVertOff = Sysmetric(9) && vertical offset

lnNewWidth = 0.75 * _Screen.Width && new form width
lnNewHeight = 0.75 * _Screen.Height && new form height

lnNewLeft = 0
lnNewTop = 40

For lnFmIdx = _Screen.FormCount To 1 Step -1
	If _Screen.Forms(lnFmIdx).Name = "FRMMAIN" Then
		Loop
	Endif
	If _Screen.Forms(lnFmIdx).Name = "BANNER" Then
		Loop
	Endif
	With _Screen.Forms(lnFmIdx)
		If Type(".BorderStyle")<>"U" And .BorderStyle = 3
			* Form tem borda redimensionável, ajusta a dimensão
			* subject to its min/max height and width
			.Width = Iif(.MinWidth = -1,lnNewWidth,Max(lnNewWidth,.MinWidth))
			.Width = Iif(.MaxWidth = -1,lnNewWidth,Min(lnNewWidth,.MaxWidth))
			.Height = Iif(.MinHeight = -1,lnNewHeight,Max(lnNewHeight,.MinHeight))
			.Height = Iif(.MaxHeight = -1,lnNewHeight,Min(lnNewHeight,.MaxHeight))
		Endif

		* move o form para sua nova posição
		If (lnNewTop + .Height < _Screen.Height) And (lnNewLeft + .Width < _Screen.Width)
			* o form não saíra dos limites da janela principal,
			* so go ahead and move it
			.Move(lnNewLeft,lnNewTop)
			* calculate the position of the next form
			lnNewLeft = lnNewLeft + lnHorizOff
			lnNewTop = lnNewTop + lnVertOff
		Else
			* form does overflow, so go back to
			* top left corner
			.Move(0,40)
			lnNewLeft = lnHorizOff
			lnNewTop = lnVertOff + 40
		Endif
	Endwith
Endfor
