CREATE DATABASE bd_empresa;
USE bd_empresa;

CREATE TABLE tb_setor (
    cd_setor INT PRIMARY KEY AUTO_INCREMENT,
    nm_setor VARCHAR(50) NOT NULL
);

CREATE TABLE tb_funcionario (
    cd_funcionario INT PRIMARY KEY AUTO_INCREMENT,
    nm_funcionario VARCHAR(100) NOT NULL,
    vl_salario DECIMAL(10,2) NOT NULL,
    cd_setor INT,

    CONSTRAINT fk_funcionario_setor
    FOREIGN KEY (cd_setor)
    REFERENCES tb_setor(cd_setor)
);

INSERT INTO tb_setor (nm_setor)
VALUES
('TI'),
('Financeiro'),
('RH'),
('Vendas');

INSERT INTO tb_funcionario
(nm_funcionario, vl_salario, cd_setor)
VALUES
('Carlos Silva', 4500.00, 1),
('Maria Souza', 5200.00, 1),
('Joao Santos', 3500.00, 2),
('Ana Oliveira', 4800.00, 3),
('Pedro Costa', 3000.00, 4),
('Juliana Lima', 6000.00, 1);

-- 01) Listar todos os funcionários
SELECT *
FROM tb_funcionario;

-- 02) Listar funcionários que recebem mais de 4000
SELECT *
FROM tb_funcionario
WHERE vl_salario > 4000;

-- 03) Listar funcionários que recebem menos de 4000
SELECT *
FROM tb_funcionario
WHERE vl_salario < 4000;

-- 04) Listar funcionários com salário entre 3000 e 5000
SELECT *
FROM tb_funcionario
WHERE vl_salario BETWEEN 3000 AND 5000;

-- 05) Listar funcionários cujo nome começa com "M"
SELECT *
FROM tb_funcionario
WHERE nm_funcionario LIKE 'M%';

-- 06) Aumentar todos os salários em 10%
UPDATE tb_funcionario
SET vl_salario = vl_salario * 1.10;

-- 07) Listar funcionários em ordem decrescente de salário
SELECT *
FROM tb_funcionario
ORDER BY vl_salario DESC;

-- 08) Mostrar o maior salário
SELECT MAX(vl_salario) AS maior_salario
FROM tb_funcionario;

-- 09) Mostrar o menor salário
SELECT MIN(vl_salario) AS menor_salario
FROM tb_funcionario;

-- 10) Mostrar a média salarial
SELECT AVG(vl_salario) AS media_salarial
FROM tb_funcionario;
