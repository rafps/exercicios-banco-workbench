
CREATE DATABASE bd_revisao;
USE bd_revisao;

CREATE TABLE tb_cliente (
cd_cliente INT NOT NULL PRIMARY KEY,
cliente VARCHAR(50)
);


CREATE TABLE tb_vendedor (
cd_vendedor INT NOT NULL PRIMARY KEY,
vendedor VARCHAR(50)
);


CREATE TABLE tb_veiculo (
cd_veiculo INT NOT NULL PRIMARY KEY,
veiculo VARCHAR(50),
valor_veiculo DECIMAL(12,2)
);


--Chave primária composta por dt_pedido, cd_veiculo, cd_cliente, cd_vendedor
CREATE TABLE tb_pedido (
dt_pedido DATE,
cd_veiculo INT,
cd_cliente INT,
cd_vendedor INT,
nr_pedido INT,
valor_pedido DECIMAL(12,2),
comissao DECIMAL(12,2),

PRIMARY KEY (dt_pedido, cd_veiculo, cd_cliente, cd_vendedor),

FOREIGN KEY (cd_veiculo) REFERENCES tb_veiculo(cd_veiculo),
FOREIGN KEY (cd_cliente) REFERENCES tb_cliente(cd_cliente),
FOREIGN KEY (cd_vendedor) REFERENCES tb_vendedor(cd_vendedor)
);


-- 06) Inserir clientes iniciais
INSERT INTO tb_cliente VALUES
(1, 'Vallu Nascimento'),
(2, 'Rogeria Negreti'),
(3, 'Henrique Silva'),
(4, 'Wellington Alves'),
(5, 'Jose Pereira');


-- 07) Inserir vendedores iniciais
INSERT INTO tb_vendedor VALUES
(1, 'Anibal'),
(2, 'Antonio de Moraes'),
(3, 'Barbara Alcantara'),
(4, 'Deise Castro'),
(5, 'Eider Nascimento');


-- 08) Inserir veículos iniciais
INSERT INTO tb_veiculo VALUES
(1, 'Onix', 52000),
(2, 'Prisma', 49000),
(3, 'S10', 109000),
(4, 'Cruze', 101000),
(5, 'Spin', 69000),
(6, 'Cobalt', 63000);

-- 09) Inserir pedidos
INSERT INTO tb_pedido VALUES
('2019-01-10',1,2,3,1,52000,0),
('2019-02-20',2,3,4,2,49000,0),
('2019-03-30',3,4,5,3,109000,0),
('2019-04-10',4,5,1,4,101000,0),
('2019-05-20',5,5,1,5,69000,0),
('2019-06-30',6,1,2,6,63000,0),
('2019-07-10',1,4,5,7,52000,0),
('2019-08-20',1,4,5,8,52000,0),
('2019-09-30',1,4,5,9,52000,0),
('2019-10-10',1,4,5,10,52000,0);

-- 10) Consultar todas as tabelas para verificar os dados
SELECT * FROM tb_cliente;
SELECT * FROM tb_vendedor;
SELECT * FROM tb_veiculo;
SELECT * FROM tb_pedido;

-- 11) Inserir novo cliente
INSERT INTO tb_cliente VALUES (6, 'Pedro Nobrega');

-- 12) Atualizar nome do cliente de cd_cliente = 1
UPDATE tb_cliente
SET cliente = 'Carlos Nascimento'
WHERE cd_cliente = 1;


-- 13) Atualizar nome do vendedor de cd_vendedor = 1
UPDATE tb_vendedor
SET vendedor = 'Anibal Santoro'
WHERE cd_vendedor = 1;

-- 14) Atualizar pedido específico (chave composta)
UPDATE tb_pedido
SET cd_veiculo = 4,
    valor_pedido = 101000
WHERE dt_pedido = '2019-01-10'
  AND cd_veiculo = 1
  AND cd_cliente = 2
  AND cd_vendedor = 3;


-- 15) Excluir pedidos de um cliente para depois poder excluir o cliente
DELETE FROM tb_pedido WHERE cd_cliente = 1;
DELETE FROM tb_cliente WHERE cd_cliente = 1;

-- 17) Atualizar comissão de todos os pedidos (10% do valor)
UPDATE tb_pedido
SET comissao = valor_pedido * 0.10;
