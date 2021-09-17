*! Executa se a versão informada for maior que a versão instalada do sistema
*! Atualiza para a versão 0.7.0
If _Exec("0.6.999") Then && <-- Todas as versões igual ou abaixo do informado serão substituídas.
	Insert Into tparam (campo, valor) Values ('CodigoPadrao', '1')
	Chdir Justpath(_Database)
	*!----------------------- Fechar Venda no Crediário ------------------------!*
	*! @field id = Identificação do registro
	*! @field idvenda = Identificação da venda
	*! @field idcliente = Identificação do cliente
	*! @field dataemi = Data de emissão
	*! @field datavenc = Data de vencimento
	*! @field datapag = Data de pagamento
	*! @field valor = Valor da parcela
	*! @field numparc = Número da parcela
	*! @field totparc = Total de parcelas
	*! @field situ = Situação aqui pode ser: Aberto(A), Baixado(B)
	Create Table 'Fechar Venda no Crediário' Name 'crediario'(;
		id			Integer Autoinc,;
		idvenda		Integer,;
		idcliente	Integer,;
		dataemi		Date,;
		datavenc	Date,;
		datapag		Date,;
		valor		Float(10,2),;
		numparc		Numeric(3),;
		totparc		Numeric(3),;
		situ		Character(1);
	)
	*!--------------------------------------------------------------------------!*

	*!---------------------------------- Cfop ----------------------------------!*
	*! @field id = Identificação do registro
	*! @field cfop = Código
	*! @field descricao = Descrição
	*! @field obs = Aplicação
	*! @field tipo = Tipo. Pode ser: E - Entrada, S - Saída
	*! @field resumo = Descrição resumida
	Create Table 'Código Fiscal de Operações e Prestações' Name 'cfop'(;
		id			Integer Autoinc,;
		cfop		Character(4),;
		descricao	Character(200),;
		obs			Memo,;
		tipo		Character(1),;
		resumo		Character(30);
	)
	*!--------------------------------------------------------------------------!*
	Create Trigger On cfop For Delete As RefInt(id, 'cfop', 'delete')
	Chdir &_SystemPath
	ALTER TABLE cfop ALTER COLUMN id integer
	INSERT INTO cfop VALUES (1, "1000", "ENTRADAS OU AQUISIÇÕES DE SERVIÇOS DO ESTADO", "Classificam-se, neste grupo, as operações ou prestações em que o estabelecimento remetente esteja " + CHR(13) + "localizado na mesma unidade da Federação do destinatário.", "E", "ENTRADAS OU AQUISIÇÕES")
	INSERT INTO cfop VALUES (2, "1100", "COMPRAS PARA INDUSTRIALIZAÇÃO, COMERCIALIZAÇÃO OU PRESTAÇÃO DE SERVIÇOS", "", "E", "COMPRAS PARA INDUSTRIALIZAÇÃO")
	INSERT INTO cfop VALUES (3, "1101", "Compra para industrialização", "Classificam-se neste código as compras de mercadorias a serem utilizadas em processo de " + CHR(13) + "industrialização. Também serão classificadas neste código as entradas de mercadorias em " + CHR(13) + "estabelecimento industrial de cooperativa recebidas de seus cooperados ou de estabelecimento de " + CHR(13) + "outra cooperativa.", "E", "Compra para industrialização")
	INSERT INTO cfop VALUES (4, "1102", "Compra para comercialização", "Classificam-se neste código as compras de mercadorias a serem comercializadas. Também serão " + CHR(13) + "classificadas neste código as entradas de mercadorias em estabelecimento comercial de cooperativa " + CHR(13) + "recebidas de seus cooperados ou de estabelecimento de outra cooperativa.", "E", "Compra para comercialização")
	INSERT INTO cfop VALUES (5, "1111", "Compra para industrialização de mercadoria recebida anteriormente em consignação industrial", "Classificam-se neste código as compras efetivas de mercadorias a serem utilizadas em processo de " + CHR(13) + "industrialização, recebidas anteriormente a título de consignação industrial.", "E", "Compra para industrialização")
	INSERT INTO cfop VALUES (6, "1113", "Compra para comercialização, de mercadoria recebida anteriormente em consignação mercantil", "Classificam-se neste código as compras efetivas de mercadorias recebidas anteriormente a título de " + CHR(13) + "consignação mercantil.", "E", "Compra para comercialização")
	INSERT INTO cfop VALUES (7, "1116", "Compra para industrialização originada de encomenda para recebimento futuro", "Classificam-se neste código as compras de mercadorias a serem utilizadas em processo de " + CHR(13) + "industrialização, quando da entrada real da mercadoria, cuja aquisição tenha sido classificada no " + CHR(13) + "código " + '"' + "1.922 – Lançamento efetuado a título de simples faturamento decorrente de compra para " + CHR(13) + "recebimento futuro" + '"' + ".", "E", "Compra para industrialização")
	INSERT INTO cfop VALUES (8, "1117", "Compra para comercialização originada de encomenda para recebimento futuro", "Classificam-se neste código as compras de mercadorias a serem comercializadas, quando da entrada " + CHR(13) + "real da mercadoria, cuja aquisição tenha sido classificada no código " + '"' + "1.922 – Lançamento efetuado a " + CHR(13) + "título de simples faturamento decorrente de compra para recebimento futuro" + '"' + ".", "E", "Compra para comercialização")
	INSERT INTO cfop VALUES (9, "1118", "Compra de mercadoria para comercialização pelo adquirente originário, entregue pelo vendedor remetente ao destinatário, em venda à ordem", "Classificam-se neste código as compras de mercadorias já comercializadas, que, sem transitar pelo " + CHR(13) + "estabelecimento do adquirente originário, sejam entregues pelo vendedor remetente diretamente ao " + CHR(13) + "destinatário, em operação de venda à ordem, cuja venda seja classificada, pelo adquirente " + CHR(13) + "originário, no código " + '"' + "5.120 – Venda de mercadoria adquirida ou recebida de terceiros entregue ao " + CHR(13) + "destinatário pelo vendedor remetente, em venda à ordem" + '"' + ".", "E", "Compra para comercialização")
	INSERT INTO cfop VALUES (10, "1120", "Compra para industrialização, em venda à ordem, já recebida do vendedor remetente", "Classificam-se neste código as compras de mercadorias a serem utilizadas em processo de " + CHR(13) + "industrialização, em vendas à ordem, já recebidas do vendedor remetente, por ordem do adquirente " + CHR(13) + "originário.", "E", "Compra para industrialização")
	INSERT INTO cfop VALUES (11, "1121", "Compra para comercialização, em venda à ordem, já recebida do vendedor remetente", "Classificam-se neste código as compras de mercadorias a serem comercializadas, em vendas à ordem, já" + CHR(13) + " recebidas do vendedor remetente por ordem do adquirente originário.", "E", "Compra para comercialização")
	INSERT INTO cfop VALUES (12, "1122", "Compra para industrialização em que a mercadoria foi remetida pelo fornecedor ao industrializador sem transitar pelo estabelecimento adquirente", "Classificam-se neste código as compras de mercadorias a serem utilizadas em processo de " + CHR(13) + "industrialização, remetidas pelo fornecedor para o industrializador sem que a mercadoria tenha " + CHR(13) + "transitado pelo estabelecimento do adquirente.", "E", "Compra para industrialização")
	INSERT INTO cfop VALUES (13, "1124", "Industrialização efetuada por outra empresa", "Classificam-se neste código as entradas de mercadorias industrializadas por terceiros, compreendendo" + CHR(13) + " os valores referentes aos serviços prestados e os das mercadorias de propriedade do " + CHR(13) + "industrializador empregadas no processo industrial. Quando a industrialização efetuada se referir a " + CHR(13) + "bens do ativo imobilizado ou de mercadorias para uso ou consumo do estabelecimento encomendante, a " + CHR(13) + "entrada deverá ser classificada nos códigos " + '"' + "1.551 – Compra de bem para o ativo imobilizado" + '"' + " ou " + CHR(13) + "" + '"' + "1.556 – Compra de material para uso ou consumo" + '"' + ".", "E", "Industrialização")
	INSERT INTO cfop VALUES (14, "1125", "Industrialização efetuada por outra empresa quando a mercadoria remetida para utilização no processo de industrialização não transitou pelo estabelecimento adquirente da mercadoria", "Classificam-se neste código as entradas de mercadorias industrializadas por outras empresas, em que " + CHR(13) + "as mercadorias remetidas para utilização no processo de industrialização não transitaram pelo " + CHR(13) + "estabelecimento do adquirente das mercadorias, compreendendo os valores referentes aos serviços " + CHR(13) + "prestados e os das mercadorias de propriedade do industrializador empregadas no processo industrial." + CHR(13) + " Quando a industrialização efetuada se referir a bens do ativo imobilizado ou de mercadorias para " + CHR(13) + "uso ou consumo do estabelecimento encomendante, a entrada deverá ser classificada nos códigos " + '"' + "1.551" + CHR(13) + " – Compra de bem para o ativo imobilizado" + '"' + " ou " + '"' + "1.556 – Compra de material para uso ou consumo" + '"' + ".", "E", "Industrialização")
	INSERT INTO cfop VALUES (15, "1126", "Compra para utilização na prestação de serviço", " Classificam-se neste código as entradas de mercadorias a serem utilizadas nas prestações de " + CHR(13) + "serviços.", "E", "Compra")
	INSERT INTO cfop VALUES (16, "1150", "TRANSFERÊNCIAS PARA INDUSTRIALIZAÇÃO, COMERCIALIZAÇÃO OU PRESTAÇÃO DE SERVIÇOS", "", "E", "TRANSF. PARA INDUSTRIALIZAÇÃO")
	INSERT INTO cfop VALUES (17, "1151", "Transferência para industrialização", "Classificam-se neste código as entradas de mercadorias recebidas em transferência de outro " + CHR(13) + "estabelecimento da mesma empresa, para serem utilizadas em processo de industrialização.", "E", "Transf. para industrialização")
	INSERT INTO cfop VALUES (18, "1152", "Transferência para comercialização", "Classificam-se neste código as entradas de mercadorias recebidas em transferência de outro " + CHR(13) + "estabelecimento da mesma empresa, para serem comercializadas.", "E", "Transf. para comercialização")
	INSERT INTO cfop VALUES (19, "1153", "Transferência de energia elétrica para distribuição", "Classificam-se neste código as entradas de energia elétrica recebida em transferência de outro " + CHR(13) + "estabelecimento da mesma empresa, para distribuição.", "E", "Transf. de energia elétrica")
	INSERT INTO cfop VALUES (20, "1154", "Transferência para utilização na prestação de serviço", "Classificam-se neste código as entradas de mercadorias recebidas em transferência de outro " + CHR(13) + "estabelecimento da mesma empresa, para serem utilizadas nas prestações de serviços.", "E", "Transf. util. prest. serviço")
	INSERT INTO cfop VALUES (21, "1200", "DEVOLUÇÕES DE VENDAS DE PRODUÇÃO PRÓPRIA, DE TERCEIROS OU ANULAÇÕES DE VALORES", "", "E", "DEVOLUÇÕES DE VENDAS")
	INSERT INTO cfop VALUES (22, "1201", "Devolução de venda de produção do estabelecimento", "Classificam-se neste código as devoluções de vendas de produtos industrializados pelo " + CHR(13) + "estabelecimento, cujas saídas tenham sido classificadas como " + '"' + "Venda de produção do estabelecimento" + '"' + ".", "E", "Devolução de venda")
	INSERT INTO cfop VALUES (23, "1202", "Devolução de venda de mercadoria adquirida ou recebida de terceiros", "Classificam-se neste código as devoluções de vendas de mercadorias adquiridas ou recebidas de " + CHR(13) + "terceiros, que não tenham sido objeto de industrialização no estabelecimento, cujas saídas tenham " + CHR(13) + "sido classificadas como " + '"' + "Venda de mercadoria adquirida ou recebida de terceiros" + '"' + ".", "E", "Devolução de venda")
	INSERT INTO cfop VALUES (24, "1203", "Devolução de venda de produção do estabelecimento, destinada à Zona Franca de Manaus ou Áreas de Livre Comércio", "Classificam-se neste código as devoluções de vendas de produtos industrializados pelo " + CHR(13) + "estabelecimento, cujas saídas foram classificadas no código " + '"' + "5.109 – Venda de produção do " + CHR(13) + "estabelecimento, destinada à Zona Franca de Manaus ou Áreas de Livre Comércio" + '"' + ".", "E", "Devolução de venda")
	INSERT INTO cfop VALUES (25, "1204", "Devolução de venda de mercadoria adquirida ou recebida de terceiros, destinada à Zona Franca de Manaus ou Áreas de Livre Comércio", "Classificam-se neste código as devoluções de vendas de mercadorias adquiridas ou recebidas de " + CHR(13) + "terceiros, cujas saídas foram classificadas no código " + '"' + "5.110 – Venda de mercadoria adquirida ou " + CHR(13) + "recebida de terceiros, destinada à Zona Franca de Manaus ou Áreas de Livre Comércio" + '"' + ".", "E", "Devolução de venda")
	INSERT INTO cfop VALUES (26, "1205", "Anulação de valor relativo à prestação de serviço de comunicação", "Classificam-se neste código as anulações correspondentes a valores faturados indevidamente, " + CHR(13) + "decorrentes de prestações de serviços de comunicação.", "E", "Anulação de valor")
	INSERT INTO cfop VALUES (27, "1206", "Anulação de valor relativo à prestação de serviço de transporte", "Classificam-se neste código as anulações correspondentes a valores faturados indevidamente, " + CHR(13) + "decorrentes de prestações de serviços de transporte.", "E", "Anulação de valor")
	INSERT INTO cfop VALUES (28, "1207", "Anulação de valor relativo à venda de energia elétrica", "Classificam-se neste código as anulações correspondentes a valores faturados indevidamente, " + CHR(13) + "decorrentes de venda de energia elétrica.", "E", "Anulação de valor")
	INSERT INTO cfop VALUES (29, "1208", "Devolução de produção do estabelecimento, remetida em transferência", "Classificam-se neste código as devoluções de produtos industrializados pelo estabelecimento, " + CHR(13) + "transferidos para outros estabelecimentos da mesma empresa.", "E", "Devolução de produção")
	INSERT INTO cfop VALUES (30, "1209", "Devolução de mercadoria adquirida ou recebida de terceiros, remetida em transferência", "Classificam-se neste código as devoluções de mercadorias adquiridas ou recebidas de terceiros, " + CHR(13) + "transferidas para outros estabelecimentos da mesma empresa.", "E", "Devolução de mercadoria")
	INSERT INTO cfop VALUES (31, "1250", "COMPRAS DE ENERGIA ELÉTRICA", "", "E", "COMPRAS DE ENERGIA ELÉTRICA")
	INSERT INTO cfop VALUES (32, "1251", "Compra de energia elétrica para distribuição ou comercialização", "Classificam-se neste código as compras de energia elétrica utilizada em sistema de distribuição ou " + CHR(13) + "comercialização. Também serão classificadas neste código as compras de energia elétrica por " + CHR(13) + "cooperativas para distribuição aos seus cooperados.", "E", "Compra de energia elétrica")
	INSERT INTO cfop VALUES (33, "1252", "Compra de energia elétrica por estabelecimento industrial", "Classificam-se neste código as compras de energia elétrica utilizada no processo de " + CHR(13) + "industrialização. Também serão classificadas neste código as compras de energia elétrica utilizada " + CHR(13) + "por estabelecimento industrial de cooperativa.", "E", "Compra de energia elétrica")
	INSERT INTO cfop VALUES (34, "1253", "Compra de energia elétrica por estabelecimento comercial", "Classificam-se neste código as compras de energia elétrica utilizada por estabelecimento comercial. " + CHR(13) + "Também serão classificadas neste código as compras de energia elétrica utilizada por estabelecimento" + CHR(13) + " comercial de cooperativa.", "E", "Compra de energia elétrica")
	INSERT INTO cfop VALUES (35, "1254", "Compra de energia elétrica por estabelecimento prestador de serviço de transporte", "Classificam-se neste código as compras de energia elétrica utilizada por estabelecimento prestador " + CHR(13) + "de serviços de transporte.", "E", "Compra de energia elétrica")
	INSERT INTO cfop VALUES (36, "1255", "Compra de energia elétrica por estabelecimento prestador de serviço de comunicação", "Classificam-se neste código as compras de energia elétrica utilizada por estabelecimento prestador " + CHR(13) + "de serviços de comunicação.", "E", "Compra de energia elétrica")
	INSERT INTO cfop VALUES (37, "1256", "Compra de energia elétrica por estabelecimento de produtor rural", " Classificam-se neste código as compras de energia elétrica utilizada por estabelecimento de " + CHR(13) + "produtor rural.", "E", "Compra de energia elétrica")
	INSERT INTO cfop VALUES (38, "1257", "Compra de energia elétrica para consumo por demanda contratada", "Classificam-se neste código as compras de energia elétrica para consumo por demanda contratada, que " + CHR(13) + "prevalecerá sobre os demais códigos deste subgrupo.", "E", "Compra de energia elétrica")
	INSERT INTO cfop VALUES (39, "1300", "AQUISIÇÕES DE SERVIÇOS DE COMUNICAÇÃO", "", "E", "AQUISIÇÕES DE SERVIÇOS")
	INSERT INTO cfop VALUES (40, "1301", "Aquisição de serviço de comunicação para execução de serviço da mesma natureza", "Classificam-se neste código as aquisições de serviços de comunicação utilizados nas prestações de " + CHR(13) + "serviços da mesma natureza.", "E", "Aquisição de serviço")
	INSERT INTO cfop VALUES (41, "1302", "Aquisição de serviço de comunicação por estabelecimento industrial", "Classificam-se neste código as aquisições de serviços de comunicação utilizados por estabelecimento " + CHR(13) + "industrial. Também serão classificadas neste código as aquisições de serviços de comunicação " + CHR(13) + "utilizados por estabelecimento industrial de cooperativa.", "E", "Aquisição de serviço")
	INSERT INTO cfop VALUES (42, "1303", "Aquisição de serviço de comunicação por estabelecimento comercial", "Classificam-se neste código as aquisições de serviços de comunicação utilizados por estabelecimento " + CHR(13) + "comercial. Também serão classificadas neste código as aquisições de serviços de comunicação " + CHR(13) + "utilizados por estabelecimento comercial de cooperativa.", "E", "Aquisição de serviço")
	INSERT INTO cfop VALUES (43, "1304", "Aquisição de serviço de comunicação por estabelecimento de prestador de serviço de transporte", "Classificam-se neste código as aquisições de serviços de comunicação utilizados por estabelecimento " + CHR(13) + "prestador de serviço de transporte.", "E", "Aquisição de serviço")
	INSERT INTO cfop VALUES (44, "1305", "Aquisição de serviço de comunicação por estabelecimento de geradora ou de distribuidora de energia elétrica", "Classificam-se neste código as aquisições de serviços de comunicação utilizados por estabelecimento " + CHR(13) + "de geradora ou de distribuidora de energia elétrica.", "E", "Aquisição de serviço")
	INSERT INTO cfop VALUES (45, "1306", "Aquisição de serviço de comunicação por estabelecimento de produtor rural", "Classificam-se neste código as aquisições de serviços de comunicação utilizados por estabelecimento " + CHR(13) + "de produtor rural.", "E", "Aquisição de serviço")
	INSERT INTO cfop VALUES (46, "1350", "AQUISIÇÕES DE SERVIÇOS DE TRANSPORTE", "", "E", "AQUISIÇÕES DE SERVIÇOS")
	INSERT INTO cfop VALUES (47, "1351", "Aquisição de serviço de transporte para execução de serviço da mesma natureza", "Classificam-se neste código as aquisições de serviços de transporte utilizados nas prestações de " + CHR(13) + "serviços da mesma natureza.", "E", "Aquisição de serviço")
	INSERT INTO cfop VALUES (48, "1352", "Aquisição de serviço de transporte por estabelecimento industrial", "Classificam-se neste código as aquisições de serviços de transporte utilizados por estabelecimento " + CHR(13) + "industrial. Também serão classificadas neste código as aquisições de serviços de transporte " + CHR(13) + "utilizados por estabelecimento industrial de cooperativa.", "E", "Aquisição de serviço")
	INSERT INTO cfop VALUES (49, "1353", "Aquisição de serviço de transporte por estabelecimento comercial", "Classificam-se neste código as aquisições de serviços de transporte utilizados por estabelecimento " + CHR(13) + "comercial. Também serão classificadas neste código as aquisições de serviços de transporte " + CHR(13) + "utilizados por estabelecimento comercial de cooperativa.", "E", "Aquisição de serviço")
	INSERT INTO cfop VALUES (50, "1354", "Aquisição de serviço de transporte por estabelecimento de prestador de serviço de comunicação", "Classificam-se neste código as aquisições de serviços de transporte utilizados por estabelecimento " + CHR(13) + "prestador de serviços de comunicação.", "E", "Aquisição de serviço")
	INSERT INTO cfop VALUES (51, "1355", "Aquisição de serviço de transporte por estabelecimento de geradora ou de distribuidora de energia elétrica", "Classificam-se neste código as aquisições de serviços de transporte utilizados por estabelecimento " + CHR(13) + "de geradora ou de distribuidora de energia elétrica.", "E", "Aquisição de serviço")
	INSERT INTO cfop VALUES (52, "1356", "Aquisição de serviço de transporte por estabelecimento de produtor rural", " Classificam-se neste código as aquisições de serviços de transporte utilizados por estabelecimento " + CHR(13) + "de produtor rural.", "E", "Aquisição de serviço")
	INSERT INTO cfop VALUES (53, "1400", "ENTRADAS DE MERCADORIAS SUJEITAS AO REGIME DE SUBSTITUIÇÃO TRIBUTÁRIA", "", "E", "ENTRADAS DE MERCADORIAS")
	INSERT INTO cfop VALUES (54, "1401", "Compra para industrialização em operação com mercadoria sujeita ao regime de substituição tributária", "Classificam-se neste código as compras de mercadorias a serem utilizadas em processo de " + CHR(13) + "industrialização, decorrentes de operações com mercadorias sujeitas ao regime de substituição " + CHR(13) + "tributária. Também serão classificadas neste código as compras por estabelecimento industrial de " + CHR(13) + "cooperativa de mercadorias sujeitas ao regime de substituição tributária.", "E", "Compra para industrialização")
	INSERT INTO cfop VALUES (55, "1403", "Compra para comercialização em operação com mercadoria sujeita ao regime de substituição tributária", "Classificam-se neste código as compras de mercadorias a serem comercializadas, decorrentes de " + CHR(13) + "operações com mercadorias sujeitas ao regime de substituição tributária. Também serão classificadas " + CHR(13) + "neste código as compras de mercadorias sujeitas ao regime de substituição tributária em " + CHR(13) + "estabelecimento comercial de cooperativa.", "E", "Compra para comercialização")
	INSERT INTO cfop VALUES (56, "1406", "Compra de bem para o ativo imobilizado cuja mercadoria está sujeita ao regime de substituição tributária", "Classificam-se neste código as compras de bens destinados ao ativo imobilizado do estabelecimento, " + CHR(13) + "em operações com mercadorias sujeitas ao regime de substituição tributária.", "E", "Compra de bem")
	INSERT INTO cfop VALUES (57, "1407", "Compra de mercadoria para uso ou consumo cuja mercadoria está sujeita ao regime de substituição tributária", "Classificam-se neste código as compras de mercadorias destinadas ao uso ou consumo do " + CHR(13) + "estabelecimento, em operações com mercadorias sujeitas ao regime de substituição tributária.", "E", "Compra para consumo")
	INSERT INTO cfop VALUES (58, "1408", "Transferência para industrialização em operação com mercadoria sujeita ao regime de substituição tributária", "Classificam-se neste código as mercadorias recebidas em transferência de outro estabelecimento da " + CHR(13) + "mesma empresa, para serem industrializadas no estabelecimento, em operações com mercadorias sujeitas" + CHR(13) + " ao regime de substituição tributária.", "E", "Transf. para industrialização")
	INSERT INTO cfop VALUES (59, "1409", "Transferência para comercialização em operação com mercadoria sujeita ao regime de substituição tributária", "Classificam-se neste código as mercadorias recebidas em transferência de outro estabelecimento da " + CHR(13) + "mesma empresa, para serem comercializadas, decorrentes de operações sujeitas ao regime de " + CHR(13) + "substituição tributária.", "E", "Transf. para comercialização")
	INSERT INTO cfop VALUES (60, "1410", "Devolução de venda de produção do estabelecimento em operação com produto sujeito ao regime de substituição tributária", "Classificam-se neste código as devoluções de produtos industrializados e vendidos pelo " + CHR(13) + "estabelecimento, cujas saídas tenham sido classificadas como " + '"' + "Venda de produção do estabelecimento " + CHR(13) + "em operação com produto sujeito ao regime de substituição tributária" + '"' + ".", "E", "Devolução de venda")
	INSERT INTO cfop VALUES (61, "1411", "Devolução de venda de mercadoria adquirida ou recebida de terceiros em operação com mercadoria sujeita ao regime de substituição tributária", "Classificam-se neste código as devoluções de vendas de mercadorias adquiridas ou recebidas de " + CHR(13) + "terceiros, cujas saídas tenham sido classificadas como " + '"' + "Venda de mercadoria adquirida ou recebida de" + CHR(13) + " terceiros em operação com mercadoria sujeita ao regime de substituição tributária" + '"' + ".", "E", "Devolução de venda")
	INSERT INTO cfop VALUES (62, "1414", "Retorno de produção do estabelecimento, remetida para venda fora do estabelecimento em operação com produto sujeito ao regime de substituição tributária", "Classificam-se neste código as entradas, em retorno, de produtos industrializados pelo " + CHR(13) + "estabelecimento, remetidos para vendas fora do estabelecimento, inclusive por meio de veículos, em " + CHR(13) + "operações com produtos sujeitos ao regime de substituição tributária, e não comercializadas.", "E", "Retorno de produção")
	INSERT INTO cfop VALUES (63, "1415", "Retorno de mercadoria adquirida ou recebida de terceiros, remetida para venda fora do estabelecimento em operação com mercadoria sujeita ao regime de substituição tributária", "Classificam-se neste código as entradas, em retorno, de mercadorias adquiridas ou recebidas de " + CHR(13) + "terceiros remetidas para vendas fora do estabelecimento, inclusive por meio de veículos, em " + CHR(13) + "operações com mercadorias sujeitas ao regime de substituição tributária, e não comercializadas.", "E", "Retorno de mercadoria")
	INSERT INTO cfop VALUES (64, "1450", "SISTEMAS DE INTEGRAÇÃO", "", "E", "SISTEMAS DE INTEGRAÇÃO")
	INSERT INTO cfop VALUES (65, "1451", "Retorno de animal do estabelecimento produtor", " Classificam-se neste código as entradas referentes ao retorno de animais criados pelo produtor no " + CHR(13) + "sistema integrado.", "E", "Retorno de animal")
	INSERT INTO cfop VALUES (66, "1452", "Retorno de insumo não utilizado na produção", "Classificam-se neste código o retorno de insumos não utilizados pelo produtor na criação de animais " + CHR(13) + "pelo sistema integrado.", "E", "Retorno de insumo")
	INSERT INTO cfop VALUES (67, "1500", "ENTRADAS DE MERCADORIAS REMETIDAS COM FIM ESPECÍFICO DE EXPORTAÇÃO E EVENTUAIS DEVOLUÇÕES", "", "E", "ENTRADAS DE MERCADORIAS")
	INSERT INTO cfop VALUES (68, "1501", "Entrada de mercadoria recebida com fim específico de exportação", "Classificam-se neste código as entradas de mercadorias em estabelecimento de trading company, " + CHR(13) + "empresa comercial exportadora ou outro estabelecimento do remetente, com fim específico de " + CHR(13) + "exportação.", "E", "Entrada de mercadoria")
	INSERT INTO cfop VALUES (69, "1503", "Entrada decorrente de devolução de produto remetido com fim específico de exportação, de produção do estabelecimento", "Classificam-se neste código as devoluções de produtos industrializados pelo estabelecimento, " + CHR(13) + "remetidos a trading company, a empresa comercial exportadora ou a outro estabelecimento do " + CHR(13) + "remetente, com fim específico de exportação, cujas saídas tenham sido classificadas no código " + '"' + "5.501" + CHR(13) + " – Remessa de produção do estabelecimento, com fim específico de exportação" + '"' + ".", "E", "Entrada decorrente devolução")
	INSERT INTO cfop VALUES (70, "1504", "Entrada decorrente de devolução de mercadoria remetida com fim específico de exportação, adquirida ou recebida de terceiros", "Classificam-se neste código as devoluções de mercadorias adquiridas ou recebidas de terceiros " + CHR(13) + "remetidas a trading company, a empresa comercial exportadora ou a outro estabelecimento do " + CHR(13) + "remetente, com fim específico de exportação, cujas saídas tenham sido classificadas no código " + '"' + "5.502" + CHR(13) + " – Remessa de mercadoria adquirida ou recebida de terceiros, com fim específico de exportação" + '"' + ".", "E", "Entrada decorrente devolução")
	INSERT INTO cfop VALUES (71, "1550", "OPERAÇÕES COM BENS DE ATIVO IMOBILIZADO E MATERIAIS PARA USO OU CONSUMO", "", "E", "OPERAÇÕES COM BENS")
	INSERT INTO cfop VALUES (72, "1551", "Compra de bem para o ativo imobilizado", " Classificam-se neste código as compras de bens destinados ao ativo imobilizado do estabelecimento.", "E", "Compra de bem")
	INSERT INTO cfop VALUES (73, "1552", "Transferência de bem do ativo imobilizado", "Classificam-se neste código as entradas de bens destinados ao ativo imobilizado recebidos em " + CHR(13) + "transferência de outro estabelecimento da mesma empresa.", "E", "Transferência de bem")
	INSERT INTO cfop VALUES (74, "1553", "Devolução de venda de bem do ativo imobilizado", "Classificam-se neste código as devoluções de vendas de bens do ativo imobilizado, cujas saídas " + CHR(13) + "tenham sido classificadas no código " + '"' + "5.551 – Venda de bem do ativo imobilizado" + '"' + ".", "E", "Devolução de venda")
	INSERT INTO cfop VALUES (75, "1554", "Retorno de bem do ativo imobilizado remetido para uso fora do estabelecimento", "Classificam-se neste código as entradas por retorno de bens do ativo imobilizado remetidos para uso " + CHR(13) + "fora do estabelecimento, cujas saídas tenham sido classificadas no código " + '"' + "5.554 – Remessa de bem do" + CHR(13) + " ativo imobilizado para uso fora do estabelecimento" + '"' + ".", "E", "Retorno de bem")
	INSERT INTO cfop VALUES (76, "1555", "Entrada de bem do ativo imobilizado de terceiro, remetido para uso no estabelecimento", "Classificam-se neste código as entradas de bens do ativo imobilizado de terceiros, remetidos para " + CHR(13) + "uso no estabelecimento.", "E", "Entrada de bem")
	INSERT INTO cfop VALUES (77, "1556", "Compra de material para uso ou consumo", " Classificam-se neste código as compras de mercadorias destinadas ao uso ou consumo do " + CHR(13) + "estabelecimento.", "E", "Compra de material")
	INSERT INTO cfop VALUES (78, "1557", "Transferência de material para uso ou consumo", "Classificam-se neste código as entradas de materiais para uso ou consumo recebidos em transferência " + CHR(13) + "de outro estabelecimento da mesma empresa.", "E", "Transferência de material")
	INSERT INTO cfop VALUES (79, "1600", "CRÉDITOS E RESSARCIMENTOS DE ICMS", "", "E", "CRÉDITOS E RESSARCIMENTOS")
	INSERT INTO cfop VALUES (80, "1601", "Recebimento, por transferência, de crédito de ICMS", "Classificam-se neste código os lançamentos destinados ao registro de créditos de ICMS, recebidos por" + CHR(13) + " transferência de outras empresas.", "E", "Recebimento, por transferência")
	INSERT INTO cfop VALUES (81, "1602", "Recebimento, por transferência, de saldo credor de ICMS de outro estabelecimento da mesma empresa, para compensação de saldo devedor de ICMS", "Classificam-se neste código os lançamentos destinados ao registro da transferência de saldos " + CHR(13) + "credores de ICMS recebidos de outros estabelecimentos da mesma empresa, destinados à compensação do " + CHR(13) + "saldo devedor do estabelecimento.", "E", "Recebimento, por transferência")
	INSERT INTO cfop VALUES (82, "1603", "Ressarcimento de ICMS retido por substituição tributária", "Classificam-se neste código os lançamentos destinados ao registro de ressarcimento de ICMS retido " + CHR(13) + "por substituição tributária a contribuinte substituído, efetuado pelo contribuinte substituto, ou, " + CHR(13) + "ainda, quando o ressarcimento for apropriado pelo próprio contribuinte substituído, nas hipóteses " + CHR(13) + "previstas na legislação aplicável.", "E", "Ressarcimento de ICMS")
	INSERT INTO cfop VALUES (83, "1900", "OUTRAS ENTRADAS DE MERCADORIAS OU AQUISIÇÕES DE SERVIÇOS", "", "E", "OUTRAS ENTRADAS DE MERCADORIAS")
	INSERT INTO cfop VALUES (84, "1901", "Entrada para industrialização por encomenda", "Classificam-se neste código as entradas de insumos recebidos para industrialização por encomenda de " + CHR(13) + "outra empresa ou de outro estabelecimento da mesma empresa.", "E", "Entrada para industrialização")
	INSERT INTO cfop VALUES (85, "1902", "Retorno de mercadoria remetida para industrialização por encomenda", "Classificam-se neste código o retorno dos insumos remetidos para industrialização por encomenda, " + CHR(13) + "incorporados ao produto final pelo estabelecimento industrializador.", "E", "Retorno de mercadoria")
	INSERT INTO cfop VALUES (86, "1903", "Entrada de mercadoria remetida para industrialização e não aplicada no referido processo", "Classificam-se neste código as entradas em devolução de insumos remetidos para industrialização e " + CHR(13) + "não aplicados no referido processo.", "E", "Entrada de mercadoria")
	INSERT INTO cfop VALUES (87, "1904", "Retorno de remessa para venda fora do estabelecimento", "Classificam-se neste código as entradas em retorno de mercadorias remetidas para venda fora do " + CHR(13) + "estabelecimento, inclusive por meio de veículos, e não comercializadas.", "E", "Retorno de remessa para venda")
	INSERT INTO cfop VALUES (88, "1905", "Entrada de mercadoria recebida para depósito em depósito fechado ou armazém geral", "Classificam-se neste código as entradas de mercadorias recebidas para depósito em depósito fechado " + CHR(13) + "ou armazém geral.", "E", "Entrada de mercadoria")
	INSERT INTO cfop VALUES (89, "1906", "Retorno de mercadoria remetida para depósito fechado ou armazém geral", "Classificam-se neste código as entradas em retorno de mercadorias remetidas para depósito em " + CHR(13) + "depósito fechado ou armazém geral.", "E", "Retorno de mercadoria")
	INSERT INTO cfop VALUES (90, "1907", "Retorno simbólico de mercadoria remetida para depósito fechado ou armazém geral", "Classificam-se neste código as entradas em retorno simbólico de mercadorias remetidas para depósito " + CHR(13) + "em depósito fechado ou armazém geral, quando as mercadorias depositadas tenham sido objeto de saída " + CHR(13) + "a qualquer título e que não tenham retornado ao estabelecimento depositante.", "E", "Retorno simbólico")
	INSERT INTO cfop VALUES (91, "1908", "Entrada de bem por conta de contrato de comodato", " Classificam-se neste código as entradas de bens recebidos em cumprimento de contrato de comodato.", "E", "Entrada de bem")
	INSERT INTO cfop VALUES (92, "1909", "Retorno de bem remetido por conta de contrato de comodato", " Classificam-se neste código as entradas de bens recebidos em devolução após cumprido o contrato de " + CHR(13) + "comodato.", "E", "Retorno de bem")
	INSERT INTO cfop VALUES (93, "1910", "Entrada de bonificação, doação ou brinde", " Classificam-se neste código as entradas de mercadorias recebidas a título de bonificação, doação ou" + CHR(13) + " brinde.", "E", "Entrada de bonificação")
	INSERT INTO cfop VALUES (94, "1911", "Entrada de amostra grátis", " Classificam-se neste código as entradas de mercadorias recebidas a título de amostra grátis.", "E", "Entrada de amostra grátis")
	INSERT INTO cfop VALUES (95, "1912", "Entrada de mercadoria ou bem recebido para demonstração", " Classificam-se neste código as entradas de mercadorias ou bens recebidos para demonstração.", "E", "Entrada de mercadoria ou bem")
	INSERT INTO cfop VALUES (96, "1913", "Retorno de mercadoria ou bem remetido para demonstração", " Classificam-se neste código as entradas em retorno de mercadorias ou bens remetidos para " + CHR(13) + "demonstração.", "E", "Retorno de mercadoria ou bem")
	INSERT INTO cfop VALUES (97, "1914", "Retorno de mercadoria ou bem remetido para exposição ou feira", " Classificam-se neste código as entradas em retorno de mercadorias ou bens remetidos para exposição " + CHR(13) + "ou feira.", "E", "Retorno de mercadoria ou bem")
	INSERT INTO cfop VALUES (98, "1915", "Entrada de mercadoria ou bem recebido para conserto ou reparo", " Classificam-se neste código as entradas de mercadorias ou bens recebidos para conserto ou reparo.", "E", "Entrada de mercadoria ou bem")
	INSERT INTO cfop VALUES (99, "1916", "Retorno de mercadoria ou bem remetido para conserto ou reparo", " Classificam-se neste código as entradas em retorno de mercadorias ou bens remetidos para conserto " + CHR(13) + "ou reparo.", "E", "Retorno de mercadoria ou bem")
	INSERT INTO cfop VALUES (100, "1917", "Entrada de mercadoria recebida em consignação mercantil ou industrial", " Classificam-se neste código as entradas de mercadorias recebidas a título de consignação mercantil " + CHR(13) + "ou industrial.", "E", "Entrada de mercadoria")
	INSERT INTO cfop VALUES (101, "1918", "Devolução de mercadoria remetida em consignação mercantil ou industrial", "Classificam-se neste código as entradas por devolução de mercadorias remetidas anteriormente a " + CHR(13) + "título de consignação mercantil ou industrial.", "E", "Devolução de mercadoria")
	INSERT INTO cfop VALUES (102, "1919", "Devolução simbólica de mercadoria vendida ou utilizada em processo industrial, remetida anteriormente em consignação mercantil ou industrial", "Classificam-se neste código as entradas por devolução simbólica de mercadorias vendidas ou " + CHR(13) + "utilizadas em processo industrial, remetidas anteriormente a título de consignação mercantil ou " + CHR(13) + "industrial.", "E", "Devolução simbólica")
	INSERT INTO cfop VALUES (103, "1920", "Entrada de vasilhame ou sacaria", " Classificam-se neste código as entradas de vasilhame ou sacaria.", "E", "Entrada vasilhame ou sacaria")
	INSERT INTO cfop VALUES (104, "1921", "Retorno de vasilhame ou sacaria", " Classificam-se neste código as entradas em retorno de vasilhame ou sacaria.", "E", "Retorno vasilhame ou sacaria")
	INSERT INTO cfop VALUES (105, "1922", "Lançamento efetuado a título de simples faturamento decorrente de compra para recebimento futuro", "Classificam-se neste código os registros efetuados a título de simples faturamento decorrente de " + CHR(13) + "compra para recebimento futuro.", "E", "Lançamento efetuado")
	INSERT INTO cfop VALUES (106, "1923", "Entrada de mercadoria recebida do vendedor remetente, em venda à ordem", "Classificam-se neste código as entradas de mercadorias recebidas do vendedor remetente, em vendas à " + CHR(13) + "ordem, cuja compra do adquirente originário, foi classificada nos códigos " + '"' + "1.120 – Compra para " + CHR(13) + "industrialização, em venda à ordem, já recebida do vendedor remetente" + '"' + " ou " + '"' + "1.121 – Compra para " + CHR(13) + "comercialização, em venda à ordem, já recebida do vendedor remetente" + '"' + ".", "E", "Entrada de mercadoria")
	INSERT INTO cfop VALUES (107, "1924", "Entrada para industrialização por conta e ordem do adquirente da mercadoria, quando esta não transitar pelo estabelecimento do adquirente", "Classificam-se neste código as entradas de insumos recebidos para serem industrializados por conta e" + CHR(13) + " ordem do adquirente, nas hipóteses em que os insumos não tenham transitado pelo estabelecimento do " + CHR(13) + "adquirente dos mesmos.", "E", "Entrada para industrialização")
	INSERT INTO cfop VALUES (108, "1925", "Retorno de mercadoria remetida para industrialização por conta e ordem do adquirente da mercadoria, quando esta não transitar pelo estabelecimento do adquirente", "Classificam-se neste código o retorno dos insumos remetidos por conta e ordem do adquirente, para " + CHR(13) + "industrialização e incorporados ao produto final pelo estabelecimento industrializador, nas " + CHR(13) + "hipóteses em que os insumos não tenham transitado pelo estabelecimento do adquirente.", "E", "Retorno de mercadoria")
	INSERT INTO cfop VALUES (109, "1926", "Lançamento efetuado a título de reclassificação de mercadoria decorrente de formação de kit ou de sua desagregação", "Classificam-se neste código os registros efetuados a título de reclassificação decorrente de " + CHR(13) + "formação de kit de mercadorias ou de sua desagregação.", "E", "Lançamento efetuado")
	INSERT INTO cfop VALUES (110, "1949", "Outra entrada de mercadoria ou prestação de serviço não especificada", "Classificam-se neste código as outras entradas de mercadorias ou prestações de serviços que não " + CHR(13) + "tenham sido especificadas nos códigos anteriores.", "E", "Outra entrada de mercadoria")
	INSERT INTO cfop VALUES (111, "2000", "ENTRADAS OU AQUISIÇÕES DE SERVIÇOS DE OUTROS ESTADOS", "Classificam-se, neste grupo, as operações ou prestações em que o estabelecimento remetente esteja " + CHR(13) + "localizado em unidade da Federação diversa daquela do destinatário", "E", "ENTRADAS OU AQUISIÇÕES DE SERV")
	INSERT INTO cfop VALUES (112, "2100", "COMPRAS PARA INDUSTRIALIZAÇÃO, COMERCIALIZAÇÃO OU PRESTAÇÃO DE SERVIÇOS", "", "E", "COMPRAS PARA INDUSTRIALIZAÇÃO")
	INSERT INTO cfop VALUES (113, "2101", "Compra para industrialização", "Classificam-se neste código as compras de mercadorias a serem utilizadas em processo de " + CHR(13) + "industrialização. Também serão classificadas neste código as entradas de mercadorias em " + CHR(13) + "estabelecimento industrial de cooperativa recebidas de seus cooperados ou de estabelecimento de " + CHR(13) + "outra cooperativa.", "E", "Compra para industrialização")
	INSERT INTO cfop VALUES (114, "2102", "Compra para comercialização", "Classificam-se neste código as compras de mercadorias a serem comercializadas. Também serão " + CHR(13) + "classificadas neste código as entradas de mercadorias em estabelecimento comercial de cooperativa " + CHR(13) + "recebidas de seus cooperados ou de estabelecimento de outra cooperativa.", "E", "Compra para comercialização")
	INSERT INTO cfop VALUES (115, "2111", "Compra para industrialização de mercadoria recebida anteriormente em consignação industrial", "Classificam-se neste código as compras efetivas de mercadorias a serem utilizadas em processo de " + CHR(13) + "industrialização, recebidas anteriormente a título de consignação industrial.", "E", "Compra para industrialização")
	INSERT INTO cfop VALUES (116, "2113", "Compra para comercialização, de mercadoria recebida anteriormente em consignação mercantil", "Classificam-se neste código as compras efetivas de mercadorias recebidas anteriormente a título de " + CHR(13) + "consignação mercantil.", "E", "Compra para comercialização")
	INSERT INTO cfop VALUES (117, "2116", "Compra para industrialização originada de encomenda para recebimento futuro", "Classificam-se neste código as compras de mercadorias a serem utilizadas em processo de " + CHR(13) + "industrialização, quando da entrada real da mercadoria, cuja aquisição tenha sido classificada no " + CHR(13) + "código " + '"' + "2.922 – Lançamento efetuado a título de simples faturamento decorrente de compra para " + CHR(13) + "recebimento futuro" + '"' + ".", "E", "Compra para industrialização")
	INSERT INTO cfop VALUES (118, "2117", "Compra para comercialização originada de encomenda para recebimento futuro", "Classificam-se neste código as compras de mercadorias a serem comercializadas, quando da entrada " + CHR(13) + "real da mercadoria, cuja aquisição tenha sido classificada no código " + '"' + "2.922 – Lançamento efetuado a " + CHR(13) + "título de simples faturamento decorrente de compra para recebimento futuro" + '"' + ".", "E", "Compra para comercialização")
	INSERT INTO cfop VALUES (119, "2118", "Compra de mercadoria para comercialização pelo adquirente originário, entregue pelo vendedor remetente ao destinatário, em venda à ordem", "Classificam-se neste código as compras de mercadorias já comercializadas, que, sem transitar pelo " + CHR(13) + "estabelecimento do adquirente originário, sejam entregues pelo vendedor remetente diretamente ao " + CHR(13) + "destinatário, em operação de venda à ordem, cuja venda seja classificada, pelo adquirente " + CHR(13) + "originário, no código " + '"' + "6.120 – Venda de mercadoria adquirida ou recebida de terceiros entregue ao " + CHR(13) + "destinatário pelo vendedor remetente, em venda à ordem" + '"' + ".", "E", "Compra de mercadoria")
	INSERT INTO cfop VALUES (120, "2120", "Compra para industrialização, em venda à ordem, já recebida do vendedor remetente", "Classificam-se neste código as compras de mercadorias a serem utilizadas em processo de " + CHR(13) + "industrialização, em vendas à ordem, já recebidas do vendedor remetente, por ordem do adquirente " + CHR(13) + "originário.", "E", "Compra para industrialização")
	INSERT INTO cfop VALUES (121, "2121", "Compra para comercialização, em venda à ordem, já recebida do vendedor remetente", "Classificam-se neste código as compras de mercadorias a serem comercializadas, em vendas à ordem, já" + CHR(13) + " recebidas do vendedor remetente por ordem do adquirente originário.", "E", "Compra para comercialização")
	INSERT INTO cfop VALUES (122, "2122", "Compra para industrialização em que a mercadoria foi remetida pelo fornecedor ao industrializador sem transitar pelo estabelecimento adquirente", "Classificam-se neste código as compras de mercadorias a serem utilizadas em processo de " + CHR(13) + "industrialização, remetidas pelo fornecedor para o industrializador sem que a mercadoria tenha " + CHR(13) + "transitado pelo estabelecimento do adquirente.", "E", "Compra para industrialização")
	INSERT INTO cfop VALUES (123, "2124", "Industrialização efetuada por outra empresa", "Classificam-se neste código as entradas de mercadorias industrializadas por terceiros, compreendendo" + CHR(13) + " os valores referentes aos serviços prestados e os das mercadorias de propriedade do " + CHR(13) + "industrializador empregadas no processo industrial. Quando a industrialização efetuada se referir a " + CHR(13) + "bens do ativo imobilizado ou de mercadorias para uso ou consumo do estabelecimento encomendante, a " + CHR(13) + "entrada deverá ser classificada nos códigos " + '"' + "2.551 – Compra de bem para o ativo imobilizado" + '"' + " ou " + CHR(13) + "" + '"' + "2.556 – Compra de material para uso ou consumo" + '"' + ".", "E", "Industrialização")
	INSERT INTO cfop VALUES (124, "2125", "Industrialização efetuada por outra empresa quando a mercadoria remetida para utilização no processo de industrialização não transitou pelo estabelecimento adquirente da mercadoria", "Classificam-se neste código as entradas de mercadorias industrializadas por outras empresas, em que " + CHR(13) + "as mercadorias remetidas para utilização no processo de industrialização não transitaram pelo " + CHR(13) + "estabelecimento do adquirente das mercadorias, compreendendo os valores referentes aos serviços " + CHR(13) + "prestados e os das mercadorias de propriedade do industrializador empregadas no processo industrial." + CHR(13) + " Quando a industrialização efetuada se referir a bens do ativo imobilizado ou de mercadorias para " + CHR(13) + "uso ou consumo do estabelecimento encomendante, a entrada deverá ser classificada nos códigos " + '"' + "2.551" + CHR(13) + " – Compra de bem para o ativo imobilizado" + '"' + " ou " + '"' + "2.556 – Compra de material para uso ou consumo" + '"' + ".", "E", "Industrialização")
	INSERT INTO cfop VALUES (125, "2126", "Compra para utilização na prestação de serviço", " Classificam-se neste código as entradas de mercadorias a serem utilizadas nas prestações de " + CHR(13) + "serviços.", "E", "Compra para utilização")
	INSERT INTO cfop VALUES (126, "2150", "TRANSFERÊNCIAS PARA INDUSTRIALIZAÇÃO, COMERCIALIZAÇÃO OU PRESTAÇÃO DE SERVIÇOS", "", "E", "TRANSF. PARA INDUSTRIALIZAÇÃO")
	INSERT INTO cfop VALUES (127, "2151", "Transferência para industrialização", "Classificam-se neste código as entradas de mercadorias recebidas em transferência de outro " + CHR(13) + "estabelecimento da mesma empresa, para serem utilizadas em processo de industrialização.", "E", "Transf. para industrialização")
	INSERT INTO cfop VALUES (128, "2152", "Transferência para comercialização", "Classificam-se neste código as entradas de mercadorias recebidas em transferência de outro " + CHR(13) + "estabelecimento da mesma empresa, para serem comercializadas.", "E", "Transf. para comercialização")
	INSERT INTO cfop VALUES (129, "2153", "Transferência de energia elétrica para distribuição", "Classificam-se neste código as entradas de energia elétrica recebida em transferência de outro " + CHR(13) + "estabelecimento da mesma empresa, para distribuição.", "E", "Transferência energia elétrica")
	INSERT INTO cfop VALUES (130, "2154", "Transferência para utilização na prestação de serviço", "Classificam-se neste código as entradas de mercadorias recebidas em transferência de outro " + CHR(13) + "estabelecimento da mesma empresa, para serem utilizadas nas prestações de serviços.", "E", "Transferência para utilização")
	INSERT INTO cfop VALUES (131, "2200", "DEVOLUÇÕES DE VENDAS DE PRODUÇÃO PRÓPRIA, DE TERCEIROS OU ANULAÇÕES DE VALORES", "", "E", "DEVOLUÇÕES DE VENDAS")
	INSERT INTO cfop VALUES (132, "2201", "Devolução de venda de produção do estabelecimento", "Classificam-se neste código as devoluções de vendas de produtos industrializados pelo " + CHR(13) + "estabelecimento, cujas saídas tenham sido classificadas como " + '"' + "Venda de produção do estabelecimento" + '"' + ".", "E", "Devolução de venda")
	INSERT INTO cfop VALUES (133, "2202", "Devolução de venda de mercadoria adquirida ou recebida de terceiros", "Classificam-se neste código as devoluções de vendas de mercadorias adquiridas ou recebidas de " + CHR(13) + "terceiros, que não tenham sido objeto de industrialização no estabelecimento, cujas saídas tenham " + CHR(13) + "sido classificadas como " + '"' + "Venda de mercadoria adquirida ou recebida de terceiros" + '"' + ".", "E", "Devolução de venda")
	INSERT INTO cfop VALUES (134, "2203", "Devolução de venda de produção do estabelecimento, destinada à Zona Franca de Manaus ou Áreas de Livre Comércio", "Classificam-se neste código as devoluções de vendas de produtos industrializados pelo " + CHR(13) + "estabelecimento, cujas saídas foram classificadas no código " + '"' + "6.109 – Venda de produção do " + CHR(13) + "estabelecimento, destinada à Zona Franca de Manaus ou Áreas de Livre Comércio" + '"' + ".", "E", "Devolução de venda")
	INSERT INTO cfop VALUES (135, "2204", "Devolução de venda de mercadoria adquirida ou recebida de terceiros, destinada à Zona Franca de Manaus ou Áreas de Livre Comércio", "Classificam-se neste código as devoluções de vendas de mercadorias adquiridas ou recebidas de " + CHR(13) + "terceiros, cujas saídas foram classificadas no código " + '"' + "6.110 - Venda de mercadoria adquirida ou " + CHR(13) + "recebida de terceiros, destinada à Zona Franca de Manaus ou Áreas de Livre Comércio" + '"' + ".", "E", "Devolução de venda")
	INSERT INTO cfop VALUES (136, "2205", "Anulação de valor relativo à prestação de serviço de comunicação", "Classificam-se neste código as anulações correspondentes a valores faturados indevidamente, " + CHR(13) + "decorrentes de prestações de serviços de comunicação.", "E", "Anulação de valor")
	INSERT INTO cfop VALUES (137, "2206", "Anulação de valor relativo à prestação de serviço de transporte", "Classificam-se neste código as anulações correspondentes a valores faturados indevidamente, " + CHR(13) + "decorrentes de prestações de serviços de transporte.", "E", "Anulação de valor")
	INSERT INTO cfop VALUES (138, "2207", "Anulação de valor relativo à venda de energia elétrica", "Classificam-se neste código as anulações correspondentes a valores faturados indevidamente, " + CHR(13) + "decorrentes de venda de energia elétrica.", "E", "Anulação de valor")
	INSERT INTO cfop VALUES (139, "2208", "Devolução de produção do estabelecimento, remetida em transferência", "Classificam-se neste código as devoluções de produtos industrializados pelo estabelecimento, " + CHR(13) + "transferidos para outros estabelecimentos da mesma empresa.", "E", "Devolução de produção")
	INSERT INTO cfop VALUES (140, "2209", "Devolução de mercadoria adquirida ou recebida de terceiros, remetida em transferência", "Classificam-se neste código as devoluções de mercadorias adquiridas ou recebidas de terceiros, " + CHR(13) + "transferidas para outros estabelecimentos da mesma empresa.", "E", "Devolução de mercadoria")
	INSERT INTO cfop VALUES (141, "2250", "COMPRAS DE ENERGIA ELÉTRICA", "", "E", "COMPRAS DE ENERGIA ELÉTRICA")
	INSERT INTO cfop VALUES (142, "2251", "Compra de energia elétrica para distribuição ou comercialização", "Classificam-se neste código as compras de energia elétrica utilizada em sistema de distribuição ou " + CHR(13) + "comercialização. Também serão classificadas neste código as compras de energia elétrica por " + CHR(13) + "cooperativas para distribuição aos seus cooperados.", "E", "Compra de energia elétrica")
	INSERT INTO cfop VALUES (143, "2252", "Compra de energia elétrica por estabelecimento industrial", "Classificam-se neste código as compras de energia elétrica utilizada no processo de " + CHR(13) + "industrialização. Também serão classificadas neste código as compras de energia elétrica utilizada " + CHR(13) + "por estabelecimento industrial de cooperativa.", "E", "Compra de energia elétrica")
	INSERT INTO cfop VALUES (144, "2253", "Compra de energia elétrica por estabelecimento comercial", "Classificam-se neste código as compras de energia elétrica utilizada por estabelecimento comercial. " + CHR(13) + "Também serão classificadas neste código as compras de energia elétrica utilizada por estabelecimento" + CHR(13) + " comercial de cooperativa.", "E", "Compra de energia elétrica")
	INSERT INTO cfop VALUES (145, "2254", "Compra de energia elétrica por estabelecimento prestador de serviço de transporte", "Classificam-se neste código as compras de energia elétrica utilizada por estabelecimento prestador " + CHR(13) + "de serviços de transporte.", "E", "Compra de energia elétrica")
	INSERT INTO cfop VALUES (146, "2255", "Compra de energia elétrica por estabelecimento prestador de serviço de comunicação", "Classificam-se neste código as compras de energia elétrica utilizada por estabelecimento prestador " + CHR(13) + "de serviços de comunicação.", "E", "Compra de energia elétrica")
	INSERT INTO cfop VALUES (147, "2256", "Compra de energia elétrica por estabelecimento de produtor rural", " Classificam-se neste código as compras de energia elétrica utilizada por estabelecimento de " + CHR(13) + "produtor rural.", "E", "Compra de energia elétrica")
	INSERT INTO cfop VALUES (148, "2257", "Compra de energia elétrica para consumo por demanda contratada", "Classificam-se neste código as compras de energia elétrica para consumo por demanda contratada, que " + CHR(13) + "prevalecerá sobre os demais códigos deste subgrupo.", "E", "Compra de energia elétrica")
	INSERT INTO cfop VALUES (149, "2300", "AQUISIÇÕES DE SERVIÇOS DE COMUNICAÇÃO", "", "E", "AQUISIÇÕES DE SERVIÇOS")
	INSERT INTO cfop VALUES (150, "2301", "Aquisição de serviço de comunicação para execução de serviço da mesma natureza", "Classificam-se neste código as aquisições de serviços de comunicação utilizados nas prestações de " + CHR(13) + "serviços da mesma natureza.", "E", "Aquisição de serviço")
	INSERT INTO cfop VALUES (151, "2302", "Aquisição de serviço de comunicação por estabelecimento industrial", "Classificam-se neste código as aquisições de serviços de comunicação utilizados por estabelecimento " + CHR(13) + "industrial. Também serão classificadas neste código as aquisições de serviços de comunicação " + CHR(13) + "utilizados por estabelecimento industrial de cooperativa.", "E", "Aquisição de serviço")
	INSERT INTO cfop VALUES (152, "2303", "Aquisição de serviço de comunicação por estabelecimento comercial", "Classificam-se neste código as aquisições de serviços de comunicação utilizados por estabelecimento " + CHR(13) + "comercial. Também serão classificadas neste código as aquisições de serviços de comunicação " + CHR(13) + "utilizados por estabelecimento comercial de cooperativa.", "E", "Aquisição de serviço")
	INSERT INTO cfop VALUES (153, "2304", "Aquisição de serviço de comunicação por estabelecimento de prestador de serviço de transporte", "Classificam-se neste código as aquisições de serviços de comunicação utilizado por estabelecimento " + CHR(13) + "prestador de serviço de transporte.", "E", "Aquisição de serviço")
	INSERT INTO cfop VALUES (154, "2305", "Aquisição de serviço de comunicação por estabelecimento de geradora ou de distribuidora de energia elétrica", "Classificam-se neste código as aquisições de serviços de comunicação utilizados por estabelecimento " + CHR(13) + "de geradora ou de distribuidora de energia elétrica.", "E", "Aquisição de serviço")
	INSERT INTO cfop VALUES (155, "2306", "Aquisição de serviço de comunicação por estabelecimento de produtor rural", "Classificam-se neste código as aquisições de serviços de comunicação utilizados por estabelecimento " + CHR(13) + "de produtor rural.", "E", "Aquisição de serviço")
	INSERT INTO cfop VALUES (156, "2350", "AQUISIÇÕES DE SERVIÇOS DE TRANSPORTE", "", "E", "AQUISIÇÕES DE SERVIÇOS")
	INSERT INTO cfop VALUES (157, "2351", "Aquisição de serviço de transporte para execução de serviço da mesma natureza", "Classificam-se neste código as aquisições de serviços de transporte utilizados nas prestações de " + CHR(13) + "serviços da mesma natureza.", "E", "Aquisição de serviço")
	INSERT INTO cfop VALUES (158, "2352", "Aquisição de serviço de transporte por estabelecimento industrial", "Classificam-se neste código as aquisições de serviços de transporte utilizados por estabelecimento " + CHR(13) + "industrial. Também serão classificadas neste código as aquisições de serviços de transporte " + CHR(13) + "utilizados por estabelecimento industrial de cooperativa.", "E", "Aquisição de serviço")
	INSERT INTO cfop VALUES (159, "2353", "Aquisição de serviço de transporte por estabelecimento comercial", "Classificam-se neste código as aquisições de serviços de transporte utilizados por estabelecimento " + CHR(13) + "comercial. Também serão classificadas neste código as aquisições de serviços de transporte " + CHR(13) + "utilizados por estabelecimento comercial de cooperativa.", "E", "Aquisição de serviço")
	INSERT INTO cfop VALUES (160, "2354", "Aquisição de serviço de transporte por estabelecimento de prestador de serviço de comunicação", "Classificam-se neste código as aquisições de serviços de transporte utilizados por estabelecimento " + CHR(13) + "prestador de serviços de comunicação.", "E", "Aquisição de serviço")
	INSERT INTO cfop VALUES (161, "2355", "Aquisição de serviço de transporte por estabelecimento de geradora ou de distribuidora de energia elétrica", "Classificam-se neste código as aquisições de serviços de transporte utilizados por estabelecimento " + CHR(13) + "de geradora ou de distribuidora de energia elétrica.", "E", "Aquisição de serviço")
	INSERT INTO cfop VALUES (162, "2356", "Aquisição de serviço de transporte por estabelecimento de produtor rural", " Classificam-se neste código as aquisições de serviços de transporte utilizados por estabelecimento " + CHR(13) + "de produtor rural.", "E", "Aquisição de serviço")
	INSERT INTO cfop VALUES (163, "2400", "ENTRADAS DE MERCADORIAS SUJEITAS AO REGIME DE SUBSTITUIÇÃO TRIBUTÁRIA", "", "E", "ENTRADAS DE MERCADORIAS")
	INSERT INTO cfop VALUES (164, "2401", "Compra para industrialização em operação com mercadoria sujeita ao regime de substituição tributária", "Classificam-se neste código as compras de mercadorias a serem utilizadas em processo de " + CHR(13) + "industrialização, decorrentes de operações com mercadorias sujeitas ao regime de substituição " + CHR(13) + "tributária. Também serão classificadas neste código as compras por estabelecimento industrial de " + CHR(13) + "cooperativa de mercadorias sujeitas ao regime de substituição tributária.", "E", "Compra para industrialização")
	INSERT INTO cfop VALUES (165, "2403", "Compra para comercialização em operação com mercadoria sujeita ao regime de substituição tributária", "Classificam-se neste código as compras de mercadorias a serem comercializadas, decorrentes de " + CHR(13) + "operações com mercadorias sujeitas ao regime de substituição tributária. Também serão classificadas " + CHR(13) + "neste código as compras de mercadorias sujeitas ao regime de substituição tributária em " + CHR(13) + "estabelecimento comercial de cooperativa.", "E", "Compra para comercialização")
	INSERT INTO cfop VALUES (166, "2406", "Compra de bem para o ativo imobilizado cuja mercadoria está sujeita ao regime de substituição tributária", "Classificam-se neste código as compras de bens destinados ao ativo imobilizado do estabelecimento, " + CHR(13) + "em operações com mercadorias sujeitas ao regime de substituição tributária.", "E", "Compra de bem")
	INSERT INTO cfop VALUES (167, "2407", "Compra de mercadoria para uso ou consumo cuja mercadoria está sujeita ao regime de substituição tributária", "Classificam-se neste código as compras de mercadorias destinadas ao uso ou consumo do " + CHR(13) + "estabelecimento, em operações com mercadorias sujeitas ao regime de substituição tributária.", "E", "Compra de mercadoria")
	INSERT INTO cfop VALUES (168, "2408", "Transferência para industrialização em operação com mercadoria sujeita ao regime de substituição tributária", "Classificam-se neste código as mercadorias recebidas em transferência de outro estabelecimento da " + CHR(13) + "mesma empresa, para serem industrializadas no estabelecimento, em operações com mercadorias sujeitas" + CHR(13) + " ao regime de substituição tributária.", "E", "Transf.para industrialização")
	INSERT INTO cfop VALUES (169, "2409", "Transferência para comercialização em operação com mercadoria sujeita ao regime de substituição tributária", "Classificam-se neste código as mercadorias recebidas em transferência de outro estabelecimento da " + CHR(13) + "mesma empresa, para serem comercializadas, decorrentes de operações sujeitas ao regime de " + CHR(13) + "substituição tributária.", "E", "Transf.para comercialização")
	INSERT INTO cfop VALUES (170, "2410", "Devolução de venda de produção do estabelecimento em operação com produto sujeito ao regime de substituição tributária", "Classificam-se neste código as devoluções de produtos industrializados e vendidos pelo " + CHR(13) + "estabelecimento, cujas saídas tenham sido classificadas como " + '"' + "Venda de produção do estabelecimento " + CHR(13) + "em operação com produto sujeito ao regime de substituição tributária" + '"' + ".", "E", "Devolução de venda")
	INSERT INTO cfop VALUES (171, "2411", "Devolução de venda de mercadoria adquirida ou recebida de terceiros em operação com mercadoria sujeita ao regime de substituição tributária", "Classificam-se neste código as devoluções de vendas de mercadorias adquiridas ou recebidas de " + CHR(13) + "terceiros, cujas saídas tenham sido classificadas como " + '"' + "Venda de mercadoria adquirida ou recebida de" + CHR(13) + " terceiros em operação com mercadoria sujeita ao regime de substituição tributária" + '"' + ".", "E", "Devolução de venda")
	INSERT INTO cfop VALUES (172, "2414", "Retorno de produção do estabelecimento, remetida para venda fora do estabelecimento em operação com produto sujeito ao regime de substituição tributária", "Classificam-se neste código as entradas, em retorno, de produtos industrializados pelo " + CHR(13) + "estabelecimento, remetidos para vendas fora do estabelecimento, inclusive por meio de veículos, em " + CHR(13) + "operações com produtos sujeitos ao regime de substituição tributária, e não comercializadas.", "E", "Retorno de produção")
	INSERT INTO cfop VALUES (173, "2415", "Retorno de mercadoria adquirida ou recebida de terceiros, remetida para venda fora do estabelecimento em operação com mercadoria sujeita ao regime de substituição tributária", "Classificam-se neste código as entradas, em retorno, de mercadorias adquiridas ou recebidas de " + CHR(13) + "terceiros remetidas para vendas fora do estabelecimento, inclusive por meio de veículos, em " + CHR(13) + "operações com mercadorias sujeitas ao regime de substituição tributária, e não comercializadas.", "E", "Retorno de mercadoria")
	INSERT INTO cfop VALUES (174, "2500", "ENTRADAS DE MERCADORIAS REMETIDAS COM FIM ESPECÍFICO DE EXPORTAÇÃO E EVENTUAIS DEVOLUÇÕES", "", "E", "ENTRADAS DE MERCADORIAS")
	INSERT INTO cfop VALUES (175, "2501", "Entrada de mercadoria recebida com fim específico de exportação", "Classificam-se neste código as entradas de mercadorias em estabelecimento de trading company, " + CHR(13) + "empresa comercial exportadora ou outro estabelecimento do remetente, com fim específico de " + CHR(13) + "exportação.", "E", "Entrada de mercadoria")
	INSERT INTO cfop VALUES (176, "2503", "Entrada decorrente de devolução de produto remetido com fim específico de exportação, de produção do estabelecimento", "Classificam-se neste código as devoluções de produtos industrializados pelo estabelecimento, " + CHR(13) + "remetidos a trading company, a empresa comercial exportadora ou a outro estabelecimento do " + CHR(13) + "remetente, com fim específico de exportação, cujas saídas tenham sido classificadas no código " + '"' + "6.501" + CHR(13) + " – Remessa de produção do estabelecimento, com fim específico de exportação" + '"' + ".", "E", "Entrada decorrente devolução")
	INSERT INTO cfop VALUES (177, "2504", "Entrada decorrente de devolução de mercadoria remetida com fim específico de exportação, adquirida ou recebida de terceiros", "Classificam-se neste código as devoluções de mercadorias adquiridas ou recebidas de terceiros " + CHR(13) + "remetidas a trading company, a empresa comercial exportadora ou a outro estabelecimento do " + CHR(13) + "remetente, com fim específico de exportação, cujas saídas tenham sido classificadas no código " + '"' + "6.502" + CHR(13) + " – Remessa de mercadoria adquirida ou recebida de terceiros, com fim específico de exportação" + '"' + ".", "E", "Entrada decorrente devolução")
	INSERT INTO cfop VALUES (178, "2550", "OPERAÇÕES COM BENS DE ATIVO IMOBILIZADO E MATERIAIS PARA USO OU CONSUMO", "", "E", "OPERAÇÕES COM BENS")
	INSERT INTO cfop VALUES (179, "2551", "Compra de bem para o ativo imobilizado", " Classificam-se neste código as compras de bens destinados ao ativo imobilizado do estabelecimento.", "E", "Compra de bem")
	INSERT INTO cfop VALUES (180, "2552", "Transferência de bem do ativo imobilizado", "Classificam-se neste código as entradas de bens destinados ao ativo imobilizado recebidos em " + CHR(13) + "transferência de outro estabelecimento da mesma empresa.", "E", "Transferência de bem")
	INSERT INTO cfop VALUES (181, "2553", "Devolução de venda de bem do ativo imobilizado", "Classificam-se neste código as devoluções de vendas de bens do ativo imobilizado, cujas saídas " + CHR(13) + "tenham sido classificadas no código " + '"' + "6.551 - Venda de bem do ativo imobilizado" + '"' + ".", "E", "Devolução de venda")
	INSERT INTO cfop VALUES (182, "2554", "Retorno de bem do ativo imobilizado remetido para uso fora do estabelecimento", "Classificam-se neste código as entradas por retorno de bens do ativo imobilizado remetidos para uso " + CHR(13) + "fora do estabelecimento, cujas saídas tenham sido classificadas no código " + '"' + "6.554 - Remessa de bem do" + CHR(13) + " ativo imobilizado para uso fora do estabelecimento" + '"' + ".", "E", "Retorno de bem")
	INSERT INTO cfop VALUES (183, "2555", "Entrada de bem do ativo imobilizado de terceiro, remetido para uso no estabelecimento", "Classificam-se neste código as entradas de bens do ativo imobilizado de terceiros, remetidos para " + CHR(13) + "uso no estabelecimento.", "E", "Entrada de bem")
	INSERT INTO cfop VALUES (184, "2556", "Compra de material para uso ou consumo", " Classificam-se neste código as compras de mercadorias destinadas ao uso ou consumo do " + CHR(13) + "estabelecimento.", "E", "Compra de material")
	INSERT INTO cfop VALUES (185, "2557", "Transferência de material para uso ou consumo", "Classificam-se neste código as entradas de materiais para uso ou consumo recebidos em transferência " + CHR(13) + "de outro estabelecimento da mesma empresa.", "E", "Transferência de material")
	INSERT INTO cfop VALUES (186, "2600", "CRÉDITOS E RESSARCIMENTOS DE ICMS", "", "E", "CRÉDITOS E RESSARCIMENTOS")
	INSERT INTO cfop VALUES (187, "2603", "Ressarcimento de ICMS retido por substituição tributária", "Classificam-se neste código os lançamentos destinados ao registro de ressarcimento de ICMS retido " + CHR(13) + "por substituição tributária a contribuinte substituído, efetuado pelo contribuinte substituto, nas " + CHR(13) + "hipóteses previstas na legislação aplicável.", "E", "Ressarcimento de ICMS")
	INSERT INTO cfop VALUES (188, "2900", "OUTRAS ENTRADAS DE MERCADORIAS OU AQUISIÇÕES DE SERVIÇOS", "", "E", "OUTRAS ENTRADAS DE MERCADORIAS")
	INSERT INTO cfop VALUES (189, "2901", "Entrada para industrialização por encomenda", "Classificam-se neste código as entradas de insumos recebidos para industrialização por encomenda de " + CHR(13) + "outra empresa ou de outro estabelecimento da mesma empresa.", "E", "Entrada para industrialização")
	INSERT INTO cfop VALUES (190, "2902", "Retorno de mercadoria remetida para industrialização por encomenda", "Classificam-se neste código o retorno dos insumos remetidos para industrialização por encomenda, " + CHR(13) + "incorporados ao produto final pelo estabelecimento industrializador.", "E", "Retorno de mercadoria")
	INSERT INTO cfop VALUES (191, "2903", "Entrada de mercadoria remetida para industrialização e não aplicada no referido processo", "Classificam-se neste código as entradas em devolução de insumos remetidos para industrialização e " + CHR(13) + "não aplicados no referido processo.", "E", "Entrada de mercadoria")
	INSERT INTO cfop VALUES (192, "2904", "Retorno de remessa para venda fora do estabelecimento", "Classificam-se neste código as entradas em retorno de mercadorias remetidas para venda fora do " + CHR(13) + "estabelecimento, inclusive por meio de veículos, e não comercializadas.", "E", "Retorno remessa venda")
	INSERT INTO cfop VALUES (193, "2905", "Entrada de mercadoria recebida para depósito em depósito fechado ou armazém geral", "Classificam-se neste código as entradas de mercadorias recebidas para depósito em depósito fechado " + CHR(13) + "ou armazém geral.", "E", "Entrada de mercadoria")
	INSERT INTO cfop VALUES (194, "2906", "Retorno de mercadoria remetida para depósito fechado ou armazém geral", "Classificam-se neste código as entradas em retorno de mercadorias remetidas para depósito em " + CHR(13) + "depósito fechado ou armazém geral.", "E", "Retorno de mercadoria")
	INSERT INTO cfop VALUES (195, "2907", "Retorno simbólico de mercadoria remetida para depósito fechado ou armazém geral", "Classificam-se neste código as entradas em retorno simbólico de mercadorias remetidas para depósito " + CHR(13) + "em depósito fechado ou armazém geral, quando as mercadorias depositadas tenham sido objeto de saída " + CHR(13) + "a qualquer título e que não tenham retornado ao estabelecimento depositante.", "E", "Retorno simbólico")
	INSERT INTO cfop VALUES (196, "2908", "Entrada de bem por conta de contrato de comodato", " Classificam-se neste código as entradas de bens recebidos em cumprimento de contrato de comodato.", "E", "Entrada de bem")
	INSERT INTO cfop VALUES (197, "2909", "Retorno de bem remetido por conta de contrato de comodato", " Classificam-se neste código as entradas de bens recebidos em devolução após cumprido o contrato de " + CHR(13) + "comodato.", "E", "Retorno de bem")
	INSERT INTO cfop VALUES (198, "2910", "Entrada de bonificação, doação ou brinde", " Classificam-se neste código as entradas de mercadorias recebidas a título de bonificação, doação ou" + CHR(13) + " brinde.", "E", "Entrada de bonificação")
	INSERT INTO cfop VALUES (199, "2911", "Entrada de amostra grátis", " Classificam-se neste código as entradas de mercadorias recebidas a título de amostra grátis.", "E", "Entrada de amostra grátis")
	INSERT INTO cfop VALUES (200, "2912", "Entrada de mercadoria ou bem recebido para demonstração", " Classificam-se neste código as entradas de mercadorias ou bens recebidos para demonstração.", "E", "Entrada de mercadoria ou bem")
	INSERT INTO cfop VALUES (201, "2913", "Retorno de mercadoria ou bem remetido para demonstração", " Classificam-se neste código as entradas em retorno de mercadorias ou bens remetidos para " + CHR(13) + "demonstração.", "E", "Retorno de mercadoria ou bem")
	INSERT INTO cfop VALUES (202, "2914", "Retorno de mercadoria ou bem remetido para exposição ou feira", " Classificam-se neste código as entradas em retorno de mercadorias ou bens remetidos para exposição " + CHR(13) + "ou feira.", "E", "Retorno de mercadoria ou bem")
	INSERT INTO cfop VALUES (203, "2915", "Entrada de mercadoria ou bem recebido para conserto ou reparo", " Classificam-se neste código as entradas de mercadorias ou bens recebidos para conserto ou reparo.", "E", "Entrada de mercadoria ou bem")
	INSERT INTO cfop VALUES (204, "2916", "Retorno de mercadoria ou bem remetido para conserto ou reparo", " Classificam-se neste código as entradas em retorno de mercadorias ou bens remetidos para conserto " + CHR(13) + "ou reparo.", "E", "Retorno de mercadoria ou bem")
	INSERT INTO cfop VALUES (205, "2917", "Entrada de mercadoria recebida em consignação mercantil ou industrial", " Classificam-se neste código as entradas de mercadorias recebidas a título de consignação mercantil " + CHR(13) + "ou industrial.", "E", "Entrada de mercadoria")
	INSERT INTO cfop VALUES (206, "2918", "Devolução de mercadoria remetida em consignação mercantil ou industrial", "Classificam-se neste código as entradas por devolução de mercadorias remetidas anteriormente a " + CHR(13) + "título de consignação mercantil ou industrial.", "E", "Devolução de mercadoria")
	INSERT INTO cfop VALUES (207, "2919", "Devolução simbólica de mercadoria vendida ou utilizada em processo industrial, remetida anteriormente em consignação mercantil ou industrial", "Classificam-se neste código as entradas por devolução simbólica de mercadorias vendidas ou " + CHR(13) + "utilizadas em processo industrial, remetidas anteriormente a título de consignação mercantil ou " + CHR(13) + "industrial.", "E", "Devolução simbólica")
	INSERT INTO cfop VALUES (208, "2920", "Entrada de vasilhame ou sacaria", " Classificam-se neste código as entradas de vasilhame ou sacaria.", "E", "Entrada vasilhame ou sacaria")
	INSERT INTO cfop VALUES (209, "2921", "Retorno de vasilhame ou sacaria", " Classificam-se neste código as entradas em retorno de vasilhame ou sacaria.", "E", "Retorno vasilhame ou sacaria")
	INSERT INTO cfop VALUES (210, "2922", "Lançamento efetuado a título de simples faturamento decorrente de compra para recebimento futuro", "Classificam-se neste código os registros efetuados a título de simples faturamento decorrente de " + CHR(13) + "compra para recebimento futuro.", "E", "Lançamento efetuado")
	INSERT INTO cfop VALUES (211, "2923", "Entrada de mercadoria recebida do vendedor remetente, em venda à ordem", "Classificam-se neste código as entradas de mercadorias recebidas do vendedor remetente, em vendas à " + CHR(13) + "ordem, cuja compra do adquirente originário, foi classificada nos códigos " + '"' + "2.120 – Compra para " + CHR(13) + "industrialização, em venda à ordem, já recebida do vendedor remetente" + '"' + " ou " + '"' + "2.121 – Compra para " + CHR(13) + "comercialização, em venda à ordem, já recebida do vendedor remetente" + '"' + ".", "E", "Entrada de mercadoria")
	INSERT INTO cfop VALUES (212, "2924", "Entrada para industrialização por conta e ordem do adquirente da mercadoria, quando esta não transitar pelo estabelecimento do adquirente", "Classificam-se neste código as entradas de insumos recebidos para serem industrializados por conta e" + CHR(13) + " ordem do adquirente, nas hipóteses em que os insumos não tenham transitado pelo estabelecimento do " + CHR(13) + "adquirente dos mesmos.", "E", "Entrada para industrialização")
	INSERT INTO cfop VALUES (213, "2925", "Retorno de mercadoria remetida para industrialização por conta e ordem do adquirente da mercadoria, quando esta não transitar pelo estabelecimento do adquirente", "Classificam-se neste código o retorno dos insumos remetidos por conta e ordem do adquirente, para " + CHR(13) + "industrialização e incorporados ao produto final pelo estabelecimento industrializador, nas " + CHR(13) + "hipóteses em que os insumos não tenham transitado pelo estabelecimento do adquirente.", "E", "Retorno de mercadoria")
	INSERT INTO cfop VALUES (214, "2949", "Outra entrada de mercadoria ou prestação de serviço não especificado", "Classificam-se neste código as outras entradas de mercadorias ou prestações de serviços que não " + CHR(13) + "tenham sido especificados nos códigos anteriores.", "E", "Outra entrada de mercadoria")
	INSERT INTO cfop VALUES (215, "3000", "ENTRADAS OU AQUISIÇÕES DE SERVIÇOS DO EXTERIOR", "Classificam-se, neste grupo, as entradas de mercadorias oriundas de outro país, inclusive as " + CHR(13) + "decorrentes de aquisição por arrematação, concorrência ou qualquer outra forma de alienação " + CHR(13) + "promovida pelo poder público, e os serviços iniciados no exterior", "E", "ENTRADAS OU AQUISIÇÕES DE SERV")
	INSERT INTO cfop VALUES (216, "3100", "COMPRAS PARA INDUSTRIALIZAÇÃO, COMERCIALIZAÇÃO OU PRESTAÇÃO DE SERVIÇOS", "", "E", "COMPRAS PARA INDUSTRIALIZAÇÃO")
	INSERT INTO cfop VALUES (217, "3101", "Compra para industrialização", "Classificam-se neste código as compras de mercadorias a serem utilizadas em processo de " + CHR(13) + "industrialização. Também serão classificadas neste código as entradas de mercadorias em " + CHR(13) + "estabelecimento industrial de cooperativa .", "E", "Compra para industrialização")
	INSERT INTO cfop VALUES (218, "3102", "Compra para comercialização", "Classificam-se neste código as compras de mercadorias a serem comercializadas. Também serão " + CHR(13) + "classificadas neste código as entradas de mercadorias em estabelecimento comercial de cooperativa.", "E", "Compra para comercialização")
	INSERT INTO cfop VALUES (219, "3126", "Compra para utilização na prestação de serviço", " Classificam-se neste código as entradas de mercadorias a serem utilizadas nas prestações de " + CHR(13) + "serviços.", "E", "Compra para utilização")
	INSERT INTO cfop VALUES (220, "3127", "Compra para industrialização sob o regime de " + '"' + "drawback" + '"' + "", "Classificam-se neste código as compras de mercadorias a serem utilizadas em processo de " + CHR(13) + "industrialização e posterior exportação do produto resultante, cujas vendas serão classificadas no " + CHR(13) + "código " + '"' + "7.127 – Venda de produção do estabelecimento sob o regime de " + '"' + "drawback" + '"' + "" + '"' + ".", "E", "Compra para industrialização")
	INSERT INTO cfop VALUES (221, "3200", "DEVOLUÇÕES DE VENDAS DE PRODUÇÃO PRÓPRIA, DE TERCEIROS OU ANULAÇÕES DE VALORES", "", "E", "DEVOLUÇÕES DE VENDAS")
	INSERT INTO cfop VALUES (222, "3201", "Devolução de venda de produção do estabelecimento", "Classificam-se neste código as devoluções de vendas de produtos industrializados pelo " + CHR(13) + "estabelecimento, cujas saídas tenham sido classificadas como " + '"' + "Venda de produção do estabelecimento" + '"' + ".", "E", "Devolução de venda")
	INSERT INTO cfop VALUES (223, "3202", "Devolução de venda de mercadoria adquirida ou recebida de terceiros", "Classificam-se neste código as devoluções de vendas de mercadorias adquiridas ou recebidas de " + CHR(13) + "terceiros, que não tenham sido objeto de industrialização no estabelecimento, cujas saídas tenham " + CHR(13) + "sido classificadas como " + '"' + "Venda de mercadoria adquirida ou recebida de terceiros" + '"' + ".", "E", "Devolução de venda")
	INSERT INTO cfop VALUES (224, "3205", "Anulação de valor relativo à prestação de serviço de comunicação", "Classificam-se neste código as anulações correspondentes a valores faturados indevidamente, " + CHR(13) + "decorrentes de prestações de serviços de comunicação.", "E", "Anulação de valor")
	INSERT INTO cfop VALUES (225, "3206", "Anulação de valor relativo à prestação de serviço de transporte", "Classificam-se neste código as anulações correspondentes a valores faturados indevidamente, " + CHR(13) + "decorrentes de prestações de serviços de transporte.", "E", "Anulação de valor")
	INSERT INTO cfop VALUES (226, "3207", "Anulação de valor relativo à venda de energia elétrica", "Classificam-se neste código as anulações correspondentes a valores faturados indevidamente, " + CHR(13) + "decorrentes de venda de energia elétrica.", "E", "Anulação de valor")
	INSERT INTO cfop VALUES (227, "3211", "Devolução de venda de produção do estabelecimento sob o regime de " + '"' + "drawback" + '"' + "", "Classificam-se neste código as devoluções de vendas de produtos industrializados pelo " + CHR(13) + "estabelecimento sob o regime de " + '"' + "drawback" + '"' + ".", "E", "Devolução de venda")
	INSERT INTO cfop VALUES (228, "3250", "COMPRAS DE ENERGIA ELÉTRICA", "", "E", "COMPRAS DE ENERGIA ELÉTRICA")
	INSERT INTO cfop VALUES (229, "3251", "Compra de energia elétrica para distribuição ou comercialização", "Classificam-se neste código as compras de energia elétrica utilizada em sistema de distribuição ou " + CHR(13) + "comercialização. Também serão classificadas neste código as compras de energia elétrica por " + CHR(13) + "cooperativas para distribuição aos seus cooperados.", "E", "Compra de energia elétrica")
	INSERT INTO cfop VALUES (230, "3300", "AQUISIÇÕES DE SERVIÇOS DE COMUNICAÇÃO", "", "E", "AQUISIÇÕES DE SERVIÇOS")
	INSERT INTO cfop VALUES (231, "3301", "Aquisição de serviço de comunicação para execução de serviço da mesma natureza", "Classificam-se neste código as aquisições de serviços de comunicação utilizados nas prestações de " + CHR(13) + "serviços da mesma natureza.", "E", "Aquisição de serviço")
	INSERT INTO cfop VALUES (232, "3350", "AQUISIÇÕES DE SERVIÇOS DE TRANSPORTE", "", "E", "AQUISIÇÕES DE SERVIÇOS")
	INSERT INTO cfop VALUES (233, "3351", "Aquisição de serviço de transporte para execução de serviço da mesma natureza", "Classificam-se neste código as aquisições de serviços de transporte utilizados nas prestações de " + CHR(13) + "serviços da mesma natureza.", "E", "Aquisição de serviço")
	INSERT INTO cfop VALUES (234, "3352", "Aquisição de serviço de transporte por estabelecimento industrial", "Classificam-se neste código as aquisições de serviços de transporte utilizados por estabelecimento " + CHR(13) + "industrial. Também serão classificadas neste código as aquisições de serviços de transporte " + CHR(13) + "utilizados por estabelecimento industrial de cooperativa.", "E", "Aquisição de serviço")
	INSERT INTO cfop VALUES (235, "3353", "Aquisição de serviço de transporte por estabelecimento comercial", "Classificam-se neste código as aquisições de serviços de transporte utilizados por estabelecimento " + CHR(13) + "comercial. Também serão classificadas neste código as aquisições de serviços de transporte " + CHR(13) + "utilizados por estabelecimento comercial de cooperativa.", "E", "Aquisição de serviço")
	INSERT INTO cfop VALUES (236, "3354", "Aquisição de serviço de transporte por estabelecimento de prestador de serviço de comunicação", "Classificam-se neste código as aquisições de serviços de transporte utilizados por estabelecimento " + CHR(13) + "prestador de serviços de comunicação.", "E", "Aquisição de serviço")
	INSERT INTO cfop VALUES (237, "3355", "Aquisição de serviço de transporte por estabelecimento de geradora ou de distribuidora de energia elétrica", "Classificam-se neste código as aquisições de serviços de transporte utilizados por estabelecimento " + CHR(13) + "de geradora ou de distribuidora de energia elétrica.", "E", "Aquisição de serviço")
	INSERT INTO cfop VALUES (238, "3356", "Aquisição de serviço de transporte por estabelecimento de produtor rural", " Classificam-se neste código as aquisições de serviços de transporte utilizados por estabelecimento " + CHR(13) + "de produtor rural.", "E", "Aquisição de serviço")
	INSERT INTO cfop VALUES (239, "3500", "ENTRADAS DE MERCADORIAS REMETIDAS COM FIM ESPECÍFICO DE EXPORTAÇÃO E EVENTUAIS DEVOLUÇÕES", "", "E", "ENTRADAS DE MERCADORIAS")
	INSERT INTO cfop VALUES (240, "3503", "Devolução de mercadoria exportada que tenha sido recebida com fim específico de exportação", "Classificam-se neste código as devoluções de mercadorias exportadas por trading company, empresa " + CHR(13) + "comercial exportadora ou outro estabelecimento do remetente, recebidas com fim específico de " + CHR(13) + "exportação, cujas saídas tenham sido classificadas no código " + '"' + "7.501 – Exportação de mercadorias " + CHR(13) + "recebidas com fim específico de exportação" + '"' + ".", "E", "Devolução de mercadoria")
	INSERT INTO cfop VALUES (241, "3550", "OPERAÇÕES COM BENS DE ATIVO IMOBILIZADO E MATERIAIS PARA USO OU CONSUMO", "", "E", "OPERAÇÕES COM BENS")
	INSERT INTO cfop VALUES (242, "3551", "Compra de bem para o ativo imobilizado", " Classificam-se neste código as compras de bens destinados ao ativo imobilizado do estabelecimento.", "E", "Compra de bem")
	INSERT INTO cfop VALUES (243, "3553", "Devolução de venda de bem do ativo imobilizado", "Classificam-se neste código as devoluções de vendas de bens do ativo imobilizado, cujas saídas " + CHR(13) + "tenham sido classificadas no código " + '"' + "7.551 - Venda de bem do ativo imobilizado" + '"' + ".", "E", "Devolução de venda")
	INSERT INTO cfop VALUES (244, "3556", "Compra de material para uso ou consumo", " Classificam-se neste código as compras de mercadorias destinadas ao uso ou consumo do " + CHR(13) + "estabelecimento.", "E", "Compra de material")
	INSERT INTO cfop VALUES (245, "3900", "OUTRAS ENTRADAS DE MERCADORIAS OU AQUISIÇÕES DE SERVIÇOS", "", "E", "OUTRAS ENTRADAS DE MERCADORIAS")
	INSERT INTO cfop VALUES (246, "3930", "Lançamento efetuado a título de entrada de bem sob amparo de regime especial aduaneiro de admissão temporária", "Classificam-se neste código os lançamentos efetuados a título de entrada de bens amparada por regime" + CHR(13) + " especial aduaneiro de admissão temporária.", "E", "Lançamento efetuado")
	INSERT INTO cfop VALUES (247, "3949", "Outra entrada de mercadoria ou prestação de serviço não especificado", "Classificam-se neste código as outras entradas de mercadorias ou prestações de serviços que não " + CHR(13) + "tenham sido especificados nos códigos anteriores. DAS SAÍDAS DE MERCADORIAS, BENS OU PRESTAÇÃO DE " + CHR(13) + "SERVIÇOS", "E", "Outra entrada de mercadoria")
	INSERT INTO cfop VALUES (248, "5000", "SAÍDAS OU PRESTAÇÕES DE SERVIÇOS PARA O ESTADO", "Classificam-se, neste grupo, as operações ou prestações em que o estabelecimento remetente esteja " + CHR(13) + "localizado na mesma unidade da Federação do destinatário", "S", "SAÍDAS OU PREST.DE SERVIÇOS")
	INSERT INTO cfop VALUES (249, "5100", "VENDAS DE PRODUÇÃO PRÓPRIA OU DE TERCEIROS", "", "S", "VENDAS DE PRODUÇÃO")
	INSERT INTO cfop VALUES (250, "5101", "Venda de produção do estabelecimento", "Classificam-se neste código as vendas de produtos industrializados no estabelecimento. Também serão " + CHR(13) + "classificadas neste código as vendas de mercadorias por estabelecimento industrial de cooperativa " + CHR(13) + "destinadas a seus cooperados ou a estabelecimento de outra cooperativa.", "S", "Venda de produção do estab.")
	INSERT INTO cfop VALUES (251, "5102", "Venda de mercadoria adquirida ou recebida de terceiros", "Classificam-se neste código as vendas de mercadorias adquiridas ou recebidas de terceiros para " + CHR(13) + "industrialização ou comercialização, que não tenham sido objeto de qualquer processo industrial no " + CHR(13) + "estabelecimento. Também serão classificadas neste código as vendas de mercadorias por " + CHR(13) + "estabelecimento comercial de cooperativa destinadas a seus cooperados ou estabelecimento de outra " + CHR(13) + "cooperativa.", "S", "Venda de mercadoria")
	INSERT INTO cfop VALUES (252, "5103", "Venda de produção do estabelecimento, efetuada fora do estabelecimento", "Classificam-se neste código as vendas efetuadas fora do estabelecimento, inclusive por meio de " + CHR(13) + "veículo, de produtos industrializados no estabelecimento.", "S", "Venda de produção do estab.")
	INSERT INTO cfop VALUES (253, "5104", "Venda de mercadoria adquirida ou recebida de terceiros, efetuada fora do estabelecimento", "Classificam-se neste código as vendas efetuadas fora do estabelecimento, inclusive por meio de " + CHR(13) + "veículo, de mercadorias adquiridas ou recebidas de terceiros para industrialização ou " + CHR(13) + "comercialização, que não tenham sido objeto de qualquer processo industrial no estabelecimento.", "S", "Venda de mercadoria")
	INSERT INTO cfop VALUES (254, "5105", "Venda de produção do estabelecimento que não deva por ele transitar", "Classificam-se neste código as vendas de produtos industrializados no estabelecimento, armazenados " + CHR(13) + "em depósito fechado, armazém geral ou outro sem que haja retorno ao estabelecimento depositante.", "S", "Venda de produção do estab.")
	INSERT INTO cfop VALUES (255, "5106", "Venda de mercadoria adquirida ou recebida de terceiros, que não deva por ele transitar", "Classificam-se neste código as vendas de mercadorias adquiridas ou recebidas de terceiros para " + CHR(13) + "industrialização ou comercialização, armazenadas em depósito fechado, armazém geral ou outro, que " + CHR(13) + "não tenham sido objeto de qualquer processo industrial no estabelecimento sem que haja retorno ao " + CHR(13) + "estabelecimento depositante. Também serão classificadas neste código as vendas de mercadorias " + CHR(13) + "importadas, cuja saída ocorra do recinto alfandegado ou da repartição alfandegária onde se processou" + CHR(13) + " o desembaraço aduaneiro, com destino ao estabelecimento do comprador, sem transitar pelo " + CHR(13) + "estabelecimento do importador.", "S", "Venda de mercadoria")
	INSERT INTO cfop VALUES (256, "5109", "Venda de produção do estabelecimento, destinada à Zona Franca de Manaus ou Áreas de Livre Comércio", "Classificam-se neste código as vendas de produtos industrializados pelo estabelecimento, destinados " + CHR(13) + "à Zona Franca de Manaus ou Áreas de Livre Comércio.", "S", "Venda de produção do estab.")
	INSERT INTO cfop VALUES (257, "5110", "Venda de mercadoria adquirida ou recebida de terceiros, destinada à Zona Franca de Manaus ou Áreas de Livre Comércio", "Classificam-se neste código as vendas de mercadorias adquiridas ou recebidas de terceiros, que não " + CHR(13) + "tenham sido objeto de qualquer processo industrial no estabelecimento, destinadas à Zona Franca de " + CHR(13) + "Manaus ou Áreas de Livre Comércio.", "S", "Venda de mercadoria")
	INSERT INTO cfop VALUES (258, "5111", "Venda de produção do estabelecimento remetida anteriormente em consignação industrial", "Classificam-se neste código as vendas efetivas de produtos industrializados no estabelecimento " + CHR(13) + "remetidos anteriormente a título de consignação industrial.", "S", "Venda de produção do estab.")
	INSERT INTO cfop VALUES (259, "5112", "Venda de mercadoria adquirida ou recebida de terceiros remetida anteriormente em consignação industrial", "Classificam-se neste código as vendas efetivas de mercadorias adquiridas ou recebidas de terceiros, " + CHR(13) + "que não tenham sido objeto de qualquer processo industrial no estabelecimento, remetidas " + CHR(13) + "anteriormente a título de consignação industrial.", "S", "Venda de mercadoria")
	INSERT INTO cfop VALUES (260, "5113", "Venda de produção do estabelecimento remetida anteriormente em consignação mercantil", "Classificam-se neste código as vendas efetivas de produtos industrializados no estabelecimento " + CHR(13) + "remetidos anteriormente a título de consignação mercantil.", "S", "Venda de produção do estab.")
	INSERT INTO cfop VALUES (261, "5114", "Venda de mercadoria adquirida ou recebida de terceiros remetida anteriormente em consignação mercantil", "Classificam-se neste código as vendas efetivas de mercadorias adquiridas ou recebidas de terceiros, " + CHR(13) + "que não tenham sido objeto de qualquer processo industrial no estabelecimento, remetidas " + CHR(13) + "anteriormente a título de consignação mercantil.", "S", "Venda de mercadoria")
	INSERT INTO cfop VALUES (262, "5115", "Venda de mercadoria adquirida ou recebida de terceiros, recebida anteriormente em consignação mercantil", "Classificam-se neste código as vendas de mercadorias adquiridas ou recebidas de terceiros, recebidas" + CHR(13) + " anteriormente a título de consignação mercantil.", "S", "Venda de mercadoria")
	INSERT INTO cfop VALUES (263, "5116", "Venda de produção do estabelecimento originada de encomenda para entrega futura", "Classificam-se neste código as vendas de produtos industrializados pelo estabelecimento, quando da " + CHR(13) + "saída real do produto, cujo faturamento tenha sido classificado no código " + '"' + "5.922 – Lançamento " + CHR(13) + "efetuado a título de simples faturamento decorrente de venda para entrega futura" + '"' + ".", "S", "Venda de produção do estab.")
	INSERT INTO cfop VALUES (264, "5117", "Venda de mercadoria adquirida ou recebida de terceiros, originada de encomenda para entrega futura", "Classificam-se neste código as vendas de mercadorias adquiridas ou recebidas de terceiros, que não " + CHR(13) + "tenham sido objeto de qualquer processo industrial no estabelecimento, quando da saída real da " + CHR(13) + "mercadoria, cujo faturamento tenha sido classificado no código " + '"' + "5.922 – Lançamento efetuado a título" + CHR(13) + " de simples faturamento decorrente de venda para entrega futura" + '"' + ".", "S", "Venda de mercadoria")
	INSERT INTO cfop VALUES (265, "5118", "Venda de produção do estabelecimento entregue ao destinatário por conta e ordem do adquirente originário, em venda à ordem", "Classificam-se neste código as vendas à ordem de produtos industrializados pelo estabelecimento, " + CHR(13) + "entregues ao destinatário por conta e ordem do adquirente originário.", "S", "Venda de produção do estab.")
	INSERT INTO cfop VALUES (266, "5119", "Venda de mercadoria adquirida ou recebida de terceiros entregue ao destinatário por conta e ordem do adquirente originário, em venda à ordem", "Classificam-se neste código as vendas à ordem de mercadorias adquiridas ou recebidas de terceiros, " + CHR(13) + "que não tenham sido objeto de qualquer processo industrial no estabelecimento, entregues ao " + CHR(13) + "destinatário por conta e ordem do adquirente originário.", "S", "Venda de mercadoria")
	INSERT INTO cfop VALUES (267, "5120", "Venda de mercadoria adquirida ou recebida de terceiros entregue ao destinatário pelo vendedor remetente, em venda à ordem", "Classificam-se neste código as vendas à ordem de mercadorias adquiridas ou recebidas de terceiros, " + CHR(13) + "que não tenham sido objeto de qualquer processo industrial no estabelecimento, entregues pelo " + CHR(13) + "vendedor remetente ao destinatário, cuja compra seja classificada, pelo adquirente originário, no " + CHR(13) + "código " + '"' + "1.118 – Compra de mercadoria pelo adquirente originário, entregue pelo vendedor remetente ao" + CHR(13) + " destinatário, em venda à ordem" + '"' + ".", "S", "Venda de mercadoria")
	INSERT INTO cfop VALUES (268, "5122", "Venda de produção do estabelecimento remetida para industrialização, por conta e ordem do adquirente, sem transitar pelo estabelecimento do adquirente", "Classificam-se neste código as vendas de produtos industrializados no estabelecimento, remetidos " + CHR(13) + "para serem industrializados em outro estabelecimento, por conta e ordem do adquirente, sem que os " + CHR(13) + "produtos tenham transitado pelo estabelecimento do adquirente.", "S", "Venda de produção do estab.")
	INSERT INTO cfop VALUES (269, "5123", "Venda de mercadoria adquirida ou recebida de terceiros remetida para industrialização, por conta e ordem do adquirente, sem transitar pelo estabelecimento do adquirente", "Classificam-se neste código as vendas de mercadorias adquiridas ou recebidas de terceiros, que não " + CHR(13) + "tenham sido objeto de qualquer processo industrial no estabelecimento, remetidas para serem " + CHR(13) + "industrializadas em outro estabelecimento, por conta e ordem do adquirente, sem que as mercadorias " + CHR(13) + "tenham transitado pelo estabelecimento do adquirente.", "S", "Venda de mercadoria")
	INSERT INTO cfop VALUES (270, "5124", "Industrialização efetuada para outra empresa", "Classificam-se neste código as saídas de mercadorias industrializadas para terceiros, compreendendo " + CHR(13) + "os valores referentes aos serviços prestados e os das mercadorias de propriedade do industrializador" + CHR(13) + " empregadas no processo industrial.", "S", "Industrialização")
	INSERT INTO cfop VALUES (271, "5125", "Industrialização efetuada para outra empresa quando a mercadoria recebida para utilização no processo de industrialização não transitar pelo estabelecimento adquirente da mercadoria", "Classificam-se neste código as saídas de mercadorias industrializadas para outras empresas, em que " + CHR(13) + "as mercadorias recebidas para utilização no processo de industrialização não tenham transitado pelo " + CHR(13) + "estabelecimento do adquirente das mercadorias, compreendendo os valores referentes aos serviços " + CHR(13) + "prestados e os das mercadorias de propriedade do industrializador empregadas no processo industrial.", "S", "Industrialização")
	INSERT INTO cfop VALUES (272, "5150", "TRANSFERÊNCIAS DE PRODUÇÃO PRÓPRIA OU DE TERCEIROS", "", "S", "TRANSFERÊNCIAS DE PRODUÇÃO")
	INSERT INTO cfop VALUES (273, "5151", "Transferência de produção do estabelecimento", "Classificam-se neste código os produtos industrializados no estabelecimento e transferidos para " + CHR(13) + "outro estabelecimento da mesma empresa.", "S", "Transferência de produção")
	INSERT INTO cfop VALUES (274, "5152", "Transferência de mercadoria adquirida ou recebida de terceiros", "Classificam-se neste código as mercadorias adquiridas ou recebidas de terceiros para " + CHR(13) + "industrialização ou comercialização e que não tenham sido objeto de qualquer processo industrial no " + CHR(13) + "estabelecimento, transferidas para outro estabelecimento da mesma empresa.", "S", "Transferência de mercadoria")
	INSERT INTO cfop VALUES (275, "5153", "Transferência de energia elétrica", "Classificam-se neste código as transferências de energia elétrica para outro estabelecimento da " + CHR(13) + "mesma empresa, para distribuição.", "S", "Transf. de energia elétrica")
	INSERT INTO cfop VALUES (276, "5155", "Transferência de produção do estabelecimento, que não deva por ele transitar", "Classificam-se neste código as transferências para outro estabelecimento da mesma empresa, de " + CHR(13) + "produtos industrializados no estabelecimento que tenham sido remetidos para armazém geral, depósito " + CHR(13) + "fechado ou outro, sem que haja retorno ao estabelecimento depositante.", "S", "Transf. de produção do estab.")
	INSERT INTO cfop VALUES (277, "5156", "Transferência de mercadoria adquirida ou recebida de terceiros, que não deva por ele transitar", "Classificam-se neste código as transferências para outro estabelecimento da mesma empresa, de " + CHR(13) + "mercadorias adquiridas ou recebidas de terceiros para industrialização ou comercialização, que não " + CHR(13) + "tenham sido objeto de qualquer processo industrial, remetidas para armazém geral, depósito fechado " + CHR(13) + "ou outro, sem que haja retorno ao estabelecimento depositante.", "S", "Transferência de mercadoria")
	INSERT INTO cfop VALUES (278, "5200", "DEVOLUÇÕES DE COMPRAS PARA INDUSTRIALIZAÇÃO, COMERCIALIZAÇÃO OU ANULAÇÕES DE VALORES", "", "S", "DEVOLUÇÕES DE COMPRAS")
	INSERT INTO cfop VALUES (279, "5201", "Devolução de compra para industrialização", "Classificam-se neste código as devoluções de mercadorias adquiridas para serem utilizadas em " + CHR(13) + "processo de industrialização, cujas entradas tenham sido classificadas como " + '"' + "Compra para " + CHR(13) + "industrialização" + '"' + ".", "S", "Devolução de compra")
	INSERT INTO cfop VALUES (280, "5202", "Devolução de compra para comercialização", "Classificam-se neste código as devoluções de mercadorias adquiridas para serem comercializadas, " + CHR(13) + "cujas entradas tenham sido classificadas como " + '"' + "Compra para comercialização" + '"' + ".", "S", "Devolução de compra")
	INSERT INTO cfop VALUES (281, "5205", "Anulação de valor relativo a aquisição de serviço de comunicação", "Classificam-se neste código as anulações correspondentes a valores faturados indevidamente, " + CHR(13) + "decorrentes das aquisições de serviços de comunicação.", "S", "Anulação de valor")
	INSERT INTO cfop VALUES (282, "5206", "Anulação de valor relativo a aquisição de serviço de transporte", "Classificam-se neste código as anulações correspondentes a valores faturados indevidamente, " + CHR(13) + "decorrentes das aquisições de serviços de transporte.", "S", "Anulação de valor")
	INSERT INTO cfop VALUES (283, "5207", "Anulação de valor relativo à compra de energia elétrica", "Classificam-se neste código as anulações correspondentes a valores faturados indevidamente, " + CHR(13) + "decorrentes da compra de energia elétrica.", "S", "Anulação de valor")
	INSERT INTO cfop VALUES (284, "5208", "Devolução de mercadoria recebida em transferência para industrialização", "Classificam-se neste código as devoluções de mercadorias recebidas em transferência de outros " + CHR(13) + "estabelecimentos da mesma empresa, para serem utilizadas em processo de industrialização.", "S", "Devolução de mercadoria")
	INSERT INTO cfop VALUES (285, "5209", "Devolução de mercadoria recebida em transferência para comercialização", "Classificam-se neste código as devoluções de mercadorias recebidas em transferência de outro " + CHR(13) + "estabelecimento da mesma empresa, para serem comercializadas.", "S", "Devolução de mercadoria")
	INSERT INTO cfop VALUES (286, "5210", "Devolução de compra para utilização na prestação de serviço", "Classificam-se neste código as devoluções de mercadorias adquiridas para utilização na prestação de " + CHR(13) + "serviços, cujas entradas tenham sido classificadas no código " + '"' + "1.126 – Compra para utilização na " + CHR(13) + "prestação de serviço" + '"' + ".", "S", "Devolução de compra")
	INSERT INTO cfop VALUES (287, "5250", "VENDAS DE ENERGIA ELÉTRICA", "", "S", "VENDAS DE ENERGIA ELÉTRICA")
	INSERT INTO cfop VALUES (288, "5251", "Venda de energia elétrica para distribuição ou comercialização", "Classificam-se neste código as vendas de energia elétrica destinada à distribuição ou " + CHR(13) + "comercialização. Também serão classificadas neste código as vendas de energia elétrica destinada a " + CHR(13) + "cooperativas para distribuição aos seus cooperados.", "S", "Venda de energia elétrica")
	INSERT INTO cfop VALUES (289, "5252", "Venda de energia elétrica para estabelecimento industrial", "Classificam-se neste código as vendas de energia elétrica para consumo por estabelecimento " + CHR(13) + "industrial. Também serão classificadas neste código as vendas de energia elétrica destinada a " + CHR(13) + "estabelecimento industrial de cooperativa.", "S", "Venda de energia elétrica")
	INSERT INTO cfop VALUES (290, "5253", "Venda de energia elétrica para estabelecimento comercial", "Classificam-se neste código as vendas de energia elétrica para consumo por estabelecimento " + CHR(13) + "comercial. Também serão classificadas neste código as vendas de energia elétrica destinada a " + CHR(13) + "estabelecimento comercial de cooperativa.", "S", "Venda de energia elétrica")
	INSERT INTO cfop VALUES (291, "5254", "Venda de energia elétrica para estabelecimento prestador de serviço de transporte", "Classificam-se neste código as vendas de energia elétrica para consumo por estabelecimento de " + CHR(13) + "prestador de serviços de transporte.", "S", "Venda de energia elétrica")
	INSERT INTO cfop VALUES (292, "5255", "Venda de energia elétrica para estabelecimento prestador de serviço de comunicação", "Classificam-se neste código as vendas de energia elétrica para consumo por estabelecimento de " + CHR(13) + "prestador de serviços de comunicação.", "S", "Venda de energia elétrica")
	INSERT INTO cfop VALUES (293, "5256", "Venda de energia elétrica para estabelecimento de produtor rural", " Classificam-se neste código as vendas de energia elétrica para consumo por estabelecimento de " + CHR(13) + "produtor rural.", "S", "Venda de energia elétrica")
	INSERT INTO cfop VALUES (294, "5257", "Venda de energia elétrica para consumo por demanda contratada", "Classificam-se neste código as vendas de energia elétrica para consumo por demanda contratada, que " + CHR(13) + "prevalecerá sobre os demais códigos deste subgrupo.", "S", "Venda de energia elétrica")
	INSERT INTO cfop VALUES (295, "5258", "Venda de energia elétrica a não contribuinte", "Classificam-se neste código as vendas de energia elétrica a pessoas físicas ou a pessoas jurídicas " + CHR(13) + "não indicadas nos códigos anteriores.", "S", "Venda de energia elétrica")
	INSERT INTO cfop VALUES (296, "5300", "PRESTAÇÕES DE SERVIÇOS DE COMUNICAÇÃO", "", "S", "PRESTAÇÕES DE SERVIÇOS")
	INSERT INTO cfop VALUES (297, "5301", "Prestação de serviço de comunicação para execução de serviço da mesma natureza", "Classificam-se neste código as prestações de serviços de comunicação destinados às prestações de " + CHR(13) + "serviços da mesma natureza.", "S", "Prestação de serviço")
	INSERT INTO cfop VALUES (298, "5302", "Prestação de serviço de comunicação a estabelecimento industrial", "Classificam-se neste código as prestações de serviços de comunicação a estabelecimento industrial. " + CHR(13) + "Também serão classificados neste código os serviços de comunicação prestados a estabelecimento " + CHR(13) + "industrial de cooperativa.", "S", "Prestação de serviço")
	INSERT INTO cfop VALUES (299, "5303", "Prestação de serviço de comunicação a estabelecimento comercial", "Classificam-se neste código as prestações de serviços de comunicação a estabelecimento comercial. " + CHR(13) + "Também serão classificados neste código os serviços de comunicação prestados a estabelecimento " + CHR(13) + "comercial de cooperativa.", "S", "Prestação de serviço")
	INSERT INTO cfop VALUES (300, "5304", "Prestação de serviço de comunicação a estabelecimento de prestador de serviço de transporte", "Classificam-se neste código as prestações de serviços de comunicação a estabelecimento prestador de " + CHR(13) + "serviço de transporte.", "S", "Prestação de serviço")
	INSERT INTO cfop VALUES (301, "5305", "Prestação de serviço de comunicação a estabelecimento de geradora ou de distribuidora de energia elétrica", "Classificam-se neste código as prestações de serviços de comunicação a estabelecimento de geradora " + CHR(13) + "ou de distribuidora de energia elétrica.", "S", "Prestação de serviço")
	INSERT INTO cfop VALUES (302, "5306", "Prestação de serviço de comunicação a estabelecimento de produtor rural", " Classificam-se neste código as prestações de serviços de comunicação a estabelecimento de produtor " + CHR(13) + "rural.", "S", "Prestação de serviço")
	INSERT INTO cfop VALUES (303, "5307", "Prestação de serviço de comunicação a não contribuinte", "Classificam-se neste código as prestações de serviços de comunicação a pessoas físicas ou a pessoas " + CHR(13) + "jurídicas não indicadas nos códigos anteriores.", "S", "Prestação de serviço")
	INSERT INTO cfop VALUES (304, "5350", "PRESTAÇÕES DE SERVIÇOS DE TRANSPORTE", "", "S", "PRESTAÇÕES DE SERVIÇOS")
	INSERT INTO cfop VALUES (305, "5351", "Prestação de serviço de transporte para execução de serviço da mesma natureza", "Classificam-se neste código as prestações de serviços de transporte destinados às prestações de " + CHR(13) + "serviços da mesma natureza.", "S", "Prestação de serviço")
	INSERT INTO cfop VALUES (306, "5352", "Prestação de serviço de transporte a estabelecimento industrial", "Classificam-se neste código as prestações de serviços de transporte a estabelecimento industrial. " + CHR(13) + "Também serão classificados neste código os serviços de transporte prestados a estabelecimento " + CHR(13) + "industrial de cooperativa.", "S", "Prestação de serviço")
	INSERT INTO cfop VALUES (307, "5353", "Prestação de serviço de transporte a estabelecimento comercial", "Classificam-se neste código as prestações de serviços de transporte a estabelecimento comercial. " + CHR(13) + "Também serão classificados neste código os serviços de transporte prestados a estabelecimento " + CHR(13) + "comercial de cooperativa.", "S", "Prestação de serviço")
	INSERT INTO cfop VALUES (308, "5354", "Prestação de serviço de transporte a estabelecimento de prestador de serviço de comunicação", "Classificam-se neste código as prestações de serviços de transporte a estabelecimento prestador de " + CHR(13) + "serviços de comunicação.", "S", "Prestação de serviço")
	INSERT INTO cfop VALUES (309, "5355", "Prestação de serviço de transporte a estabelecimento de geradora ou de distribuidora de energia elétrica", "Classificam-se neste código as prestações de serviços de transporte a estabelecimento de geradora ou" + CHR(13) + " de distribuidora de energia elétrica.", "S", "Prestação de serviço")
	INSERT INTO cfop VALUES (310, "5356", "Prestação de serviço de transporte a estabelecimento de produtor rural", " Classificam-se neste código as prestações de serviços de transporte a estabelecimento de produtor " + CHR(13) + "rural.", "S", "Prestação de serviço")
	INSERT INTO cfop VALUES (311, "5357", "Prestação de serviço de transporte a não contribuinte", "Classificam-se neste código as prestações de serviços de transporte a pessoas físicas ou a pessoas " + CHR(13) + "jurídicas não indicadas nos códigos anteriores.", "S", "Prestação de serviço")
	INSERT INTO cfop VALUES (312, "5400", "SAÍDAS DE MERCADORIAS SUJEITAS AO REGIME DE SUBSTITUIÇÃO TRIBUTÁRIA", "", "S", "SAÍDAS DE MERCADORIAS")
	INSERT INTO cfop VALUES (313, "5401", "Venda de produção do estabelecimento em operação com produto sujeito ao regime de substituição tributária, na condição de contribuinte substituto", "Classificam-se neste código as vendas de produtos industrializados no estabelecimento em operações " + CHR(13) + "com produtos sujeitos ao regime de substituição tributária, na condição de contribuinte substituto. " + CHR(13) + "Também serão classificadas neste código as vendas de produtos industrializados por estabelecimento " + CHR(13) + "industrial de cooperativa sujeitos ao regime de substituição tributária, na condição de contribuinte" + CHR(13) + " substituto.", "S", "Venda de produção do estab.")
	INSERT INTO cfop VALUES (314, "5402", "Venda de produção do estabelecimento de produto sujeito ao regime de substituição tributária, em operação entre contribuintes substitutos do mesmo produto", "Classificam-se neste código as vendas de produtos sujeitos ao regime de substituição tributária " + CHR(13) + "industrializados no estabelecimento, em operações entre contribuintes substitutos do mesmo produto", "S", "Venda de produção do estab.")
	INSERT INTO cfop VALUES (315, "5403", "Venda de mercadoria adquirida ou recebida de terceiros em operação com mercadoria sujeita ao regime de substituição tributária, na condição de contribuinte substituto", "Classificam-se neste código as vendas de mercadorias adquiridas ou recebidas de terceiros, na " + CHR(13) + "condição de contribuinte substituto, em operação com mercadorias sujeitas ao regime de substituição " + CHR(13) + "tributária.", "S", "Venda de mercadoria")
	INSERT INTO cfop VALUES (316, "5405", "Venda de mercadoria adquirida ou recebida de terceiros em operação com mercadoria sujeita ao regime de substituição tributária, na condição de contribuinte substituído", "Classificam-se neste código as vendas de mercadorias adquiridas ou recebidas de terceiros em " + CHR(13) + "operação com mercadorias sujeitas ao regime de substituição tributária, na condição de contribuinte " + CHR(13) + "substituído.", "S", "Venda de mercadoria")
	INSERT INTO cfop VALUES (317, "5408", "Transferência de produção do estabelecimento em operação com produto sujeito ao regime de substituição tributária", "Classificam-se neste código os produtos industrializados no estabelecimento e transferidos para " + CHR(13) + "outro estabelecimento da mesma empresa, em operações com produtos sujeitos ao regime de substituição" + CHR(13) + " tributária.", "S", "Transferência de produção")
	INSERT INTO cfop VALUES (318, "5409", "Transferência de mercadoria adquirida ou recebida de terceiros em operação com mercadoria sujeita ao regime de substituição tributária", "Classificam-se neste código as transferências para outro estabelecimento da mesma empresa, de " + CHR(13) + "mercadorias adquiridas ou recebidas de terceiros que não tenham sido objeto de qualquer processo " + CHR(13) + "industrial no estabelecimento, em operações com mercadorias sujeitas ao regime de substituição " + CHR(13) + "tributária.", "S", "Transferência de mercadoria")
	INSERT INTO cfop VALUES (319, "5410", "Devolução de compra para industrialização em operação com mercadoria sujeita ao regime de substituição tributária", "Classificam-se neste código as devoluções de mercadorias adquiridas para serem utilizadas em " + CHR(13) + "processo de industrialização cujas entradas tenham sido classificadas como " + '"' + "Compra para " + CHR(13) + "industrialização em operação com mercadoria sujeita ao regime de substituição tributária" + '"' + ".", "S", "Devolução de compra")
	INSERT INTO cfop VALUES (320, "5411", "Devolução de compra para comercialização em operação com mercadoria sujeita ao regime de substituição tributária", "Classificam-se neste código as devoluções de mercadorias adquiridas para serem comercializadas, " + CHR(13) + "cujas entradas tenham sido classificadas como " + '"' + "Compra para comercialização em operação com " + CHR(13) + "mercadoria sujeita ao regime de substituição tributária" + '"' + ".", "S", "Devolução de compra")
	INSERT INTO cfop VALUES (321, "5412", "Devolução de bem do ativo imobilizado, em operação com mercadoria sujeita ao regime de substituição tributária", "Classificam-se neste código as devoluções de bens adquiridos para integrar o ativo imobilizado do " + CHR(13) + "estabelecimento, cuja entrada tenha sido classificada no código " + '"' + "1.406 – Compra de bem para o ativo " + CHR(13) + "imobilizado cuja mercadoria está sujeita ao regime de substituição tributária" + '"' + ".", "S", "Devolução de bem")
	INSERT INTO cfop VALUES (322, "5413", "Devolução de mercadoria destinada ao uso ou consumo, em operação com mercadoria sujeita ao regime de substituição tributária", "Classificam-se neste código as devoluções de mercadorias adquiridas para uso ou consumo do " + CHR(13) + "estabelecimento, cuja entrada tenha sido classificada no código " + '"' + "1.407 – Compra de mercadoria para " + CHR(13) + "uso ou consumo cuja mercadoria está sujeita ao regime de substituição tributária" + '"' + ".", "S", "Devolução de mercadoria")
	INSERT INTO cfop VALUES (323, "5414", "Remessa de produção do estabelecimento para venda fora do estabelecimento em operação com produto sujeito ao regime de substituição tributária", "Classificam-se neste código as remessas de produtos industrializados pelo estabelecimento para serem" + CHR(13) + " vendidos fora do estabelecimento, inclusive por meio de veículos, em operações com produtos " + CHR(13) + "sujeitos ao regime de substituição tributária.", "S", "Remessa de produção do estab.")
	INSERT INTO cfop VALUES (324, "5415", "Remessa de mercadoria adquirida ou recebida de terceiros para venda fora do estabelecimento, em operação com mercadoria sujeita ao regime de substituição tributária", "Classificam-se neste código as remessas de mercadorias adquiridas ou recebidas de terceiros para " + CHR(13) + "serem vendidas fora do estabelecimento, inclusive por meio de veículos, em operações com mercadorias" + CHR(13) + " sujeitas ao regime de substituição tributária.", "S", "Remessa de mercadoria")
	INSERT INTO cfop VALUES (325, "5450", "SISTEMAS DE INTEGRAÇÃO", "", "S", "SISTEMAS DE INTEGRAÇÃO")
	INSERT INTO cfop VALUES (326, "5451", "Remessa de animal e de insumo para estabelecimento produtor", "Classificam-se neste código as saídas referentes à remessa de animais e de insumos para criação de " + CHR(13) + "animais no sistema integrado, tais como: pintos, leitões, rações e medicamentos.", "S", "Remessa de animal")
	INSERT INTO cfop VALUES (327, "5500", "REMESSAS COM FIM ESPECÍFICO DE EXPORTAÇÃO E EVENTUAIS DEVOLUÇÕES", "", "S", "REMESSAS COM FIM ESPECÍFICO")
	INSERT INTO cfop VALUES (328, "5501", "Remessa de produção do estabelecimento, com fim específico de exportação", "Classificam-se neste código as saídas de produtos industrializados pelo estabelecimento, remetidos " + CHR(13) + "com fim específico de exportação a trading company, empresa comercial exportadora ou outro " + CHR(13) + "estabelecimento do remetente.", "S", "Remessa de produção do estab.")
	INSERT INTO cfop VALUES (329, "5502", "Remessa de mercadoria adquirida ou recebida de terceiros, com fim específico de exportação", "Classificam-se neste código as saídas de mercadorias adquiridas ou recebidas de terceiros, remetidas" + CHR(13) + " com fim específico de exportação a trading company, empresa comercial exportadora ou outro " + CHR(13) + "estabelecimento do remetente.", "S", "Remessa de mercadoria")
	INSERT INTO cfop VALUES (330, "5503", "Devolução de mercadoria recebida com fim específico de exportação", "Classificam-se neste código as devoluções efetuadas por trading company, empresa comercial " + CHR(13) + "exportadora ou outro estabelecimento do destinatário, de mercadorias recebidas com fim específico de" + CHR(13) + " exportação, cujas entradas tenham sido classificadas no código " + '"' + "1.501 – Entrada de mercadoria " + CHR(13) + "recebida com fim específico de exportação" + '"' + ".", "S", "Devolução de mercadoria")
	INSERT INTO cfop VALUES (331, "5550", "OPERAÇÕES COM BENS DE ATIVO IMOBILIZADO E MATERIAIS PARA USO OU CONSUMO", "", "S", "OPERAÇÕES COM BENS")
	INSERT INTO cfop VALUES (332, "5551", "Venda de bem do ativo imobilizado", " Classificam-se neste código as vendas de bens integrantes do ativo imobilizado do estabelecimento.", "S", "Venda de bem")
	INSERT INTO cfop VALUES (333, "5552", "Transferência de bem do ativo imobilizado", "Classificam-se neste código os bens do ativo imobilizado transferidos para outro estabelecimento da " + CHR(13) + "mesma empresa.", "S", "Transferência de bem")
	INSERT INTO cfop VALUES (334, "5553", "Devolução de compra de bem para o ativo imobilizado", "Classificam-se neste código as devoluções de bens adquiridos para integrar o ativo imobilizado do " + CHR(13) + "estabelecimento, cuja entrada foi classificada no código " + '"' + "1.551 – Compra de bem para o ativo " + CHR(13) + "imobilizado" + '"' + ".", "S", "Devolução de compra")
	INSERT INTO cfop VALUES (335, "5554", "Remessa de bem do ativo imobilizado para uso fora do estabelecimento", " Classificam-se neste código as remessas de bens do ativo imobilizado para uso fora do " + CHR(13) + "estabelecimento.", "S", "Remessa de bem")
	INSERT INTO cfop VALUES (336, "5555", "Devolução de bem do ativo imobilizado de terceiro, recebido para uso no estabelecimento", "Classificam-se neste código as saídas em devolução, de bens do ativo imobilizado de terceiros, " + CHR(13) + "recebidos para uso no estabelecimento, cuja entrada tenha sido classificada no código " + '"' + "1.555 – " + CHR(13) + "Entrada de bem do ativo imobilizado de terceiro, remetido para uso no estabelecimento" + '"' + ".", "S", "Devolução de bem")
	INSERT INTO cfop VALUES (337, "5556", "Devolução de compra de material de uso ou consumo", "Classificam-se neste código as devoluções de mercadorias destinadas ao uso ou consumo do " + CHR(13) + "estabelecimento, cuja entrada tenha sido classificada no código " + '"' + "1.556 – Compra de material para uso" + CHR(13) + " ou consumo" + '"' + ".", "S", "Devolução de compra")
	INSERT INTO cfop VALUES (338, "5557", "Transferência de material de uso ou consumo", "Classificam-se neste código os materiais para uso ou consumo transferidos para outro estabelecimento" + CHR(13) + " da mesma empresa.", "S", "Transferência de material")
	INSERT INTO cfop VALUES (339, "5600", "CRÉDITOS E RESSARCIMENTOS DE ICMS", "", "S", "CRÉDITOS E RESSARCIMENTOS")
	INSERT INTO cfop VALUES (340, "5601", "Transferência de crédito de ICMS acumulado", "Classificam-se neste código os lançamentos destinados ao registro da transferência de créditos de " + CHR(13) + "ICMS para outras empresas.", "S", "Transferência de crédito")
	INSERT INTO cfop VALUES (341, "5602", "Transferência de saldo credor de ICMS para outro estabelecimento da mesma empresa, destinado à compensação de saldo devedor de ICMS", "Classificam-se neste código os lançamentos destinados ao registro da transferência de saldos " + CHR(13) + "credores de ICMS para outros estabelecimentos da mesma empresa, destinados à compensação do saldo " + CHR(13) + "devedor desses estabelecimentos.", "S", "Transferência de saldo")
	INSERT INTO cfop VALUES (342, "5603", "Ressarcimento de ICMS retido por substituição tributária", "Classificam-se neste código os lançamentos destinados ao registro de ressarcimento de ICMS retido " + CHR(13) + "por substituição tributária a contribuinte substituído, efetuado pelo contribuinte substituto, nas " + CHR(13) + "hipóteses previstas na legislação aplicável.", "S", "Ressarcimento de ICMS")
	INSERT INTO cfop VALUES (343, "5900", "OUTRAS SAÍDAS DE MERCADORIAS OU PRESTAÇÕES DE SERVIÇOS", "", "S", "OUTRAS SAÍDAS DE MERCADORIAS")
	INSERT INTO cfop VALUES (344, "5901", "Remessa para industrialização por encomenda", "Classificam-se neste código as remessas de insumos remetidos para industrialização por encomenda, a " + CHR(13) + "ser realizada em outra empresa ou em outro estabelecimento da mesma empresa.", "S", "Remessa para industrialização")
	INSERT INTO cfop VALUES (345, "5902", "Retorno de mercadoria utilizada na industrialização por encomenda", "Classificam-se neste código as remessas, pelo estabelecimento industrializador, dos insumos " + CHR(13) + "recebidos para industrialização e incorporados ao produto final, por encomenda de outra empresa ou " + CHR(13) + "de outro estabelecimento da mesma empresa. O valor dos insumos nesta operação deverá ser igual ao " + CHR(13) + "valor dos insumos recebidos para industrialização.", "S", "Retorno de mercadoria")
	INSERT INTO cfop VALUES (346, "5903", "Retorno de mercadoria recebida para industrialização e não aplicada no referido processo", "Classificam-se neste código as remessas em devolução de insumos recebidos para industrialização e " + CHR(13) + "não aplicados no referido processo.", "S", "Retorno de mercadoria")
	INSERT INTO cfop VALUES (347, "5904", "Remessa para venda fora do estabelecimento", "Classificam-se neste código as remessas de mercadorias para venda fora do estabelecimento, inclusive" + CHR(13) + " por meio de veículos.", "S", "Remessa para venda")
	INSERT INTO cfop VALUES (348, "5905", "Remessa para depósito fechado ou armazém geral", " Classificam-se neste código as remessas de mercadorias para depósito em depósito fechado ou armazém" + CHR(13) + " geral.", "S", "Remessa para depósito")
	INSERT INTO cfop VALUES (349, "5906", "Retorno de mercadoria depositada em depósito fechado ou armazém geral", "Classificam-se neste código os retornos de mercadorias depositadas em depósito fechado ou armazém " + CHR(13) + "geral ao estabelecimento depositante.", "S", "Retorno de mercadoria")
	INSERT INTO cfop VALUES (350, "5907", "Retorno simbólico de mercadoria depositada em depósito fechado ou armazém geral", "Classificam-se neste código os retornos simbólicos de mercadorias recebidas para depósito em " + CHR(13) + "depósito fechado ou armazém geral, quando as mercadorias depositadas tenham sido objeto de saída a " + CHR(13) + "qualquer título e que não devam retornar ao estabelecimento depositante.", "S", "Retorno simbólico")
	INSERT INTO cfop VALUES (351, "5908", "Remessa de bem por conta de contrato de comodato", " Classificam-se neste código as remessas de bens para o cumprimento de contrato de comodato.", "S", "Remessa de bem")
	INSERT INTO cfop VALUES (352, "5909", "Retorno de bem recebido por conta de contrato de comodato", " Classificam-se neste código as remessas de bens em devolução após cumprido o contrato de comodato.", "S", "Retorno de bem")
	INSERT INTO cfop VALUES (353, "5910", "Remessa em bonificação, doação ou brinde", " Classificam-se neste código as remessas de mercadorias a título de bonificação, doação ou brinde.", "S", "Remessa em bonificação")
	INSERT INTO cfop VALUES (354, "5911", "Remessa de amostra grátis", " Classificam-se neste código as remessas de mercadorias a título de amostra grátis.", "S", "Remessa de amostra grátis")
	INSERT INTO cfop VALUES (355, "5912", "Remessa de mercadoria ou bem para demonstração", " Classificam-se neste código as remessas de mercadorias ou bens para demonstração.", "S", "Remessa de mercadoria ou bem")
	INSERT INTO cfop VALUES (356, "5913", "Retorno de mercadoria ou bem recebido para demonstração", " Classificam-se neste código as remessas em devolução de mercadorias ou bens recebidos para " + CHR(13) + "demonstração.", "S", "Retorno de mercadoria ou bem")
	INSERT INTO cfop VALUES (357, "5914", "Remessa de mercadoria ou bem para exposição ou feira", " Classificam-se neste código as remessas de mercadorias ou bens para exposição ou feira.", "S", "Remessa de mercadoria ou bem")
	INSERT INTO cfop VALUES (358, "5915", "Remessa de mercadoria ou bem para conserto ou reparo", " Classificam-se neste código as remessas de mercadorias ou bens para conserto ou reparo.", "S", "Remessa de mercadoria ou bem")
	INSERT INTO cfop VALUES (359, "5916", "Retorno de mercadoria ou bem recebido para conserto ou reparo", " Classificam-se neste código as remessas em devolução de mercadorias ou bens recebidos para conserto" + CHR(13) + " ou reparo.", "S", "Retorno de mercadoria ou bem")
	INSERT INTO cfop VALUES (360, "5917", "Remessa de mercadoria em consignação mercantil ou industrial", " Classificam-se neste código as remessas de mercadorias a título de consignação mercantil ou " + CHR(13) + "industrial.", "S", "Remessa de mercadoria")
	INSERT INTO cfop VALUES (361, "5918", "Devolução de mercadoria recebida em consignação mercantil ou industrial", "Classificam-se neste código as devoluções de mercadorias recebidas anteriormente a título de " + CHR(13) + "consignação mercantil ou industrial.", "S", "Devolução de mercadoria")
	INSERT INTO cfop VALUES (362, "5919", "Devolução simbólica de mercadoria vendida ou utilizada em processo industrial, recebida anteriormente em consignação mercantil ou industrial", "Classificam-se neste código as devoluções simbólicas de mercadorias vendidas ou utilizadas em " + CHR(13) + "processo industrial, que tenham sido recebidas anteriormente a título de consignação mercantil ou " + CHR(13) + "industrial.", "S", "Devolução simbólica")
	INSERT INTO cfop VALUES (363, "5920", "Remessa de vasilhame ou sacaria", " Classificam-se neste código as remessas de vasilhame ou sacaria.", "S", "Remessa vasilhame ou sacaria")
	INSERT INTO cfop VALUES (364, "5921", "Devolução de vasilhame ou sacaria", " Classificam-se neste código as saídas por devolução de vasilhame ou sacaria.", "S", "Devolução vasilhame ou sacaria")
	INSERT INTO cfop VALUES (365, "5922", "Lançamento efetuado a título de simples faturamento decorrente de venda para entrega futura", "Classificam-se neste código os registros efetuados a título de simples faturamento decorrente de " + CHR(13) + "venda para entrega futura.", "S", "Lançamento efetuado")
	INSERT INTO cfop VALUES (366, "5923", "Remessa de mercadoria por conta e ordem de terceiros, em venda à ordem", "Classificam-se neste código as saídas correspondentes à entrega de mercadorias por conta e ordem de " + CHR(13) + "terceiros, em vendas à ordem, cuja venda ao adquirente originário, foi classificada nos códigos " + CHR(13) + "" + '"' + "5.118 – Venda de produção do estabelecimento entregue ao destinatário por conta e ordem do " + CHR(13) + "adquirente originário, em venda à ordem" + '"' + " ou " + '"' + "5.119 – Venda de mercadoria adquirida ou recebida de " + CHR(13) + "terceiros entregue ao destinatário por conta e ordem do adquirente originário, em venda à ordem" + '"' + ".", "S", "Remessa de mercadoria")
	INSERT INTO cfop VALUES (367, "5924", "Remessa para industrialização por conta e ordem do adquirente da mercadoria, quando esta não transitar pelo estabelecimento do adquirente", "Classificam-se neste código as saídas de insumos com destino a estabelecimento industrializador, " + CHR(13) + "para serem industrializados por conta e ordem do adquirente, nas hipóteses em que os insumos não " + CHR(13) + "tenham transitado pelo estabelecimento do adquirente dos mesmos.", "S", "Remessa para industrialização")
	INSERT INTO cfop VALUES (368, "5925", "Retorno de mercadoria recebida para industrialização por conta e ordem do adquirente da mercadoria, quando aquela não transitar pelo estabelecimento do adquirente", "Classificam-se neste código as remessas, pelo estabelecimento industrializador, dos insumos " + CHR(13) + "recebidos, por conta e ordem do adquirente, para industrialização e incorporados ao produto final, " + CHR(13) + "nas hipóteses em que os insumos não tenham transitado pelo estabelecimento do adquirente. O valor " + CHR(13) + "dos insumos nesta operação deverá ser igual ao valor dos insumos recebidos para industrialização.", "S", "Retorno de mercadoria")
	INSERT INTO cfop VALUES (369, "5926", "Lançamento efetuado a título de reclassificação de mercadoria decorrente de formação de kit ou de sua desagregação", "Classificam-se neste código os registros efetuados a título de reclassificação decorrente de " + CHR(13) + "formação de kit de mercadorias ou de sua desagregação.", "S", "Lançamento efetuado")
	INSERT INTO cfop VALUES (370, "5927", "Lançamento efetuado a título de baixa de estoque decorrente de perda, roubo ou deterioração", "Classificam-se neste código os registros efetuados a título de baixa de estoque decorrente de perda," + CHR(13) + " roubou ou deterioração das mercadorias.", "S", "Lançamento efetuado")
	INSERT INTO cfop VALUES (371, "5928", "Lançamento efetuado a título de baixa de estoque decorrente do encerramento da atividade da empresa", "Classificam-se neste código os registros efetuados a título de baixa de estoque decorrente do " + CHR(13) + "encerramento das atividades da empresa.", "S", "Lançamento efetuado")
	INSERT INTO cfop VALUES (372, "5929", "Lançamento efetuado em decorrência de emissão de documento fiscal relativo a operação ou prestação também registrada em equipamento Emissor de Cupom Fiscal – ECF", "Classificam-se neste código os registros relativos aos documentos fiscais emitidos em operações ou " + CHR(13) + "prestações que também tenham sido registradas em equipamento Emissor de Cupom Fiscal – ECF.", "S", "Lançamento efetuado")
	INSERT INTO cfop VALUES (373, "5931", "Lançamento efetuado em decorrência da responsabilidade de retenção do imposto por substituição tributária, atribuída ao remetente ou alienante da mercadoria, pelo serviço de transporte realizado por t", "Classificam-se neste código exclusivamente os lançamentos efetuados pelo remetente ou alienante da " + CHR(13) + "mercadoria quando lhe for atribuída a responsabilidade pelo recolhimento do imposto devido pelo " + CHR(13) + "serviço de transporte realizado por transportador autônomo ou por transportador não inscrito na " + CHR(13) + "unidade da Federação onde iniciado o serviço.", "S", "Lançamento efetuado")
	INSERT INTO cfop VALUES (374, "5932", "Prestação de serviço de transporte iniciada em unidade da Federação diversa daquela onde inscrito o prestador", "Classificam-se neste código as prestações de serviço de transporte que tenham sido iniciadas em " + CHR(13) + "unidade da Federação diversa daquela onde o prestador está inscrito como contribuinte.", "S", "Prestação de serviço")
	INSERT INTO cfop VALUES (375, "5949", "Outra saída de mercadoria ou prestação de serviço não especificado", "Classificam-se neste código as outras saídas de mercadorias ou prestações de serviços que não tenham" + CHR(13) + " sido especificados nos códigos anteriores.", "S", "Outra saída de mercadoria")
	INSERT INTO cfop VALUES (376, "6000", "SAÍDAS OU PRESTAÇÕES DE SERVIÇOS PARA OUTROS ESTADOS", "Classificam-se, neste grupo, as operações ou prestações em que o estabelecimento remetente esteja " + CHR(13) + "localizado em unidade da Federação diversa daquela do destinatário", "S", "SAÍDAS OU PREST. DE SERVIÇOS")
	INSERT INTO cfop VALUES (377, "6100", "VENDAS DE PRODUÇÃO PRÓPRIA OU DE TERCEIROS", "", "S", "VENDAS DE PRODUÇÃO")
	INSERT INTO cfop VALUES (378, "6101", "Venda de produção do estabelecimento", "Classificam-se neste código as vendas de produtos industrializados no estabelecimento. Também serão " + CHR(13) + "classificadas neste código as vendas de mercadorias por estabelecimento industrial de cooperativa " + CHR(13) + "destinadas a seus cooperados ou a estabelecimento de outra cooperativa.", "S", "Venda de produção do estab.")
	INSERT INTO cfop VALUES (379, "6102", "Venda de mercadoria adquirida ou recebida de terceiros", "Classificam-se neste código as vendas de mercadorias adquiridas ou recebidas de terceiros para " + CHR(13) + "industrialização ou comercialização, que não tenham sido objeto de qualquer processo industrial no " + CHR(13) + "estabelecimento. Também serão classificadas neste código as vendas de mercadorias por " + CHR(13) + "estabelecimento comercial de cooperativa destinadas a seus cooperados ou estabelecimento de outra " + CHR(13) + "cooperativa.", "S", "Venda de mercadoria")
	INSERT INTO cfop VALUES (380, "6103", "Venda de produção do estabelecimento, efetuada fora do estabelecimento", "Classificam-se neste código as vendas efetuadas fora do estabelecimento, inclusive por meio de " + CHR(13) + "veículo, de produtos industrializados no estabelecimento.", "S", "Venda de produção do estab.")
	INSERT INTO cfop VALUES (381, "6104", "Venda de mercadoria adquirida ou recebida de terceiros, efetuada fora do estabelecimento", "Classificam-se neste código as vendas efetuadas fora do estabelecimento, inclusive por meio de " + CHR(13) + "veículo, de mercadorias adquiridas ou recebidas de terceiros para industrialização ou " + CHR(13) + "comercialização, que não tenham sido objeto de qualquer processo industrial no estabelecimento.", "S", "Venda de mercadoria")
	INSERT INTO cfop VALUES (382, "6105", "Venda de produção do estabelecimento que não deva por ele transitar", "Classificam-se neste código as vendas de produtos industrializados no estabelecimento, armazenados " + CHR(13) + "em depósito fechado, armazém geral ou outro sem que haja retorno ao estabelecimento depositante.", "S", "Venda de produção do estab.")
	INSERT INTO cfop VALUES (383, "6106", "Venda de mercadoria adquirida ou recebida de terceiros, que não deva por ele transitar", "Classificam-se neste código as vendas de mercadorias adquiridas ou recebidas de terceiros para " + CHR(13) + "industrialização ou comercialização, armazenadas em depósito fechado, armazém geral ou outro, que " + CHR(13) + "não tenham sido objeto de qualquer processo industrial no estabelecimento sem que haja retorno ao " + CHR(13) + "estabelecimento depositante. Também serão classificadas neste código as vendas de mercadorias " + CHR(13) + "importadas, cuja saída ocorra do recinto alfandegado ou da repartição alfandegária onde se processou" + CHR(13) + " o desembaraço aduaneiro, com destino ao estabelecimento do comprador, sem transitar pelo " + CHR(13) + "estabelecimento do importador.", "S", "Venda de mercadoria")
	INSERT INTO cfop VALUES (384, "6107", "Venda de produção do estabelecimento, destinada a não contribuinte", "Classificam-se neste código as vendas de produtos industrializados no estabelecimento, destinadas a " + CHR(13) + "não contribuintes. Quaisquer operações de venda destinadas a não contribuintes deverão ser " + CHR(13) + "classificadas neste código.", "S", "Venda de produção do estab.")
	INSERT INTO cfop VALUES (385, "6108", "Venda de mercadoria adquirida ou recebida de terceiros, destinada a não contribuinte", "Classificam-se neste código as vendas de mercadorias adquiridas ou recebidas de terceiros para " + CHR(13) + "industrialização ou comercialização, que não tenham sido objeto de qualquer processo industrial no " + CHR(13) + "estabelecimento, destinadas a não contribuintes. Quaisquer operações de venda destinadas a não " + CHR(13) + "contribuintes deverão ser classificadas neste código.", "S", "Venda de mercadoria")
	INSERT INTO cfop VALUES (386, "6109", "Venda de produção do estabelecimento, destinada à Zona Franca de Manaus ou Áreas de Livre Comércio", "Classificam-se neste código as vendas de produtos industrializados pelo estabelecimento, destinados " + CHR(13) + "à Zona Franca de Manaus ou Áreas de Livre Comércio.", "S", "Venda de produção do estab.")
	INSERT INTO cfop VALUES (387, "6110", "Venda de mercadoria adquirida ou recebida de terceiros, destinada à Zona Franca de Manaus ou Áreas de Livre Comércio", "Classificam-se neste código as vendas de mercadorias adquiridas ou recebidas de terceiros, que não " + CHR(13) + "tenham sido objeto de qualquer processo industrial no estabelecimento, destinadas à Zona Franca de " + CHR(13) + "Manaus ou Áreas de Livre Comércio.", "S", "Venda de mercadoria")
	INSERT INTO cfop VALUES (388, "6111", "Venda de produção do estabelecimento remetida anteriormente em consignação industrial", "Classificam-se neste código as vendas efetivas de produtos industrializados no estabelecimento " + CHR(13) + "remetidos anteriormente a título de consignação industrial.", "S", "Venda de produção do estab.")
	INSERT INTO cfop VALUES (389, "6112", "Venda de mercadoria adquirida ou recebida de Terceiros remetida anteriormente em consignação industrial", "Classificam-se neste código as vendas efetivas de mercadorias adquiridas ou recebidas de terceiros, " + CHR(13) + "que não tenham sido objeto de qualquer processo industrial no estabelecimento, remetidas " + CHR(13) + "anteriormente a título de consignação industrial.", "S", "Venda de mercadoria")
	INSERT INTO cfop VALUES (390, "6113", "Venda de produção do estabelecimento remetida anteriormente em consignação mercantil", "Classificam-se neste código as vendas efetivas de produtos industrializados no estabelecimento " + CHR(13) + "remetidos anteriormente a título de consignação mercantil.", "S", "Venda de produção do estab.")
	INSERT INTO cfop VALUES (391, "6114", "Venda de mercadoria adquirida ou recebida de terceiros remetida anteriormente em consignação mercantil", "Classificam-se neste código as vendas efetivas de mercadorias adquiridas ou recebidas de terceiros, " + CHR(13) + "que não tenham sido objeto de qualquer processo industrial no estabelecimento, remetidas " + CHR(13) + "anteriormente a título de consignação mercantil.", "S", "Venda de mercadoria")
	INSERT INTO cfop VALUES (392, "6115", "Venda de mercadoria adquirida ou recebida de terceiros, recebida anteriormente em consignação mercantil", "Classificam-se neste código as vendas de mercadorias adquiridas ou recebidas de terceiros, recebidas" + CHR(13) + " anteriormente a título de consignação mercantil.", "S", "Venda de mercadoria")
	INSERT INTO cfop VALUES (393, "6116", "Venda de produção do estabelecimento originada de encomenda para entrega futura", "Classificam-se neste código as vendas de produtos industrializados pelo estabelecimento, quando da " + CHR(13) + "saída real do produto, cujo faturamento tenha sido classificado no código " + '"' + "6.922 – Lançamento " + CHR(13) + "efetuado a título de simples faturamento decorrente de venda para entrega futura" + '"' + ".", "S", "Venda de produção do estab.")
	INSERT INTO cfop VALUES (394, "6117", "Venda de mercadoria adquirida ou recebida de terceiros, originada de encomenda para entrega futura", "Classificam-se neste código as vendas de mercadorias adquiridas ou recebidas de terceiros, que não " + CHR(13) + "tenham sido objeto de qualquer processo industrial no estabelecimento, quando da saída real da " + CHR(13) + "mercadoria, cujo faturamento tenha sido classificado no código " + '"' + "6.922 – Lançamento efetuado a título" + CHR(13) + " de simples faturamento decorrente de venda para entrega futura" + '"' + ".", "S", "Venda de mercadoria")
	INSERT INTO cfop VALUES (395, "6118", "Venda de produção do estabelecimento entregue ao destinatário por conta e ordem do adquirente originário, em venda à ordem", "Classificam-se neste código as vendas à ordem de produtos industrializados pelo estabelecimento, " + CHR(13) + "entregues ao destinatário por conta e ordem do adquirente originário.", "S", "Venda de produção do estab.")
	INSERT INTO cfop VALUES (396, "6119", "Venda de mercadoria adquirida ou recebida de terceiros entregue ao destinatário por conta e ordem do adquirente originário, em venda à ordem", "Classificam-se neste código as vendas à ordem de mercadorias adquiridas ou recebidas de terceiros, " + CHR(13) + "que não tenham sido objeto de qualquer processo industrial no estabelecimento, entregues ao " + CHR(13) + "destinatário por conta e ordem do adquirente originário.", "S", "Venda de mercadoria")
	INSERT INTO cfop VALUES (397, "6120", "Venda de mercadoria adquirida ou recebida de terceiros entregue ao destinatário pelo vendedor remetente, em venda à ordem", "Classificam-se neste código as vendas à ordem de mercadorias adquiridas ou recebidas de terceiros, " + CHR(13) + "que não tenham sido objeto de qualquer processo industrial no estabelecimento, entregues pelo " + CHR(13) + "vendedor remetente ao destinatário, cuja compra seja classificada, pelo adquirente originário, no " + CHR(13) + "código " + '"' + "2.118 – Compra de mercadoria pelo adquirente originário, entregue pelo vendedor remetente ao" + CHR(13) + " destinatário, em venda à ordem" + '"' + ".", "S", "Venda de mercadoria")
	INSERT INTO cfop VALUES (398, "6122", "Venda de produção do estabelecimento remetida para industrialização, por conta e ordem do adquirente, sem transitar pelo estabelecimento do adquirente", "Classificam-se neste código as vendas de produtos industrializados no estabelecimento, remetidos " + CHR(13) + "para serem industrializados em outro estabelecimento, por conta e ordem do adquirente, sem que os " + CHR(13) + "produtos tenham transitado pelo estabelecimento do adquirente.", "S", "Venda de produção do estab.")
	INSERT INTO cfop VALUES (399, "6123", "Venda de mercadoria adquirida ou recebida de terceiros remetida para industrialização, por conta e ordem do adquirente, sem transitar pelo estabelecimento do adquirente", "Classificam-se neste código as vendas de mercadorias adquiridas ou recebidas de terceiros, que não " + CHR(13) + "tenham sido objeto de qualquer processo industrial no estabelecimento, remetidas para serem " + CHR(13) + "industrializadas em outro estabelecimento, por conta e ordem do adquirente, sem que as mercadorias " + CHR(13) + "tenham transitado pelo estabelecimento do adquirente.", "S", "Venda de mercadoria")
	INSERT INTO cfop VALUES (400, "6124", "Industrialização efetuada para outra empresa", "Classificam-se neste código as saídas de mercadorias industrializadas para terceiros, compreendendo " + CHR(13) + "os valores referentes aos serviços prestados e os das mercadorias de propriedade do industrializador" + CHR(13) + " empregadas no processo industrial.", "S", "Industrialização")
	INSERT INTO cfop VALUES (401, "6125", "Industrialização efetuada para outra empresa quando a mercadoria recebida para utilização no processo de industrialização não transitar pelo estabelecimento adquirente da mercadoria", "Classificam-se neste código as saídas de mercadorias industrializadas para outras empresas, em que " + CHR(13) + "as mercadorias recebidas para utilização no processo de industrialização não tenham transitado pelo " + CHR(13) + "estabelecimento do adquirente das mercadorias, compreendendo os valores referentes aos serviços " + CHR(13) + "prestados e os das mercadorias de propriedade do industrializador empregadas no processo industrial.", "S", "Industrialização")
	INSERT INTO cfop VALUES (402, "6150", "TRANSFERÊNCIAS DE PRODUÇÃO PRÓPRIA OU DE TERCEIROS", "", "S", "TRANSFERÊNCIAS DE PRODUÇÃO")
	INSERT INTO cfop VALUES (403, "6151", "Transferência de produção do estabelecimento", "Classificam-se neste código os produtos industrializados no estabelecimento e transferidos para " + CHR(13) + "outro estabelecimento da mesma empresa.", "S", "Transferência de produção")
	INSERT INTO cfop VALUES (404, "6152", "Transferência de mercadoria adquirida ou recebida de terceiros", "Classificam-se neste código as mercadorias adquiridas ou recebidas de terceiros para " + CHR(13) + "industrialização ou comercialização e que não tenham sido objeto de qualquer processo industrial no " + CHR(13) + "estabelecimento, transferidas para outro estabelecimento da mesma empresa.", "S", "Transferência de mercadoria")
	INSERT INTO cfop VALUES (405, "6153", "Transferência de energia elétrica", "Classificam-se neste código as transferências de energia elétrica para outro estabelecimento da " + CHR(13) + "mesma empresa, para distribuição.", "S", "Transf. de energia elétrica")
	INSERT INTO cfop VALUES (406, "6155", "Transferência de produção do estabelecimento, que não deva por ele transitar", "Classificam-se neste código as transferências para outro estabelecimento da mesma empresa, de " + CHR(13) + "produtos industrializados no estabelecimento que tenham sido remetidos para armazém geral, depósito " + CHR(13) + "fechado ou outro, sem que haja retorno ao estabelecimento depositante.", "S", "Transf. de produção do estab.")
	INSERT INTO cfop VALUES (407, "6156", "Transferência de mercadoria adquirida ou recebida de terceiros, que não deva por ele transitar", "Classificam-se neste código as transferências para outro estabelecimento da mesma empresa, de " + CHR(13) + "mercadorias adquiridas ou recebidas de terceiros para industrialização ou comercialização, que não " + CHR(13) + "tenham sido objeto de qualquer processo industrial, remetidas para armazém geral, depósito fechado " + CHR(13) + "ou outro, sem que haja retorno ao estabelecimento depositante.", "S", "Transferência de mercadoria")
	INSERT INTO cfop VALUES (408, "6200", "DEVOLUÇÕES DE COMPRAS PARA INDUSTRIALIZAÇÃO, COMERCIALIZAÇÃO OU ANULAÇÕES DE VALORES", "", "S", "DEVOLUÇÕES DE COMPRAS")
	INSERT INTO cfop VALUES (409, "6201", "Devolução de compra para industrialização", "Classificam-se neste código as devoluções de mercadorias adquiridas para serem utilizadas em " + CHR(13) + "processo de industrialização, cujas entradas tenham sido classificadas como " + '"' + "Compra para " + CHR(13) + "industrialização" + '"' + ".", "S", "Devolução de compra")
	INSERT INTO cfop VALUES (410, "6202", "Devolução de compra para comercialização", "Classificam-se neste código as devoluções de mercadorias adquiridas para serem comercializadas, " + CHR(13) + "cujas entradas tenham sido classificadas como " + '"' + "Compra para comercialização" + '"' + ".", "S", "Devolução de compra")
	INSERT INTO cfop VALUES (411, "6205", "Anulação de valor relativo a aquisição de serviço de comunicação", "Classificam-se neste código as anulações correspondentes a valores faturados indevidamente, " + CHR(13) + "decorrentes das aquisições de serviços de comunicação.", "S", "Anulação de valor")
	INSERT INTO cfop VALUES (412, "6206", "Anulação de valor relativo a aquisição de serviço de transporte", "Classificam-se neste código as anulações correspondentes a valores faturados indevidamente, " + CHR(13) + "decorrentes das aquisições de serviços de transporte.", "S", "Anulação de valor")
	INSERT INTO cfop VALUES (413, "6207", "Anulação de valor relativo à compra de energia elétrica", "Classificam-se neste código as anulações correspondentes a valores faturados indevidamente, " + CHR(13) + "decorrentes da compra de energia elétrica.", "S", "Anulação de valor")
	INSERT INTO cfop VALUES (414, "6208", "Devolução de mercadoria recebida em transferência para industrialização", "Classificam-se neste código as devoluções de mercadorias recebidas em transferência de outros " + CHR(13) + "estabelecimentos da mesma empresa, para serem utilizadas em processo de industrialização.", "S", "Devolução de mercadoria")
	INSERT INTO cfop VALUES (415, "6209", "Devolução de mercadoria recebida em transferência para comercialização", "Classificam-se neste código as devoluções de mercadorias recebidas em transferência de outro " + CHR(13) + "estabelecimento da mesma empresa, para serem comercializadas.", "S", "Devolução de mercadoria")
	INSERT INTO cfop VALUES (416, "6210", "Devolução de compra para utilização na prestação de serviço", "Classificam-se neste código as devoluções de mercadorias adquiridas para utilização na prestação de " + CHR(13) + "serviços, cujas entradas tenham sido classificadas no código " + '"' + "2.126 – Compra para utilização na " + CHR(13) + "prestação de serviço" + '"' + ".", "S", "Devolução de compra")
	INSERT INTO cfop VALUES (417, "6250", "VENDAS DE ENERGIA ELÉTRICA", "", "S", "VENDAS DE ENERGIA ELÉTRICA")
	INSERT INTO cfop VALUES (418, "6251", "Venda de energia elétrica para distribuição ou comercialização", "Classificam-se neste código as vendas de energia elétrica destinada à distribuição ou " + CHR(13) + "comercialização. Também serão classificadas neste código as vendas de energia elétrica destinada a " + CHR(13) + "cooperativas para distribuição aos seus cooperados.", "S", "Venda de energia elétrica")
	INSERT INTO cfop VALUES (419, "6252", "Venda de energia elétrica para estabelecimento industrial", "Classificam-se neste código as vendas de energia elétrica para consumo por estabelecimento " + CHR(13) + "industrial. Também serão classificadas neste código as vendas de energia elétrica destinada a " + CHR(13) + "estabelecimento industrial de cooperativa.", "S", "Venda de energia elétrica")
	INSERT INTO cfop VALUES (420, "6253", "Venda de energia elétrica para estabelecimento comercial", "Classificam-se neste código as vendas de energia elétrica para consumo por estabelecimento " + CHR(13) + "comercial. Também serão classificadas neste código as vendas de energia elétrica destinada a " + CHR(13) + "estabelecimento comercial de cooperativa.", "S", "Venda de energia elétrica")
	INSERT INTO cfop VALUES (421, "6254", "Venda de energia elétrica para estabelecimento prestador de serviço de transporte", "Classificam-se neste código as vendas de energia elétrica para consumo por estabelecimento de " + CHR(13) + "prestador de serviços de transporte.", "S", "Venda de energia elétrica")
	INSERT INTO cfop VALUES (422, "6255", "Venda de energia elétrica para estabelecimento prestador de serviço de comunicação", "Classificam-se neste código as vendas de energia elétrica para consumo por estabelecimento de " + CHR(13) + "prestador de serviços de comunicação.", "S", "Venda de energia elétrica")
	INSERT INTO cfop VALUES (423, "6256", "Venda de energia elétrica para estabelecimento de produtor rural", " Classificam-se neste código as vendas de energia elétrica para consumo por estabelecimento de " + CHR(13) + "produtor rural.", "S", "Venda de energia elétrica")
	INSERT INTO cfop VALUES (424, "6257", "Venda de energia elétrica para consumo por demanda contratada", "Classificam-se neste código as vendas de energia elétrica para consumo por demanda contratada, que " + CHR(13) + "prevalecerá sobre os demais códigos deste subgrupo.", "S", "Venda de energia elétrica")
	INSERT INTO cfop VALUES (425, "6258", "Venda de energia elétrica a não contribuinte", "Classificam-se neste código as vendas de energia elétrica a pessoas físicas ou a pessoas jurídicas " + CHR(13) + "não indicadas nos códigos anteriores.", "S", "Venda de energia elétrica")
	INSERT INTO cfop VALUES (426, "6300", "PRESTAÇÕES DE SERVIÇOS DE COMUNICAÇÃO", "", "S", "PRESTAÇÕES DE SERVIÇOS")
	INSERT INTO cfop VALUES (427, "6301", "Prestação de serviço de comunicação para execução de serviço da mesma natureza", "Classificam-se neste código as prestações de serviços de comunicação destinados às prestações de " + CHR(13) + "serviços da mesma natureza.", "S", "Prestação de serviço")
	INSERT INTO cfop VALUES (428, "6302", "Prestação de serviço de comunicação a estabelecimento industrial", "Classificam-se neste código as prestações de serviços de comunicação a estabelecimento industrial. " + CHR(13) + "Também serão classificados neste código os serviços de comunicação prestados a estabelecimento " + CHR(13) + "industrial de cooperativa.", "S", "Prestação de serviço")
	INSERT INTO cfop VALUES (429, "6303", "Prestação de serviço de comunicação a estabelecimento comercial", "Classificam-se neste código as prestações de serviços de comunicação a estabelecimento comercial. " + CHR(13) + "Também serão classificados neste código os serviços de comunicação prestados a estabelecimento " + CHR(13) + "comercial de cooperativa.", "S", "Prestação de serviço")
	INSERT INTO cfop VALUES (430, "6304", "Prestação de serviço de comunicação a estabelecimento de prestador de serviço de transporte", "Classificam-se neste código as prestações de serviços de comunicação a estabelecimento prestador de " + CHR(13) + "serviço de transporte.", "S", "Prestação de serviço")
	INSERT INTO cfop VALUES (431, "6305", "Prestação de serviço de comunicação a estabelecimento de geradora ou de distribuidora de energia elétrica", "Classificam-se neste código as prestações de serviços de comunicação a estabelecimento de geradora " + CHR(13) + "ou de distribuidora de energia elétrica.", "S", "Prestação de serviço")
	INSERT INTO cfop VALUES (432, "6306", "Prestação de serviço de comunicação a estabelecimento de produtor rural", " Classificam-se neste código as prestações de serviços de comunicação a estabelecimento de produtor " + CHR(13) + "rural.", "S", "Prestação de serviço")
	INSERT INTO cfop VALUES (433, "6307", "Prestação de serviço de comunicação a não contribuinte", "Classificam-se neste código as prestações de serviços de comunicação a pessoas físicas ou a pessoas " + CHR(13) + "jurídicas não indicadas nos códigos anteriores.", "S", "Prestação de serviço")
	INSERT INTO cfop VALUES (434, "6350", "PRESTAÇÕES DE SERVIÇOS DE TRANSPORTE", "", "S", "PRESTAÇÕES DE SERVIÇOS")
	INSERT INTO cfop VALUES (435, "6351", "Prestação de serviço de transporte para execução de serviço da mesma natureza", "Classificam-se neste código as prestações de serviços de transporte destinados às prestações de " + CHR(13) + "serviços da mesma natureza.", "S", "Prestação de serviço")
	INSERT INTO cfop VALUES (436, "6352", "Prestação de serviço de transporte a estabelecimento industrial", "Classificam-se neste código as prestações de serviços de transporte a estabelecimento industrial. " + CHR(13) + "Também serão classificados neste código os serviços de transporte prestados a estabelecimento " + CHR(13) + "industrial de cooperativa.", "S", "Prestação de serviço")
	INSERT INTO cfop VALUES (437, "6353", "Prestação de serviço de transporte a estabelecimento comercial", "Classificam-se neste código as prestações de serviços de transporte a estabelecimento comercial. " + CHR(13) + "Também serão classificados neste código os serviços de transporte prestados a estabelecimento " + CHR(13) + "comercial de cooperativa.", "S", "Prestação de serviço")
	INSERT INTO cfop VALUES (438, "6354", "Prestação de serviço de transporte a estabelecimento de prestador de serviço de comunicação", "Classificam-se neste código as prestações de serviços de transporte a estabelecimento prestador de " + CHR(13) + "serviços de comunicação.", "S", "Prestação de serviço")
	INSERT INTO cfop VALUES (439, "6355", "Prestação de serviço de transporte a estabelecimento de geradora ou de distribuidora de energia elétrica", "Classificam-se neste código as prestações de serviços de transporte a estabelecimento de geradora ou" + CHR(13) + " de distribuidora de energia elétrica.", "S", "Prestação de serviço")
	INSERT INTO cfop VALUES (440, "6356", "Prestação de serviço de transporte a estabelecimento de produtor rural", " Classificam-se neste código as prestações de serviços de transporte a estabelecimento de produtor " + CHR(13) + "rural.", "S", "Prestação de serviço")
	INSERT INTO cfop VALUES (441, "6357", "Prestação de serviço de transporte a não contribuinte", "Classificam-se neste código as prestações de serviços de transporte a pessoas físicas ou a pessoas " + CHR(13) + "jurídicas não indicadas nos códigos anteriores.", "S", "Prestação de serviço")
	INSERT INTO cfop VALUES (442, "6400", "SAÍDAS DE MERCADORIAS SUJEITAS AO REGIME DE SUBSTITUIÇÃO TRIBUTÁRIA", "", "S", "SAÍDAS DE MERCADORIAS")
	INSERT INTO cfop VALUES (443, "6401", "Venda de produção do estabelecimento em operação com produto sujeito ao regime de substituição tributária, na condição de contribuinte substituto", "Classificam-se neste código as vendas de produtos industrializados no estabelecimento em operações " + CHR(13) + "com produtos sujeitos ao regime de substituição tributária, na condição de contribuinte substituto. " + CHR(13) + "Também serão classificadas neste código as vendas de produtos industrializados por estabelecimento " + CHR(13) + "industrial de cooperativa sujeitos ao regime de substituição tributária, na condição de contribuinte" + CHR(13) + " substituto.", "S", "Venda de produção do estab.")
	INSERT INTO cfop VALUES (444, "6402", "Venda de produção do estabelecimento de produto sujeito ao regime de substituição tributária, em operação entre contribuintes substitutos do mesmo produto", "Classificam-se neste código as vendas de produtos sujeitos ao regime de substituição tributária " + CHR(13) + "industrializados no estabelecimento, em operações entre contribuintes substitutos do mesmo produto.", "S", "Venda de produção do estab.")
	INSERT INTO cfop VALUES (445, "6403", "Venda de mercadoria adquirida ou recebida de terceiros em operação com mercadoria sujeita ao regime de substituição tributária, na condição de contribuinte substituto", "Classificam-se neste código as vendas de mercadorias adquiridas ou recebidas de terceiros, na " + CHR(13) + "condição de contribuinte substituto, em operação com mercadorias sujeitas ao regime de substituição " + CHR(13) + "tributária.", "S", "Venda de mercadoria")
	INSERT INTO cfop VALUES (446, "6404", "Venda de mercadoria sujeita ao regime de substituição tributária, cujo imposto já tenha sido retido anteriormente", "Classificam-se neste código as vendas de mercadorias sujeitas ao regime de substituição tributária, " + CHR(13) + "na condição de substituto tributário, exclusivamente nas hipóteses em que o imposto já tenha sido " + CHR(13) + "retido anteriormente.", "S", "Venda de mercadoria")
	INSERT INTO cfop VALUES (447, "6408", "Transferência de produção do estabelecimento em operação com produto sujeito ao regime de substituição tributária", "Classificam-se neste código os produtos industrializados no estabelecimento e transferidos para " + CHR(13) + "outro estabelecimento da mesma empresa, em operações com produtos sujeitos ao regime de substituição" + CHR(13) + " tributária.", "S", "Transferência de produção")
	INSERT INTO cfop VALUES (448, "6409", "Transferência de mercadoria adquirida ou recebida de terceiros em operação com mercadoria sujeita ao regime de substituição tributária", "Classificam-se neste código as transferências para outro estabelecimento da mesma empresa, de " + CHR(13) + "mercadorias adquiridas ou recebidas de terceiros que não tenham sido objeto de qualquer processo " + CHR(13) + "industrial no estabelecimento, em operações com mercadorias sujeitas ao regime de substituição " + CHR(13) + "tributária.", "S", "Transferência de mercadoria")
	INSERT INTO cfop VALUES (449, "6410", "Devolução de compra para industrialização em operação com mercadoria sujeita ao regime de substituição tributária", "Classificam-se neste código as devoluções de mercadorias adquiridas para serem utilizadas em " + CHR(13) + "processo de industrialização cujas entradas tenham sido classificadas como " + '"' + "Compra para " + CHR(13) + "industrialização em operação com mercadoria sujeita ao regime de substituição tributária" + '"' + ".", "S", "Devolução de compra")
	INSERT INTO cfop VALUES (450, "6411", "Devolução de compra para comercialização em operação com mercadoria sujeita ao regime de substituição tributária", "Classificam-se neste código as devoluções de mercadorias adquiridas para serem comercializadas, " + CHR(13) + "cujas entradas tenham sido classificadas como " + '"' + "Compra para comercialização em operação com " + CHR(13) + "mercadoria sujeita ao regime de substituição tributária" + '"' + ".", "S", "Devolução de compra")
	INSERT INTO cfop VALUES (451, "6412", "Devolução de bem do ativo imobilizado, em operação com mercadoria sujeita ao regime de substituição tributária", "Classificam-se neste código as devoluções de bens adquiridos para integrar o ativo imobilizado do " + CHR(13) + "estabelecimento, cuja entrada tenha sido classificada no código " + '"' + "2.406 – Compra de bem para o ativo " + CHR(13) + "imobilizado cuja mercadoria está sujeita ao regime de substituição tributária" + '"' + ".", "S", "Devolução de bem")
	INSERT INTO cfop VALUES (452, "6413", "Devolução de mercadoria destinada ao uso ou consumo, em operação com mercadoria sujeita ao regime de substituição tributária", "Classificam-se neste código as devoluções de mercadorias adquiridas para uso ou consumo do " + CHR(13) + "estabelecimento, cuja entrada tenha sido classificada no código " + '"' + "2.407 – Compra de mercadoria para " + CHR(13) + "uso ou consumo cuja mercadoria está sujeita ao regime de substituição tributária" + '"' + ".", "S", "Devolução de mercadoria")
	INSERT INTO cfop VALUES (453, "6414", "Remessa de produção do estabelecimento para venda fora do estabelecimento em operação com produto sujeito ao regime de substituição tributária", "Classificam-se neste código as remessas de produtos industrializados pelo estabelecimento para serem" + CHR(13) + " vendidos fora do estabelecimento, inclusive por meio de veículos, em operações com produtos " + CHR(13) + "sujeitos ao regime de substituição tributária.", "S", "Remessa de produção do estab.")
	INSERT INTO cfop VALUES (454, "6415", "Remessa de mercadoria adquirida ou recebida de terceiros para venda fora do estabelecimento, em operação com mercadoria sujeita ao regime de substituição tributária", "Classificam-se neste código as remessas de mercadorias adquiridas ou recebidas de terceiros para " + CHR(13) + "serem vendidas fora do estabelecimento, inclusive por meio de veículos, em operações com mercadorias" + CHR(13) + " sujeitas ao regime de substituição tributária.", "S", "Remessa de mercadoria")
	INSERT INTO cfop VALUES (455, "6500", "REMESSAS COM FIM ESPECÍFICO DE EXPORTAÇÃO E EVENTUAIS DEVOLUÇÕES", "", "S", "REMESSAS COM FIM ESPECÍFICO")
	INSERT INTO cfop VALUES (456, "6501", "Remessa de produção do estabelecimento, com fim específico de exportação", "Classificam-se neste código as saídas de produtos industrializados pelo estabelecimento, remetidos " + CHR(13) + "com fim específico de exportação a trading company, empresa comercial exportadora ou outro " + CHR(13) + "estabelecimento do remetente.", "S", "Remessa de produção do estab.")
	INSERT INTO cfop VALUES (457, "6502", "Remessa de mercadoria adquirida ou recebida de terceiros, com fim específico de exportação", "Classificam-se neste código as saídas de mercadorias adquiridas ou recebidas de terceiros, remetidas" + CHR(13) + " com fim específico de exportação a trading company, empresa comercial exportadora ou outro " + CHR(13) + "estabelecimento do remetente.", "S", "Remessa de mercadoria")
	INSERT INTO cfop VALUES (458, "6503", "Devolução de mercadoria recebida com fim específico de exportação", "Classificam-se neste código as devoluções efetuadas por trading company, empresa comercial " + CHR(13) + "exportadora ou outro estabelecimento do destinatário, de mercadorias recebidas com fim específico de" + CHR(13) + " exportação, cujas entradas tenham sido classificadas no código " + '"' + "2.501 – Entrada de mercadoria " + CHR(13) + "recebida com fim específico de exportação" + '"' + ".", "S", "Devolução de mercadoria")
	INSERT INTO cfop VALUES (459, "6550", "OPERAÇÕES COM BENS DE ATIVO IMOBILIZADO E MATERIAIS PARA USO OU CONSUMO", "", "S", "OPERAÇÕES COM BENS")
	INSERT INTO cfop VALUES (460, "6551", "Venda de bem do ativo imobilizado", " Classificam-se neste código as vendas de bens integrantes do ativo imobilizado do estabelecimento.", "S", "Venda de bem")
	INSERT INTO cfop VALUES (461, "6552", "Transferência de bem do ativo imobilizado", "Classificam-se neste código os bens do ativo imobilizado transferidos para outro estabelecimento da " + CHR(13) + "mesma empresa.", "S", "Transferência de bem")
	INSERT INTO cfop VALUES (462, "6553", "Devolução de compra de bem para o ativo imobilizado", "Classificam-se neste código as devoluções de bens adquiridos para integrar o ativo imobilizado do " + CHR(13) + "estabelecimento, cuja entrada foi classificada no código " + '"' + "2.551 - Compra de bem para o ativo " + CHR(13) + "imobilizado" + '"' + ".", "S", "Devolução de compra")
	INSERT INTO cfop VALUES (463, "6554", "Remessa de bem do ativo imobilizado para uso fora do estabelecimento", " Classificam-se neste código as remessas de bens do ativo imobilizado para uso fora do " + CHR(13) + "estabelecimento.", "S", "Remessa de bem")
	INSERT INTO cfop VALUES (464, "6555", "Devolução de bem do ativo imobilizado de terceiro, recebido para uso no estabelecimento", "Classificam-se neste código as saídas em devolução, de bens do ativo imobilizado de terceiros, " + CHR(13) + "recebidos para uso no estabelecimento, cuja entrada tenha sido classificada no código " + '"' + "2.555 – " + CHR(13) + "Entrada de bem do ativo imobilizado de terceiro, remetido para uso no estabelecimento" + '"' + ".", "S", "Devolução de bem")
	INSERT INTO cfop VALUES (465, "6556", "Devolução de compra de material de uso ou consumo", "Classificam-se neste código as devoluções de mercadorias destinadas ao uso ou consumo do " + CHR(13) + "estabelecimento, cuja entrada tenha sido classificada no código " + '"' + "2.556 – Compra de material para uso" + CHR(13) + " ou consumo" + '"' + ".", "S", "Devolução de compra")
	INSERT INTO cfop VALUES (466, "6557", "Transferência de material de uso ou consumo", "Classificam-se neste código os materiais de uso ou consumo transferidos para outro estabelecimento " + CHR(13) + "da mesma empresa.", "S", "Transferência de material")
	INSERT INTO cfop VALUES (467, "6600", "CRÉDITOS E RESSARCIMENTOS DE ICMS", "", "S", "CRÉDITOS E RESSARCIMENTOS")
	INSERT INTO cfop VALUES (468, "6603", "Ressarcimento de ICMS retido por substituição tributária", "Classificam-se neste código os lançamentos destinados ao registro de ressarcimento de ICMS retido " + CHR(13) + "por substituição tributária a contribuinte substituído, efetuado pelo contribuinte substituto, nas " + CHR(13) + "hipóteses previstas na legislação aplicável.", "S", "Ressarcimento de ICMS")
	INSERT INTO cfop VALUES (469, "6900", "OUTRAS SAÍDAS DE MERCADORIAS OU PRESTAÇÕES DE SERVIÇOS", "", "S", "OUTRAS SAÍDAS DE MERCADORIAS")
	INSERT INTO cfop VALUES (470, "6901", "Remessa para industrialização por encomenda", "Classificam-se neste código as remessas de insumos remetidos para industrialização por encomenda, a " + CHR(13) + "ser realizada em outra empresa ou em outro estabelecimento da mesma empresa.", "S", "Remessa para industrialização")
	INSERT INTO cfop VALUES (471, "6902", "Retorno de mercadoria utilizada na industrialização por encomenda", "Classificam-se neste código as remessas, pelo estabelecimento industrializador, dos insumos " + CHR(13) + "recebidos para industrialização e incorporados ao produto final, por encomenda de outra empresa ou " + CHR(13) + "de outro estabelecimento da mesma empresa. O valor dos insumos nesta operação deverá ser igual ao " + CHR(13) + "valor dos insumos recebidos para industrialização.", "S", "Retorno de mercadoria")
	INSERT INTO cfop VALUES (472, "6903", "Retorno de mercadoria recebida para industrialização e não aplicada no referido processo", "Classificam-se neste código as remessas em devolução de insumos recebidos para industrialização e " + CHR(13) + "não aplicados no referido processo.", "S", "Retorno de mercadoria")
	INSERT INTO cfop VALUES (473, "6904", "Remessa para venda fora do estabelecimento", "Classificam-se neste código as remessas de mercadorias para venda fora do estabelecimento, inclusive" + CHR(13) + " por meio de veículos.", "S", "Remessa para venda")
	INSERT INTO cfop VALUES (474, "6905", "Remessa para depósito fechado ou armazém geral", " Classificam-se neste código as remessas de mercadorias para depósito em depósito fechado ou armazém" + CHR(13) + " geral.", "S", "Remessa para depósito")
	INSERT INTO cfop VALUES (475, "6906", "Retorno de mercadoria depositada em depósito fechado ou armazém geral", "Classificam-se neste código os retornos de mercadorias depositadas em depósito fechado ou armazém " + CHR(13) + "geral ao estabelecimento depositante.", "S", "Retorno de mercadoria")
	INSERT INTO cfop VALUES (476, "6907", "Retorno simbólico de mercadoria depositada em depósito fechado ou armazém geral", "Classificam-se neste código os retornos simbólicos de mercadorias recebidas para depósito em " + CHR(13) + "depósito fechado ou armazém geral, quando as mercadorias depositadas tenham sido objeto de saída a " + CHR(13) + "qualquer título e que não devam retornar ao estabelecimento depositante.", "S", "Retorno simbólico")
	INSERT INTO cfop VALUES (477, "6908", "Remessa de bem por conta de contrato de comodato", " Classificam-se neste código as remessas de bens para o cumprimento de contrato de comodato.", "S", "Remessa de bem")
	INSERT INTO cfop VALUES (478, "6909", "Retorno de bem recebido por conta de contrato de comodato", " Classificam-se neste código as remessas de bens em devolução após cumprido o contrato de comodato.", "S", "Retorno de bem")
	INSERT INTO cfop VALUES (479, "6910", "Remessa em bonificação, doação ou brinde", " Classificam-se neste código as remessas de mercadorias a título de bonificação, doação ou brinde.", "S", "Remessa em bonificação")
	INSERT INTO cfop VALUES (480, "6911", "Remessa de amostra grátis", " Classificam-se neste código as remessas de mercadorias a título de amostra grátis.", "S", "Remessa de amostra grátis")
	INSERT INTO cfop VALUES (481, "6912", "Remessa de mercadoria ou bem para demonstração", " Classificam-se neste código as remessas de mercadorias ou bens para demonstração.", "S", "Remessa de mercadoria")
	INSERT INTO cfop VALUES (482, "6913", "Retorno de mercadoria ou bem recebido para demonstração", " Classificam-se neste código as remessas em devolução de mercadorias ou bens recebidos para " + CHR(13) + "demonstração.", "S", "Retorno de mercadoria ou bem")
	INSERT INTO cfop VALUES (483, "6914", "Remessa de mercadoria ou bem para exposição ou feira", " Classificam-se neste código as remessas de mercadorias ou bens para exposição ou feira.", "S", "Remessa de mercadoria ou bem")
	INSERT INTO cfop VALUES (484, "6915", "Remessa de mercadoria ou bem para conserto ou reparo", " Classificam-se neste código as remessas de mercadorias ou bens para conserto ou reparo.", "S", "Remessa de mercadoria ou bem")
	INSERT INTO cfop VALUES (485, "6916", "Retorno de mercadoria ou bem recebido para conserto ou reparo", "Classificam-se neste código as remessas em devolução de mercadorias ou bens recebidos para conserto " + CHR(13) + "ou reparo.", "S", "Retorno de mercadoria ou bem")
	INSERT INTO cfop VALUES (486, "6917", "Remessa de mercadoria em consignação mercantil ou industrial", " Classificam-se neste código as remessas de mercadorias a título de consignação mercantil ou " + CHR(13) + "industrial.", "S", "Remessa de mercadoria")
	INSERT INTO cfop VALUES (487, "6918", "Devolução de mercadoria recebida em consignação mercantil ou industrial", "Classificam-se neste código as devoluções de mercadorias recebidas anteriormente a título de " + CHR(13) + "consignação mercantil ou industrial.", "S", "Devolução de mercadoria")
	INSERT INTO cfop VALUES (488, "6919", "Devolução simbólica de mercadoria vendida ou utilizada em processo industrial, recebida anteriormente em consignação mercantil ou industrial", "Classificam-se neste código as devoluções simbólicas de mercadorias vendidas ou utilizadas em " + CHR(13) + "processo industrial, que tenham sido recebidas anteriormente a título de consignação mercantil ou " + CHR(13) + "industrial.", "S", "Devolução simbólica")
	INSERT INTO cfop VALUES (489, "6920", "Remessa de vasilhame ou sacaria", " Classificam-se neste código as remessas de vasilhame ou sacaria.", "S", "Remessa vasilhame ou sacaria")
	INSERT INTO cfop VALUES (490, "6921", "Devolução de vasilhame ou sacaria", " Classificam-se neste código as saídas por devolução de vasilhame ou sacaria.", "S", "Devolução vasilhame ou sacaria")
	INSERT INTO cfop VALUES (491, "6922", "Lançamento efetuado a título de simples faturamento decorrente de venda para entrega futura", "Classificam-se neste código os registros efetuados a título de simples faturamento decorrente de " + CHR(13) + "venda para entrega futura.", "S", "Lançamento efetuado")
	INSERT INTO cfop VALUES (492, "6923", "Remessa de mercadoria por conta e ordem de terceiros, em venda à ordem", "Classificam-se neste código as saídas correspondentes à entrega de mercadorias por conta e ordem de " + CHR(13) + "terceiros, em vendas à ordem, cuja venda ao adquirente originário, foi classificada nos códigos " + CHR(13) + "" + '"' + "6.118 – Venda de produção do estabelecimento entregue ao destinatário por conta e ordem do " + CHR(13) + "adquirente originário, em venda à ordem" + '"' + " ou " + '"' + "6.119 – Venda de mercadoria adquirida ou recebida de " + CHR(13) + "terceiros entregue ao destinatário por conta e ordem do adquirente originário, em venda à ordem" + '"' + ".", "S", "Remessa de mercadoria")
	INSERT INTO cfop VALUES (493, "6924", "Remessa para industrialização por conta e ordem do adquirente da mercadoria, quando esta não transitar pelo estabelecimento do adquirente", "Classificam-se neste código as saídas de insumos com destino a estabelecimento industrializador, " + CHR(13) + "para serem industrializados por conta e ordem do adquirente, nas hipóteses em que os insumos não " + CHR(13) + "tenham transitado pelo estabelecimento do adquirente dos mesmos.", "S", "Remessa para industrialização")
	INSERT INTO cfop VALUES (494, "6925", "Retorno de mercadoria recebida para industrialização por conta e ordem do adquirente da mercadoria, quando aquela não transitar pelo estabelecimento do adquirente", "Classificam-se neste código as remessas, pelo estabelecimento industrializador, dos insumos " + CHR(13) + "recebidos, por conta e ordem do adquirente, para industrialização e incorporados ao produto final, " + CHR(13) + "nas hipóteses em que os insumos não tenham transitado pelo estabelecimento do adquirente. O valor " + CHR(13) + "dos insumos nesta operação deverá ser igual ao valor dos insumos recebidos para industrialização.", "S", "Retorno de mercadoria")
	INSERT INTO cfop VALUES (495, "6929", "Lançamento efetuado em decorrência de emissão de documento fiscal relativo a operação ou prestação também registrada em equipamento Emissor de Cupom Fiscal – ECF", "Classificam-se neste código os registros relativos aos documentos fiscais emitidos em operações ou " + CHR(13) + "prestações que também tenham sido registradas em equipamento Emissor de Cupom Fiscal – ECF.", "S", "Lançamento efetuado")
	INSERT INTO cfop VALUES (496, "6931", "Lançamento efetuado em decorrência da responsabilidade de retenção do imposto por substituição tributária, atribuída ao remetente ou alienante da mercadoria, pelo serviço de transporte realizado por t", "Classificam-se neste código exclusivamente os lançamentos efetuados pelo remetente ou alienante da " + CHR(13) + "mercadoria quando lhe for atribuída a responsabilidade pelo recolhimento do imposto devido pelo " + CHR(13) + "serviço de transporte realizado por transportador autônomo ou por transportador não inscrito na " + CHR(13) + "unidade da Federação onde iniciado o serviço.", "S", "Lançamento efetuado")
	INSERT INTO cfop VALUES (497, "6932", "Prestação de serviço de transporte iniciada em unidade da Federação diversa daquela onde inscrito o prestador", "Classificam-se neste código as prestações de serviço de transporte que tenham sido iniciadas em " + CHR(13) + "unidade da Federação diversa daquela onde o prestador está inscrito como contribuinte.", "S", "Prestação de serviço")
	INSERT INTO cfop VALUES (498, "6949", "Outra saída de mercadoria ou prestação de serviço não especificado", "Classificam-se neste código as outras saídas de mercadorias ou prestações de serviços que não tenham" + CHR(13) + " sido especificados nos códigos anteriores.", "S", "Outra saída de mercadoria")
	INSERT INTO cfop VALUES (499, "7000", "SAÍDAS OU PRESTAÇÕES DE SERVIÇOS PARA O EXTERIOR", " Classificam-se, neste grupo, as operações ou prestações em que o destinatário esteja localizado em " + CHR(13) + "outro país", "S", "SAÍDAS OU PREST. DE SERVIÇOS")
	INSERT INTO cfop VALUES (500, "7100", "VENDAS DE PRODUÇÃO PRÓPRIA OU DE TERCEIROS", "", "S", "VENDAS DE PRODUÇÃO")
	INSERT INTO cfop VALUES (501, "7101", "Venda de produção do estabelecimento", "Classificam-se neste código as vendas de produtos industrializados no estabelecimento. Também serão " + CHR(13) + "classificadas neste código as vendas de mercadorias por estabelecimento industrial de cooperativa.", "S", "Venda de produção do estab.")
	INSERT INTO cfop VALUES (502, "7102", "Venda de mercadoria adquirida ou recebida de terceiros", "Classificam-se neste código as vendas de mercadorias adquiridas ou recebidas de terceiros para " + CHR(13) + "industrialização ou comercialização, que não tenham sido objeto de qualquer processo industrial no " + CHR(13) + "estabelecimento. Também serão classificadas neste código as vendas de mercadorias por " + CHR(13) + "estabelecimento comercial de cooperativa.", "S", "Venda de mercadoria")
	INSERT INTO cfop VALUES (503, "7105", "Venda de produção do estabelecimento, que não deva por ele transitar", "Classificam-se neste código as vendas de produtos industrializados no estabelecimento, armazenados " + CHR(13) + "em depósito fechado, armazém geral ou outro sem que haja retorno ao estabelecimento depositante.", "S", "Venda de produção do estab.")
	INSERT INTO cfop VALUES (504, "7106", "Venda de mercadoria adquirida ou recebida de terceiros, que não deva por ele transitar", "Classificam-se neste código as vendas de mercadorias adquiridas ou recebidas de terceiros para " + CHR(13) + "industrialização ou comercialização, armazenadas em depósito fechado, armazém geral ou outro, que " + CHR(13) + "não tenham sido objeto de qualquer processo industrial no estabelecimento sem que haja retorno ao " + CHR(13) + "estabelecimento depositante. Também serão classificadas neste código as vendas de mercadorias " + CHR(13) + "importadas, cuja saída ocorra do recinto alfandegado ou da repartição alfandegária onde se processou" + CHR(13) + " o desembaraço aduaneiro, com destino ao estabelecimento do comprador, sem transitar pelo " + CHR(13) + "estabelecimento do importador.", "S", "Venda de mercadoria")
	INSERT INTO cfop VALUES (505, "7127", "Venda de produção do estabelecimento sob o regime de " + '"' + "drawback" + '"' + "", "Classificam-se neste código as vendas de produtos industrializados no estabelecimento sob o regime " + CHR(13) + "de " + '"' + "drawback" + '"' + ", cujas compras foram classificadas no código " + '"' + "3.127 – Compra para industrialização sob" + CHR(13) + " o regime de " + '"' + "drawback" + '"' + "" + '"' + ".", "S", "Venda de produção do estab.")
	INSERT INTO cfop VALUES (506, "7200", "DEVOLUÇÕES DE COMPRAS PARA INDUSTRIALIZAÇÃO, COMERCIALIZAÇÃO OU ANULAÇÕES DE VALORES", "", "S", "DEVOLUÇÕES DE COMPRAS")
	INSERT INTO cfop VALUES (507, "7201", "Devolução de compra para industrialização", "Classificam-se neste código as devoluções de mercadorias adquiridas para serem utilizadas em " + CHR(13) + "processo de industrialização, cujas entradas tenham sido classificadas como " + '"' + "Compra para " + CHR(13) + "industrialização" + '"' + ".", "S", "Devolução de compra")
	INSERT INTO cfop VALUES (508, "7202", "Devolução de compra para comercialização", "Classificam-se neste código as devoluções de mercadorias adquiridas para serem comercializadas, " + CHR(13) + "cujas entradas tenham sido classificadas como " + '"' + "Compra para comercialização" + '"' + ".", "S", "Devolução de compra")
	INSERT INTO cfop VALUES (509, "7205", "Anulação de valor relativo à aquisição de serviço de comunicação", "Classificam-se neste código as anulações correspondentes a valores faturados indevidamente, " + CHR(13) + "decorrentes das aquisições de serviços de comunicação.", "S", "Anulação de valor")
	INSERT INTO cfop VALUES (510, "7206", "Anulação de valor relativo a aquisição de serviço de transporte", "Classificam-se neste código as anulações correspondentes a valores faturados indevidamente, " + CHR(13) + "decorrentes das aquisições de serviços de transporte.", "S", "Anulação de valor")
	INSERT INTO cfop VALUES (511, "7207", "Anulação de valor relativo à compra de energia elétrica", "Classificam-se neste código as anulações correspondentes a valores faturados indevidamente, " + CHR(13) + "decorrentes da compra de energia elétrica.", "S", "Anulação de valor")
	INSERT INTO cfop VALUES (512, "7210", "Devolução de compra para utilização na prestação de serviço", "Classificam-se neste código as devoluções de mercadorias adquiridas para utilização na prestação de " + CHR(13) + "serviços, cujas entradas tenham sido classificadas no código " + '"' + "3.126 – Compra para utilização na " + CHR(13) + "prestação de serviço" + '"' + ".", "S", "Devolução de compra")
	INSERT INTO cfop VALUES (513, "7211", "Devolução de compras para industrialização sob o regime de drawback" + '"' + "", "Classificam-se neste código as devoluções de mercadorias adquiridas para serem utilizadas em " + CHR(13) + "processo de industrialização sob o regime de " + '"' + "drawback" + '"' + " e não utilizadas no referido processo, cujas" + CHR(13) + " entradas tenham sido classificadas no código " + '"' + "3.127 – Compra para industrialização sob o regime de " + CHR(13) + "" + '"' + "drawback" + '"' + "" + '"' + ".", "S", "Devolução de compra")
	INSERT INTO cfop VALUES (514, "7250", "VENDAS DE ENERGIA ELÉTRICA", "", "S", "VENDAS DE ENERGIA ELÉTRICA")
	INSERT INTO cfop VALUES (515, "7251", "Venda de energia elétrica para o exterior", " Classificam-se neste código as vendas de energia elétrica para o exterior.", "S", "Venda de energia elétrica")
	INSERT INTO cfop VALUES (516, "7300", "PRESTAÇÕES DE SERVIÇOS DE COMUNICAÇÃO", "", "S", "PRESTAÇÕES DE SERVIÇOS")
	INSERT INTO cfop VALUES (517, "7301", "Prestação de serviço de comunicação para execução de serviço da mesma natureza", "Classificam-se neste código as prestações de serviços de comunicação destinados às prestações de " + CHR(13) + "serviços da mesma natureza.", "S", "Prestação de serviço")
	INSERT INTO cfop VALUES (518, "7350", "PRESTAÇÕES DE SERVIÇO DE TRANSPORTE", "", "S", "PRESTAÇÕES DE SERVIÇO")
	INSERT INTO cfop VALUES (519, "7358", "Prestação de serviço de transporte", " Classificam-se neste código as prestações de serviços de transporte destinado a estabelecimento no " + CHR(13) + "exterior.", "S", "Prestação de serviço")
	INSERT INTO cfop VALUES (520, "7500", "EXPORTAÇÃO DE MERCADORIAS RECEBIDAS COM FIM ESPECÍFICO DE EXPORTAÇÃO", "", "S", "EXPORTAÇÃO DE MERCADORIAS")
	INSERT INTO cfop VALUES (521, "7501", "Exportação de mercadorias recebidas com fim específico de exportação", "Classificam-se neste código as exportações das mercadorias recebidas anteriormente com finalidade " + CHR(13) + "específica de exportação, cujas entradas tenham sido classificadas nos códigos " + '"' + "1.501 – Entrada de " + CHR(13) + "mercadoria recebida com fim específico de exportação" + '"' + " ou " + '"' + "2.501 – Entrada de mercadoria recebida com" + CHR(13) + " fim específico de exportação" + '"' + ".", "S", "Exportação de mercadorias")
	INSERT INTO cfop VALUES (522, "7550", "OPERAÇÕES COM BENS DE ATIVO IMOBILIZADO E MATERIAIS PARA USO OU CONSUMO", "", "S", "OPERAÇÕES COM BENS")
	INSERT INTO cfop VALUES (523, "7551", "Venda de bem do ativo imobilizado", " Classificam-se neste código as vendas de bens integrantes do ativo imobilizado do estabelecimento.", "S", "Venda de bem")
	INSERT INTO cfop VALUES (524, "7553", "Devolução de compra de bem para o ativo imobilizado", "Classificam-se neste código as devoluções de bens adquiridos para integrar o ativo imobilizado do " + CHR(13) + "estabelecimento, cuja entrada foi classificada no código " + '"' + "3.551 – Compra de bem para o ativo " + CHR(13) + "imobilizado" + '"' + ".", "S", "Devolução de compra")
	INSERT INTO cfop VALUES (525, "7556", "Devolução de compra de material de uso ou consumo", "Classificam-se neste código as devoluções de mercadorias destinadas ao uso ou consumo do " + CHR(13) + "estabelecimento, cuja entrada tenha sido classificada no código " + '"' + "3.556 - Compra de material para uso" + CHR(13) + " ou consumo" + '"' + ".", "S", "Devolução de compra")
	INSERT INTO cfop VALUES (526, "7900", "OUTRAS SAÍDAS DE MERCADORIAS OU PRESTAÇÕES DE SERVIÇOS", "", "S", "OUTRAS SAÍDAS DE MERCADORIAS")
	INSERT INTO cfop VALUES (527, "7930", "Lançamento efetuado a título de devolução de bem cuja entrada tenha ocorrido sob amparo de regime especial aduaneiro de admissão temporária", "Classificam-se neste código os lançamentos efetuados a título de saída em devolução de bens cuja " + CHR(13) + "entrada tenha ocorrido sob amparo de regime especial aduaneiro de admissão temporária.", "S", "Lançamento efetuado")
	INSERT INTO cfop VALUES (528, "7949", "Outra saída de mercadoria ou prestação de serviço não especificado", "Classificam-se neste código as outras saídas de mercadorias ou prestações de serviços que não tenham" + CHR(13) + " sido especificados nos códigos anteriores.", "S", "Outra saída de mercadoria")
	ALTER TABLE cfop ALTER COLUMN id integer AUTOINC NEXTVALUE 529

	Chdir Justpath(_Database)
	*!--------------------------------- Confnot --------------------------------!*
	*! @field id = Identificação do registro
	*! @field descricao = Descrição do campo na NF
	*! @field linha = Medida em milímetros do topo da página até o campo
	*! @field coluna = Medida em milímetros da esquerda da página até o campo
	Create Table 'Configurações da nota fiscal' Name 'confnot'(;
		id			Integer Autoinc,;
		descricao	Character(200),;
		linha		Float(8,4),;
		coluna		Float(8,4);
	)
	*!--------------------------------------------------------------------------!*
	Chdir &_SystemPath
	Insert Into confnot (descricao) Values ('Número da nota cabeçalho')
	Insert Into confnot (descricao) Values ('Saída')
	Insert Into confnot (descricao) Values ('Entrada')
	Insert Into confnot (descricao) Values ('Natureza de operação')
	Insert Into confnot (descricao) Values ('Cfop')
	Insert Into confnot (descricao) Values ('Nome/Razão Social')
	Insert Into confnot (descricao) Values ('Cnpj/Cpf')
	Insert Into confnot (descricao) Values ('Data de emissão')
	Insert Into confnot (descricao) Values ('Endereço')
	Insert Into confnot (descricao) Values ('Bairro')
	Insert Into confnot (descricao) Values ('Cep')
	Insert Into confnot (descricao) Values ('Data de saída/entrada')
	Insert Into confnot (descricao) Values ('Município')
	Insert Into confnot (descricao) Values ('Fone/Fax')
	Insert Into confnot (descricao) Values ('Estado')
	Insert Into confnot (descricao) Values ('Inscrição Estadual')
	Insert Into confnot (descricao) Values ('Hora da saída')
	Insert Into confnot (descricao) Values ('Fatura n°1')
	Insert Into confnot (descricao) Values ('Fatura n°2')
	Insert Into confnot (descricao) Values ('Fatura n°3')
	Insert Into confnot (descricao) Values ('Fatura n°4')
	Insert Into confnot (descricao) Values ('Fatura n°5')
	Insert Into confnot (descricao) Values ('Fatura n°6')
	Insert Into confnot (descricao) Values ('Fatura n°7')
	Insert Into confnot (descricao) Values ('Fatura n°8')
	Insert Into confnot (descricao) Values ('Fatura n°9')
	Insert Into confnot (descricao) Values ('Fatura n°10')
	Insert Into confnot (descricao) Values ('Fatura n°11')
	Insert Into confnot (descricao) Values ('Fatura n°12')
	Insert Into confnot (descricao) Values ('Produto código')
	Insert Into confnot (descricao) Values ('Produto descrição')
	Insert Into confnot (descricao) Values ('Produto c. fiscal')
	Insert Into confnot (descricao) Values ('Produto sit. tributária')
	Insert Into confnot (descricao) Values ('Produto unidade')
	Insert Into confnot (descricao) Values ('Produto quantidade')
	Insert Into confnot (descricao) Values ('Produto valor unitário')
	Insert Into confnot (descricao) Values ('Produto valor total')
	Insert Into confnot (descricao) Values ('Produto alíq. icms')
	Insert Into confnot (descricao) Values ('Produto alíq. ipi')
	Insert Into confnot (descricao) Values ('Produto valor do ipi')
	Insert Into confnot (descricao) Values ('Base de cálculo do icms')
	Insert Into confnot (descricao) Values ('Valor do icms')
	Insert Into confnot (descricao) Values ('Base de calc. icms subst.')
	Insert Into confnot (descricao) Values ('Valor do icms substituição')
	Insert Into confnot (descricao) Values ('Valor total dos produtos')
	Insert Into confnot (descricao) Values ('Valor do frete')
	Insert Into confnot (descricao) Values ('Valor do seguro')
	Insert Into confnot (descricao) Values ('Outras despesas acessórias')
	Insert Into confnot (descricao) Values ('Valor total do ipi')
	Insert Into confnot (descricao) Values ('Valor total da nota')
	Insert Into confnot (descricao) Values ('Transp. Nome/Razão Social')
	Insert Into confnot (descricao) Values ('Transp. Frete por conta')
	Insert Into confnot (descricao) Values ('Transp. Placa do veículo')
	Insert Into confnot (descricao) Values ('Transp. UF veículo')
	Insert Into confnot (descricao) Values ('Transp. Cnpj/Cpf')
	Insert Into confnot (descricao) Values ('Transp. Endereço')
	Insert Into confnot (descricao) Values ('Transp. Município')
	Insert Into confnot (descricao) Values ('Transp. UF')
	Insert Into confnot (descricao) Values ('Transp. Inscrição estadual')
	Insert Into confnot (descricao) Values ('Quantidade')
	Insert Into confnot (descricao) Values ('Espécie')
	Insert Into confnot (descricao) Values ('Marca')
	Insert Into confnot (descricao) Values ('Número')
	Insert Into confnot (descricao) Values ('Peso bruto')
	Insert Into confnot (descricao) Values ('Peso líquido')
	Insert Into confnot (descricao) Values ('Obs. linha 1')
	Insert Into confnot (descricao) Values ('Obs. linha 2')
	Insert Into confnot (descricao) Values ('Obs. linha 3')
	Insert Into confnot (descricao) Values ('Obs. linha 4')
	Insert Into confnot (descricao) Values ('Obs. linha 5')
	Insert Into confnot (descricao) Values ('Obs. linha 6')
	Insert Into confnot (descricao) Values ('Número da nota rodapé')
	Insert Into tparam (campo, valor) Values ('QuantidadeDeProdutosDaNotaFiscal', '0')
	Insert Into tparam (campo, valor) Values ('CfopPadrao', '0')
	Insert Into tparam (campo, valor) Values ('ImpressoraCalibrada', 'F')
	Chdir Justpath(_Database)
	*!---------------------------------- Obsnf ---------------------------------!*
	*! @field id = Identificação do registro
	*! @field descricao = Descrição
	*! @field obs = Observação
	Create Table 'Cadastro de observações da nota fiscal' Name 'obsnf'(;
		id			Integer Autoinc,;
		descricao	Character(80),;
		obs			Memo;
	)
	*!--------------------------------------------------------------------------!*
	Chdir &_SystemPath
	Alter Table produto Rename depadm To despfix
	Alter Table produto Add Column valipromo Date
	Alter Table produto Add Column ipi Float(6,2)
	Alter Table produto Add Column basecalc Float(6,2)
	Alter Table produto Add Column clafis Character(8)
	Alter Table produto Add Column situtrib Character(3)
	Update produto Set basecalc = 100
	Chdir Justpath(_Database)
	*!-------------------------------- Situtrib --------------------------------!*
	*! @field id = Identificação do registro
	*! @field codigo = Código de substituição tributária
	*! @field descricao = Descrição
	*! @field icmspad = ICMS Padrão
	Create Table 'Situação Tributária' Name 'situtrib'(;
		id			Integer Autoinc,;
		codigo		Character(3),;
		descricao	Character(80),;
		icmspad		Float(6,2);
	)
	*!--------------------------------------------------------------------------!*
	Chdir &_SystemPath
	Insert Into situtrib (codigo, descricao, icmspad) Values ('000', 'Tributada integralmente', 18.00)
	Insert Into situtrib (codigo, descricao, icmspad) Values ('010', 'Tributada e com cobrança do ICMS por substituição tributária', 18.00)
	Insert Into situtrib (codigo, descricao, icmspad) Values ('020', 'Com redução no base de calculo', 0.00)
	Insert Into situtrib (codigo, descricao, icmspad) Values ('030', 'Isenta ou não tributada e com cobrança do ICMS por substituição tributária', 0.00)
	Insert Into situtrib (codigo, descricao, icmspad) Values ('040', 'Isenta', 0.00)
	Insert Into situtrib (codigo, descricao, icmspad) Values ('041', 'Não tributada', 0.00)
	Insert Into situtrib (codigo, descricao, icmspad) Values ('050', 'Suspenção', 0.00)
	Insert Into situtrib (codigo, descricao, icmspad) Values ('051', 'Diferimento', 0.00)
	Insert Into situtrib (codigo, descricao, icmspad) Values ('060', 'ICMS cobrado anteriormente por substituição tributária', 0.00)
	Insert Into situtrib (codigo, descricao, icmspad) Values ('070', 'Com redução de base de cálculo e cob. do ICMS por substituição tributária', 0.00)
	Insert Into situtrib (codigo, descricao, icmspad) Values ('090', 'Outras', 0.00)
	Chdir Justpath(_Database)
	*!--------------------------------- Eminot ---------------------------------!*
	*! @field id = Identificação do registro
	*! @field numnf = Número da nota fiscal
	*! @field tipo = Tipo da nota pode ser: 1 = Saída, 2 = Entrada
	*! @field icms = Percentual de icms
	*! @field emissao = Data de emissão
	*! @field datasai = Data de saída
	*! @field horasai = Hora de saída
	*! @field idcfop = Identificação da CFOP
	*! @field idcfop2 = Identificação da CFOP2
	*! @field iddest = Identificação do destinatário(cliente ou fornecedor)
	*! @field idendereco = Identificação do endereço(cliente)
	*! @field baseicms = Base de cálculo do ICMS
	*! @field vlricms = Valor do ICMS
	*! @field basesubs = Base de cálculo do ICMS substituição
	*! @field vlrsubs = Valor do ICMS substituição
	*! @field vlrpro = Valor total dos produtos
	*! @field vlrfrete = Valor do frete
	*! @field vlrseg = Valor do seguro
	*! @field outdesp = Outras despesas acessórias
	*! @field vlripi = Valor total do IPI
	*! @field vlrnota = Valor total da nota
	*! @field idtransp = Identificação do transportador
	*! @field frete = Frete por conta pode ser: 1 = Emitente, 2 = Destinatário
	*! @field veiculo = Placa do veículo transportador
	*! @field ufveic = Estado de registro do veículo transportador
	*! @field qtde = Quantidade
	*! @field especie
	*! @field marca
	*! @field numero
	*! @field pesobru = Peso bruto
	*! @field pesoliq = Peso líquido
	*! @field dadosadic = Mensagem impressa em dados adicionais
	*! @field dadoscorp = Mensagem impressa no corpo da nota
	*! @field impressa
	*! @field numparc = Número de parcelas
	*! @field pentpar = Prazo entre parcelas
	*! @field privenc = Primeiro vencimento
	Create Table 'Emissão de Nota Fiscal' Name 'eminot'(;
		id			Integer Autoinc,;
		numnf		Integer,;
		tipo		Numeric(1),;
		icms		Float(5,2),;
		emissao		Date,;
		datasai		Date,;
		horasai		Character(5),;
		idcfop		Integer,;
		idcfop2		Integer,;
		iddest		Integer,;
		idendereco	Integer,;
		baseicms	Float(10,2),;
		vlricms		Float(10,2),;
		basesubs	Float(10,2),;
		vlrsubs		Float(10,2),;
		vlrpro		Float(10,2),;
		vlrfrete	Float(10,2),;
		vlrseg		Float(10,2),;
		outdesp		Float(10,2),;
		vlripi		Float(10,2),;
		vlrnota		Float(10,2),;
		idtransp	Integer,;
		frete		Numeric(1),;
		veiculo		Character(8),;
		ufveic		Character(2),;
		qtde		Integer,;
		especie		Character(20),;
		marca		Character(20),;
		numero		Character(20),;
		pesobru		Float(8,3),;
		pesoliq		Float(8,3),;
		dadosadic	Memo,;
		dadoscorp	Memo,;
		impressa	Logical,;
		numparc		Numeric(2),;
		pentpar		Numeric(2),;
		privenc		Date;
	)
	*!--------------------------------------------------------------------------!*

	*!--------------------------- Produtos Faturados ---------------------------!*
	*! @field id = Identificação do registro
	*! @field ideminot = Identificação da nota fiscal
	*! @field idproduto = Identificação do produto
	*! @field preco = Preço de venda
	*! @field qtde = Quantidade faturada
	Create Table 'Produtos Faturados' Name 'pronot'(;
		id			Integer Autoinc,;
		ideminot	Integer,;
		idproduto	Integer,;
		preco       Float(10,2),;
		qtde		Float(8,3);
	)
	*!--------------------------------------------------------------------------!*

	*!--------------------------------- Fatura ---------------------------------!*
	*! @field id = Identificação do registro
	*! @field ideminot = Identificação da nota fiscal
	*! @field parcela = Identificação da parcela
	*! @field dataven = Data de vencimento
	*! @field valor = Valor da parcela
	Create Table 'Fatura da Nota Fiscal' Name 'fatura'(;
		id			Integer Autoinc,;
		ideminot	Integer,;
		parcela		Character(1),;
		datavenc	Date,;
		valor		Float(10,2);
	)
	*!--------------------------------------------------------------------------!*
	Chdir &_SystemPath
	Alter Table cliente Add Column limcart Float(10,2)
	Alter Table cliente Add Column limbole Float(10,2)
	Chdir Justpath(_Database)
	*!------------------------------- Tabela Icms ------------------------------!*
	*! @field id = Identificação do registro
	*! @field origem = Estado de Origem
	*! @field destino = Estado de Destino
	*! @field icms = Percentual Icms para o relacionamento entre os estados
	Create Table 'Tabela Icms' Name 'icms'(;
		id			Integer Autoinc,;
		origem		Character(2),;
		destino		Character(2),;
		icms		Float(5,2);
	)
	*!--------------------------------------------------------------------------!*
	Chdir &_SystemPath
	Insert Into icms(origem, destino, icms) Values('AC', 'AC', 0)
	Insert Into icms(origem, destino, icms) Values('AC', 'AL', 12)
	Insert Into icms(origem, destino, icms) Values('AC', 'AM', 12)
	Insert Into icms(origem, destino, icms) Values('AC', 'AP', 12)
	Insert Into icms(origem, destino, icms) Values('AC', 'BA', 12)
	Insert Into icms(origem, destino, icms) Values('AC', 'CE', 12)
	Insert Into icms(origem, destino, icms) Values('AC', 'DF', 12)
	Insert Into icms(origem, destino, icms) Values('AC', 'ES', 12)
	Insert Into icms(origem, destino, icms) Values('AC', 'GO', 12)
	Insert Into icms(origem, destino, icms) Values('AC', 'MA', 12)
	Insert Into icms(origem, destino, icms) Values('AC', 'MT', 12)
	Insert Into icms(origem, destino, icms) Values('AC', 'MS', 12)
	Insert Into icms(origem, destino, icms) Values('AC', 'MG', 12)
	Insert Into icms(origem, destino, icms) Values('AC', 'PA', 12)
	Insert Into icms(origem, destino, icms) Values('AC', 'PB', 12)
	Insert Into icms(origem, destino, icms) Values('AC', 'PR', 12)
	Insert Into icms(origem, destino, icms) Values('AC', 'PE', 12)
	Insert Into icms(origem, destino, icms) Values('AC', 'PI', 12)
	Insert Into icms(origem, destino, icms) Values('AC', 'RN', 12)
	Insert Into icms(origem, destino, icms) Values('AC', 'RS', 12)
	Insert Into icms(origem, destino, icms) Values('AC', 'RJ', 12)
	Insert Into icms(origem, destino, icms) Values('AC', 'RO', 12)
	Insert Into icms(origem, destino, icms) Values('AC', 'RR', 12)
	Insert Into icms(origem, destino, icms) Values('AC', 'SC', 12)
	Insert Into icms(origem, destino, icms) Values('AC', 'SP', 12)
	Insert Into icms(origem, destino, icms) Values('AC', 'SE', 12)
	Insert Into icms(origem, destino, icms) Values('AC', 'TO', 12)
	Insert Into icms(origem, destino, icms) Values('AL', 'AC', 12)
	Insert Into icms(origem, destino, icms) Values('AL', 'AL', 0)
	Insert Into icms(origem, destino, icms) Values('AL', 'AM', 12)
	Insert Into icms(origem, destino, icms) Values('AL', 'AP', 12)
	Insert Into icms(origem, destino, icms) Values('AL', 'BA', 12)
	Insert Into icms(origem, destino, icms) Values('AL', 'CE', 12)
	Insert Into icms(origem, destino, icms) Values('AL', 'DF', 12)
	Insert Into icms(origem, destino, icms) Values('AL', 'ES', 12)
	Insert Into icms(origem, destino, icms) Values('AL', 'GO', 12)
	Insert Into icms(origem, destino, icms) Values('AL', 'MA', 12)
	Insert Into icms(origem, destino, icms) Values('AL', 'MT', 12)
	Insert Into icms(origem, destino, icms) Values('AL', 'MS', 12)
	Insert Into icms(origem, destino, icms) Values('AL', 'MG', 12)
	Insert Into icms(origem, destino, icms) Values('AL', 'PA', 12)
	Insert Into icms(origem, destino, icms) Values('AL', 'PB', 12)
	Insert Into icms(origem, destino, icms) Values('AL', 'PR', 12)
	Insert Into icms(origem, destino, icms) Values('AL', 'PE', 12)
	Insert Into icms(origem, destino, icms) Values('AL', 'PI', 12)
	Insert Into icms(origem, destino, icms) Values('AL', 'RN', 12)
	Insert Into icms(origem, destino, icms) Values('AL', 'RS', 12)
	Insert Into icms(origem, destino, icms) Values('AL', 'RJ', 12)
	Insert Into icms(origem, destino, icms) Values('AL', 'RO', 12)
	Insert Into icms(origem, destino, icms) Values('AL', 'RR', 12)
	Insert Into icms(origem, destino, icms) Values('AL', 'SC', 12)
	Insert Into icms(origem, destino, icms) Values('AL', 'SP', 12)
	Insert Into icms(origem, destino, icms) Values('AL', 'SE', 12)
	Insert Into icms(origem, destino, icms) Values('AL', 'TO', 12)
	Insert Into icms(origem, destino, icms) Values('AM', 'AC', 12)
	Insert Into icms(origem, destino, icms) Values('AM', 'AL', 12)
	Insert Into icms(origem, destino, icms) Values('AM', 'AM', 0)
	Insert Into icms(origem, destino, icms) Values('AM', 'AP', 12)
	Insert Into icms(origem, destino, icms) Values('AM', 'BA', 12)
	Insert Into icms(origem, destino, icms) Values('AM', 'CE', 12)
	Insert Into icms(origem, destino, icms) Values('AM', 'DF', 12)
	Insert Into icms(origem, destino, icms) Values('AM', 'ES', 12)
	Insert Into icms(origem, destino, icms) Values('AM', 'GO', 12)
	Insert Into icms(origem, destino, icms) Values('AM', 'MA', 12)
	Insert Into icms(origem, destino, icms) Values('AM', 'MT', 12)
	Insert Into icms(origem, destino, icms) Values('AM', 'MS', 12)
	Insert Into icms(origem, destino, icms) Values('AM', 'MG', 12)
	Insert Into icms(origem, destino, icms) Values('AM', 'PA', 12)
	Insert Into icms(origem, destino, icms) Values('AM', 'PB', 12)
	Insert Into icms(origem, destino, icms) Values('AM', 'PR', 12)
	Insert Into icms(origem, destino, icms) Values('AM', 'PE', 12)
	Insert Into icms(origem, destino, icms) Values('AM', 'PI', 12)
	Insert Into icms(origem, destino, icms) Values('AM', 'RN', 12)
	Insert Into icms(origem, destino, icms) Values('AM', 'RS', 12)
	Insert Into icms(origem, destino, icms) Values('AM', 'RJ', 12)
	Insert Into icms(origem, destino, icms) Values('AM', 'RO', 12)
	Insert Into icms(origem, destino, icms) Values('AM', 'RR', 12)
	Insert Into icms(origem, destino, icms) Values('AM', 'SC', 12)
	Insert Into icms(origem, destino, icms) Values('AM', 'SP', 12)
	Insert Into icms(origem, destino, icms) Values('AM', 'SE', 12)
	Insert Into icms(origem, destino, icms) Values('AM', 'TO', 12)
	Insert Into icms(origem, destino, icms) Values('AP', 'AC', 12)
	Insert Into icms(origem, destino, icms) Values('AP', 'AL', 12)
	Insert Into icms(origem, destino, icms) Values('AP', 'AM', 12)
	Insert Into icms(origem, destino, icms) Values('AP', 'AP', 0)
	Insert Into icms(origem, destino, icms) Values('AP', 'BA', 12)
	Insert Into icms(origem, destino, icms) Values('AP', 'CE', 12)
	Insert Into icms(origem, destino, icms) Values('AP', 'DF', 12)
	Insert Into icms(origem, destino, icms) Values('AP', 'ES', 12)
	Insert Into icms(origem, destino, icms) Values('AP', 'GO', 12)
	Insert Into icms(origem, destino, icms) Values('AP', 'MA', 12)
	Insert Into icms(origem, destino, icms) Values('AP', 'MT', 12)
	Insert Into icms(origem, destino, icms) Values('AP', 'MS', 12)
	Insert Into icms(origem, destino, icms) Values('AP', 'MG', 12)
	Insert Into icms(origem, destino, icms) Values('AP', 'PA', 12)
	Insert Into icms(origem, destino, icms) Values('AP', 'PB', 12)
	Insert Into icms(origem, destino, icms) Values('AP', 'PR', 12)
	Insert Into icms(origem, destino, icms) Values('AP', 'PE', 12)
	Insert Into icms(origem, destino, icms) Values('AP', 'PI', 12)
	Insert Into icms(origem, destino, icms) Values('AP', 'RN', 12)
	Insert Into icms(origem, destino, icms) Values('AP', 'RS', 12)
	Insert Into icms(origem, destino, icms) Values('AP', 'RJ', 12)
	Insert Into icms(origem, destino, icms) Values('AP', 'RO', 12)
	Insert Into icms(origem, destino, icms) Values('AP', 'RR', 12)
	Insert Into icms(origem, destino, icms) Values('AP', 'SC', 12)
	Insert Into icms(origem, destino, icms) Values('AP', 'SP', 12)
	Insert Into icms(origem, destino, icms) Values('AP', 'SE', 12)
	Insert Into icms(origem, destino, icms) Values('AP', 'TO', 12)
	Insert Into icms(origem, destino, icms) Values('BA', 'AC', 12)
	Insert Into icms(origem, destino, icms) Values('BA', 'AL', 12)
	Insert Into icms(origem, destino, icms) Values('BA', 'AM', 12)
	Insert Into icms(origem, destino, icms) Values('BA', 'AP', 12)
	Insert Into icms(origem, destino, icms) Values('BA', 'BA', 0)
	Insert Into icms(origem, destino, icms) Values('BA', 'CE', 12)
	Insert Into icms(origem, destino, icms) Values('BA', 'DF', 12)
	Insert Into icms(origem, destino, icms) Values('BA', 'ES', 12)
	Insert Into icms(origem, destino, icms) Values('BA', 'GO', 12)
	Insert Into icms(origem, destino, icms) Values('BA', 'MA', 12)
	Insert Into icms(origem, destino, icms) Values('BA', 'MT', 12)
	Insert Into icms(origem, destino, icms) Values('BA', 'MS', 12)
	Insert Into icms(origem, destino, icms) Values('BA', 'MG', 12)
	Insert Into icms(origem, destino, icms) Values('BA', 'PA', 12)
	Insert Into icms(origem, destino, icms) Values('BA', 'PB', 12)
	Insert Into icms(origem, destino, icms) Values('BA', 'PR', 12)
	Insert Into icms(origem, destino, icms) Values('BA', 'PE', 12)
	Insert Into icms(origem, destino, icms) Values('BA', 'PI', 12)
	Insert Into icms(origem, destino, icms) Values('BA', 'RN', 12)
	Insert Into icms(origem, destino, icms) Values('BA', 'RS', 12)
	Insert Into icms(origem, destino, icms) Values('BA', 'RJ', 12)
	Insert Into icms(origem, destino, icms) Values('BA', 'RO', 12)
	Insert Into icms(origem, destino, icms) Values('BA', 'RR', 12)
	Insert Into icms(origem, destino, icms) Values('BA', 'SC', 12)
	Insert Into icms(origem, destino, icms) Values('BA', 'SP', 12)
	Insert Into icms(origem, destino, icms) Values('BA', 'SE', 12)
	Insert Into icms(origem, destino, icms) Values('BA', 'TO', 12)
	Insert Into icms(origem, destino, icms) Values('CE', 'AC', 12)
	Insert Into icms(origem, destino, icms) Values('CE', 'AL', 12)
	Insert Into icms(origem, destino, icms) Values('CE', 'AM', 12)
	Insert Into icms(origem, destino, icms) Values('CE', 'AP', 12)
	Insert Into icms(origem, destino, icms) Values('CE', 'BA', 12)
	Insert Into icms(origem, destino, icms) Values('CE', 'CE', 0)
	Insert Into icms(origem, destino, icms) Values('CE', 'DF', 12)
	Insert Into icms(origem, destino, icms) Values('CE', 'ES', 12)
	Insert Into icms(origem, destino, icms) Values('CE', 'GO', 12)
	Insert Into icms(origem, destino, icms) Values('CE', 'MA', 12)
	Insert Into icms(origem, destino, icms) Values('CE', 'MT', 12)
	Insert Into icms(origem, destino, icms) Values('CE', 'MS', 12)
	Insert Into icms(origem, destino, icms) Values('CE', 'MG', 12)
	Insert Into icms(origem, destino, icms) Values('CE', 'PA', 12)
	Insert Into icms(origem, destino, icms) Values('CE', 'PB', 12)
	Insert Into icms(origem, destino, icms) Values('CE', 'PR', 12)
	Insert Into icms(origem, destino, icms) Values('CE', 'PE', 12)
	Insert Into icms(origem, destino, icms) Values('CE', 'PI', 12)
	Insert Into icms(origem, destino, icms) Values('CE', 'RN', 12)
	Insert Into icms(origem, destino, icms) Values('CE', 'RS', 12)
	Insert Into icms(origem, destino, icms) Values('CE', 'RJ', 12)
	Insert Into icms(origem, destino, icms) Values('CE', 'RO', 12)
	Insert Into icms(origem, destino, icms) Values('CE', 'RR', 12)
	Insert Into icms(origem, destino, icms) Values('CE', 'SC', 12)
	Insert Into icms(origem, destino, icms) Values('CE', 'SP', 12)
	Insert Into icms(origem, destino, icms) Values('CE', 'SE', 12)
	Insert Into icms(origem, destino, icms) Values('CE', 'TO', 12)
	Insert Into icms(origem, destino, icms) Values('DF', 'AC', 12)
	Insert Into icms(origem, destino, icms) Values('DF', 'AL', 12)
	Insert Into icms(origem, destino, icms) Values('DF', 'AM', 12)
	Insert Into icms(origem, destino, icms) Values('DF', 'AP', 12)
	Insert Into icms(origem, destino, icms) Values('DF', 'BA', 12)
	Insert Into icms(origem, destino, icms) Values('DF', 'CE', 12)
	Insert Into icms(origem, destino, icms) Values('DF', 'DF', 0)
	Insert Into icms(origem, destino, icms) Values('DF', 'ES', 12)
	Insert Into icms(origem, destino, icms) Values('DF', 'GO', 12)
	Insert Into icms(origem, destino, icms) Values('DF', 'MA', 12)
	Insert Into icms(origem, destino, icms) Values('DF', 'MT', 12)
	Insert Into icms(origem, destino, icms) Values('DF', 'MS', 12)
	Insert Into icms(origem, destino, icms) Values('DF', 'MG', 12)
	Insert Into icms(origem, destino, icms) Values('DF', 'PA', 12)
	Insert Into icms(origem, destino, icms) Values('DF', 'PB', 12)
	Insert Into icms(origem, destino, icms) Values('DF', 'PR', 12)
	Insert Into icms(origem, destino, icms) Values('DF', 'PE', 12)
	Insert Into icms(origem, destino, icms) Values('DF', 'PI', 12)
	Insert Into icms(origem, destino, icms) Values('DF', 'RN', 12)
	Insert Into icms(origem, destino, icms) Values('DF', 'RS', 12)
	Insert Into icms(origem, destino, icms) Values('DF', 'RJ', 12)
	Insert Into icms(origem, destino, icms) Values('DF', 'RO', 12)
	Insert Into icms(origem, destino, icms) Values('DF', 'RR', 12)
	Insert Into icms(origem, destino, icms) Values('DF', 'SC', 12)
	Insert Into icms(origem, destino, icms) Values('DF', 'SP', 12)
	Insert Into icms(origem, destino, icms) Values('DF', 'SE', 12)
	Insert Into icms(origem, destino, icms) Values('DF', 'TO', 12)
	Insert Into icms(origem, destino, icms) Values('ES', 'AC', 12)
	Insert Into icms(origem, destino, icms) Values('ES', 'AL', 12)
	Insert Into icms(origem, destino, icms) Values('ES', 'AM', 12)
	Insert Into icms(origem, destino, icms) Values('ES', 'AP', 12)
	Insert Into icms(origem, destino, icms) Values('ES', 'BA', 12)
	Insert Into icms(origem, destino, icms) Values('ES', 'CE', 12)
	Insert Into icms(origem, destino, icms) Values('ES', 'DF', 12)
	Insert Into icms(origem, destino, icms) Values('ES', 'ES', 0)
	Insert Into icms(origem, destino, icms) Values('ES', 'GO', 12)
	Insert Into icms(origem, destino, icms) Values('ES', 'MA', 12)
	Insert Into icms(origem, destino, icms) Values('ES', 'MT', 12)
	Insert Into icms(origem, destino, icms) Values('ES', 'MS', 12)
	Insert Into icms(origem, destino, icms) Values('ES', 'MG', 12)
	Insert Into icms(origem, destino, icms) Values('ES', 'PA', 12)
	Insert Into icms(origem, destino, icms) Values('ES', 'PB', 12)
	Insert Into icms(origem, destino, icms) Values('ES', 'PR', 12)
	Insert Into icms(origem, destino, icms) Values('ES', 'PE', 12)
	Insert Into icms(origem, destino, icms) Values('ES', 'PI', 12)
	Insert Into icms(origem, destino, icms) Values('ES', 'RN', 12)
	Insert Into icms(origem, destino, icms) Values('ES', 'RS', 12)
	Insert Into icms(origem, destino, icms) Values('ES', 'RJ', 12)
	Insert Into icms(origem, destino, icms) Values('ES', 'RO', 12)
	Insert Into icms(origem, destino, icms) Values('ES', 'RR', 12)
	Insert Into icms(origem, destino, icms) Values('ES', 'SC', 12)
	Insert Into icms(origem, destino, icms) Values('ES', 'SP', 12)
	Insert Into icms(origem, destino, icms) Values('ES', 'SE', 12)
	Insert Into icms(origem, destino, icms) Values('ES', 'TO', 12)
	Insert Into icms(origem, destino, icms) Values('GO', 'AC', 12)
	Insert Into icms(origem, destino, icms) Values('GO', 'AL', 12)
	Insert Into icms(origem, destino, icms) Values('GO', 'AM', 12)
	Insert Into icms(origem, destino, icms) Values('GO', 'AP', 12)
	Insert Into icms(origem, destino, icms) Values('GO', 'BA', 12)
	Insert Into icms(origem, destino, icms) Values('GO', 'CE', 12)
	Insert Into icms(origem, destino, icms) Values('GO', 'DF', 12)
	Insert Into icms(origem, destino, icms) Values('GO', 'ES', 12)
	Insert Into icms(origem, destino, icms) Values('GO', 'GO', 0)
	Insert Into icms(origem, destino, icms) Values('GO', 'MA', 12)
	Insert Into icms(origem, destino, icms) Values('GO', 'MT', 12)
	Insert Into icms(origem, destino, icms) Values('GO', 'MS', 12)
	Insert Into icms(origem, destino, icms) Values('GO', 'MG', 12)
	Insert Into icms(origem, destino, icms) Values('GO', 'PA', 12)
	Insert Into icms(origem, destino, icms) Values('GO', 'PB', 12)
	Insert Into icms(origem, destino, icms) Values('GO', 'PR', 12)
	Insert Into icms(origem, destino, icms) Values('GO', 'PE', 12)
	Insert Into icms(origem, destino, icms) Values('GO', 'PI', 12)
	Insert Into icms(origem, destino, icms) Values('GO', 'RN', 12)
	Insert Into icms(origem, destino, icms) Values('GO', 'RS', 12)
	Insert Into icms(origem, destino, icms) Values('GO', 'RJ', 12)
	Insert Into icms(origem, destino, icms) Values('GO', 'RO', 12)
	Insert Into icms(origem, destino, icms) Values('GO', 'RR', 12)
	Insert Into icms(origem, destino, icms) Values('GO', 'SC', 12)
	Insert Into icms(origem, destino, icms) Values('GO', 'SP', 12)
	Insert Into icms(origem, destino, icms) Values('GO', 'SE', 12)
	Insert Into icms(origem, destino, icms) Values('GO', 'TO', 12)
	Insert Into icms(origem, destino, icms) Values('MA', 'AC', 12)
	Insert Into icms(origem, destino, icms) Values('MA', 'AL', 12)
	Insert Into icms(origem, destino, icms) Values('MA', 'AM', 12)
	Insert Into icms(origem, destino, icms) Values('MA', 'AP', 12)
	Insert Into icms(origem, destino, icms) Values('MA', 'BA', 12)
	Insert Into icms(origem, destino, icms) Values('MA', 'CE', 12)
	Insert Into icms(origem, destino, icms) Values('MA', 'DF', 12)
	Insert Into icms(origem, destino, icms) Values('MA', 'ES', 12)
	Insert Into icms(origem, destino, icms) Values('MA', 'GO', 12)
	Insert Into icms(origem, destino, icms) Values('MA', 'MA', 0)
	Insert Into icms(origem, destino, icms) Values('MA', 'MT', 12)
	Insert Into icms(origem, destino, icms) Values('MA', 'MS', 12)
	Insert Into icms(origem, destino, icms) Values('MA', 'MG', 12)
	Insert Into icms(origem, destino, icms) Values('MA', 'PA', 12)
	Insert Into icms(origem, destino, icms) Values('MA', 'PB', 12)
	Insert Into icms(origem, destino, icms) Values('MA', 'PR', 12)
	Insert Into icms(origem, destino, icms) Values('MA', 'PE', 12)
	Insert Into icms(origem, destino, icms) Values('MA', 'PI', 12)
	Insert Into icms(origem, destino, icms) Values('MA', 'RN', 12)
	Insert Into icms(origem, destino, icms) Values('MA', 'RS', 12)
	Insert Into icms(origem, destino, icms) Values('MA', 'RJ', 12)
	Insert Into icms(origem, destino, icms) Values('MA', 'RO', 12)
	Insert Into icms(origem, destino, icms) Values('MA', 'RR', 12)
	Insert Into icms(origem, destino, icms) Values('MA', 'SC', 12)
	Insert Into icms(origem, destino, icms) Values('MA', 'SP', 12)
	Insert Into icms(origem, destino, icms) Values('MA', 'SE', 12)
	Insert Into icms(origem, destino, icms) Values('MA', 'TO', 12)
	Insert Into icms(origem, destino, icms) Values('MT', 'AC', 12)
	Insert Into icms(origem, destino, icms) Values('MT', 'AL', 12)
	Insert Into icms(origem, destino, icms) Values('MT', 'AM', 12)
	Insert Into icms(origem, destino, icms) Values('MT', 'AP', 12)
	Insert Into icms(origem, destino, icms) Values('MT', 'BA', 12)
	Insert Into icms(origem, destino, icms) Values('MT', 'CE', 12)
	Insert Into icms(origem, destino, icms) Values('MT', 'DF', 12)
	Insert Into icms(origem, destino, icms) Values('MT', 'ES', 12)
	Insert Into icms(origem, destino, icms) Values('MT', 'GO', 12)
	Insert Into icms(origem, destino, icms) Values('MT', 'MA', 12)
	Insert Into icms(origem, destino, icms) Values('MT', 'MT', 0)
	Insert Into icms(origem, destino, icms) Values('MT', 'MS', 12)
	Insert Into icms(origem, destino, icms) Values('MT', 'MG', 12)
	Insert Into icms(origem, destino, icms) Values('MT', 'PA', 12)
	Insert Into icms(origem, destino, icms) Values('MT', 'PB', 12)
	Insert Into icms(origem, destino, icms) Values('MT', 'PR', 12)
	Insert Into icms(origem, destino, icms) Values('MT', 'PE', 12)
	Insert Into icms(origem, destino, icms) Values('MT', 'PI', 12)
	Insert Into icms(origem, destino, icms) Values('MT', 'RN', 12)
	Insert Into icms(origem, destino, icms) Values('MT', 'RS', 12)
	Insert Into icms(origem, destino, icms) Values('MT', 'RJ', 12)
	Insert Into icms(origem, destino, icms) Values('MT', 'RO', 12)
	Insert Into icms(origem, destino, icms) Values('MT', 'RR', 12)
	Insert Into icms(origem, destino, icms) Values('MT', 'SC', 12)
	Insert Into icms(origem, destino, icms) Values('MT', 'SP', 12)
	Insert Into icms(origem, destino, icms) Values('MT', 'SE', 12)
	Insert Into icms(origem, destino, icms) Values('MT', 'TO', 12)
	Insert Into icms(origem, destino, icms) Values('MS', 'AC', 12)
	Insert Into icms(origem, destino, icms) Values('MS', 'AL', 12)
	Insert Into icms(origem, destino, icms) Values('MS', 'AM', 12)
	Insert Into icms(origem, destino, icms) Values('MS', 'AP', 12)
	Insert Into icms(origem, destino, icms) Values('MS', 'BA', 12)
	Insert Into icms(origem, destino, icms) Values('MS', 'CE', 12)
	Insert Into icms(origem, destino, icms) Values('MS', 'DF', 12)
	Insert Into icms(origem, destino, icms) Values('MS', 'ES', 12)
	Insert Into icms(origem, destino, icms) Values('MS', 'GO', 12)
	Insert Into icms(origem, destino, icms) Values('MS', 'MA', 12)
	Insert Into icms(origem, destino, icms) Values('MS', 'MT', 12)
	Insert Into icms(origem, destino, icms) Values('MS', 'MS', 0)
	Insert Into icms(origem, destino, icms) Values('MS', 'MG', 12)
	Insert Into icms(origem, destino, icms) Values('MS', 'PA', 12)
	Insert Into icms(origem, destino, icms) Values('MS', 'PB', 12)
	Insert Into icms(origem, destino, icms) Values('MS', 'PR', 12)
	Insert Into icms(origem, destino, icms) Values('MS', 'PE', 12)
	Insert Into icms(origem, destino, icms) Values('MS', 'PI', 12)
	Insert Into icms(origem, destino, icms) Values('MS', 'RN', 12)
	Insert Into icms(origem, destino, icms) Values('MS', 'RS', 12)
	Insert Into icms(origem, destino, icms) Values('MS', 'RJ', 12)
	Insert Into icms(origem, destino, icms) Values('MS', 'RO', 12)
	Insert Into icms(origem, destino, icms) Values('MS', 'RR', 12)
	Insert Into icms(origem, destino, icms) Values('MS', 'SC', 12)
	Insert Into icms(origem, destino, icms) Values('MS', 'SP', 12)
	Insert Into icms(origem, destino, icms) Values('MS', 'SE', 12)
	Insert Into icms(origem, destino, icms) Values('MS', 'TO', 12)
	Insert Into icms(origem, destino, icms) Values('MG', 'AC', 7)
	Insert Into icms(origem, destino, icms) Values('MG', 'AL', 7)
	Insert Into icms(origem, destino, icms) Values('MG', 'AM', 7)
	Insert Into icms(origem, destino, icms) Values('MG', 'AP', 7)
	Insert Into icms(origem, destino, icms) Values('MG', 'BA', 7)
	Insert Into icms(origem, destino, icms) Values('MG', 'CE', 7)
	Insert Into icms(origem, destino, icms) Values('MG', 'DF', 7)
	Insert Into icms(origem, destino, icms) Values('MG', 'ES', 7)
	Insert Into icms(origem, destino, icms) Values('MG', 'GO', 7)
	Insert Into icms(origem, destino, icms) Values('MG', 'MA', 7)
	Insert Into icms(origem, destino, icms) Values('MG', 'MT', 7)
	Insert Into icms(origem, destino, icms) Values('MG', 'MS', 7)
	Insert Into icms(origem, destino, icms) Values('MG', 'MG', 0)
	Insert Into icms(origem, destino, icms) Values('MG', 'PA', 7)
	Insert Into icms(origem, destino, icms) Values('MG', 'PB', 7)
	Insert Into icms(origem, destino, icms) Values('MG', 'PR', 12)
	Insert Into icms(origem, destino, icms) Values('MG', 'PE', 7)
	Insert Into icms(origem, destino, icms) Values('MG', 'PI', 7)
	Insert Into icms(origem, destino, icms) Values('MG', 'RN', 7)
	Insert Into icms(origem, destino, icms) Values('MG', 'RS', 12)
	Insert Into icms(origem, destino, icms) Values('MG', 'RJ', 12)
	Insert Into icms(origem, destino, icms) Values('MG', 'RO', 7)
	Insert Into icms(origem, destino, icms) Values('MG', 'RR', 7)
	Insert Into icms(origem, destino, icms) Values('MG', 'SC', 12)
	Insert Into icms(origem, destino, icms) Values('MG', 'SP', 12)
	Insert Into icms(origem, destino, icms) Values('MG', 'SE', 7)
	Insert Into icms(origem, destino, icms) Values('MG', 'TO', 7)
	Insert Into icms(origem, destino, icms) Values('PA', 'AC', 12)
	Insert Into icms(origem, destino, icms) Values('PA', 'AL', 12)
	Insert Into icms(origem, destino, icms) Values('PA', 'AM', 12)
	Insert Into icms(origem, destino, icms) Values('PA', 'AP', 12)
	Insert Into icms(origem, destino, icms) Values('PA', 'BA', 12)
	Insert Into icms(origem, destino, icms) Values('PA', 'CE', 12)
	Insert Into icms(origem, destino, icms) Values('PA', 'DF', 12)
	Insert Into icms(origem, destino, icms) Values('PA', 'ES', 12)
	Insert Into icms(origem, destino, icms) Values('PA', 'GO', 12)
	Insert Into icms(origem, destino, icms) Values('PA', 'MA', 12)
	Insert Into icms(origem, destino, icms) Values('PA', 'MT', 12)
	Insert Into icms(origem, destino, icms) Values('PA', 'MS', 12)
	Insert Into icms(origem, destino, icms) Values('PA', 'MG', 12)
	Insert Into icms(origem, destino, icms) Values('PA', 'PA', 0)
	Insert Into icms(origem, destino, icms) Values('PA', 'PB', 12)
	Insert Into icms(origem, destino, icms) Values('PA', 'PR', 12)
	Insert Into icms(origem, destino, icms) Values('PA', 'PE', 12)
	Insert Into icms(origem, destino, icms) Values('PA', 'PI', 12)
	Insert Into icms(origem, destino, icms) Values('PA', 'RN', 12)
	Insert Into icms(origem, destino, icms) Values('PA', 'RS', 12)
	Insert Into icms(origem, destino, icms) Values('PA', 'RJ', 12)
	Insert Into icms(origem, destino, icms) Values('PA', 'RO', 12)
	Insert Into icms(origem, destino, icms) Values('PA', 'RR', 12)
	Insert Into icms(origem, destino, icms) Values('PA', 'SC', 12)
	Insert Into icms(origem, destino, icms) Values('PA', 'SP', 12)
	Insert Into icms(origem, destino, icms) Values('PA', 'SE', 12)
	Insert Into icms(origem, destino, icms) Values('PA', 'TO', 12)
	Insert Into icms(origem, destino, icms) Values('PB', 'AC', 12)
	Insert Into icms(origem, destino, icms) Values('PB', 'AL', 12)
	Insert Into icms(origem, destino, icms) Values('PB', 'AM', 12)
	Insert Into icms(origem, destino, icms) Values('PB', 'AP', 12)
	Insert Into icms(origem, destino, icms) Values('PB', 'BA', 12)
	Insert Into icms(origem, destino, icms) Values('PB', 'CE', 12)
	Insert Into icms(origem, destino, icms) Values('PB', 'DF', 12)
	Insert Into icms(origem, destino, icms) Values('PB', 'ES', 12)
	Insert Into icms(origem, destino, icms) Values('PB', 'GO', 12)
	Insert Into icms(origem, destino, icms) Values('PB', 'MA', 12)
	Insert Into icms(origem, destino, icms) Values('PB', 'MT', 12)
	Insert Into icms(origem, destino, icms) Values('PB', 'MS', 12)
	Insert Into icms(origem, destino, icms) Values('PB', 'MG', 12)
	Insert Into icms(origem, destino, icms) Values('PB', 'PA', 12)
	Insert Into icms(origem, destino, icms) Values('PB', 'PB', 0)
	Insert Into icms(origem, destino, icms) Values('PB', 'PR', 12)
	Insert Into icms(origem, destino, icms) Values('PB', 'PE', 12)
	Insert Into icms(origem, destino, icms) Values('PB', 'PI', 12)
	Insert Into icms(origem, destino, icms) Values('PB', 'RN', 12)
	Insert Into icms(origem, destino, icms) Values('PB', 'RS', 12)
	Insert Into icms(origem, destino, icms) Values('PB', 'RJ', 12)
	Insert Into icms(origem, destino, icms) Values('PB', 'RO', 12)
	Insert Into icms(origem, destino, icms) Values('PB', 'RR', 12)
	Insert Into icms(origem, destino, icms) Values('PB', 'SC', 12)
	Insert Into icms(origem, destino, icms) Values('PB', 'SP', 12)
	Insert Into icms(origem, destino, icms) Values('PB', 'SE', 12)
	Insert Into icms(origem, destino, icms) Values('PB', 'TO', 12)
	Insert Into icms(origem, destino, icms) Values('PR', 'AC', 7)
	Insert Into icms(origem, destino, icms) Values('PR', 'AL', 7)
	Insert Into icms(origem, destino, icms) Values('PR', 'AM', 7)
	Insert Into icms(origem, destino, icms) Values('PR', 'AP', 7)
	Insert Into icms(origem, destino, icms) Values('PR', 'BA', 7)
	Insert Into icms(origem, destino, icms) Values('PR', 'CE', 7)
	Insert Into icms(origem, destino, icms) Values('PR', 'DF', 7)
	Insert Into icms(origem, destino, icms) Values('PR', 'ES', 7)
	Insert Into icms(origem, destino, icms) Values('PR', 'GO', 7)
	Insert Into icms(origem, destino, icms) Values('PR', 'MA', 7)
	Insert Into icms(origem, destino, icms) Values('PR', 'MT', 7)
	Insert Into icms(origem, destino, icms) Values('PR', 'MS', 7)
	Insert Into icms(origem, destino, icms) Values('PR', 'MG', 12)
	Insert Into icms(origem, destino, icms) Values('PR', 'PA', 7)
	Insert Into icms(origem, destino, icms) Values('PR', 'PB', 7)
	Insert Into icms(origem, destino, icms) Values('PR', 'PR', 18)
	Insert Into icms(origem, destino, icms) Values('PR', 'PE', 7)
	Insert Into icms(origem, destino, icms) Values('PR', 'PI', 7)
	Insert Into icms(origem, destino, icms) Values('PR', 'RN', 7)
	Insert Into icms(origem, destino, icms) Values('PR', 'RS', 12)
	Insert Into icms(origem, destino, icms) Values('PR', 'RJ', 12)
	Insert Into icms(origem, destino, icms) Values('PR', 'RO', 7)
	Insert Into icms(origem, destino, icms) Values('PR', 'RR', 7)
	Insert Into icms(origem, destino, icms) Values('PR', 'SC', 12)
	Insert Into icms(origem, destino, icms) Values('PR', 'SP', 12)
	Insert Into icms(origem, destino, icms) Values('PR', 'SE', 7)
	Insert Into icms(origem, destino, icms) Values('PR', 'TO', 7)
	Insert Into icms(origem, destino, icms) Values('PE', 'AC', 12)
	Insert Into icms(origem, destino, icms) Values('PE', 'AL', 12)
	Insert Into icms(origem, destino, icms) Values('PE', 'AM', 12)
	Insert Into icms(origem, destino, icms) Values('PE', 'AP', 12)
	Insert Into icms(origem, destino, icms) Values('PE', 'BA', 12)
	Insert Into icms(origem, destino, icms) Values('PE', 'CE', 12)
	Insert Into icms(origem, destino, icms) Values('PE', 'DF', 12)
	Insert Into icms(origem, destino, icms) Values('PE', 'ES', 12)
	Insert Into icms(origem, destino, icms) Values('PE', 'GO', 12)
	Insert Into icms(origem, destino, icms) Values('PE', 'MA', 12)
	Insert Into icms(origem, destino, icms) Values('PE', 'MT', 12)
	Insert Into icms(origem, destino, icms) Values('PE', 'MS', 12)
	Insert Into icms(origem, destino, icms) Values('PE', 'MG', 12)
	Insert Into icms(origem, destino, icms) Values('PE', 'PA', 12)
	Insert Into icms(origem, destino, icms) Values('PE', 'PB', 12)
	Insert Into icms(origem, destino, icms) Values('PE', 'PR', 12)
	Insert Into icms(origem, destino, icms) Values('PE', 'PE', 0)
	Insert Into icms(origem, destino, icms) Values('PE', 'PI', 12)
	Insert Into icms(origem, destino, icms) Values('PE', 'RN', 12)
	Insert Into icms(origem, destino, icms) Values('PE', 'RS', 12)
	Insert Into icms(origem, destino, icms) Values('PE', 'RJ', 12)
	Insert Into icms(origem, destino, icms) Values('PE', 'RO', 12)
	Insert Into icms(origem, destino, icms) Values('PE', 'RR', 12)
	Insert Into icms(origem, destino, icms) Values('PE', 'SC', 12)
	Insert Into icms(origem, destino, icms) Values('PE', 'SP', 12)
	Insert Into icms(origem, destino, icms) Values('PE', 'SE', 12)
	Insert Into icms(origem, destino, icms) Values('PE', 'TO', 12)
	Insert Into icms(origem, destino, icms) Values('PI', 'AC', 12)
	Insert Into icms(origem, destino, icms) Values('PI', 'AL', 12)
	Insert Into icms(origem, destino, icms) Values('PI', 'AM', 12)
	Insert Into icms(origem, destino, icms) Values('PI', 'AP', 12)
	Insert Into icms(origem, destino, icms) Values('PI', 'BA', 12)
	Insert Into icms(origem, destino, icms) Values('PI', 'CE', 12)
	Insert Into icms(origem, destino, icms) Values('PI', 'DF', 12)
	Insert Into icms(origem, destino, icms) Values('PI', 'ES', 12)
	Insert Into icms(origem, destino, icms) Values('PI', 'GO', 12)
	Insert Into icms(origem, destino, icms) Values('PI', 'MA', 12)
	Insert Into icms(origem, destino, icms) Values('PI', 'MT', 12)
	Insert Into icms(origem, destino, icms) Values('PI', 'MS', 12)
	Insert Into icms(origem, destino, icms) Values('PI', 'MG', 12)
	Insert Into icms(origem, destino, icms) Values('PI', 'PA', 12)
	Insert Into icms(origem, destino, icms) Values('PI', 'PB', 12)
	Insert Into icms(origem, destino, icms) Values('PI', 'PR', 12)
	Insert Into icms(origem, destino, icms) Values('PI', 'PE', 12)
	Insert Into icms(origem, destino, icms) Values('PI', 'PI', 0)
	Insert Into icms(origem, destino, icms) Values('PI', 'RN', 12)
	Insert Into icms(origem, destino, icms) Values('PI', 'RS', 12)
	Insert Into icms(origem, destino, icms) Values('PI', 'RJ', 12)
	Insert Into icms(origem, destino, icms) Values('PI', 'RO', 12)
	Insert Into icms(origem, destino, icms) Values('PI', 'RR', 12)
	Insert Into icms(origem, destino, icms) Values('PI', 'SC', 12)
	Insert Into icms(origem, destino, icms) Values('PI', 'SP', 12)
	Insert Into icms(origem, destino, icms) Values('PI', 'SE', 12)
	Insert Into icms(origem, destino, icms) Values('PI', 'TO', 12)
	Insert Into icms(origem, destino, icms) Values('RN', 'AC', 12)
	Insert Into icms(origem, destino, icms) Values('RN', 'AL', 12)
	Insert Into icms(origem, destino, icms) Values('RN', 'AM', 12)
	Insert Into icms(origem, destino, icms) Values('RN', 'AP', 12)
	Insert Into icms(origem, destino, icms) Values('RN', 'BA', 12)
	Insert Into icms(origem, destino, icms) Values('RN', 'CE', 12)
	Insert Into icms(origem, destino, icms) Values('RN', 'DF', 12)
	Insert Into icms(origem, destino, icms) Values('RN', 'ES', 12)
	Insert Into icms(origem, destino, icms) Values('RN', 'GO', 12)
	Insert Into icms(origem, destino, icms) Values('RN', 'MA', 12)
	Insert Into icms(origem, destino, icms) Values('RN', 'MT', 12)
	Insert Into icms(origem, destino, icms) Values('RN', 'MS', 12)
	Insert Into icms(origem, destino, icms) Values('RN', 'MG', 12)
	Insert Into icms(origem, destino, icms) Values('RN', 'PA', 12)
	Insert Into icms(origem, destino, icms) Values('RN', 'PB', 12)
	Insert Into icms(origem, destino, icms) Values('RN', 'PR', 12)
	Insert Into icms(origem, destino, icms) Values('RN', 'PE', 12)
	Insert Into icms(origem, destino, icms) Values('RN', 'PI', 12)
	Insert Into icms(origem, destino, icms) Values('RN', 'RN', 0)
	Insert Into icms(origem, destino, icms) Values('RN', 'RS', 12)
	Insert Into icms(origem, destino, icms) Values('RN', 'RJ', 12)
	Insert Into icms(origem, destino, icms) Values('RN', 'RO', 12)
	Insert Into icms(origem, destino, icms) Values('RN', 'RR', 12)
	Insert Into icms(origem, destino, icms) Values('RN', 'SC', 12)
	Insert Into icms(origem, destino, icms) Values('RN', 'SP', 12)
	Insert Into icms(origem, destino, icms) Values('RN', 'SE', 12)
	Insert Into icms(origem, destino, icms) Values('RN', 'TO', 12)
	Insert Into icms(origem, destino, icms) Values('RS', 'AC', 7)
	Insert Into icms(origem, destino, icms) Values('RS', 'AL', 7)
	Insert Into icms(origem, destino, icms) Values('RS', 'AM', 7)
	Insert Into icms(origem, destino, icms) Values('RS', 'AP', 7)
	Insert Into icms(origem, destino, icms) Values('RS', 'BA', 7)
	Insert Into icms(origem, destino, icms) Values('RS', 'CE', 7)
	Insert Into icms(origem, destino, icms) Values('RS', 'DF', 7)
	Insert Into icms(origem, destino, icms) Values('RS', 'ES', 7)
	Insert Into icms(origem, destino, icms) Values('RS', 'GO', 7)
	Insert Into icms(origem, destino, icms) Values('RS', 'MA', 7)
	Insert Into icms(origem, destino, icms) Values('RS', 'MT', 7)
	Insert Into icms(origem, destino, icms) Values('RS', 'MS', 7)
	Insert Into icms(origem, destino, icms) Values('RS', 'MG', 12)
	Insert Into icms(origem, destino, icms) Values('RS', 'PA', 7)
	Insert Into icms(origem, destino, icms) Values('RS', 'PB', 7)
	Insert Into icms(origem, destino, icms) Values('RS', 'PR', 12)
	Insert Into icms(origem, destino, icms) Values('RS', 'PE', 7)
	Insert Into icms(origem, destino, icms) Values('RS', 'PI', 7)
	Insert Into icms(origem, destino, icms) Values('RS', 'RN', 7)
	Insert Into icms(origem, destino, icms) Values('RS', 'RS', 0)
	Insert Into icms(origem, destino, icms) Values('RS', 'RJ', 12)
	Insert Into icms(origem, destino, icms) Values('RS', 'RO', 7)
	Insert Into icms(origem, destino, icms) Values('RS', 'RR', 7)
	Insert Into icms(origem, destino, icms) Values('RS', 'SC', 12)
	Insert Into icms(origem, destino, icms) Values('RS', 'SP', 12)
	Insert Into icms(origem, destino, icms) Values('RS', 'SE', 7)
	Insert Into icms(origem, destino, icms) Values('RS', 'TO', 7)
	Insert Into icms(origem, destino, icms) Values('RJ', 'AC', 7)
	Insert Into icms(origem, destino, icms) Values('RJ', 'AL', 7)
	Insert Into icms(origem, destino, icms) Values('RJ', 'AM', 7)
	Insert Into icms(origem, destino, icms) Values('RJ', 'AP', 7)
	Insert Into icms(origem, destino, icms) Values('RJ', 'BA', 7)
	Insert Into icms(origem, destino, icms) Values('RJ', 'CE', 7)
	Insert Into icms(origem, destino, icms) Values('RJ', 'DF', 7)
	Insert Into icms(origem, destino, icms) Values('RJ', 'ES', 7)
	Insert Into icms(origem, destino, icms) Values('RJ', 'GO', 7)
	Insert Into icms(origem, destino, icms) Values('RJ', 'MA', 7)
	Insert Into icms(origem, destino, icms) Values('RJ', 'MT', 7)
	Insert Into icms(origem, destino, icms) Values('RJ', 'MS', 7)
	Insert Into icms(origem, destino, icms) Values('RJ', 'MG', 12)
	Insert Into icms(origem, destino, icms) Values('RJ', 'PA', 7)
	Insert Into icms(origem, destino, icms) Values('RJ', 'PB', 7)
	Insert Into icms(origem, destino, icms) Values('RJ', 'PR', 12)
	Insert Into icms(origem, destino, icms) Values('RJ', 'PE', 7)
	Insert Into icms(origem, destino, icms) Values('RJ', 'PI', 7)
	Insert Into icms(origem, destino, icms) Values('RJ', 'RN', 7)
	Insert Into icms(origem, destino, icms) Values('RJ', 'RS', 12)
	Insert Into icms(origem, destino, icms) Values('RJ', 'RJ', 0)
	Insert Into icms(origem, destino, icms) Values('RJ', 'RO', 7)
	Insert Into icms(origem, destino, icms) Values('RJ', 'RR', 7)
	Insert Into icms(origem, destino, icms) Values('RJ', 'SC', 12)
	Insert Into icms(origem, destino, icms) Values('RJ', 'SP', 12)
	Insert Into icms(origem, destino, icms) Values('RJ', 'SE', 7)
	Insert Into icms(origem, destino, icms) Values('RJ', 'TO', 7)
	Insert Into icms(origem, destino, icms) Values('RO', 'AC', 12)
	Insert Into icms(origem, destino, icms) Values('RO', 'AL', 12)
	Insert Into icms(origem, destino, icms) Values('RO', 'AM', 12)
	Insert Into icms(origem, destino, icms) Values('RO', 'AP', 12)
	Insert Into icms(origem, destino, icms) Values('RO', 'BA', 12)
	Insert Into icms(origem, destino, icms) Values('RO', 'CE', 12)
	Insert Into icms(origem, destino, icms) Values('RO', 'DF', 12)
	Insert Into icms(origem, destino, icms) Values('RO', 'ES', 12)
	Insert Into icms(origem, destino, icms) Values('RO', 'GO', 12)
	Insert Into icms(origem, destino, icms) Values('RO', 'MA', 12)
	Insert Into icms(origem, destino, icms) Values('RO', 'MT', 12)
	Insert Into icms(origem, destino, icms) Values('RO', 'MS', 12)
	Insert Into icms(origem, destino, icms) Values('RO', 'MG', 12)
	Insert Into icms(origem, destino, icms) Values('RO', 'PA', 12)
	Insert Into icms(origem, destino, icms) Values('RO', 'PB', 12)
	Insert Into icms(origem, destino, icms) Values('RO', 'PR', 12)
	Insert Into icms(origem, destino, icms) Values('RO', 'PE', 12)
	Insert Into icms(origem, destino, icms) Values('RO', 'PI', 12)
	Insert Into icms(origem, destino, icms) Values('RO', 'RN', 12)
	Insert Into icms(origem, destino, icms) Values('RO', 'RS', 12)
	Insert Into icms(origem, destino, icms) Values('RO', 'RJ', 12)
	Insert Into icms(origem, destino, icms) Values('RO', 'RO', 0)
	Insert Into icms(origem, destino, icms) Values('RO', 'RR', 12)
	Insert Into icms(origem, destino, icms) Values('RO', 'SC', 12)
	Insert Into icms(origem, destino, icms) Values('RO', 'SP', 12)
	Insert Into icms(origem, destino, icms) Values('RO', 'SE', 12)
	Insert Into icms(origem, destino, icms) Values('RO', 'TO', 12)
	Insert Into icms(origem, destino, icms) Values('RR', 'AC', 12)
	Insert Into icms(origem, destino, icms) Values('RR', 'AL', 12)
	Insert Into icms(origem, destino, icms) Values('RR', 'AM', 12)
	Insert Into icms(origem, destino, icms) Values('RR', 'AP', 12)
	Insert Into icms(origem, destino, icms) Values('RR', 'BA', 12)
	Insert Into icms(origem, destino, icms) Values('RR', 'CE', 12)
	Insert Into icms(origem, destino, icms) Values('RR', 'DF', 12)
	Insert Into icms(origem, destino, icms) Values('RR', 'ES', 12)
	Insert Into icms(origem, destino, icms) Values('RR', 'GO', 12)
	Insert Into icms(origem, destino, icms) Values('RR', 'MA', 12)
	Insert Into icms(origem, destino, icms) Values('RR', 'MT', 12)
	Insert Into icms(origem, destino, icms) Values('RR', 'MS', 12)
	Insert Into icms(origem, destino, icms) Values('RR', 'MG', 12)
	Insert Into icms(origem, destino, icms) Values('RR', 'PA', 12)
	Insert Into icms(origem, destino, icms) Values('RR', 'PB', 12)
	Insert Into icms(origem, destino, icms) Values('RR', 'PR', 12)
	Insert Into icms(origem, destino, icms) Values('RR', 'PE', 12)
	Insert Into icms(origem, destino, icms) Values('RR', 'PI', 12)
	Insert Into icms(origem, destino, icms) Values('RR', 'RN', 12)
	Insert Into icms(origem, destino, icms) Values('RR', 'RS', 12)
	Insert Into icms(origem, destino, icms) Values('RR', 'RJ', 12)
	Insert Into icms(origem, destino, icms) Values('RR', 'RO', 12)
	Insert Into icms(origem, destino, icms) Values('RR', 'RR', 0)
	Insert Into icms(origem, destino, icms) Values('RR', 'SC', 12)
	Insert Into icms(origem, destino, icms) Values('RR', 'SP', 12)
	Insert Into icms(origem, destino, icms) Values('RR', 'SE', 12)
	Insert Into icms(origem, destino, icms) Values('RR', 'TO', 12)
	Insert Into icms(origem, destino, icms) Values('SC', 'AC', 7)
	Insert Into icms(origem, destino, icms) Values('SC', 'AL', 7)
	Insert Into icms(origem, destino, icms) Values('SC', 'AM', 7)
	Insert Into icms(origem, destino, icms) Values('SC', 'AP', 7)
	Insert Into icms(origem, destino, icms) Values('SC', 'BA', 7)
	Insert Into icms(origem, destino, icms) Values('SC', 'CE', 7)
	Insert Into icms(origem, destino, icms) Values('SC', 'DF', 7)
	Insert Into icms(origem, destino, icms) Values('SC', 'ES', 7)
	Insert Into icms(origem, destino, icms) Values('SC', 'GO', 7)
	Insert Into icms(origem, destino, icms) Values('SC', 'MA', 7)
	Insert Into icms(origem, destino, icms) Values('SC', 'MT', 7)
	Insert Into icms(origem, destino, icms) Values('SC', 'MS', 7)
	Insert Into icms(origem, destino, icms) Values('SC', 'MG', 12)
	Insert Into icms(origem, destino, icms) Values('SC', 'PA', 7)
	Insert Into icms(origem, destino, icms) Values('SC', 'PB', 7)
	Insert Into icms(origem, destino, icms) Values('SC', 'PR', 12)
	Insert Into icms(origem, destino, icms) Values('SC', 'PE', 7)
	Insert Into icms(origem, destino, icms) Values('SC', 'PI', 7)
	Insert Into icms(origem, destino, icms) Values('SC', 'RN', 7)
	Insert Into icms(origem, destino, icms) Values('SC', 'RS', 12)
	Insert Into icms(origem, destino, icms) Values('SC', 'RJ', 12)
	Insert Into icms(origem, destino, icms) Values('SC', 'RO', 7)
	Insert Into icms(origem, destino, icms) Values('SC', 'RR', 7)
	Insert Into icms(origem, destino, icms) Values('SC', 'SC', 0)
	Insert Into icms(origem, destino, icms) Values('SC', 'SP', 12)
	Insert Into icms(origem, destino, icms) Values('SC', 'SE', 7)
	Insert Into icms(origem, destino, icms) Values('SC', 'TO', 7)
	Insert Into icms(origem, destino, icms) Values('SP', 'AC', 7)
	Insert Into icms(origem, destino, icms) Values('SP', 'AL', 7)
	Insert Into icms(origem, destino, icms) Values('SP', 'AM', 7)
	Insert Into icms(origem, destino, icms) Values('SP', 'AP', 7)
	Insert Into icms(origem, destino, icms) Values('SP', 'BA', 7)
	Insert Into icms(origem, destino, icms) Values('SP', 'CE', 7)
	Insert Into icms(origem, destino, icms) Values('SP', 'DF', 7)
	Insert Into icms(origem, destino, icms) Values('SP', 'ES', 7)
	Insert Into icms(origem, destino, icms) Values('SP', 'GO', 7)
	Insert Into icms(origem, destino, icms) Values('SP', 'MA', 7)
	Insert Into icms(origem, destino, icms) Values('SP', 'MT', 7)
	Insert Into icms(origem, destino, icms) Values('SP', 'MS', 7)
	Insert Into icms(origem, destino, icms) Values('SP', 'MG', 12)
	Insert Into icms(origem, destino, icms) Values('SP', 'PA', 7)
	Insert Into icms(origem, destino, icms) Values('SP', 'PB', 7)
	Insert Into icms(origem, destino, icms) Values('SP', 'PR', 12)
	Insert Into icms(origem, destino, icms) Values('SP', 'PE', 7)
	Insert Into icms(origem, destino, icms) Values('SP', 'PI', 7)
	Insert Into icms(origem, destino, icms) Values('SP', 'RN', 7)
	Insert Into icms(origem, destino, icms) Values('SP', 'RS', 12)
	Insert Into icms(origem, destino, icms) Values('SP', 'RJ', 12)
	Insert Into icms(origem, destino, icms) Values('SP', 'RO', 7)
	Insert Into icms(origem, destino, icms) Values('SP', 'RR', 7)
	Insert Into icms(origem, destino, icms) Values('SP', 'SC', 12)
	Insert Into icms(origem, destino, icms) Values('SP', 'SP', 0)
	Insert Into icms(origem, destino, icms) Values('SP', 'SE', 7)
	Insert Into icms(origem, destino, icms) Values('SP', 'TO', 7)
	Insert Into icms(origem, destino, icms) Values('SE', 'AC', 12)
	Insert Into icms(origem, destino, icms) Values('SE', 'AL', 12)
	Insert Into icms(origem, destino, icms) Values('SE', 'AM', 12)
	Insert Into icms(origem, destino, icms) Values('SE', 'AP', 12)
	Insert Into icms(origem, destino, icms) Values('SE', 'BA', 12)
	Insert Into icms(origem, destino, icms) Values('SE', 'CE', 12)
	Insert Into icms(origem, destino, icms) Values('SE', 'DF', 12)
	Insert Into icms(origem, destino, icms) Values('SE', 'ES', 12)
	Insert Into icms(origem, destino, icms) Values('SE', 'GO', 12)
	Insert Into icms(origem, destino, icms) Values('SE', 'MA', 12)
	Insert Into icms(origem, destino, icms) Values('SE', 'MT', 12)
	Insert Into icms(origem, destino, icms) Values('SE', 'MS', 12)
	Insert Into icms(origem, destino, icms) Values('SE', 'MG', 12)
	Insert Into icms(origem, destino, icms) Values('SE', 'PA', 12)
	Insert Into icms(origem, destino, icms) Values('SE', 'PB', 12)
	Insert Into icms(origem, destino, icms) Values('SE', 'PR', 12)
	Insert Into icms(origem, destino, icms) Values('SE', 'PE', 12)
	Insert Into icms(origem, destino, icms) Values('SE', 'PI', 12)
	Insert Into icms(origem, destino, icms) Values('SE', 'RN', 12)
	Insert Into icms(origem, destino, icms) Values('SE', 'RS', 12)
	Insert Into icms(origem, destino, icms) Values('SE', 'RJ', 12)
	Insert Into icms(origem, destino, icms) Values('SE', 'RO', 12)
	Insert Into icms(origem, destino, icms) Values('SE', 'RR', 12)
	Insert Into icms(origem, destino, icms) Values('SE', 'SC', 12)
	Insert Into icms(origem, destino, icms) Values('SE', 'SP', 12)
	Insert Into icms(origem, destino, icms) Values('SE', 'SE', 0)
	Insert Into icms(origem, destino, icms) Values('SE', 'TO', 12)
	Insert Into icms(origem, destino, icms) Values('TO', 'AC', 12)
	Insert Into icms(origem, destino, icms) Values('TO', 'AL', 12)
	Insert Into icms(origem, destino, icms) Values('TO', 'AM', 12)
	Insert Into icms(origem, destino, icms) Values('TO', 'AP', 12)
	Insert Into icms(origem, destino, icms) Values('TO', 'BA', 12)
	Insert Into icms(origem, destino, icms) Values('TO', 'CE', 12)
	Insert Into icms(origem, destino, icms) Values('TO', 'DF', 12)
	Insert Into icms(origem, destino, icms) Values('TO', 'ES', 12)
	Insert Into icms(origem, destino, icms) Values('TO', 'GO', 12)
	Insert Into icms(origem, destino, icms) Values('TO', 'MA', 12)
	Insert Into icms(origem, destino, icms) Values('TO', 'MT', 12)
	Insert Into icms(origem, destino, icms) Values('TO', 'MS', 12)
	Insert Into icms(origem, destino, icms) Values('TO', 'MG', 12)
	Insert Into icms(origem, destino, icms) Values('TO', 'PA', 12)
	Insert Into icms(origem, destino, icms) Values('TO', 'PB', 12)
	Insert Into icms(origem, destino, icms) Values('TO', 'PR', 12)
	Insert Into icms(origem, destino, icms) Values('TO', 'PE', 12)
	Insert Into icms(origem, destino, icms) Values('TO', 'PI', 12)
	Insert Into icms(origem, destino, icms) Values('TO', 'RN', 12)
	Insert Into icms(origem, destino, icms) Values('TO', 'RS', 12)
	Insert Into icms(origem, destino, icms) Values('TO', 'RJ', 12)
	Insert Into icms(origem, destino, icms) Values('TO', 'RO', 12)
	Insert Into icms(origem, destino, icms) Values('TO', 'RR', 12)
	Insert Into icms(origem, destino, icms) Values('TO', 'SC', 12)
	Insert Into icms(origem, destino, icms) Values('TO', 'SP', 12)
	Insert Into icms(origem, destino, icms) Values('TO', 'SE', 12)
	Insert Into icms(origem, destino, icms) Values('TO', 'TO', 0)
	Update cliente Set situ = 'Inativo' Where Alltrim(situ) == 'Desativo'
	Rename Table clicob To endereco
	Alter Table endereco Add Column complemento Character(50)
	Alter Table endereco Add Column pontoref Character(50)
	Alter Table endereco Add Column tipo Numeric(1)
	Alter Table endereco Add Column idcliente Integer
	Alter Table endereco Add Column principal Logical

	Use In cliente
	Use In endereco
	Select 1
	Use cliente Exclusive
	Select 2
	Use endereco Exclusive
	Scan
		Select cliente
		Locate For idclicob = endereco.id
		Select endereco
		Replace idcliente With cliente.id
	EndScan

	Use In cliente
	Use In endereco
	Alter Table cliente Drop Column idclicob

	Use In cliente
	Select 1
	Use cliente Exclusive
	Scan
		Replace fax With Stuff(fax, 5, 1, '')
		Replace celular With Stuff(celular, 5, 1, '')
		Replace foneref1 With Stuff(foneref1, 5, 1, '')
		Replace foneref2 With Stuff(foneref2, 5, 1, '')
		Replace foneref3 With Stuff(foneref3, 5, 1, '')
		Replace fonecom With Stuff(fonecom, 5, 1, '')
		Replace fonefin With Stuff(fonefin, 5, 1, '')
		Replace celconj With Stuff(celconj, 5, 1, '')
		Replace fonepc1 With Stuff(fonepc1, 5, 1, '')
		Replace fonepc2 With Stuff(fonepc2, 5, 1, '')
		Replace fonepc3 With Stuff(fonepc3, 5, 1, '')
		Insert Into endereco (endereco, numero, cidade, bairro, cep, contato, fone, estado,;
			complemento, pontoref, tipo, idcliente, principal) Values (cliente.endereco, cliente.numero,;
			cliente.cidade, cliente.bairro, cliente.cep, cliente.contato, cliente.fone,;
			cliente.estado, cliente.complemento, cliente.pontoref,;
			Iif(Alltrim(cliente.tipo) == 'Jurídica', 1, 2), cliente.id, .T.)
		Select cliente
	EndScan
	Use In cliente
	Alter Table cliente Drop Column endereco
	Alter Table cliente Drop Column numero
	Alter Table cliente Drop Column cidade
	Alter Table cliente Drop Column bairro
	Alter Table cliente Drop Column cep
	Alter Table cliente Drop Column estado
	Alter Table cliente Drop Column complemento
	Alter Table cliente Drop Column pontoref
	Insert Into tparam (campo, valor) Values ('AutoPecas', '0')
	Alter Table produto Add Column custobru Float(10,2)
	Alter Table produto Add Column percdesc Float(6,2)

	Chdir Justpath(_Database)
	*!------------------------- Fechar Venda no Boleto -------------------------!*
	*! @field id = Identificação do registro
	*! @field idvenda = Identificação da venda
	*! @field idcliente = Identificação do cliente
	*! @field idendereco = Identificação do endereço
	*! @field nossonum = Nosso número
	*! @field dataemi = Data de emissão
	*! @field datavenc = Data de vencimento
	*! @field datapag = Data de pagamento
	*! @field vlrpago = Valor pago
	*! @field vlrdoc = Valor total do documento
	*! @field numparc = Número de parcelas
	*! @field totparc = Total de parcelas
	*! @field numdoc = Número do documento
	*! @field qtde = Quantidade
	*! @field valor
	*! @field sacador = Sacador / Avalista
	*! @field codbaixa = Código de baixa
	*! @field impresso = Indica se o documento já foi impresso
	*! @field situ = Situação aqui pode ser: Aberto(A), Baixado(B)
	Create Table 'Fechar Venda no Boleto' Name 'boleto'(;
		id			Integer Autoinc,;
		idvenda		Integer,;
		idcliente	Integer,;
		idendereco	Integer,;
		nossonum	Character(20),;
		dataemi		Date,;
		datavenc	Date,;
		datapag		Date,;
		vlrpago		Float(10,2),;
		vlrdoc		Float(10,2),;
		numparc		Numeric(3),;
		totparc		Numeric(3),;
		numdoc		Character(10),;
		qtde		Float(10,3),;
		valor		Float(10,2),;
		sacador		Character(40),;
		codbaixa	Character(10),;
		impresso	Logical,;
		situ		Character(1);
	)
	*!--------------------------------------------------------------------------!*
	Chdir &_SystemPath
	Alter Table venda Add Column idendereco Integer
	Alter Table prevenda Add Column idendereco Integer
	Alter Table orcame Add Column idendereco Integer
	Insert Into tparam (campo, valor) Values ('LocalPagamentoBoleto', '')
	Insert Into tparam (campo, valor) Values ('CedenteBoleto', '')
	Insert Into tparam (campo, valor) Values ('CodigoCedenteBoleto', '')
	Insert Into tparam (campo, valor) Values ('EspecieDocumentoBoleto', '')
	Insert Into tparam (campo, valor) Values ('AceiteBoleto', '')
	Insert Into tparam (campo, valor) Values ('EspecieMoedaBoleto', '')
	Insert Into tparam (campo, valor) Values ('InstrucoesBoleto', '')
	Chdir Justpath(_Database)
	*!--------------------------------- Confbol --------------------------------!*
	*! @field id = Identificação do registro
	*! @field descricao = Descrição do campo no boleto
	*! @field linha = Medida em milímetros do topo da página até o campo
	*! @field coluna = Medida em milímetros da esquerda da página até o campo
	Create Table 'Configurações do boleto' Name 'confbol'(;
		id			Integer Autoinc,;
		descricao	Character(200),;
		linha		Float(8,4),;
		coluna		Float(8,4);
	)
	*!--------------------------------------------------------------------------!*
	Chdir &_SystemPath
	Insert Into confbol (descricao) Values ('Local de Pagamento')
	Insert Into confbol (descricao) Values ('Vencimento')
	Insert Into confbol (descricao) Values ('Cedente')
	Insert Into confbol (descricao) Values ('Código Cedente')
	Insert Into confbol (descricao) Values ('Data do Documento')
	Insert Into confbol (descricao) Values ('Número do Documento')
	Insert Into confbol (descricao) Values ('Espécie do Documento')
	Insert Into confbol (descricao) Values ('Aceite')
	Insert Into confbol (descricao) Values ('Data do Processamento')
	Insert Into confbol (descricao) Values ('Espécie da Moeda')
	Insert Into confbol (descricao) Values ('Quantidade')
	Insert Into confbol (descricao) Values ('Valor')
	Insert Into confbol (descricao) Values ('Valor do Documento')
	Insert Into confbol (descricao) Values ('Instruções')
	Insert Into confbol (descricao) Values ('Sacado')
	Insert Into confbol (descricao) Values ('Cnpj')
	Insert Into confbol (descricao) Values ('Endereço')
	Insert Into confbol (descricao) Values ('Sacador')
	Insert Into confbol (descricao) Values ('Código de Baixa')
	Chdir Justpath(_Database)
	*!--------------------------------- Veiculo --------------------------------!*
	*! @field id = Identificação do registro
	*! @field idcliente = Identificação do cliente
	*! @field modelo
	*! @field marca
	*! @field cor
	*! @field placa
	Create Table 'Veículos do cliente' Name 'veiculo'(;
		id			Integer Autoinc,;
		idcliente	Integer,;
		modelo		Character(20),;
		marca		Character(15),;
		cor			Character(15),;
		placa		Character(15);
	)
	*!--------------------------------------------------------------------------!*
	Chdir &_SystemPath
	Insert Into tparam (campo, valor) Values ('Mecanica', '0')
	Alter Table venda Add Column idveiculo Integer
	Alter Table prevenda Add Column idveiculo Integer
	Alter Table orcame Add Column idveiculo Integer
	Insert Into tparam (campo, valor) Values ('QuantidadeDeCopiasDoRecibo', '1')
	Insert Into tparam (campo, valor) Values ('BloquearVendaEstoqueNegativo', '0')
	Insert Into tparam (campo, valor) Values ('ClienteComRestricaoDeCredito', '1')
	Alter Table cliente Drop Column bloquear
	Alter Table feccart Rename idcartao To idcadcart
	Rename Table cartao To cadcart
	Create Trigger On cadcart For Delete As RefInt(id, 'cadcart', 'delete')
	Update pergru Set recurso = 'cadcart' Where Alltrim(recurso) == 'cartao'
	Update perusu Set recurso = 'cadcart' Where Alltrim(recurso) == 'cartao'
	Rename Table feccart To cartao
	Rename Table contasban To contas
	Alter Table credito Rename idcontasban To idcontas
	Insert Into tparam (campo, valor) Values ('TextoResponsabilidadeSobreEquipamentoOS', '')
	Chdir Justpath(_Database)
	*!------------------------------ Colaboradores -----------------------------!*
	*! @field id = Identificação do registro
	*! @field cnome = Campo nome
	*! @field datacad = Data de cadastro
	*! @field endereco
	*! @field bairro
	*! @field cidade
	*! @field estado
	*! @field cep
	*! @field fone
	*! @field celular
	*! @field rg
	*! @field cpf
	*! @field datanas = Data de nascimento
	*! @field email
	*! @field cargo = Pode ser: 1 - Técnico, 2 - Atendente, 3 - Outro
	*! @field obs = Observações
	Create Table 'Colaboradores' Name 'colab'(;
		id			Integer Autoinc,;
		cnome		Character(20),;
		datacad		Date,;
		endereco	Character(50),;
		bairro		Character(40),;
		cidade		Character(40),;
		estado		Character(2),;
		cep			Character(10),;
		fone		Character(14),;
		celular		Character(14),;
		rg			Character(10),;
		cpf			Character(15),;
		datanas		Date,;
		email		Character(50),;
		cargo		Numeric(1),;
		obs			Memo;
	)
	*!--------------------------------------------------------------------------!*
	Chdir &_SystemPath
	Insert Into tparam (campo, valor) Values ('GarantiaOS', '')
	Chdir Justpath(_Database)
	*!---------------------------- Ordem de Serviço ----------------------------!*
	*! @field id = Identificação do registro
	*! @field idcliente = Identificação do cliente
	*! @field idendereco = Identificação do endereço
	*! @field idatend = Identificação do atendente
	*! @field idtec = Identificação do técnico
	*! @field dataent = Data de entrada do equipamento
	*! @field _status = Pode ser: 1 - Aberta, 2 - Pendente, 3 - Concluída
	*! @field modelo = Pode ser o modelo do veículo ou a descrição(nome) do equipamento
	*! @field marca = Pode ser a marca do veículo ou do equipamento
	*! @field cor = Pode ser a cor do veículo ou o modelo do equipamento
	*! @field placa = Pode ser a placa do veículo ou o número de série do equipamento
	*! @field defeito = Defeito reportado pelo cliente
	*! @field servicos = Descrição dos serviços executados
	*! @field totpro = Valor total dos produtos aplicados
	*! @field totserv = Valor dos serviços executados
	*! @field datasai = Data de saída
	*! @field relatorio = Relatório(laudo) técnico do serviço.
	*! @field historico = Histórico de execução do serviço
	Create Table 'Ordem de Serviço' Name 'ordserv'(;
		id			Integer Autoinc,;
		idcliente	Integer,;
		idendereco	Integer,;
		idatend		Integer,;
		idtec		Integer,;
		dataent		Date,;
		_status		Numeric(1),;
		modelo		Character(30),;
		marca		Character(20),;
		cor			Character(20),;
		placa		Character(20),;
		defeito		Memo,;
		servicos	Memo,;
		totpro		Float(10,2),;
		totserv		Float(10,2),;
		datasai		Date,;
		relatorio	Memo,;
		historico	Memo;
	)
	*!--------------------------------------------------------------------------!*

	*!---------------------- Produtos da Ordem de Serviços ---------------------!*
	*! @field id = Identificação do registro
	*! @field idordserv = Identificação da venda
	*! @field idproduto = Identificação do produto
	*! @field preco = Preço de venda
	*! @field qtde = Quantidade vendida
	*! @field idproncad = Identificação do produto não cadastrado
	Create Table 'Produtos da Ordem de Serviços' Name 'proord'(;
		id			Integer Autoinc,;
		idordserv	Integer,;
		idproduto	Integer,;
		preco       Float(10,2),;
		qtde		Float(8,3),;
		idproncad	Integer;
	)
	*!--------------------------------------------------------------------------!*
	Chdir &_SystemPath
	Insert Into tparam (campo, valor) Values ('DescontoMaximo', '0,00')
	ReadWriteFileIni.WriteFileIni(_SystemPath + 'Config.ini', 'Local Config', 'ImpressoraNotaFiscal', '')
	ReadWriteFileIni.WriteFileIni(_SystemPath + 'Config.ini', 'Local Config', 'TipoImpressoraNotaFiscal', '1')
	ReadWriteFileIni.WriteFileIni(_SystemPath + 'Config.ini', 'Local Config', 'ImpressoraBoleto', '')
	ReadWriteFileIni.WriteFileIni(_SystemPath + 'Config.ini', 'Local Config', 'TipoImpressoraBoleto', '1')
	ReadWriteFileIni.WriteFileIni(_SystemPath + 'Config.ini', 'Local Config', 'ImpressoraOrdemServico', '')
	ReadWriteFileIni.WriteFileIni(_SystemPath + 'Config.ini', 'Local Config', 'TipoImpressoraOrdemServico', '1')
