CREATE DATABASE bd_biblioteca;
USE bd_biblioteca;

CREATE TABLE tb_autor (
    cd_autor INT PRIMARY KEY AUTO_INCREMENT,
    nm_autor VARCHAR(100) NOT NULL
);

CREATE TABLE tb_categoria (
    cd_categoria INT PRIMARY KEY AUTO_INCREMENT,
    nm_categoria VARCHAR(50) NOT NULL
);

CREATE TABLE tb_livro (
    cd_livro INT PRIMARY KEY AUTO_INCREMENT,
    nm_livro VARCHAR(150) NOT NULL,
    nr_ano INT,
    cd_autor INT,
    cd_categoria INT,

    FOREIGN KEY (cd_autor)
    REFERENCES tb_autor(cd_autor),

    FOREIGN KEY (cd_categoria)
    REFERENCES tb_categoria(cd_categoria)
);

CREATE TABLE tb_usuario (
    cd_usuario INT PRIMARY KEY AUTO_INCREMENT,
    nm_usuario VARCHAR(100) NOT NULL,
    ds_email VARCHAR(100) UNIQUE
);

CREATE TABLE tb_emprestimo (
    cd_emprestimo INT PRIMARY KEY AUTO_INCREMENT,
    dt_emprestimo DATE NOT NULL,
    dt_devolucao DATE,
    cd_usuario INT,
    cd_livro INT,

    FOREIGN KEY (cd_usuario)
    REFERENCES tb_usuario(cd_usuario),

    FOREIGN KEY (cd_livro)
    REFERENCES tb_livro(cd_livro)
);

INSERT INTO tb_autor (nm_autor)
VALUES
('Machado de Assis'),
('George Orwell'),
('J. K. Rowling'),
('Robert C. Martin');

INSERT INTO tb_categoria (nm_categoria)
VALUES
('Romance'),
('Ficcao'),
('Tecnologia');

INSERT INTO tb_livro
(nm_livro, nr_ano, cd_autor, cd_categoria)
VALUES
('Dom Casmurro', 1899, 1, 1),
('1984', 1949, 2, 2),
('Harry Potter', 1997, 3, 2),
('Clean Code', 2008, 4, 3);

INSERT INTO tb_usuario
(nm_usuario, ds_email)
VALUES
('Rafael', 'rafael@email.com'),
('Maria', 'maria@email.com'),
('Carlos', 'carlos@email.com');

INSERT INTO tb_emprestimo
(dt_emprestimo, dt_devolucao, cd_usuario, cd_livro)
VALUES
('2026-09-01', '2026-09-10', 1, 1),
('2026-09-02', NULL, 2, 2),
('2026-09-03', NULL, 3, 4);

-- 01) Listar todos os livros
SELECT *
FROM tb_livro;

-- 02) Listar livros com seus respectivos autores
SELECT
    l.nm_livro,
    a.nm_autor
FROM tb_livro l
INNER JOIN tb_autor a
ON l.cd_autor = a.cd_autor;

-- 03) Listar livros com suas categorias
SELECT
    l.nm_livro,
    c.nm_categoria
FROM tb_livro l
INNER JOIN tb_categoria c
ON l.cd_categoria = c.cd_categoria;

-- 04) Listar livros publicados depois de 2000
SELECT *
FROM tb_livro
WHERE nr_ano > 2000;

-- 05) Listar usuários cadastrados
SELECT *
FROM tb_usuario;

-- 06) Listar todos os empréstimos
SELECT *
FROM tb_emprestimo;

-- 07) Mostrar quem pegou cada livro
SELECT
    u.nm_usuario,
    l.nm_livro,
    e.dt_emprestimo
FROM tb_emprestimo e
INNER JOIN tb_usuario u
ON e.cd_usuario = u.cd_usuario
INNER JOIN tb_livro l
ON e.cd_livro = l.cd_livro;

-- 08) Listar livros que ainda não foram devolvidos
SELECT
    u.nm_usuario,
    l.nm_livro,
    e.dt_emprestimo
FROM tb_emprestimo e
INNER JOIN tb_usuario u
ON e.cd_usuario = u.cd_usuario
INNER JOIN tb_livro l
ON e.cd_livro = l.cd_livro
WHERE e.dt_devolucao IS NULL;

-- 09) Contar quantos empréstimos cada usuário realizou
SELECT
    u.nm_usuario,
    COUNT(e.cd_emprestimo) AS quantidade_emprestimos
FROM tb_usuario u
LEFT JOIN tb_emprestimo e
ON u.cd_usuario = e.cd_usuario
GROUP BY u.nm_usuario;

-- 10) Listar todas as informações dos livros
SELECT
    l.nm_livro,
    l.nr_ano,
    a.nm_autor,
    c.nm_categoria
FROM tb_livro l
INNER JOIN tb_autor a
ON l.cd_autor = a.cd_autor
INNER JOIN tb_categoria c
ON l.cd_categoria = c.cd_categoria;
