:SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [CUSTOMER_CLASSIFICATIONS](
	[CUSTOMER_CLASSIFICATION_ID] [numeric](15, 0) IDENTITY(1,1) NOT NULL,
	[SOURCE_FORM_ID] [numeric](6, 0) NULL,
	[SOURCE_MASTER_TAB_ID] [numeric](6, 0) NULL,
	[SOURCE_MASTER_REC_ID] [numeric](15, 0) NULL,
	[LOG_INCLUSION_REC_ID] [numeric](15, 0) NULL,
	[DESCRIPTION] [varchar](60) NOT NULL,
	[ADDITIONAL_MARKUP] [numeric](6, 2) NOT NULL,
	[GUID] [uniqueidentifier] NOT NULL,
	[OLD_CODE] [varchar](20) NULL,
	[REQUIRE_COMMITMENT] [varchar](1) NOT NULL,
	[REQUIRE_BILLING_EMAIL] [varchar](1) NOT NULL,
	[DISREGARD_DUE_DATE] [varchar](1) NULL,
	[CONVENTION_87] [varchar](7) NOT NULL
) ON [PRIMARY]
GO
CREATE TABLE [ADDRESSES](
	[ADDRESS_ID] [numeric](15, 0) IDENTITY(1,1) NOT NULL,
	[SOURCE_FORM] [numeric](6, 0) NULL,
	[SOURCE_MASTER_TABLE] [numeric](6, 0) NULL,
	[SOURCE_MASTER_RECORD] [numeric](15, 0) NULL,
	[INCLUSION_LOG_RECORD] [numeric](15, 0) NULL,
	[ENTITY] [numeric](15, 0) NOT NULL,
	[COUNTRY] [varchar](40) NOT NULL,
	[ZIP_CODE] [varchar](9) NOT NULL,
	[ADDRESS_TYPE] [varchar](15) NOT NULL,
	[STREET_ADDRESS] [varchar](60) NOT NULL,
	[STREET_NUMBER] [numeric](10, 0) NOT NULL,
	[ADDRESS_COMPLEMENT] [varchar](60) NULL,
	[NEIGHBORHOOD] [varchar](40) NOT NULL,
	[CITY] [varchar](40) NOT NULL,
	[STATE] [varchar](2) NOT NULL,
	[REFERENCE] [varchar](255) NULL,
	[MUNICIPALITY] [numeric](15, 0) NULL,
	[GUID] [uniqueidentifier] NOT NULL,
	[IBGE_CODE] [numeric](7, 0) NULL,
	[POSTAL_CODE] [varchar](25) NULL,
	[ZIP_CODE_POSTAL_CODE] [varchar](25) NULL
) ON [PRIMARY]
GO
CREATE TABLE [ENTITIES] (
  [ENTITY] [numeric](15, 0) IDENTITY(1, 1) NOT NULL,
  [SOURCE_FORM] [numeric](6, 0) NULL,
  [MASTER_TABLE_SOURCE] [numeric](6, 0) NULL,
  [MASTER_RECORD_SOURCE] [numeric](15, 0) NULL,
  [RECORD_LOG_INSERTION] [numeric](15, 0) NULL,
  [NAME] [varchar](200) NULL,
  [FANTASY_NAME] [varchar](200) NULL,
  [FEDERAL_TAX_REGISTRATION] [varchar](20) NULL,
  [STATE_TAX_REGISTRATION] [varchar](20) NULL,
  [MUNICIPAL_TAX_REGISTRATION] [varchar](20) NULL,
  [DOMESTIC_COMPANY] [varchar](1) NOT NULL,
  [ICMS_TAXPAYER] [varchar](1) NOT NULL,
  [CONCENTRATOR] [numeric](15, 0) NULL,
  [REGION] [numeric](5, 0) NULL,
  [TYPE] [numeric](2, 0) NULL,
  [OLD_CODE] [varchar](30) NULL,
  [ACCOUNTING_GROUP] [numeric](15, 0) NULL,
  [IMPORTED] [varchar](1) NULL,
  [ACTIVE] [varchar](1) NULL,
  [SIMPLE_NATIONAL] [varchar](1) NULL,
  [COLOR] [numeric](15, 0) NULL,
  [FOREIGN_TAX_REGISTRATION] [varchar](20) NULL,
  [FINANCIAL_CLASSIFICATION] [numeric](15, 0) NULL,
  [NFE_TYPE_IE_INDICATOR] AS (
    CASE
      WHEN ISNULL([ICMS_TAXPAYER], 'N') = 'S' AND LEN(REPLACE(REPLACE(REPLACE(ISNULL([STATE_TAX_REGISTRATION], ''), '.', ''), '-', ''), 'EXEMPT', '')) < 2
      THEN 2
      WHEN ISNULL([ICMS_TAXPAYER], 'N') = 'S' AND LEN(REPLACE(REPLACE(REPLACE(ISNULL([STATE_TAX_REGISTRATION], ''), '.', ''), '-', ''), 'EXEMPT', '')) > 1
      THEN 1
      WHEN ISNULL([ICMS_TAXPAYER], 'N') = 'N' OR [ICMS_TAXPAYER] = ''
      THEN 9
    END
  ) PERSISTED,
  [NFE_FINAL_CONSUMER] AS (
    CASE
      WHEN ISNULL([ICMS_TAXPAYER], 'N') = 'N'
      THEN 1
      ELSE 0
    END
  ),
  [CLIENT_CLASSIFICATION] [numeric](15, 0) NULL,
  [REGISTRATION_DATE] [datetime] NOT NULL,
  [OLD_SUPPLIER_CODE] [numeric](15, 0) NULL
) ON [PRIMARY];
GO
CREATE TABLE [STATES](
    [STATE] [varchar](2) NOT NULL,
    [SOURCE_FORM] [numeric](6, 0) NULL,
    [SOURCE_MASTER_TABLE] [numeric](6, 0) NULL,
    [SOURCE_MASTER_RECORD] [numeric](15, 0) NULL,
    [INCLUSION_LOG_RECORD] [numeric](15, 0) NULL,
    [NAME] [varchar](40) NOT NULL,
    [ICMS_RATE] [numeric](6, 2) NOT NULL,
    [INTERNAL_RATE] [numeric](6, 2) NOT NULL,
    [IBGE_CODE] [numeric](2, 0) NULL,
    [INTERSTATE_RATE] [numeric](6, 2) NULL,
    [GIA_CODE] [numeric](6, 0) NULL,
    [GUID] [uniqueidentifier] NOT NULL,
    [ICMS_POOR_RATE] [numeric](6, 2) NULL,
    [GIAM_CODE] [varchar](2) NULL,
    [GNRE_RECEIPT_CODE] [varchar](6) NULL,
    [GNRE_RECEIPT_DETAIL_CODE] [varchar](6) NULL,
    [GNRE_RECEIPT_CODE_FP] [varchar](6) NULL,
    [GNRE_RECEIPT_DETAIL_CODE_FP] [varchar](6) NULL,
    [DUE_DATE] [datetime] NULL,
    [DUE_DATE_FCP] [datetime] NULL,
    [REQUIRES_TECHNICAL_RESP_NFE] [varchar](1) NULL
) ON [PRIMARY]
GO
CREATE TABLE [PRODUCT_FAMILIES](
	[PRODUCT_FAMILY] [numeric](15, 0) IDENTITY(1,1) NOT NULL,
	[ORIGIN_FORM] [numeric](6, 0) NULL,
	[SOURCE_MASTER_TABLE] [numeric](6, 0) NULL,
	[SOURCE_MASTER_RECORD] [numeric](15, 0) NULL,
	[INCLUSION_LOG_RECORD] [numeric](15, 0) NULL,
	[DESCRIPTION] [varchar](60) NOT NULL,
	[GUID] [uniqueidentifier] NOT NULL
) ON [PRIMARY]
GO
CREATE TABLE [PRODUCT_GROUPS](
	[PRODUCT_GROUP] [numeric](15, 0) IDENTITY(1,1) NOT NULL,
	[SOURCE_FORM] [numeric](6, 0) NULL,
	[SOURCE_MASTER_TABLE] [numeric](6, 0) NULL,
	[SOURCE_MASTER_RECORD] [numeric](15, 0) NULL,
	[INCLUSION_LOG_RECORD] [numeric](15, 0) NULL,
	[DESCRIPTION] [varchar](60) NOT NULL,
	[MARKUP] [numeric](6, 2) NOT NULL,
	[OLD_CODE] [numeric](15, 0) NULL,
	[GUID] [uniqueidentifier] NOT NULL
) ON [PRIMARY]
GO
CREATE TABLE [BRANDS](
	[BRAND] [numeric](15, 0) IDENTITY(1,1) NOT NULL,
	[ORIGIN_FORM] [numeric](6, 0) NULL,
	[ORIGIN_MASTER_TABLE] [numeric](6, 0) NULL,
	[ORIGIN_MASTER_RECORD] [numeric](15, 0) NULL,
	[INCLUSION_LOG_RECORD] [numeric](15, 0) NULL,
	[DESCRIPTION] [varchar](60) NOT NULL,
	[MARGIN] [numeric](15, 2) NOT NULL,
	[STATUS] [varchar](2) NOT NULL,
	[GUID] [uniqueidentifier] NOT NULL,
	[IMS] [varchar](1) NOT NULL
) ON [PRIMARY]
GO
CREATE TABLE [dbo].[Products](
	[Product_ID] [numeric](15, 0) IDENTITY(1,1) PRIMARY KEY,
	[Origin_Form] [numeric](6, 0) NULL,
	[Origin_Master_Table] [numeric](6, 0) NULL,
	[Origin_Master_Register] [numeric](15, 0) NULL,
	[Inclusion_Log_Register] [numeric](15, 0) NULL,
	[Description] [varchar](255) NOT NULL,
	[Short_Description] [varchar](40) NOT NULL,
	[Unit_of_Measurement] [varchar](3) NOT NULL,
	[Product_Family] [numeric](15, 0) NULL,
	[Product_Section] [numeric](15, 0) NOT NULL,
	[Product_Group] [numeric](15, 0) NOT NULL,
	[Product_Subgroup] [numeric](15, 0) NOT NULL,
	[Seasonality] [numeric](15, 0) NULL,
	[Brand] [numeric](15, 0) NULL,
	[Inclusion_Date] [datetime] NULL,
	[End_of_Production_Date] [datetime] NULL,
	[Product_Status] [numeric](15, 0) NULL,
	[Old_Code] [varchar](18) NULL,
	[Packaging_Factor] [numeric](8, 2) NOT NULL,
	[Packaging_Factor_Unit_of_Measurement] [varchar](3) NOT NULL,
	[Industry_Packaging] [numeric](6, 0) NULL,
	[Accounting_Group] [numeric](15, 0) NULL,
	[Manufacturer] [numeric](15, 0) NULL,
	[Tax_Group] [numeric](15, 0) NULL,
	[Ecommerce_Description] [varchar](255) NULL,
	[Send_to_Ecommerce] [varchar](1) NOT NULL,
	[Purchasing_Product_Status] [numeric](15, 0) NULL,
	[Send_to_Stores] [varchar](1) NOT NULL,
	[Price_Type] [numeric](2, 0) NOT NULL,
	[Label_Type] [numeric](15, 0) NULL,
	[Gross_Profit] [numeric](6, 2) NULL,
	[Process_GUID] [uniqueidentifier] NULL,
	[Active_Registration] [varchar](1) NOT NULL,
	[Product_Class] [numeric](15, 0) NULL,
	[Country] [varchar](40) NULL,
	[NCM] [varchar](13) NOT NULL,
	[Gross_Profit_Percentage] [numeric](15, 2) NULL,
	[Product_Sales_Note] [varchar](255) NULL,
	[Price_Factor] [numeric](15, 2) NULL,
	[GUID] [uniqueidentifier] NOT NULL,
	[Tax_Group_Input] [numeric](15, 0) NULL,
	[Fiscal_Group] [numeric](15, 0) NULL,
	[PNU_List] [numeric](5, 0) NULL,
	[Inventory_Product_Classification] [numeric](15, 0) NULL,
	[Reference_Code] [varchar](60) NULL,
	[Old_REGMS_Code] [varchar](60) NULL,
	[Old_Full_Code] [varchar](60) NULL,
	[Concentrating_Product] [numeric](15, 0) NULL,
	[CEST_Code] [varchar](10) NULL,
	[Minimum_Sale_Unit] [numeric](15, 0) NULL,
	[Origin_Product] [numeric](15, 0) NULL,
	[Factor] [numeric](15, 0) NULL,
	[Presentation_Factor_Description] [varchar](255) NULL,
	[Commission] [numeric](5, 0) NULL,
	[Full_Description] [varchar](100) NULL,
	[Origin] [numeric](15, 0) NULL,
	[EC_Term_Agreement_Group] [numeric](15, 0) NULL,
	[Base_Cost] [numeric](15, 2) NULL,
	[Reference] [varchar](20) NULL,
	[SyspDV_Code] [numeric](15, 0) NULL,
	[Transfer_Active_Status] [numeric](15, 0) NOT NULL,
	[Checked_with_Movement] [varchar](1) NULL,
	[Markup] [numeric](6, 2) NULL
);
CREATE TABLE [SUBPRODUCT_GROUP](
	[SUBPRODUCT_GROUP_ID] [numeric](15, 0) IDENTITY(1,1) NOT NULL,
	[FORM_ORIGIN] [numeric](6, 0) NULL,
	[MASTER_TABLE_ORIGIN] [numeric](6, 0) NULL,
	[MASTER_RECORD_ORIGIN] [numeric](15, 0) NULL,
	[INSERTION_LOG_RECORD] [numeric](15, 0) NULL,
	[DESCRIPTION] [varchar](60) NOT NULL,
	[GUID] [uniqueidentifier] NOT NULL,
	[AVERAGE_VOLUME] [numeric](15, 2) NULL
) ON [PRIMARY]
GO
CREATE TABLE [SALES_ANALYTICS](
	[SOURCE_FORM] [numeric](15, 0) NOT NULL,
	[SOURCE_MASTER_TABLE] [numeric](15, 0) NOT NULL,
	[SOURCE_MASTER_RECORD] [numeric](15, 0) NOT NULL,
	[CONTROL_RECORD] [numeric](15, 0) NOT NULL,
	[CONTROL_RECORD_II] [numeric](15, 0) NOT NULL,
	[COMPANY] [numeric](15, 0) NOT NULL,
	[MOVEMENT] [date] NOT NULL,
	[CASH_REGISTER] [numeric](15, 0) NULL,
	[SALE] [numeric](15, 0) NOT NULL,
	[PRODUCT] [numeric](15, 0) NOT NULL,
	[SALESMAN] [numeric](15, 0) NULL,
	[OPERATOR] [numeric](15, 0) NULL,
	[CUSTOMER] [numeric](15, 0) NULL,
	[QUANTITY] [numeric](10, 2) NOT NULL,
	[GROSS_SALE] [numeric](15, 2) NOT NULL,
	[DISCOUNT] [numeric](15, 2) NOT NULL,
	[NEGOTIATED_DISCOUNT] [numeric](15, 2) NULL,
	[NET_SALE]  AS ([GROSS_SALE]-[DISCOUNT]) PERSISTED,
	[FISCAL_OPERATION] [numeric](5, 0) NOT NULL,
	[PIS_RATE] [numeric](15, 2) NULL,
	[PIS_BASE_CALCULATION] [numeric](15, 2) NULL,
	[PIS_VALUE] [numeric](15, 2) NULL,
	[PIS_TAX_SITUATION] [varchar](2) NULL,
	[COFINS_RATE] [numeric](15, 2) NULL,
	[COFINS_BASE_CALCULATION] [numeric](15, 2) NULL,
	[COFINS_VALUE] [numeric](15, 2) NULL,
	[COFINS_TAX_SITUATION] [varchar](2) NULL,
	[ICMS_RATE] [numeric](15, 2) NULL,
	[ICMS_BASE_CALCULATION] [numeric](15, 2) NULL,
	[ICMS_VALUE] [numeric](15, 2) NULL,
	[TAX_SITUATION] [varchar](3) NULL,
	[ICMS_ECF_CODE] [varchar](10) NULL,
	[FISCAL_KIND] [varchar](3) NULL,
	[DOCUMENT_TYPE] [numeric](15, 0) NULL,
	[DOCUMENT_NUMBER] [numeric](15, 0) NULL,
	[CASH_REGISTER_ECF] [varchar](4) NULL,
	[BONUS_TYPE] [varchar](1) NULL,
	[BONUS] [numeric](15, 2) NULL,
	[CONTROL_OBJECT] [numeric](15, 0) NULL,
	[GUID] [uniqueidentifier] NOT NULL,
	[ANALYTIC_SALE] [numeric](15, 0) IDENTITY(1,1) NOT NULL,
	[TAXES]  AS ((isnull([PIS_VALUE],(0))+isnull([COFINS_VALUE],(0)))+isnull([ICMS_VALUE],(0))) PERSISTED,
	[SOURCE_FORM_RELATED] [numeric](15, 0) NULL,
	[SOURCE_MASTER_TABLE_RELATED] [numeric](15, 0) NULL,
	[SOURCE_MASTER_RECORD_RELATED] [numeric](15, 0) NULL,
	[CONTROL_RECORD_RELATED] [numeric](15, 0) NULL,
	[CONTROL_RECORD_II_RELATED] [numeric](15, 0) NULL,
	[COMMISSION_TYPE] [varchar](1) NULL,
	[COMMISSION] [numeric](9, 2) NULL,
	[BONUS_VALUE]  AS (case [BONUS_TYPE] when 'V' then isnull([BONUS],(0))*[QUANTITY] when 'P' then ([GROSS_SALE]-[DISCOUNT])*(isnull([BONUS],(0))/(100)) else (0.00) end) PERSISTED,
	[COMMISSION_VALUE]  AS (case [COMMISSION_TYPE] when 'V' then isnull([COMMISSION],(0))*[QUANTITY] when 'P' then ([GROSS_SALE]-[DISCOUNT])*(isnull([COMMISSION],(0))/(100)) else (0.00) end) PERSISTED,
	[AUTOMATIC_DISCOUNT] [numeric](15, 2) NULL,
	[GRANTED_DISCOUNT] [numeric](15, 2) NOT NULL,
	[GENERATES_DEMAND]  AS ([DBO].[UDF_GENERATE_DEMAND]([ANALYTIC_SALE])),
	[PRESCRIBER_CODE_CR] [numeric](9, 0) NULL,
	[PRESCRIBER_CR] [varchar](20) NULL,
	[PRESCRIBER_STATE] [varchar](2) NULL,
	[SALES_ORDER] [numeric](15, 0) NULL
) ON [PRIMARY]
GO
CREATE TABLE [SALESMEN](
	[SALESMAN] [numeric](15, 0) IDENTITY(1,1) NOT NULL,
	[ORIGIN_FORM] [numeric](6, 0) NULL,
	[ORIGIN_MASTER_TABLE] [numeric](6, 0) NULL,
	[ORIGIN_MASTER_RECORD] [numeric](15, 0) NULL,
	[RECORD_INCLUSION_LOG] [numeric](15, 0) NULL,
	[NAME] [varchar](60) NOT NULL,
	[DP_CODE] [numeric](5, 0) NULL,
	[COMMISSION] [numeric](6, 2) NULL,
	[ENTITY] [numeric](15, 0) NOT NULL,
	[POS_OPERATOR_CODE] [numeric](15, 0) NULL,
	[USER_COMPANY] [numeric](15, 0) NULL,
	[MAXIMUM_PMC_DISCOUNT] [numeric](15, 2) NULL,
	[TOTAL_COUNTER_DISCOUNT] [varchar](1) NULL,
	[SUPERVISOR] [varchar](1) NULL,
	[FP_USER] [varchar](15) NULL,
	[FP_PASSWORD] [varchar](15) NULL,
	[ACTIVE_REGISTRATION] [varchar](1) NULL,
	[GUID] [uniqueidentifier] NOT NULL,
	[DISCOUNT_POSITION] [numeric](15, 0) NULL,
	[COMMISSION_POSITION] [numeric](15, 0) NULL,
	[DELIVERY_FEE] [numeric](15, 2) NULL,
	[DELIVERY_MAN] [varchar](1) NULL,
	[EMAIL] [varchar](120) NULL,
	[BIDDING] [varchar](1) NULL,
	[USER] [numeric](15, 0) NULL,
	[SALESMAN_EMAIL] [varchar](120) NULL,
	[POSITION_COMMISSION] [numeric](15, 0) NULL,
	[PHYSICAL_THERAPIST] [varchar](1) NULL,
	[COMMISSION_GROUP] [numeric](15, 0) NULL
) ON [PRIMARY]
GO