Endif

*! Atualiza para a versão 0.7.1
If _Exec("0.7.0") Then && <-- Todas as versões igual ou abaixo do informado serão substituídas.
	Insert Into tparam (campo, valor) Values ('MeiaPaginaOS', '0')
	Alter Table ordserv Add Column condeq Numeric(1)
	Alter Table ordserv Add Column tiposerv Numeric(1)
	Alter Table ordserv Add Column orcame Numeric(1)
	Alter Table ordserv Add Column aprovpor Character(30)
Endif

*! Atualiza para a versão 0.7.4
If _Exec("0.7.3") Then && <-- Todas as versões igual ou abaixo do informado serão substituídas.
	Alter Table colab Add Column comissao Float(5,2)
	Insert Into tparam (campo, valor) Values ('PagarComissaoSobreProduto', '0')
Endif

*! Atualiza para a versão 0.7.8
If _Exec("0.7.7") Then && <-- Todas as versões igual ou abaixo do informado serão substituídas.
	Insert Into tparam (campo, valor) Values ('FonteImpressaoRecibo', '12,0')
Endif

*! Atualiza para a versão 0.7.12
If _Exec("0.7.11") Then && <-- Todas as versões igual ou abaixo do informado serão substituídas.
	Insert Into tparam (campo, valor) Values ('DuasCopiasPorPagina', '0')
