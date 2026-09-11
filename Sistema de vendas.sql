CREATE DATABASE bd_sistema_vendas;
USE bd_sistema_vendas;

CREATE TABLE tb_cliente (
    cd_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nm_cliente VARCHAR(100) NOT NULL
);

CREATE TABLE tb_produto (
    cd_produto INT PRIMARY KEY AUTO_INCREMENT,
    nm_produto VARCHAR(100) NOT NULL,
    vl_preco DECIMAL(10,2) NOT NULL
);

CREATE TABLE tb_venda (
    cd_venda INT PRIMARY KEY AUTO_INCREMENT,
    dt_venda DATE NOT NULL,
    cd_cliente INT,

    FOREIGN KEY (cd_cliente)
    REFERENCES tb_cliente(cd_cliente)
);

CREATE TABLE tb_item_venda (
    cd_venda INT,
    cd_produto INT,
    qt_produto INT NOT NULL,
    vl_unitario DECIMAL(10,2) NOT NULL,

    PRIMARY KEY (cd_venda, cd_produto),

    FOREIGN KEY (cd_venda)
    REFERENCES tb_venda(cd_venda),

    FOREIGN KEY (cd_produto)
    REFERENCES tb_produto(cd_produto)
);

INSERT INTO tb_cliente (nm_cliente)
VALUES
('Rafael'),
('Maria'),
('Carlos');

INSERT INTO tb_produto
(nm_produto, vl_preco)
VALUES
('Notebook', 3500.00),
('Mouse', 100.00),
('Teclado', 150.00),
('Headset', 250.00);

INSERT INTO tb_venda
(dt_venda, cd_cliente)
VALUES
('2026-09-01', 1),
('2026-09-02', 2),
('2026-09-03', 1);

INSERT INTO tb_item_venda
(cd_venda, cd_produto, qt_produto, vl_unitario)
VALUES
(1, 1, 1, 3500.00),
(1, 2, 2, 100.00),
(2, 3, 1, 150.00),
(2, 4, 2, 250.00),
(3, 2, 3, 100.00);

-- 01) Listar todas as vendas
SELECT *
FROM tb_venda;

-- 02) Listar todos os produtos vendidos
SELECT *
FROM tb_item_venda;

-- 03) Mostrar os produtos de cada venda
SELECT
    i.cd_venda,
    p.nm_produto,
    i.qt_produto,
    i.vl_unitario
FROM tb_item_venda i
INNER JOIN tb_produto p
ON i.cd_produto = p.cd_produto;

-- 04) Calcular o subtotal de cada item vendido
SELECT
    i.cd_venda,
    p.nm_produto,
    i.qt_produto,
    i.vl_unitario,
    i.qt_produto * i.vl_unitario AS subtotal
FROM tb_item_venda i
INNER JOIN tb_produto p
ON i.cd_produto = p.cd_produto;

-- 05) Mostrar o cliente de cada venda
SELECT
    v.cd_venda,
    v.dt_venda,
    c.nm_cliente
FROM tb_venda v
INNER JOIN tb_cliente c
ON v.cd_cliente = c.cd_cliente;

-- 06) Calcular o total de cada venda
SELECT
    i.cd_venda,
    SUM(i.qt_produto * i.vl_unitario) AS total_venda
FROM tb_item_venda i
GROUP BY i.cd_venda;

-- 07) Mostrar quanto cada cliente gastou
SELECT
    c.nm_cliente,
    SUM(i.qt_produto * i.vl_unitario) AS total_gasto
FROM tb_cliente c
INNER JOIN tb_venda v
ON c.cd_cliente = v.cd_cliente
INNER JOIN tb_item_venda i
ON v.cd_venda = i.cd_venda
GROUP BY c.nm_cliente;

-- 08) Mostrar produtos que tiveram mais de 2 unidades vendidas
SELECT
    p.nm_produto,
    SUM(i.qt_produto) AS quantidade_vendida
FROM tb_produto p
INNER JOIN tb_item_venda i
ON p.cd_produto = i.cd_produto
GROUP BY p.nm_produto
HAVING SUM(i.qt_produto) > 2;

-- 09) Mostrar a venda de maior valor
SELECT
    cd_venda,
    SUM(qt_produto * vl_unitario) AS total_venda
FROM tb_item_venda
GROUP BY cd_venda
ORDER BY total_venda DESC
LIMIT 1;

-- 10) Mostrar todas as informações das vendas
SELECT
    v.cd_venda,
    v.dt_venda,
    c.nm_cliente,
    p.nm_produto,
    i.qt_produto,
    i.vl_unitario,
    i.qt_produto * i.vl_unitario AS subtotal
FROM tb_venda v
INNER JOIN tb_cliente c
ON v.cd_cliente = c.cd_cliente
INNER JOIN tb_item_venda i
ON v.cd_venda = i.cd_venda
INNER JOIN tb_produto p
ON i.cd_produto = p.cd_produto;
