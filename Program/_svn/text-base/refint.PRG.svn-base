Lparameters _id as Integer, _table as String, _type as String
Local Retorno as Boolean
Do Case
	Case _table == 'cliente' And _type == 'delete'
		Retorno = DeleteCliente(_id)
	Case _table == 'fornec' And _type == 'delete'
		Retorno = DeleteFornec(_id)
	Case _table == 'vendedor' And _type == 'delete'
		Retorno = DeleteVendedor(_id)
	Case _table == 'banco' And _type == 'delete'
		Retorno = DeleteBanco(_id)
	Case _table == 'transp' And _type == 'delete'
		Retorno = DeleteTransp(_id)
	Case _table == 'credito' And _type == 'delete'
		Retorno = DeleteCredito(_id)
	Case _table == 'debito' And _type == 'delete'
		Retorno = DeleteDebito(_id)
	Case _table == 'tipdoc' And _type == 'delete'
		Retorno = DeleteTipdoc(_id)
	Case _table == 'centcus' And _type == 'delete'
		Retorno = DeleteCentcus(_id)
	Case _table == 'contorc' And _type == 'delete'
		Retorno = DeleteContorc(_id)
	Case _table == 'grupo' And _type == 'delete'
		Retorno = DeleteGrupo(_id)
	Case _table == 'produto' And _type == 'delete'
		Retorno = DeleteProduto(_id)
	Case _table == 'subgrupo' And _type == 'delete'
		Retorno = DeleteSubgrupo(_id)
	Case _table == 'fab' And _type == 'delete'
		Retorno = DeleteFab(_id)
	Case _table == 'compra' And _type == 'delete'
		Retorno = DeleteEntpro(_id)
	Case _table == 'cheque' And _type == 'delete'
		Retorno = DeleteCheque(_id)
	Case _table == 'contas' And _type == 'delete'
		Retorno = DeleteContas(_id)
	Case _table == 'usugru' And _type == 'delete'
		Retorno = DeleteUsuGru(_id)
	Case _table == 'admcartao' And _type == 'delete'
		Retorno = DeleteAdmCartao(_id)
	Case _table == 'cadcart' And _type == 'delete'
		Retorno = DeleteCartao(_id)
EndCase
Return Retorno

Function DeleteCliente
	Lparameters _id as Integer
	Local Tally as Integer
	Local Retorno as Boolean
	Tally = 0
	Select id From credito Where idcliente = _id To Screen Noconsole
	Tally = Tally + _Tally
	Select id From venda Where idcliente = _id To Screen Noconsole
	Tally = Tally + _Tally
	Select id From cheque Where idcliente = _id To Screen Noconsole
	Tally = Tally + _Tally
	Select id From prevenda Where idcliente = _id To Screen Noconsole
	Tally = Tally + _Tally
	Select id From orcame Where idcliente = _id To Screen Noconsole
	Tally = Tally + _Tally
	Select id From boleto Where idcliente = _id To Screen Noconsole
	Tally = Tally + _Tally
	Select id From ordserv Where idcliente = _id To Screen Noconsole
	Tally = Tally + _Tally
	If Tally = 0 Then
		Retorno = .T.
	Else
		Retorno = .F.
	EndIf
	Return Retorno
EndFunc

Function DeleteFornec
	Lparameters _id as Integer
	Local Tally as Integer
	Local Retorno as Boolean
	Tally = 0
	Select id From debito Where idfornec = _id To Screen Noconsole
	Tally = Tally + _Tally
	Select id From produto Where idfornec = _id To Screen Noconsole
	Tally = Tally + _Tally
	Select id From compra Where idfornec = _id To Screen Noconsole
	Tally = Tally + _Tally
	If Tally = 0 Then
		Retorno = .T.
	Else
		Retorno = .F.
	EndIf
	Return Retorno
EndFunc