Endif

*! Atualiza para a versão 0.7.15
If _Exec("0.7.14") Then && <-- Todas as versões igual ou abaixo do informado serão substituídas.
	Chdir Justpath(_Database)
	*!------------------------- Devoluções de Clientes -------------------------!*
	*! @field id = Identificação do registro
	*! @field idvenda = Identificação da venda
	*! @field idproduto = Identificação do produto
	*! @field idcliente = Identificação do cliente
	*! @field motivo = Motivo da devolução pode ser: 1 - Simples Troca, 2 - Defeito
	*! @field financ = Financeiro pode ser: 1 - Gravar crédito p/ cliente, 2 - Reembolsar(será lançado no momento da gravação um débito no valor reembolsado)
	*! @field qtde = Quantidade devolvida
	*! @field credito = Valor do crédito gerado para o cliente(pode conter o valor de crédito ou de reembolso, dependendo da variável financ)
	*! @field saldo = Saldo que o cliente ainda tem disponível para usar nas suas compras
	Create Table 'Devoluções de Clientes' Name 'devcli'(;
		id			Integer Autoinc,;
		idvenda		Integer,;
		idproduto	Integer,;
		idcliente	Integer,;
		motivo		Numeric(1),;
		financ		Numeric(1),;
		qtde		Float(9,3),;
		credito		Float(10,2),;
		saldo		Float(10,2);
	)
	*!--------------------------------------------------------------------------!*
	Chdir &_SystemPath
	Alter Table proven Add Column qtdedev Float(8,3)
