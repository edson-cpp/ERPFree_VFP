****************************************************************
*! AUTOR: Edson Gonçalves de Aguiar
*! ARQUIVO: permissoes.prg
*! FUNÇÃO: Definir as permissões do sistema
****************************************************************
Public Permissoes
Permissoes = Createobject("_Permissoes")

Define Class _Permissoes As Custom
	Function Init
	Endfunc

	Function ControleDeAcessos
		Begin transaction 
			Try
				Local _QtdePermissoes As Integer
				Local i As Integer
				Local _Permissao As String
				Select recurso, permissao From pergru Where idgrupo = (Select idusugru From usuario Where Id = ID_USUARIO) Into Cursor cPermissaoGrupo Readwrite
				Select recurso, permissao From perusu Where idusuario = ID_USUARIO Into Cursor cPermissaoUsuario
				Scan
					_Permissao = ''
					Select cPermissaoGrupo
					Locate For Alltrim(recurso) == Alltrim(cPermissaoUsuario.recurso)
					If !Found() Then
						Insert Into cPermissaoGrupo(recurso, permissao) Values (cPermissaoUsuario.recurso, cPermissaoUsuario.permissao)
					EndIf
					
					For i = 1 To 8
						If Substr(Alltrim(cPermissaoUsuario.permissao), i, 1) == 'G' Then
							_Permissao = _Permissao + Substr(Alltrim(cPermissaoGrupo.permissao), i, 1)
						Else
							_Permissao = _Permissao + Substr(Alltrim(cPermissaoUsuario.permissao), i, 1)
						Endif
					Endfor
					Replace permissao With _Permissao
					Select cPermissaoUsuario
				Endscan
				Select recurso, permissao From cPermissaoGrupo Into Cursor cPermissao
				Use In cPermissaoGrupo
				Select cPermissao
				Calculate Cnt() To _QtdePermissoes
				If _QtdePermissoes # 0 Then
					Public Array aCgsForms(_QtdePermissoes, 2)
					i = 1
					Scan
						aCgsForms(i,1) = cPermissao.recurso
						aCgsForms(i,2) = cPermissao.permissao
						i = i + 1
					EndScan
				EndIf
				End transaction 
			Catch To oErr
				Rollback
				Messagebox('Ocorreu um erro ao tentar definir as permissões do usuário.';
					+ Chr(13) + 'Isso pode ter sido ocasionado por um erro na gravação';
					+ Chr(13) + 'do disco ou na memória do computador.';
					+ Chr(13) + 'O sistema não pode ser iniciado e será fechado.';
					+ Chr(13) + 'Por favor tente novamente, caso o problema persista';
					+ Chr(13) + 'entre em contato com a assistência técnica.', 16, 'Falha no sistema')
				Do GravaSystemLog In TrataErro With oErr, 'Permissoes.prg'
				On Shutdown
				Clear Events
				Quit
			Endtry
	Endfunc
	
	Function ObtemPermissao(_Form As String)
		Local i As Integer
		Local _Perm As Character
		Local Array _Admin(1) As String
		_Admin = ''
		i = Ascan(aCgsForms, Lower(_Form), 1, Alen(aCgsForms, 1), 1, 8)
		_Perm = Iif(i = 0, 'FFFFFFFF', aCgsForms(i,2))
		Try
			Select unome From usuario Where id = ID_USUARIO Into Array _Admin
		Catch To oErr
			Do TrataErro With oErr, 'SmallFunc.prg'
		EndTry
		If Alltrim(_Admin) == 'ADMINISTRADOR' Then
			_Perm = 'TTTTTTTT'
		Endif
		Release _Admin
		Return _Perm
	Endfunc
Enddefine
