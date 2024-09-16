



CREATE TABLE [CLASSIFICACOES_CLIENTES](
	[CLASSIFICACAO_CLIENTE] [numeric](15, 0) IDENTITY(1,1) NOT NULL,
	[FORMULARIO_ORIGEM] [numeric](6, 0) NULL,
	[TAB_MASTER_ORIGEM] [numeric](6, 0) NULL,
	[REG_MASTER_ORIGEM] [numeric](15, 0) NULL,
	[REG_LOG_INCLUSAO] [numeric](15, 0) NULL,
	[DESCRICAO] [varchar](60) NOT NULL,
	[MARKUP_ADICIONAL] [numeric](6, 2) NOT NULL,
	[GUID] [uniqueidentifier] NOT NULL,
	[CODIGO_ANTIGO] [varchar](20) NULL,
	[EXIGIR_EMPENHO] [varchar](1) NOT NULL,
	[EXIGIR_EMAIL_COBRANCA] [varchar](1) NOT NULL,
	[DESCONSIDERAR_VENCIMENTO] [varchar](1) NULL,
	[CONVENIO_87] [varchar](7) NOT NULL
) 





CREATE TABLE [ENDERECOS](
	[ENDERECOS] [numeric](15, 0) IDENTITY(1,1) NOT NULL,
	[FORMULARIO_ORIGEM] [numeric](6, 0) NULL,
	[TAB_MASTER_ORIGEM] [numeric](6, 0) NULL,
	[REG_MASTER_ORIGEM] [numeric](15, 0) NULL,
	[REG_LOG_INCLUSAO] [numeric](15, 0) NULL,
	[ENTIDADE] [numeric](15, 0) NOT NULL,
	[PAIS] [varchar](40) NOT NULL,
	[CEP] [varchar](9) NOT NULL,
	[TIPO_ENDERECO] [varchar](15) NOT NULL,
	[ENDERECO] [varchar](60) NOT NULL,
	[NUMERO] [numeric](10, 0) NOT NULL,
	[COMPLEMENTO] [varchar](60) NULL,
	[BAIRRO] [varchar](40) NOT NULL,
	[CIDADE] [varchar](40) NOT NULL,
	[ESTADO] [varchar](2) NOT NULL,
	[REFERENCIA] [varchar](255) NULL,
	[MUNICIPIO] [numeric](15, 0) NULL,
	[GUID] [uniqueidentifier] NOT NULL,
	[CODIGO_IBGE] [numeric](7, 0) NULL,
	[CODIGO_POSTAL] [varchar](25) NULL,
	[CODIGO_POSTAL_CEP] [varchar](25) NULL
) 