Function DeleteVendedor
	Lparameters _id as Integer
	Local Tally as Integer
	Local Retorno as Boolean
	Tally = 0
	Select id From cliente Where idvendedor = _id To Screen Noconsole
	Tally = Tally + _Tally
	Select id From venda Where idvendedor = _id To Screen Noconsole
	Tally = Tally + _Tally
	Select id From prevenda Where idvendedor = _id To Screen Noconsole
	Tally = Tally + _Tally
	Select id From orcame Where idvendedor = _id To Screen Noconsole
	Tally = Tally + _Tally
	If Tally = 0 Then
		Retorno = .T.
	Else
		Retorno = .F.
	EndIf
	Return Retorno
EndFunc

Function DeleteBanco
	Lparameters _id as Integer
	Local Tally as Integer
	Local Retorno as Boolean
	Tally = 0
	Select id From cliente Where idbanco = _id To Screen Noconsole
	Tally = Tally + _Tally
	Select id From debito Where idbanco = _id To Screen Noconsole
	Tally = Tally + _Tally
	Select id From cheque Where idbanco = _id To Screen Noconsole
	Tally = Tally + _Tally
	Select id From contas Where idbanco = _id To Screen Noconsole
	Tally = Tally + _Tally
	If Tally = 0 Then
		Retorno = .T.
	Else
		Retorno = .F.
	EndIf
	Return Retorno
EndFunc

Function DeleteTransp
	Lparameters _id as Integer
	Local Tally as Integer
	Local Retorno as Boolean
	Tally = 0
	Select id From cliente Where idtransp = _id To Screen Noconsole
	Tally = Tally + _Tally
	If Tally = 0 Then
		Retorno = .T.
	Else
		Retorno = .F.
	EndIf
	Return Retorno
EndFunc

Function DeleteCredito
	Lparameters _id as Integer
	Local Tally as Integer
	Local Retorno as Boolean
	Tally = 0
	Select id From cheque Where idcredito = _id To Screen Noconsole
	Tally = Tally + _Tally
	If Tally = 0 Then
		Retorno = .T.
	Else
		Retorno = .F.
	EndIf
	Return Retorno
EndFunc

Function DeleteDebito
	Lparameters _id as Integer
	Local Tally as Integer
	Local Retorno as Boolean
	Tally = 0
	If Tally = 0 Then
		Retorno = .T.
	Else
		Retorno = .F.
	EndIf
	Return Retorno
EndFunc

Function DeleteTipdoc
	Lparameters _id as Integer
	Local Tally as Integer
	Local Retorno as Boolean
	Tally = 0
	Select id From credito Where idtipdoc = _id To Screen Noconsole
	Tally = Tally + _Tally
	Select id From debito Where idtipdoc = _id To Screen Noconsole
	Tally = Tally + _Tally
	If Tally = 0 Then
		Retorno = .T.
	Else
		Retorno = .F.
	EndIf
	Return Retorno
EndFunc

Function DeleteCentcus
	Lparameters _id as Integer
	Local Tally as Integer
	Local Retorno as Boolean
	Tally = 0
	Select id From credito Where idcentcus = _id To Screen Noconsole
	Tally = Tally + _Tally
	Select id From debito Where idcentcus = _id To Screen Noconsole
	Tally = Tally + _Tally
	If Tally = 0 Then
		Retorno = .T.
	Else
		Retorno = .F.
	EndIf
	Return Retorno
EndFunc

Function DeleteContorc
	Lparameters _id as Integer
	Local Tally as Integer
	Local Retorno as Boolean
	Tally = 0
	Select id From credito Where idcontorc = _id To Screen Noconsole
	Tally = Tally + _Tally
	Select id From debito Where idcontorc = _id To Screen Noconsole
	Tally = Tally + _Tally
	If Tally = 0 Then
		Retorno = .T.
	Else
		Retorno = .F.
	EndIf
	Return Retorno
EndFunc

Function DeleteGrupo
	Lparameters _id as Integer
	Local Tally as Integer
	Local Retorno as Boolean
	Tally = 0
	Select id From produto Where idgrupo = _id To Screen Noconsole
	Tally = Tally + _Tally
	Select id From subgrupo Where idgrupo = _id To Screen Noconsole
	Tally = Tally + _Tally
	If Tally = 0 Then
		Retorno = .T.
	Else
		Retorno = .F.
	EndIf
	Return Retorno
