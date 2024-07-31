-- CRIAÇÃO DO BANCO DE DADOS dbLOJAS

CREATE DATABASE dbLoja;

/*Define o arquivo de dados primário do banco de dados. No SQL Server, o "PRIMARY" 
refere-se ao grupo de arquivos primário onde os dados do banco de dados são armazenados.*/

ON PRIMARY (
	NAME = db_Loja,
	FILENAME = 'C:\SQL\db_Loja.mdf',
	SIZE = 6MB,
	MAXSIZE = 15MB,
	FILEGROWTH = 10%
)
/*Define o arquivo de log do banco de dados. O arquivo de log é onde o SQL Server 
registra todas as transações realizadas no banco de dados.*/

LOG ON (
	NAME = db_Loja_log,
	FILENAME = 'C:\SQL\db_Loja.ldf',
	SIZE = 3MB,
	MAXSIZE = 8MB,
	FILEGROWTH = 5%
);

USE dbLoja;
-- CRIAÇÃO DAS TABELAS
-- TBL_CLIENTES
CREATE TABLE tblClientes(
	
	pk_codigoCliente	VARCHAR(5) PRIMARY KEY,
	nomeEmpresa			VARCHAR(40) NOT NULL,
	nomeContato			VARCHAR(30),
	cargoContato		VARCHAR(30),
	endereco			VARCHAR(60),
	cidade				VARCHAR(15),
	regiao				VARCHAR(15),
	cep					VARCHAR(10),
	pais				VARCHAR(15),
	telefone			VARCHAR(24),
	fax					VARCHAR(24)
);

-- TBL_FUNCIONÁRIOS
CREATE TABLE tblFuncionario (
	
	pk_codigoFuncionario	INT PRIMARY KEY,
	sobrenome				VARCHAR(20) NOT NULL,
	nome					VARCHAR(20) NOT NULL,
	cargo					VARCHAR(30),
	tratamento				VARCHAR(50),
	dataNascimento			DATE,
	dataContratacao			DATE,
	endereco				VARCHAR(60),
	cidade					VARCHAR(15),
	regiao					VARCHAR(15),
	cep						VARCHAR(10),
	pais					VARCHAR(15),
	telefoneResidencial		VARCHAR(24),
	ramal					VARCHAR(4),
	observacoes				VARCHAR(200)

);

-- TBL_FORNECEDORES

CREATE TABLE Tbl_Fornecedores(
	pk_codigoDoFornecedor 		INT	 PRIMARY KEY NOT NULL,
	nomeDaEmpresa 				VARCHAR(40) NOT NULL,
	nomeDoContato 				VARCHAR(30),
	cargoDoContato 				VARCHAR(30),
	endereco 					VARCHAR(60),
	cidade 						VARCHAR(15),
	regiao 						VARCHAR(15),
	cep 						VARCHAR(10),
	pais 						VARCHAR(15),
	telefone 					VARCHAR(24),
	fax 						VARCHAR(24),
);

-- TBL_TRANSPORTADORAS

CREATE TABLE Tbl_Transportadoras(
	pk_codigoDaTransportadora 	INT PRIMARY KEY	NOT NULL,
	nomeDaEmpresa 				VARCHAR(40) NOT NULL,
	telefone 					VARCHAR(24) 
);

-- TBL_CATEGORIAS


CREATE TABLE Tbl_Categorias(
	pk_codigoDaCategoria 		INT	PRIMARY KEY	NOT NULL,
	nomeDaCategoria 			VARCHAR(15) NOT NULL,
	descricao 					VARCHAR(300)
);

-- TBL_PRODUTOS
CREATE TABLE Tbl_Produtos(
	pk_codigoDoProduto 			INT PRIMARY KEY	NOT NULL,
	nomeDoProduto 				VARCHAR(40)	NOT NULL,
	fk_codigoDoFornecedor 		INT,
	fk_codigoDaCategoria 		INT,
	quantidadePorUnidade 		VARCHAR(25),
	precoUnitario 				DECIMAL(5,2),
	unidadesEmEstoque 			SMALLINT,
	unidadesPedidas 			SMALLINT,
	nivelDeReposicao 			SMALLINT,
	descontinuado 				BIT NOT NULL,

	FOREIGN KEY (fk_codigoDoFornecedor) REFERENCES Tbl_Fornecedores (pk_codigoDoFornecedor),
	FOREIGN KEY (fk_codigoDaCategoria) REFERENCES Tbl_Categorias (pk_codigoDaCategoria)
);
-- TBL_PEDIDOS

CREATE TABLE Tbl_Pedidos(
	pk_numeroDoPedido 			INT	 PRIMARY KEY,
	fk_codigoDoCliente 			VARCHAR(5),
	fk_codigoDoFuncionario 		INT,
	dataDoPedido 				DATE,
	dataDeEntrega 				DATE,
	dataDeEnvio 				DATE,
	fk_codigoDaTransportadora	INT	,
	frete 						DECIMAL(6,2),
	nomeDoDestinatario 			VARCHAR(40),
	endereçoDoDestinatario 		VARCHAR(60),
	cidadeDeDestino 			VARCHAR(15),
	regiaoDeDestino 			VARCHAR(15),
	cepDeDestino 				VARCHAR(10),
	paisDeDestino 				VARCHAR(15),

	FOREIGN KEY (fk_codigoDoCliente) REFERENCES tblClientes(pk_codigoCliente),
	FOREIGN KEY (fk_codigoDoFuncionario) REFERENCES tblFuncionario (pk_codigoFuncionario),
	FOREIGN KEY (fk_codigoDaTransportadora) REFERENCES Tbl_Transportadoras (pk_codigoDaTransportadora)
);


-- TBL_DETALHEPEDIDOS

CREATE TABLE Tbl_DetalhesPedidos(
	pk_idDetalhes				INT	PRIMARY KEY IDENTITY(1,1), /* MYSQL AUTO_INCREMENT */
	fk_numeroDoPedido 			INT	 			NOT NULL,
	fk_codigoDoProduto 			INT	 			NOT NULL,
	precoUnitario 				MONEY 			NOT NULL,
	quantidade 					SMALLINT 		NOT NULL,
	desconto 					REAL 			NOT NULL

	FOREIGN KEY (fk_numeroDoPedido) REFERENCES Tbl_Pedidos(pk_numeroDoPedido),
	FOREIGN KEY (fk_codigoDoProduto) REFERENCES Tbl_Produtos (pk_codigoDoProduto)

);