CREATE TABLE [ENTIDADES](
	[ENTIDADE] [numeric](15, 0) IDENTITY(1,1) NOT NULL,
	[FORMULARIO_ORIGEM] [numeric](6, 0) NULL,
	[TAB_MASTER_ORIGEM] [numeric](6, 0) NULL,
	[REG_MASTER_ORIGEM] [numeric](15, 0) NULL,
	[REG_LOG_INCLUSAO] [numeric](15, 0) NULL,
	[NOME] [varchar](200) NULL,
	[NOME_FANTASIA] [varchar](200) NULL,
	[INSCRICAO_FEDERAL] [varchar](20) NULL,
	[INSCRICAO_ESTADUAL] [varchar](20) NULL,
	[INSCRICAO_MUNICIPAL] [varchar](20) NULL,
	[EMPRESA_NACIONAL] [varchar](1) NOT NULL,
	[CONTRIBUINTE_ICMS] [varchar](1) NOT NULL,
	[CONCENTRADOR] [numeric](15, 0) NULL,
	[REGIAO] [numeric](5, 0) NULL,
	[TIPO] [numeric](2, 0) NULL,
	[CODIGO_ANTIGO] [varchar](30) NULL,
	[GRUPO_CONTABIL] [numeric](15, 0) NULL,
	[IMPORTADO] [varchar](1) NULL,
	[ATIVO] [varchar](1) NULL,
	[SIMPLES_NACIONAL] [varchar](1) NULL,
	[COR] [numeric](15, 0) NULL,
	[INSCRICAO_ESTRANGEIRO] [varchar](20) NULL,
	[CLASSIF_FINANCEIRA] [numeric](15, 0) NULL,
	[NFE_TIPO_INDICADOR_IE]  AS (case when isnull([CONTRIBUINTE_ICMS],'N')='S' AND len(replace(replace(replace(isnull([INSCRICAO_ESTADUAL],''),'.',''),'-',''),'ISENTO',''))<(2) then (2) when isnull([CONTRIBUINTE_ICMS],'N')='S' AND len(replace(replace(replace(isnull([INSCRICAO_ESTADUAL],''),'.',''),'-',''),'ISENTO',''))>(1) then (1) when isnull([CONTRIBUINTE_ICMS],'N')='N' OR [CONTRIBUINTE_ICMS]='' then (9)  end) PERSISTED,
	[NFE_CONSUMIDOR_FINAL]  AS (case when isnull([CONTRIBUINTE_ICMS],'N')='N' then (1) else (0) end),
	[CLASSIFICACAO_CLIENTE] [numeric](15, 0) NULL,
	[DATA_CADASTRO] [datetime] NOT NULL,
	[CODIGO_ANTIGO_FORNECEDOR] [numeric](15, 0) NULL
) 





CREATE TABLE [ESTADOS](
	[ESTADO] [varchar](2) NOT NULL,
	[FORMULARIO_ORIGEM] [numeric](6, 0) NULL,
	[TAB_MASTER_ORIGEM] [numeric](6, 0) NULL,
	[REG_MASTER_ORIGEM] [numeric](15, 0) NULL,
	[REG_LOG_INCLUSAO] [numeric](15, 0) NULL,
	[NOME] [varchar](40) NOT NULL,
	[ALIQUOTA_ICMS] [numeric](6, 2) NOT NULL,
	[ALIQUOTA_INTERNA] [numeric](6, 2) NOT NULL,
	[CODIGO_IBGE] [numeric](2, 0) NULL,
	[ALIQUOTA_INTERESTADUAL] [numeric](6, 2) NULL,
	[CODIGO_GIA] [numeric](6, 0) NULL,
	[GUID] [uniqueidentifier] NOT NULL,
	[ICMS_ALIQUOTA_FPOBREZA] [numeric](6, 2) NULL,
	[CODIGO_GIAM] [varchar](2) NULL,
	[GNRE_CODIGO_RECEITA] [varchar](6) NULL,
	[GNRE_CODIGO_RECEITA_DETALHAMENTO] [varchar](6) NULL,
	[GNRE_CODIGO_RECEITA_FP] [varchar](6) NULL,
	[GNRE_CODIGO_RECEITA_DETALHAMENTO_FP] [varchar](6) NULL,
	[DATA_VENCIMENTO] [datetime] NULL,
	[DATA_VENCIMENTO_FCP] [datetime] NULL,
	[EXIGE_RESP_TECNICO_NFE] [varchar](1) NULL
) 





CREATE TABLE [FAMILIAS_PRODUTOS](
	[FAMILIA_PRODUTO] [numeric](15, 0) IDENTITY(1,1) NOT NULL,
	[FORMULARIO_ORIGEM] [numeric](6, 0) NULL,
	[TAB_MASTER_ORIGEM] [numeric](6, 0) NULL,
	[REG_MASTER_ORIGEM] [numeric](15, 0) NULL,
	[REG_LOG_INCLUSAO] [numeric](15, 0) NULL,
	[DESCRICAO] [varchar](60) NOT NULL,
	[GUID] [uniqueidentifier] NOT NULL
) 





