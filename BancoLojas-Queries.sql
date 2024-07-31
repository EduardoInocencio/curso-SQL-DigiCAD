-- EXERCÍCIO DE QUERIES (CONSULTAS)


/* 

EX1: 
Listar o Código, Nome da Empresa, Nome do Contato, Pais e Telefone da tabela
Tbl_Fornecedores, banco de dados db_Loja, e classificar em ordem crescente por Pais.

*/

SELECT 
	pk_codigoDoFornecedor AS CODIGO, 
	nomeDaEmpresa AS EMPRESA,
	nomeDoContato AS CONTATO,
	pais AS PAIS,
	telefone AS TELEFONE
FROM 
	Tbl_Fornecedores;