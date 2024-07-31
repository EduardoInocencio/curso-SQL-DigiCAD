CREATE DATABASE eleicao;

USE eleicao;

-- Criando a tabela CARGO
-- PRIMARY KEY / NOT NULL / UNIQUE -> Constraints (Restrições)
CREATE TABLE Cargo(
	pk_CodigoCargo	INT PRIMARY KEY ,
	nomeCargo		VARCHAR(30) NOT NULL UNIQUE,
	salario			DECIMAL(5,2) NOT NULL DEFAULT 17000.00,
	numeroVagas		INT NOT NULL
);

CREATE TABLE Partido(
	pk_CodigoPartido	INT PRIMARY KEY,
	sigla				CHAR(5) NOT NULL UNIQUE,
	nome				VARCHAR(40) NOT NULL UNIQUE,
	numero				INT NOT NULL UNIQUE
);

CREATE TABLE Candidato(
	pk_CodigoCandidato	INT PRIMARY KEY,
	nome				VARCHAR(40) NOT NULL UNIQUE,
	fk_codigoCargo		INT NOT NULL,
	fk_codigoPartido	INT NOT NULL

	FOREIGN KEY (fk_codigoCargo) REFERENCES Cargo (pk_CodigoCargo),
	FOREIGN KEY (fk_codigoPartido) REFERENCES Partido(pk_CodigoPartido)
);

CREATE TABLE Eleitor(
	pk_tituloEleitor	VARCHAR(30) NOT NULL UNIQUE,
	zonaEleitoral		CHAR(5) NOT NULL,
	sessaoEleitoral		CHAR(5) NOT NULL,
	nome				VARCHAR(40) NOT NULL,
);

CREATE TABLE Voto(
	pk_idVoto			INT PRIMARY KEY,
	fk_tituloEleitor	VARCHAR(30) UNIQUE NOT NULL,
	fk_numeroCandidato	INT NOT NULL

	FOREIGN KEY (fk_tituloEleitor) REFERENCES Eleitor (pk_tituloEleitor),
	FOREIGN KEY (fk_numeroCandidato) REFERENCES Candidato (pk_CodigoCandidato)
);