CREATE TABLE [GRUPOS_PRODUTOS](
	[GRUPO_PRODUTO] [numeric](15, 0) IDENTITY(1,1) NOT NULL,
	[FORMULARIO_ORIGEM] [numeric](6, 0) NULL,
	[TAB_MASTER_ORIGEM] [numeric](6, 0) NULL,
	[REG_MASTER_ORIGEM] [numeric](15, 0) NULL,
	[REG_LOG_INCLUSAO] [numeric](15, 0) NULL,
	[DESCRICAO] [varchar](60) NOT NULL,
	[MARKUP] [numeric](6, 2) NOT NULL,
	[CODIGO_ANTIGO] [numeric](15, 0) NULL,
	[GUID] [uniqueidentifier] NOT NULL
) 





CREATE TABLE [MARCAS](
	[MARCA] [numeric](15, 0) IDENTITY(1,1) NOT NULL,
	[FORMULARIO_ORIGEM] [numeric](6, 0) NULL,
	[TAB_MASTER_ORIGEM] [numeric](6, 0) NULL,
	[REG_MASTER_ORIGEM] [numeric](15, 0) NULL,
	[REG_LOG_INCLUSAO] [numeric](15, 0) NULL,
	[DESCRICAO] [varchar](60) NOT NULL,
	[MARGEM] [numeric](15, 2) NOT NULL,
	[ESTADO] [varchar](2) NOT NULL,
	[GUID] [uniqueidentifier] NOT NULL,
	[IMS] [varchar](1) NOT NULL
) 





CREATE TABLE [METAS_GRUPOS_LOJAS_PARTICIPANTES](
	[META_GRUPO_LOJA_PARTICIPANTE] [numeric](15, 0) IDENTITY(1,1) NOT NULL,
	[FORMULARIO_ORIGEM] [numeric](6, 0) NULL,
	[TAB_MASTER_ORIGEM] [numeric](6, 0) NULL,
	[REG_MASTER_ORIGEM] [numeric](15, 0) NULL,
	[REG_LOG_INCLUSAO] [numeric](15, 0) NULL,
	[META_GRUPO_LOJA] [numeric](15, 0) NOT NULL,
	[EMPRESA] [numeric](15, 0) NOT NULL
) 





CREATE TABLE [SECOES_PRODUTOS](
	[SECAO_PRODUTO] [numeric](15, 0) IDENTITY(1,1) NOT NULL,
	[FORMULARIO_ORIGEM] [numeric](6, 0) NULL,
	[TAB_MASTER_ORIGEM] [numeric](6, 0) NULL,
	[REG_MASTER_ORIGEM] [numeric](15, 0) NULL,
	[REG_LOG_INCLUSAO] [numeric](15, 0) NULL,
	[DESCRICAO] [varchar](60) NOT NULL,
	[COMERCIALIZAVEL] [varchar](1) NULL,
	[FATOR_REDUCAO_ST] [numeric](6, 2) NOT NULL,
	[CODIGO_ESTACAO] [varchar](5) NULL,
	[PERCENTUAL_CURVA_A] [numeric](6, 2) NULL,
	[PERCENTUAL_CURVA_B] [numeric](6, 2) NULL,
	[PERCENTUAL_CURVA_C] [numeric](6, 2) NULL,
	[DIAS_VENDAS_CURVA] [numeric](4, 0) NULL,
	[DIAS_RECALCULO] [numeric](4, 0) NULL,
	[ULTIMA_ATUALIZACAO] [datetime] NULL,
	[GUID] [uniqueidentifier] NOT NULL,
	[SOLICITA_RECEITA] [varchar](1) NOT NULL
) 