Endif

*! Atualiza para a versão 0.7.16
If _Exec("0.7.15") Then && <-- Todas as versões igual ou abaixo do informado serão substituídas.
	Alter Table devcli Add Column datadev Date
Endif

*! Atualiza para a versão 0.7.17
If _Exec("0.7.16") Then && <-- Todas as versões igual ou abaixo do informado serão atualizadas.
	Insert Into tparam (campo, valor) Values ('HabilitarPedidoExpresso', '0')
	Insert Into tparam (campo, valor) Values ('VendedorPadraoPedidoExpresso', '0')
	Insert Into tparam (campo, valor) Values ('ImprimirReciboPedido', '3')
Endif

*! Atualiza para a versão 0.7.21
If _Exec("0.7.20") Then && <-- Todas as versões igual ou abaixo do informado serão atualizadas.
	Insert Into tparam (campo, valor) Values ('FormatoTextoOS', '0')
	Insert Into tparam (campo, valor) Values ('CaminhoLogotipoOS', _SystemPath + 'imagens\jpg\logo_cybersis.jpg')
Endif

*! Atualiza para a versão 0.7.23
If _Exec("0.7.22") Then && <-- Todas as versões igual ou abaixo do informado serão atualizadas.
	Use venda
	Go Top
	Scan
		If venda.dinheiro + venda.cheque + venda.cartao + venda.boleto + venda.crediario + venda.desconto + venda.ticket > venda.vlrven Then
			Replace dinheiro With dinheiro - ((venda.dinheiro + venda.cheque + venda.cartao + venda.boleto + venda.crediario + venda.desconto + venda.ticket) - venda.vlrven)
		EndIf
	EndScan
	Use In venda
