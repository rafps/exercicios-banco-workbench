CREATE DATABASE bd_vendas;
USE bd_vendas;

CREATE TABLE tb_cliente (
    cd_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nm_cliente VARCHAR(100) NOT NULL,
    ds_cidade VARCHAR(50)
);

CREATE TABLE tb_pedido (
    cd_pedido INT PRIMARY KEY AUTO_INCREMENT,
    dt_pedido DATE NOT NULL,
    vl_total DECIMAL(10,2) NOT NULL,
    cd_cliente INT,

    CONSTRAINT fk_pedido_cliente
    FOREIGN KEY (cd_cliente)
    REFERENCES tb_cliente(cd_cliente)
);

INSERT INTO tb_cliente
(nm_cliente, ds_cidade)
VALUES
('Rafael', 'Brasilia'),
('Maria', 'Goiania'),
('Carlos', 'Sao Paulo'),
('Ana', 'Brasilia');

INSERT INTO tb_pedido
(dt_pedido, vl_total, cd_cliente)
VALUES
('2026-09-01', 500.00, 1),
('2026-09-02', 1000.00, 2),
('2026-09-03', 750.00, 1),
('2026-09-04', 2000.00, 3),
('2026-09-05', 300.00, 4);

-- 01) Listar clientes e seus respectivos pedidos
SELECT
    tb_cliente.nm_cliente,
    tb_pedido.cd_pedido,
    tb_pedido.dt_pedido,
    tb_pedido.vl_total
FROM tb_cliente
INNER JOIN tb_pedido
ON tb_cliente.cd_cliente = tb_pedido.cd_cliente;

-- 02) Listar somente clientes de Brasilia
SELECT *
FROM tb_cliente
WHERE ds_cidade = 'Brasilia';

-- 03) Listar pedidos feitos pelo cliente Rafael
SELECT
    tb_cliente.nm_cliente,
    tb_pedido.vl_total
FROM tb_cliente
INNER JOIN tb_pedido
ON tb_cliente.cd_cliente = tb_pedido.cd_cliente
WHERE tb_cliente.nm_cliente = 'Rafael';

-- 04) Listar pedidos acima de 700 junto com o nome do cliente
SELECT
    tb_cliente.nm_cliente,
    tb_pedido.vl_total
FROM tb_cliente
INNER JOIN tb_pedido
ON tb_cliente.cd_cliente = tb_pedido.cd_cliente
WHERE tb_pedido.vl_total > 700;

-- 05) Listar os pedidos em ordem decrescente de valor
SELECT
    tb_cliente.nm_cliente,
    tb_pedido.vl_total
FROM tb_cliente
INNER JOIN tb_pedido
ON tb_cliente.cd_cliente = tb_pedido.cd_cliente
ORDER BY tb_pedido.vl_total DESC;

-- 06) Mostrar quanto cada cliente gastou
SELECT
    tb_cliente.nm_cliente,
    SUM(tb_pedido.vl_total) AS total_gasto
FROM tb_cliente
INNER JOIN tb_pedido
ON tb_cliente.cd_cliente = tb_pedido.cd_cliente
GROUP BY tb_cliente.nm_cliente;

-- 07) Mostrar quantos pedidos cada cliente realizou
SELECT
    tb_cliente.nm_cliente,
    COUNT(tb_pedido.cd_pedido) AS quantidade_pedidos
FROM tb_cliente
INNER JOIN tb_pedido
ON tb_cliente.cd_cliente = tb_pedido.cd_cliente
GROUP BY tb_cliente.nm_cliente;

-- 08) Mostrar o cliente que realizou o maior pedido
SELECT
    tb_cliente.nm_cliente,
    tb_pedido.vl_total
FROM tb_cliente
INNER JOIN tb_pedido
ON tb_cliente.cd_cliente = tb_pedido.cd_cliente
ORDER BY tb_pedido.vl_total DESC
LIMIT 1;

-- 09) Mostrar clientes que gastaram mais de 1000
SELECT
    tb_cliente.nm_cliente,
    SUM(tb_pedido.vl_total) AS total_gasto
FROM tb_cliente
INNER JOIN tb_pedido
ON tb_cliente.cd_cliente = tb_pedido.cd_cliente
GROUP BY tb_cliente.nm_cliente
HAVING SUM(tb_pedido.vl_total) > 1000;

-- 10) Mostrar a média dos pedidos de cada cliente
SELECT
    tb_cliente.nm_cliente,
    AVG(tb_pedido.vl_total) AS media_pedidos
FROM tb_cliente
INNER JOIN tb_pedido
ON tb_cliente.cd_cliente = tb_pedido.cd_cliente
GROUP BY tb_cliente.nm_cliente;