CREATE TABLE [SUBGRUPOS_PRODUTOS](
	[SUBGRUPO_PRODUTO] [numeric](15, 0) IDENTITY(1,1) NOT NULL,
	[FORMULARIO_ORIGEM] [numeric](6, 0) NULL,
	[TAB_MASTER_ORIGEM] [numeric](6, 0) NULL,
	[REG_MASTER_ORIGEM] [numeric](15, 0) NULL,
	[REG_LOG_INCLUSAO] [numeric](15, 0) NULL,
	[DESCRICAO] [varchar](60) NOT NULL,
	[GUID] [uniqueidentifier] NOT NULL,
	[CUBAGEM_MEDIA] [numeric](15, 2) NULL
) 





CREATE TABLE [VENDAS_ANALITICAS](
	[FORMULARIO_ORIGEM] [numeric](15, 0) NOT NULL,
	[TAB_MASTER_ORIGEM] [numeric](15, 0) NOT NULL,
	[REG_MASTER_ORIGEM] [numeric](15, 0) NOT NULL,
	[REGISTRO_CONTROLE] [numeric](15, 0) NOT NULL,
	[REGISTRO_CONTROLE_II] [numeric](15, 0) NOT NULL,
	[EMPRESA] [numeric](15, 0) NOT NULL,
	[MOVIMENTO] [date] NOT NULL,
	[CAIXA] [numeric](15, 0) NULL,
	[VENDA] [numeric](15, 0) NOT NULL,
	[PRODUTO] [numeric](15, 0) NOT NULL,
	[VENDEDOR] [numeric](15, 0) NULL,
	[OPERADOR] [numeric](15, 0) NULL,
	[CLIENTE] [numeric](15, 0) NULL,
	[QUANTIDADE] [numeric](10, 2) NOT NULL,
	[VENDA_BRUTA] [numeric](15, 2) NOT NULL,
	[DESCONTO] [numeric](15, 2) NOT NULL,
	[DESCONTO_NEGOCIADO] [numeric](15, 2) NULL,
	[VENDA_LIQUIDA]  AS ([VENDA_BRUTA]-[DESCONTO]) PERSISTED,
	[OPERACAO_FISCAL] [numeric](5, 0) NOT NULL,
	[PIS_ALIQUOTA] [numeric](15, 2) NULL,
	[PIS_BASE_CALCULO] [numeric](15, 2) NULL,
	[PIS_VALOR] [numeric](15, 2) NULL,
	[SITUACAO_TRIBUTARIA_PIS] [varchar](2) NULL,
	[COFINS_ALIQUOTA] [numeric](15, 2) NULL,
	[COFINS_BASE_CALCULO] [numeric](15, 2) NULL,
	[COFINS_VALOR] [numeric](15, 2) NULL,
	[SITUACAO_TRIBUTARIA_COFINS] [varchar](2) NULL,
	[ICMS_ALIQUOTA] [numeric](15, 2) NULL,
	[ICMS_BASE_CALCULO] [numeric](15, 2) NULL,
	[ICMS_VALOR] [numeric](15, 2) NULL,
	[SITUACAO_TRIBUTARIA] [varchar](3) NULL,
	[ICMS_CODIGO_ECF] [varchar](10) NULL,
	[ESPECIE_FISCAL] [varchar](3) NULL,
	[DOCUMENTO_TIPO] [numeric](15, 0) NULL,
	[DOCUMENTO_NUMERO] [numeric](15, 0) NULL,
	[ECF_CAIXA] [varchar](4) NULL,
	[TIPO_BONIFICACAO] [varchar](1) NULL,
	[BONIFICACAO] [numeric](15, 2) NULL,
	[OBJETO_CONTROLE] [numeric](15, 0) NULL,
	[GUID] [uniqueidentifier] NOT NULL,
	[VENDA_ANALITICA] [numeric](15, 0) IDENTITY(1,1) NOT NULL,
	[IMPOSTOS]  AS ((isnull([PIS_VALOR],(0))+isnull([COFINS_VALOR],(0)))+isnull([ICMS_VALOR],(0))) PERSISTED,
	[FORMULARIO_ORIGEM_RELACIONADO] [numeric](15, 0) NULL,
	[TAB_MASTER_ORIGEM_RELACIONADO] [numeric](15, 0) NULL,
	[REG_MASTER_ORIGEM_RELACIONADO] [numeric](15, 0) NULL,
	[REGISTRO_CONTROLE_RELACIONADO] [numeric](15, 0) NULL,
	[REGISTRO_CONTROLE_II_RELACIONADO] [numeric](15, 0) NULL,
	[TIPO_COMISSAO] [varchar](1) NULL,
	[COMISSAO] [numeric](9, 2) NULL,
	[VALOR_BONIFICACAO]  AS (case [TIPO_BONIFICACAO] when 'V' then isnull([BONIFICACAO],(0))*[QUANTIDADE] when 'P' then ([VENDA_BRUTA]-[DESCONTO])*(isnull([BONIFICACAO],(0))/(100)) else (0.00) end) PERSISTED,
	[VALOR_COMISSAO]  AS (case [TIPO_COMISSAO] when 'V' then isnull([COMISSAO],(0))*[QUANTIDADE] when 'P' then ([VENDA_BRUTA]-[DESCONTO])*(isnull([COMISSAO],(0))/(100)) else (0.00) end) PERSISTED,
	[DESCONTO_AUTOMATICO] [numeric](15, 2) NULL,
	[DESCONTO_CONCEDIDO] [numeric](15, 2) NOT NULL,
	[GERA_DEMANDA]  AS ([DBO].[UDF_GERA_DEMANDA]([VENDA_ANALITICA])),
	[CODIGO_CR_PRESCRITOR] [numeric](9, 0) NULL,
	[CR_PRESCRITOR] [varchar](20) NULL,
	[UF_PRESCRITOR] [varchar](2) NULL,
	[PEDIDO_VENDA] [numeric](15, 0) NULL
) 





