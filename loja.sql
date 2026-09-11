CREATE DATABASE bd_loja;
USE bd_loja;

CREATE TABLE tb_categoria (
    cd_categoria INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    categoria VARCHAR(50)
);

CREATE TABLE tb_produto (
    cd_produto INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    produto VARCHAR(100),
    preco DECIMAL(10,2),
    estoque INT,
    cd_categoria INT,

    FOREIGN KEY (cd_categoria) REFERENCES tb_categoria(cd_categoria)
);

-- Inserindo categorias
INSERT INTO tb_categoria (categoria) VALUES
('Eletrônicos'),
('Informática'),
('Acessórios'),
('Móveis');

-- Inserindo produtos
INSERT INTO tb_produto
(produto, preco, estoque, cd_categoria)
VALUES
('Teclado Mecânico', 250.00, 15, 2),
('Mouse Gamer', 150.00, 25, 3),
('Monitor 24', 900.00, 8, 1),
('Headset', 300.00, 12, 3),
('Cadeira Gamer', 1200.00, 5, 4);

-- 01) Listar todos os produtos
SELECT * FROM tb_produto;

-- 02) Listar produtos com preço maior que 500
SELECT * FROM tb_produto
WHERE preco > 500;

-- 03) Listar produtos com estoque menor que 10
SELECT * FROM tb_produto
WHERE estoque < 10;

-- 04) Aumentar o preço dos produtos em 10%
UPDATE tb_produto
SET preco = preco * 1.10;

-- 05) Alterar o estoque do produto cd_produto = 1
UPDATE tb_produto
SET estoque = 30
WHERE cd_produto = 1;

-- 06) Listar produtos ordenados pelo preço
SELECT * FROM tb_produto
ORDER BY preco DESC;

-- 07) Mostrar produto e categoria
SELECT
    p.produto,
    c.categoria
FROM tb_produto p
INNER JOIN tb_categoria c
    ON p.cd_categoria = c.cd_categoria;

-- 08) Mostrar produto, categoria e preço
SELECT
    p.produto,
    c.categoria,
    p.preco
FROM tb_produto p
INNER JOIN tb_categoria c
    ON p.cd_categoria = c.cd_categoria;

-- 09) Mostrar o maior preço
SELECT MAX(preco) AS maior_preco
FROM tb_produto;

-- 10) Mostrar o preço médio
SELECT AVG(preco) AS preco_medio
FROM tb_produto;

-- 11) Contar produtos
SELECT COUNT(*) AS quantidade_produtos
FROM tb_produto;

-- 12) Mostrar a quantidade de produtos por categoria
SELECT
    c.categoria,
    COUNT(p.cd_produto) AS quantidade
FROM tb_produto p
INNER JOIN tb_categoria c
    ON p.cd_categoria = c.cd_categoria
GROUP BY c.categoria;