Endif

Function _Exec( CgsVer As String )
	Local _MajorParam As Integer
	Local _MinorParam As Integer
	Local _RevisionParam As Integer
	Local _MajorVerInst As Integer
	Local _MinorVerInst As Integer
	Local _RevisionVerInst As Integer
	_MajorParam = Val(Substr(CgsVer, 1, At('.', CgsVer) - 1))
	_MinorParam = Val(Substr(CgsVer, At('.', CgsVer) + 1, At('.', CgsVer, 2) - (At('.', CgsVer) + 1)))
	_RevisionParam = Val(Substr(CgsVer, At('.', CgsVer, 2) + 1))
	_MajorVerInst = Val(Substr(CgsVersion(4), 1, At('.', CgsVersion(4)) - 1))
	_MinorVerInst = Val(Substr(CgsVersion(4), At('.', CgsVersion(4)) + 1, At('.', CgsVersion(4), 2) - (At('.', CgsVersion(4)) + 1)))
	_RevisionVerInst = Val(Substr(CgsVersion(4), At('.', CgsVersion(4), 2) + 1))
	Do Case
		Case _MajorParam < _MajorVerInst
			_Retorno = .F.
			Return _Retorno
		Case _MajorParam = _MajorVerInst And _MinorParam < _MinorVerInst
			_Retorno = .F.
			Return _Retorno
		Case _MajorParam = _MajorVerInst And _MinorParam = _MinorVerInst And _RevisionParam < _RevisionVerInst
			_Retorno = .F.
			Return _Retorno
		Otherwise
			_Retorno = .T.
			Return _Retorno
	Endcase
Endfunc