CREATE TABLE [VENDEDORES](
	[VENDEDOR] [numeric](15, 0) IDENTITY(1,1) NOT NULL,
	[FORMULARIO_ORIGEM] [numeric](6, 0) NULL,
	[TAB_MASTER_ORIGEM] [numeric](6, 0) NULL,
	[REG_MASTER_ORIGEM] [numeric](15, 0) NULL,
	[REG_LOG_INCLUSAO] [numeric](15, 0) NULL,
	[NOME] [varchar](60) NOT NULL,
	[CODIGO_DP] [numeric](5, 0) NULL,
	[COMISSAO] [numeric](6, 2) NULL,
	[ENTIDADE] [numeric](15, 0) NOT NULL,
	[CODIGO_OPERADOR_PDV] [numeric](15, 0) NULL,
	[EMPRESA_USUARIA] [numeric](15, 0) NULL,
	[DESCONTO_MAXIMO_PMC] [numeric](15, 2) NULL,
	[DESCONTO_TOTAL_BALCAO] [varchar](1) NULL,
	[SUPERVISOR] [varchar](1) NULL,
	[USUARIO_FP] [varchar](15) NULL,
	[SENHA_FP] [varchar](15) NULL,
	[CADASTRO_ATIVO] [varchar](1) NULL,
	[GUID] [uniqueidentifier] NOT NULL,
	[CARGO_DESCONTO] [numeric](15, 0) NULL,
	[CARGO_COMISSAO] [numeric](15, 0) NULL,
	[TAXA_MOTOBOY] [numeric](15, 2) NULL,
	[MOTOQUEIRO] [varchar](1) NULL,
	[EMAIL] [varchar](120) NULL,
	[LICITACAO] [varchar](1) NULL,
	[USUARIO] [numeric](15, 0) NULL,
	[EMAIL_VENDEDOR] [varchar](120) NULL,
	[COMISSAO_CARGO] [numeric](15, 0) NULL,
	[FISIOTERAPEUTA] [varchar](1) NULL,
	[GRUPO_COMISSAO] [numeric](15, 0) NULL
) 

