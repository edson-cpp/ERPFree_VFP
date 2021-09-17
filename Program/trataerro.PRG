Lparameters oErr as Object, _Form as String
Do Case
	Case oErr.ErrorNo = 1
		Messagebox('Arquivo inexistente.', 16, 'Erro')
	Case oErr.ErrorNo = 3
		Messagebox('Arquivo em uso.', 16, 'Erro')
	Case oErr.ErrorNo = 7
		Messagebox('Arquivo já existe.', 16, 'Erro')
	Case oErr.ErrorNo = 13
		Messagebox('Arquivo não encontrado.', 16, 'Erro')
	Case oErr.ErrorNo = 1539 &&Trigger Failed
		Messagebox('Não foi possível excluir o registro.' + Chr(13);
			+ 'Existe pelo menos um relacionamento associado.', 16, 'Impossível excluir!')
		Return .T.
	Otherwise
		Messagebox('Erro inesperado.', 16, 'Erro')
Endcase
GravaSystemLog(oErr, _Form)

Function GravaSystemLog
	Lparameters oErr as Object, _Form as String
	Try
		ServerWay = Substr(_Database, 1, Len(_Database) - 13)
		If !File(ServerWay + 'SystemLog.txt')
			gnerrFile = Fcreate(ServerWay + 'SystemLog.txt')
		Else
			gnerrFile = Fopen(ServerWay + 'SystemLog.txt', 12)
		EndIf
		Fseek(gnerrFile,0,2)
		Fputs(gnerrFile, 'USUÁRIO: ' + Alltrim(Str(ID_USUARIO)) + ' - ' + NOME_USUARIO + ', DATA: ' + Dtoc(Date()) + ', HORA: ' + Time())
		Fputs(gnerrFile, [	Form: ] + _Form)
		Fputs(gnerrFile, [	Error: ] + Str(oErr.ErrorNo))
		Fputs(gnerrFile, [	LineNo: ] + Str(oErr.LineNo))
		Fputs(gnerrFile, [	Message: ] + oErr.Message)
		Fputs(gnerrFile, [	Procedure: ] + oErr.Procedure)
		Fputs(gnerrFile, [	Details: ] + oErr.Details)
		Fputs(gnerrFile, [	StackLevel: ] + Str(oErr.StackLevel))
		Fputs(gnerrFile, [	LineContents: ] + oErr.LineContents)
		Fputs(gnerrFile, [	])
		Fclose(gnerrFile)
	Catch To oErrErr
		Messagebox('O CGS não pode gravar um log de erro,' + Chr(13);
			+ 'por favor entre em contato com o suporte.')
		Fclose(gnerrFile)
	Endtry
Endfunc
