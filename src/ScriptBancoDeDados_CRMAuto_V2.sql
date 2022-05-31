CREATE DATABASE [CRM_AUTO]
 
USE [CRM_AUTO]
GO

CREATE TABLE [dbo].[AGENDAMENTO_SERVICO](
	[ID_AGENDAMENTO] [int] IDENTITY(1,1) NOT NULL,
	[ID_CLIENTE] [int] NOT NULL,
	[DATA_AGENDADA] [datetime] NOT NULL,
	[ID_VEICULO_CLIENTE] [int] NOT NULL,
PRIMARY KEY CLUSTERED ([ID_AGENDAMENTO]))

CREATE TABLE [dbo].[CLIENTE](
	[ID_CLIENTE] [int] IDENTITY(1,1) NOT NULL,
	[CNPJ_CPF] [varchar](14) NOT NULL,
	[NOME_CLIENTE] [char](50) NOT NULL,
	[CNPJ_OU_CPF] [char](1) NOT NULL,
	[APELIDO] [varchar](15) NOT NULL,
	[DATA_NASCIMENTO] [date] NULL,
	[DATA_CADASTRO] [datetime] NOT NULL,
	[ID_USUARIO_CAD] [int] NOT NULL,
	[EMAIL_NF] [varchar](255) NULL,
	[CEP] [char](8) NOT NULL,
	[LOGRADOURO] [varchar](80) NOT NULL,
	[NUMERO] [varchar](6) NOT NULL,
	[COMPLEMENTO] [varchar](30) NOT NULL,
	[BAIRRO] [varchar](40) NOT NULL,
	[CIDADE] [varchar](50) NOT NULL,
	[TELEFONE] [varchar](11) NULL,
	[CELULAR] [varchar](11) NOT NULL,
PRIMARY KEY CLUSTERED ([ID_CLIENTE]),
PRIMARY KEY CLUSTERED ([CNPJ_CPF]),
INDEX [EMAIL_NF],
INDEX [ID_USUARIO_CAD],
INDEX [CELULAR],
INDEX [APELIDO],
INDEX [DATA_NASCIMENTO])

CREATE TABLE [dbo].[CLIENTE_VEICULO](
	[ID_CLI_VEICULO] [int] IDENTITY(1,1) NOT NULL,
	[ID_CLIENTE] [int] NOT NULL,
	[ID_VEICULO] [int] NOT NULL,
	[VEICULO_ATUAL] [bit] NOT NULL,
	[DATA_CADASTRO] [datetime] NOT NULL,
	[ID_USUARIO_CAD] [int] NOT NULL,
PRIMARY KEY CLUSTERED ([ID_CLI_VEICULO]),
INDEX [ID_CLIENTE],
INDEX [ID_VEICULO],
INDEX [ID_USUARIO]) 

CREATE TABLE [dbo].[DETALHE_OS](
	[ID_DETALHE] [int] AUTO_INCREMENT NOT NULL,
	[ID_ORDEM] [int] NOT NULL,
	[ID_SERVICO] [int] NOT NULL,
	[ID_MEC_RESPONSAVEL] [int] NOT NULL,
	[QUANTIDADE] [numeric](3, 0) NOT NULL,
	[TEMPO_PREVISTO] [time](7) NOT NULL,
	[DATA_INICIO_SERVICO] [datetime] NOT NULL,
	[DATA_FIM_SERVICO] [datetime] NOT NULL,
	[APROVADO] [bit] NOT NULL,
	[VALOR_UNITARIO] [float] NOT NULL,
PRIMARY KEY CLUSTERED ([ID_DETALHE]),
INDEX [ID_ORDEM],
INDEX [ID_SERVICO],
INDEX [ID_MEC_RESPONSAVEL],
INDEX [DATA_INICIO_SERVICO],
INDEX [DATA_FIM_SERVICO])

CREATE TABLE [dbo].[FUNCIONARIO](
	[ID_FUNCIONARIO] [int] AUTO_INCREMENT NOT NULL,
	[NOME] [varchar](70) NOT NULL,
	[FUNCAO] [varchar](20) NOT NULL,
	[ID_OFICINA] [int] NOT NULL,
PRIMARY KEY CLUSTERED([ID_FUNCIONARIO]),
INDEX [NOME],
INDEX [ID_OFICINA])

CREATE TABLE [dbo].[MARCA_CARRO](
	[ID_MARCA] [int] AUTO_INCREMENT NOT NULL,
	[NOME_MARCA] [varchar](30) NOT NULL,
PRIMARY KEY ([ID_MARCA]),
INDEX [NOME_MARCA])

