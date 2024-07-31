-- CRIANDO O BANCO DE DADOS
CREATE DATABASE biblioteca;

USE biblioteca;

-- ******* CRIAÇÃO DAS TABELAS *******

CREATE TABLE editora(
	pk_publisherID		INT PRIMARY KEY IDENTITY(1,1),
	publisherName		VARCHAR(100) NOT NULL UNIQUE,
	publisherAddress	VARCHAR(100) NOT NULL,
	publisherPhone		CHAR(11) NOT NULL
);


CREATE TABLE livros(
	pk_bookID		INT PRIMARY KEY IDENTITY(1,1),
	bookTitle		VARCHAR(50) NOT NULL,
	fk_publisherID	INT NOT NULL,

	FOREIGN KEY (fk_publisherID) REFERENCES editora (pk_publisherID)
);


CREATE TABLE filialBiblioteca(
	pk_branchID		INT PRIMARY KEY IDENTITY(1,1),
	branchName		VARCHAR(50) NOT NULL UNIQUE,
	branchAddress	VARCHAR(50) NOT NULL
);


CREATE TABLE clientes(
	pk_cardNumber	INT PRIMARY KEY IDENTITY(1,1),
	customerName	VARCHAR(50) NOT NULL,
	customerAddress	VARCHAR(100) NOT NULL,
	customerPhone	CHAR(11) NOT NULL

);

CREATE TABLE emprestimoLivros (
	pk_loansID		INT PRIMARY KEY IDENTITY(1,1),
	fk_bookID		INT NOT NULL,
	fk_branchID		INT NOT NULL,
	fk_cardNumber	INT NOT NULL,
	dateOUT			DATE NOT NULL,
	dueDate			DATE NOT NULL,

	FOREIGN KEY (fk_bookID) REFERENCES livros(pk_bookID),
	FOREIGN KEY (fk_branchID) REFERENCES filialBiblioteca (pk_branchID),
	FOREIGN KEY (fk_cardNumber) REFERENCES clientes (pk_cardNumber)
);

CREATE TABLE copiaLivros(
	pk_copieID		INT PRIMARY KEY IDENTITY(1,1),
	fk_bookID		INT NOT NULL,
	fk_branchID		INT NOT NULL,
	numberOfCopies	INT NOT NULL,

	FOREIGN KEY (fk_bookID) REFERENCES livros(pk_bookID),
	FOREIGN KEY (fk_branchID) REFERENCES filialBiblioteca(pk_branchID)
);

CREATE TABLE autoresLivros(
	pk_authorID		INT PRIMARY KEY IDENTITY(1,1),
	fk_bookID		INT NOT NULL,
	authorName		VARCHAR(50) NOT NULL,

	FOREIGN KEY (fk_bookID) REFERENCES livros(pk_bookID)
);