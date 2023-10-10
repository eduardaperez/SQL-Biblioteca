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
	isbn VARCHAR(13) PRIMARY KEY NOT NULL,
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

ALTER TABLE Emprestimos
MODIFY COLUMN data_emprestimo DATE DEFAULT (current_date());

ALTER TABLE Emprestimos
MODIFY COLUMN data_prevista_devolucao DATE DEFAULT (current_date() + 7); 

ALTER TABLE Emprestimos
MODIFY COLUMN data_devolvido DATE;

CREATE TABLE LivrosEmprestados (
    id_emprestimo INT,
    isbn VARCHAR(13),
    PRIMARY KEY (id_emprestimo, isbn),
    FOREIGN KEY (id_emprestimo) REFERENCES Emprestimos(id_emprestimo),
    FOREIGN KEY (isbn) REFERENCES Livros(isbn)
);


INSERT INTO Autor (nome_autor, nacionalidade)
VALUES
    ('George Orwell', 'Inglaterra'),
    ('Gabriel García Márquez', 'Colômbia'),
    ('Jane Austen', 'Inglaterra'),
    ('Mark Twain', 'Estados Unidos'),
	('J.K. Rowling', 'Reino Unido'),
    ('Stephen King', 'Estados Unidos'),
    ('Agatha Christie', 'Reino Unido');


INSERT INTO Categorias (nome)
VALUES
    ('Ficção Científica'),
    ('Romance'),
    ('Clássico'),
    ('Fantasia'),
    ('Suspense'),
    ('Mistério'),
    ('Não Ficção'),
    ('Aventura');

ALTER TABLE Livros
MODIFY COLUMN ano_publicacao INT;

INSERT INTO Livros (isbn, titulo, ano_publicacao, editora, qtd_disponivel, fk_id_autor, fk_id_categoria)
VALUES
    ('9780451524935', '1984', 1949, 'Penguin', 10, 1, 1),
    ('9780061120084', 'Cem Anos de Solidão', 1967, 'Harper & Row', 8, 2, 2),
    ('9780141439723', 'Orgulho e Preconceito', 1813, 'Penguin', 12, 3, 3),
    ('9780140620590', 'As Aventuras de Huckleberry Finn', 1884, 'Penguin', 7, 4, 4),
    ('9780439554930', 'Harry Potter e a Pedra Filosofal', 1997, 'Bloomsbury', 15, 1, 1),
    ('9780451169525', 'O Iluminado', 1977, 'Signet', 10, 2, 2),
    ('9780062073475', 'Assassinato no Expresso Oriente', 1934, 'HarperCollins', 12, 3, 3),
    ('9780385514249', 'Uma Breve História do Tempo', 1988, 'Bantam', 8, 4, 4);

INSERT INTO Membros (nome, cpf, data_nascimento, email, telefone, endereco)
VALUES
    ('João da Silva', '12345678901', '1990-05-15', 'joao@gmail.com', '(11) 1234-5678', 'Rua A, 123'),
    ('Maria Souza', '98765432109', '1985-08-20', 'maria@hotmail.com', '(21) 9876-5432', 'Av. B, 456'),
    ('Pedro Pereira', '56789012345', '2000-03-10', 'pedro@yahoo.com', '(31) 5555-4444', 'Rua C, 789'),
    ('Ana Lima', '34567890123', '1982-09-25', 'ana@example.com', '(41) 9876-5432', 'Rua D, 101'),
    ('Ricardo Santos', '78901234567', '1995-04-12', 'ricardo@example.com', '(51) 1234-5678', 'Av. E, 202'),
    ('Isabela Ferreira', '23456789012', '2001-07-03', 'isabela@example.com', '(61) 5555-1234', 'Rua F, 303');
    
INSERT INTO Emprestimos (id_membro)
VALUES
    (1),
    (2),
    (3),
    (4),
    (5),
    (6);
    
INSERT INTO LivrosEmprestados (id_emprestimo, isbn)
VALUES
    (1, 9780451524935),
    (1, 9780061120084),
    (2, 9780141439723),
    (3, 9780140620590),
    (4, 9780439554930),
    (4, 9780451169525),
    (5, 9780062073475),
    (6, 9780141439723);
    
SELECT *
FROM LivrosEmprestados;