CREATE TABLE [dbo].[MODELO_CARRO](
	[ID_MODELO] [int] AUTO_INCREMENT NOT NULL,
	[ID_MARCA] [int] NOT NULL,
	[NOME_MODELO] [varchar](30) NOT NULL,
PRIMARY KEY ([ID_MODELO]),
INDEX [ID_MARCA],
INDEX [NOME_MODELO])

CREATE TABLE [dbo].[OFICINA](
	[ID_OFICINA] [int] AUTO_INCREMENT NOT NULL,
	[CNPJ] [char](14) NOT NULL,
	[NOME_OFICINA] [varchar](50) NOT NULL,
	[APELIDO] [varchar](15) NOT NULL,
	[INSC_ESTADUAL] [varchar](15) NOT NULL,
	[INSC_MUNICIPAL] [varchar](15) NOT NULL,
	[CEP] [char](8) NOT NULL,
	[LOGRADOURO] [varchar](80) NOT NULL,
	[NUMERO] [varchar](6) NULL,
	[COMPLEMENTO] [varchar](30) NULL,
	[BAIRRO] [varchar](40) NULL,
	[CIDADE] [varchar](50) NULL,
	[TELEFONE1] [varchar](11) NOT NULL,
	[TELEFONE2] [varchar](11) NOT NULL,
	[EMAIL] [varchar](155) NOT NULL,
	[EMAIL_NF] [varchar](155) NOT NULL,
	[OPCAO_CADASTRO] [bit] NOT NULL,
PRIMARY KEY ([ID_OFICINA]),
INDEX [CNPJ],
INDEX [APELIDO],


CREATE TABLE [dbo].[ORDEM_SERVICO](
	[ID_ORDEM_SERVICO] [int] AUTO_INCREMENT NOT NULL,
	[ID_CLIENTE] [int] NOT NULL,
	[ID_VEICULO] [int] NOT NULL,
	[DATA_ORDEM] [datetime] NOT NULL,
	[TELEFONE_CONTATO] [varchar](11) NOT NULL,
	[EMAIL_CONTATO] [varchar](155) NOT NULL,
	[ID_OFICINA] [int] NOT NULL,
	[ID_AGENDAMENTO] [int] NULL,
	[ID_USUARIO_CAD] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_ORDEM_SERVICO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SERVICO]    Script Date: 12/05/2022 22:54:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SERVICO](
	[ID_SERVICO] [int] IDENTITY(1,1) NOT NULL,
	[DESCRICAO] [varchar](50) NOT NULL,
	[TEMPO_EXEC_SERVICO] [time](7) NOT NULL,
	[CUSTO_HORA] [numeric](5, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_SERVICO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[USUARIO]    Script Date: 12/05/2022 22:54:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[USUARIO](
	[ID_USUARIO] [int] IDENTITY(1,1) NOT NULL,
	[ID_FUNCIONARIO] [int] NOT NULL,
	[LOGIN_USUARIO] [varchar](50) NOT NULL,
	[SENHA_USUARIO] [varchar](200) NOT NULL,
	[CLIENTE_OU_FUNCIONARIO] [char](1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_USUARIO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VEICULO]    Script Date: 12/05/2022 22:54:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VEICULO](
	[ID_VEICULO] [int] IDENTITY(1,1) NOT NULL,
	[ID_CLIENTE] [int] NOT NULL,
	[ID_MODELO] [int] NOT NULL,
	[MOTORIZACAO] [varchar](5) NOT NULL,
	[ANO_FABRICACAO] [char](4) NOT NULL,
	[ANO_MODELO] [char](4) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_VEICULO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [IDX01_AGENDAMENTO_SERVICO]    Script Date: 12/05/2022 22:54:40 ******/
CREATE NONCLUSTERED INDEX [IDX01_AGENDAMENTO_SERVICO] ON [dbo].[AGENDAMENTO_SERVICO]
(
	[ID_VEICULO_CLIENTE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX01_CLIENTE]    Script Date: 12/05/2022 22:54:40 ******/
CREATE NONCLUSTERED INDEX [IDX01_CLIENTE] ON [dbo].[CLIENTE]
(
	[CNPJ_CPF] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX02_CLIENTE]    Script Date: 12/05/2022 22:54:40 ******/
CREATE NONCLUSTERED INDEX [IDX02_CLIENTE] ON [dbo].[CLIENTE]
(
	[NOME_CLIENTE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX03_CLIENTE]    Script Date: 12/05/2022 22:54:40 ******/
CREATE NONCLUSTERED INDEX [IDX03_CLIENTE] ON [dbo].[CLIENTE]
(
	[APELIDO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IDX04_CLIENTE]    Script Date: 12/05/2022 22:54:40 ******/
CREATE NONCLUSTERED INDEX [IDX04_CLIENTE] ON [dbo].[CLIENTE]
(
	[DATA_CADASTRO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IDX05_CLIENTE]    Script Date: 12/05/2022 22:54:40 ******/
CREATE NONCLUSTERED INDEX [IDX05_CLIENTE] ON [dbo].[CLIENTE]
(
	[ID_USUARIO_CAD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX06_CLIENTE]    Script Date: 12/05/2022 22:54:40 ******/
CREATE NONCLUSTERED INDEX [IDX06_CLIENTE] ON [dbo].[CLIENTE]
(
	[EMAIL_NF] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX07_CLIENTE]    Script Date: 12/05/2022 22:54:40 ******/
CREATE NONCLUSTERED INDEX [IDX07_CLIENTE] ON [dbo].[CLIENTE]
(
	[CELULAR] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IDX01_CLIENTE_VEICULO]    Script Date: 12/05/2022 22:54:40 ******/
CREATE NONCLUSTERED INDEX [IDX01_CLIENTE_VEICULO] ON [dbo].[CLIENTE_VEICULO]
(
	[DATA_CADASTRO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX01_MARCA_CARRO]    Script Date: 12/05/2022 22:54:40 ******/
CREATE NONCLUSTERED INDEX [IDX01_MARCA_CARRO] ON [dbo].[MARCA_CARRO]
(
	[NOME_MARCA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX01_MODELO_CARRO]    Script Date: 12/05/2022 22:54:40 ******/
CREATE NONCLUSTERED INDEX [IDX01_MODELO_CARRO] ON [dbo].[MODELO_CARRO]
(
	[NOME_MODELO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX01_OFICINA]    Script Date: 12/05/2022 22:54:40 ******/
CREATE NONCLUSTERED INDEX [IDX01_OFICINA] ON [dbo].[OFICINA]
(
	[CNPJ] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX02_OFICINA]    Script Date: 12/05/2022 22:54:40 ******/
CREATE NONCLUSTERED INDEX [IDX02_OFICINA] ON [dbo].[OFICINA]
(
	[APELIDO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX03_OFICINA]    Script Date: 12/05/2022 22:54:40 ******/
CREATE NONCLUSTERED INDEX [IDX03_OFICINA] ON [dbo].[OFICINA]
(
	[INSC_ESTADUAL] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX04_OFICINA]    Script Date: 12/05/2022 22:54:40 ******/
CREATE NONCLUSTERED INDEX [IDX04_OFICINA] ON [dbo].[OFICINA]
(
	[INSC_MUNICIPAL] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX01_ORDEM_SERVICO]    Script Date: 12/05/2022 22:54:40 ******/
CREATE NONCLUSTERED INDEX [IDX01_ORDEM_SERVICO] ON [dbo].[ORDEM_SERVICO]
(
	[EMAIL_CONTATO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CLIENTE] ADD  DEFAULT ('') FOR [DATA_NASCIMENTO]
GO
ALTER TABLE [dbo].[CLIENTE] ADD  DEFAULT ('') FOR [CEP]
GO
ALTER TABLE [dbo].[CLIENTE] ADD  DEFAULT ('') FOR [LOGRADOURO]
GO
ALTER TABLE [dbo].[CLIENTE] ADD  DEFAULT ('') FOR [NUMERO]
GO
ALTER TABLE [dbo].[CLIENTE] ADD  DEFAULT ('') FOR [COMPLEMENTO]
GO
ALTER TABLE [dbo].[CLIENTE] ADD  DEFAULT ('') FOR [BAIRRO]
GO
ALTER TABLE [dbo].[CLIENTE] ADD  DEFAULT ('') FOR [CIDADE]
GO
ALTER TABLE [dbo].[CLIENTE] ADD  DEFAULT ('') FOR [TELEFONE]
GO
ALTER TABLE [dbo].[OFICINA] ADD  DEFAULT ('') FOR [NUMERO]
GO
ALTER TABLE [dbo].[OFICINA] ADD  DEFAULT ('') FOR [COMPLEMENTO]
GO
ALTER TABLE [dbo].[OFICINA] ADD  DEFAULT ('') FOR [BAIRRO]
GO
ALTER TABLE [dbo].[OFICINA] ADD  DEFAULT ('') FOR [CIDADE]
GO
ALTER TABLE [dbo].[OFICINA] ADD  DEFAULT ('') FOR [TELEFONE1]
GO
ALTER TABLE [dbo].[OFICINA] ADD  DEFAULT ('') FOR [TELEFONE2]
GO
ALTER TABLE [dbo].[OFICINA] ADD  DEFAULT ('') FOR [EMAIL]
GO
ALTER TABLE [dbo].[ORDEM_SERVICO] ADD  DEFAULT ('') FOR [ID_AGENDAMENTO]
GO
ALTER TABLE [dbo].[AGENDAMENTO_SERVICO]  WITH CHECK ADD  CONSTRAINT [FK_AGENDAMENTOSERVICO_CLIENTE] FOREIGN KEY([ID_CLIENTE])
REFERENCES [dbo].[CLIENTE] ([ID_CLIENTE])
GO
ALTER TABLE [dbo].[AGENDAMENTO_SERVICO] CHECK CONSTRAINT [FK_AGENDAMENTOSERVICO_CLIENTE]
GO
ALTER TABLE [dbo].[AGENDAMENTO_SERVICO]  WITH CHECK ADD  CONSTRAINT [FK_AGENDAMENTOSERVICO_VEICULO] FOREIGN KEY([ID_VEICULO_CLIENTE])
REFERENCES [dbo].[VEICULO] ([ID_VEICULO])
GO
ALTER TABLE [dbo].[AGENDAMENTO_SERVICO] CHECK CONSTRAINT [FK_AGENDAMENTOSERVICO_VEICULO]
GO
ALTER TABLE [dbo].[CLIENTE]  WITH CHECK ADD  CONSTRAINT [FK_CLIENTE_USUARIO] FOREIGN KEY([ID_USUARIO_CAD])
REFERENCES [dbo].[USUARIO] ([ID_USUARIO])
GO
ALTER TABLE [dbo].[CLIENTE] CHECK CONSTRAINT [FK_CLIENTE_USUARIO]
GO
ALTER TABLE [dbo].[CLIENTE_VEICULO]  WITH CHECK ADD  CONSTRAINT [FK_CLIENTEVEICULO_CLIENTE] FOREIGN KEY([ID_CLIENTE])
REFERENCES [dbo].[CLIENTE] ([ID_CLIENTE])
GO
ALTER TABLE [dbo].[CLIENTE_VEICULO] CHECK CONSTRAINT [FK_CLIENTEVEICULO_CLIENTE]
GO
ALTER TABLE [dbo].[CLIENTE_VEICULO]  WITH CHECK ADD  CONSTRAINT [FK_CLIENTEVEICULO_USUARIO] FOREIGN KEY([ID_USUARIO_CAD])
REFERENCES [dbo].[USUARIO] ([ID_USUARIO])
GO
ALTER TABLE [dbo].[CLIENTE_VEICULO] CHECK CONSTRAINT [FK_CLIENTEVEICULO_USUARIO]
GO
ALTER TABLE [dbo].[CLIENTE_VEICULO]  WITH CHECK ADD  CONSTRAINT [FK_CLIENTEVEICULO_VEICULO] FOREIGN KEY([ID_VEICULO])
REFERENCES [dbo].[VEICULO] ([ID_VEICULO])
GO
ALTER TABLE [dbo].[CLIENTE_VEICULO] CHECK CONSTRAINT [FK_CLIENTEVEICULO_VEICULO]
GO
ALTER TABLE [dbo].[DETALHE_OS]  WITH CHECK ADD  CONSTRAINT [FK_DETALHEOS_FUNCIONARIO] FOREIGN KEY([ID_MEC_RESPONSAVEL])
REFERENCES [dbo].[FUNCIONARIO] ([ID_FUNCIONARIO])
GO
ALTER TABLE [dbo].[DETALHE_OS] CHECK CONSTRAINT [FK_DETALHEOS_FUNCIONARIO]
GO
ALTER TABLE [dbo].[DETALHE_OS]  WITH CHECK ADD  CONSTRAINT [FK_DETALHEOS_ORDEMSERVICO] FOREIGN KEY([ORDER_ID])
REFERENCES [dbo].[ORDEM_SERVICO] ([ID_ORDEM_SERVICO])
GO
ALTER TABLE [dbo].[DETALHE_OS] CHECK CONSTRAINT [FK_DETALHEOS_ORDEMSERVICO]
GO
ALTER TABLE [dbo].[DETALHE_OS]  WITH CHECK ADD  CONSTRAINT [FK_DETALHEOS_SERVICO] FOREIGN KEY([ID_SERVICO])
REFERENCES [dbo].[SERVICO] ([ID_SERVICO])
GO
ALTER TABLE [dbo].[DETALHE_OS] CHECK CONSTRAINT [FK_DETALHEOS_SERVICO]
GO
ALTER TABLE [dbo].[FUNCIONARIO]  WITH CHECK ADD  CONSTRAINT [FK_FUNCIONARIO_OFICINA] FOREIGN KEY([ID_OFICINA])
REFERENCES [dbo].[OFICINA] ([ID_OFICINA])
GO
ALTER TABLE [dbo].[FUNCIONARIO] CHECK CONSTRAINT [FK_FUNCIONARIO_OFICINA]
GO
ALTER TABLE [dbo].[MODELO_CARRO]  WITH CHECK ADD  CONSTRAINT [FK_MODELOCARRO_MARCACARRO] FOREIGN KEY([ID_MARCA])
REFERENCES [dbo].[MARCA_CARRO] ([ID_MARCA])
GO
ALTER TABLE [dbo].[MODELO_CARRO] CHECK CONSTRAINT [FK_MODELOCARRO_MARCACARRO]
GO
ALTER TABLE [dbo].[ORDEM_SERVICO]  WITH CHECK ADD  CONSTRAINT [FK_ORDEMSERVICO_AGENDAMENTOSERVICO] FOREIGN KEY([ID_AGENDAMENTO])
REFERENCES [dbo].[AGENDAMENTO_SERVICO] ([ID_AGENDAMENTO])
GO
ALTER TABLE [dbo].[ORDEM_SERVICO] CHECK CONSTRAINT [FK_ORDEMSERVICO_AGENDAMENTOSERVICO]
GO
ALTER TABLE [dbo].[ORDEM_SERVICO]  WITH CHECK ADD  CONSTRAINT [FK_ORDEMSERVICO_CLIENTE] FOREIGN KEY([ID_CLIENTE])
REFERENCES [dbo].[CLIENTE] ([ID_CLIENTE])
GO
ALTER TABLE [dbo].[ORDEM_SERVICO] CHECK CONSTRAINT [FK_ORDEMSERVICO_CLIENTE]
GO
ALTER TABLE [dbo].[ORDEM_SERVICO]  WITH CHECK ADD  CONSTRAINT [FK_ORDEMSERVICO_OFICINA] FOREIGN KEY([ID_OFICINA])
REFERENCES [dbo].[OFICINA] ([ID_OFICINA])
GO
ALTER TABLE [dbo].[ORDEM_SERVICO] CHECK CONSTRAINT [FK_ORDEMSERVICO_OFICINA]
GO
ALTER TABLE [dbo].[ORDEM_SERVICO]  WITH CHECK ADD  CONSTRAINT [FK_ORDEMSERVICO_USUARIO] FOREIGN KEY([ID_USUARIO_CAD])
REFERENCES [dbo].[USUARIO] ([ID_USUARIO])
GO
ALTER TABLE [dbo].[ORDEM_SERVICO] CHECK CONSTRAINT [FK_ORDEMSERVICO_USUARIO]
GO
ALTER TABLE [dbo].[ORDEM_SERVICO]  WITH CHECK ADD  CONSTRAINT [FK_ORDEMSERVICO_VEICULO] FOREIGN KEY([ID_VEICULO])
REFERENCES [dbo].[VEICULO] ([ID_VEICULO])
GO
ALTER TABLE [dbo].[ORDEM_SERVICO] CHECK CONSTRAINT [FK_ORDEMSERVICO_VEICULO]
GO
ALTER TABLE [dbo].[USUARIO]  WITH CHECK ADD  CONSTRAINT [FK_USUARIO_FUNCIONARIO] FOREIGN KEY([ID_FUNCIONARIO])
REFERENCES [dbo].[FUNCIONARIO] ([ID_FUNCIONARIO])
GO
ALTER TABLE [dbo].[USUARIO] CHECK CONSTRAINT [FK_USUARIO_FUNCIONARIO]
GO
ALTER TABLE [dbo].[VEICULO]  WITH CHECK ADD  CONSTRAINT [FK_VEICULO_CLIENTE] FOREIGN KEY([ID_CLIENTE])
REFERENCES [dbo].[CLIENTE] ([ID_CLIENTE])
GO
ALTER TABLE [dbo].[VEICULO] CHECK CONSTRAINT [FK_VEICULO_CLIENTE]
GO
ALTER TABLE [dbo].[VEICULO]  WITH CHECK ADD  CONSTRAINT [FK_VEICULO_MODELOCARRO] FOREIGN KEY([ID_MODELO])
REFERENCES [dbo].[MODELO_CARRO] ([ID_MODELO])
GO
ALTER TABLE [dbo].[VEICULO] CHECK CONSTRAINT [FK_VEICULO_MODELOCARRO]
GO
USE [master]
GO
ALTER DATABASE [CRM_AUTO] SET  READ_WRITE 
GO