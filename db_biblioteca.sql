/*DROP DATABASE IF EXISTS Biblioteca;*/

CREATE DATABASE Biblioteca
CHARACTER SET utf8mb4
COLLATE utf8mb4_0900_ai_ci;

USE Biblioteca;

CREATE TABLE Autor(
	id_autor INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nome_autor VARCHAR (30) NOT NULL,
    nacionalidade VARCHAR (30)
);

CREATE TABLE Categorias(
	id_categoria INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nome VARCHAR (50) NOT NULL
);

CREATE TABLE Livros(
	isbn INT PRIMARY KEY NOT NULL,
    titulo VARCHAR (50) NOT NULL,
    ano_publicacao YEAR,
    editora VARCHAR (20),
    qtd_disponivel INT NOT NULL,
    fk_id_autor INT NOT NULL,
    fk_id_categoria INT NOT NULL,
		FOREIGN KEY (fk_id_autor) REFERENCES Autor(id_autor),
        FOREIGN KEY (fk_id_categoria) REFERENCES Categorias (id_categoria)
);

CREATE TABLE Membros(
	id_membro INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nome VARCHAR (80) NOT NULL,
    cpf VARCHAR (11) NOT NULL UNIQUE,
    data_nascimento DATE,
    email VARCHAR (40),
    telefone VARCHAR (14),
    endereco VARCHAR (100)
);

CREATE TABLE Emprestimos(
	id_emprestimo INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    id_membro INT,
    data_emprestimo TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    data_prevista_devolucao TIMESTAMP DEFAULT (CURRENT_TIMESTAMP + 7),
    data_devolvido TIMESTAMP
);

CREATE TABLE LivrosEmprestados (
    id_emprestimo INT,
    isbn INT,
    PRIMARY KEY (id_emprestimo, isbn),
    FOREIGN KEY (id_emprestimo) REFERENCES Emprestimos(id_emprestimo),
    FOREIGN KEY (isbn) REFERENCES Livros(isbn)
);