EndFunc

Function DeleteProduto
	Lparameters _id as Integer
	Local Tally as Integer
	Local Retorno as Boolean
	Tally = 0
	Select id From proven Where idproduto = _id To Screen Noconsole
	Tally = Tally + _Tally
	Select id From propre Where idproduto = _id To Screen Noconsole
	Tally = Tally + _Tally
	Select id From proorc Where idproduto = _id To Screen Noconsole
	Tally = Tally + _Tally
	Select id From procomp Where idproduto = _id To Screen Noconsole
	Tally = Tally + _Tally
	If Tally = 0 Then
		Retorno = .T.
	Else
		Retorno = .F.
	EndIf
	Return Retorno
EndFunc

Function DeleteSubgrupo
	Lparameters _id as Integer
	Local Tally as Integer
	Local Retorno as Boolean
	Tally = 0
	Select id From produto Where idsubgrupo = _id To Screen Noconsole
	Tally = Tally + _Tally
	If Tally = 0 Then
		Retorno = .T.
	Else
		Retorno = .F.
	EndIf
	Return Retorno
EndFunc

Function DeleteFab
	Lparameters _id as Integer
	Local Tally as Integer
	Local Retorno as Boolean
	Tally = 0
	Select id From produto Where idfab = _id To Screen Noconsole
	Tally = Tally + _Tally
	If Tally = 0 Then
		Retorno = .T.
	Else
		Retorno = .F.
	EndIf
	Return Retorno
EndFunc

Function DeleteEntpro
	Lparameters _id as Integer
	Local Tally as Integer
	Local Retorno as Boolean
	Tally = 0
	Select id From debito Where idcompra = _id To Screen Noconsole
	Tally = Tally + _Tally
	Select id From procomp Where idcompra = _id To Screen Noconsole
	Tally = Tally + _Tally
	If Tally = 0 Then
		Retorno = .T.
	Else
		Retorno = .F.
	EndIf
	Return Retorno
EndFunc

Function DeleteCheque
	Lparameters _id as Integer
	Local Tally as Integer
	Local Retorno as Boolean
	Tally = 0
	If Tally = 0 Then
		Retorno = .T.
	Else
		Retorno = .F.
	EndIf
	Return Retorno
EndFunc

Function DeleteContas
	Lparameters _id as Integer
	Local Tally as Integer
	Local Retorno as Boolean
	Tally = 0
	Select id From credito Where idcontas = _id To Screen Noconsole
	Tally = Tally + _Tally
	If Tally = 0 Then
		Retorno = .T.
	Else
		Retorno = .F.
	EndIf
	Return Retorno
EndFunc

Function DeleteUsuGru
	Lparameters _id as Integer
	Local Tally as Integer
	Local Retorno as Boolean
	Tally = 0
	Select id From usuario Where idusugru = _id To Screen Noconsole
	Tally = Tally + _Tally
	If Tally = 0 Then
		Retorno = .T.
	Else
		Retorno = .F.
	EndIf
	Return Retorno
EndFunc

Function DeleteAdmCartao
	Lparameters _id as Integer
	Local Tally as Integer
	Local Retorno as Boolean
	Tally = 0
	Select id From cadcart Where idadmcartao = _id To Screen Noconsole
	Tally = Tally + _Tally
	If Tally = 0 Then
		Retorno = .T.
	Else
		Retorno = .F.
	EndIf
	Return Retorno
EndFunc

Function DeleteCartao
	Lparameters _id as Integer
	Local Tally as Integer
	Local Retorno as Boolean
	Tally = 0
	Select id From cartao Where idcadcart = _id To Screen Noconsole
	Tally = Tally + _Tally
	If Tally = 0 Then
		Retorno = .T.
	Else
		Retorno = .F.
	EndIf
	Return Retorno
EndFunc
