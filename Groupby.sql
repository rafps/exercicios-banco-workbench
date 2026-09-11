CREATE DATABASE bd_funcionarios;
USE bd_funcionarios;

CREATE TABLE tb_funcionario (
    cd_funcionario INT PRIMARY KEY AUTO_INCREMENT,
    nm_funcionario VARCHAR(100) NOT NULL,
    nm_departamento VARCHAR(50) NOT NULL,
    vl_salario DECIMAL(10,2) NOT NULL
);

INSERT INTO tb_funcionario
(nm_funcionario, nm_departamento, vl_salario)
VALUES
('Rafael', 'TI', 5000.00),
('Carlos', 'TI', 6000.00),
('Maria', 'RH', 4000.00),
('Ana', 'RH', 4500.00),
('Pedro', 'Financeiro', 5500.00),
('Joao', 'Financeiro', 6500.00),
('Juliana', 'TI', 7000.00);

-- 01) Listar todos os funcionários
SELECT *
FROM tb_funcionario;

-- 02) Contar quantos funcionários existem
SELECT COUNT(*) AS quantidade_funcionarios
FROM tb_funcionario;

-- 03) Contar funcionários por departamento
SELECT
    nm_departamento,
    COUNT(*) AS quantidade
FROM tb_funcionario
GROUP BY nm_departamento;

-- 04) Calcular a média salarial geral
SELECT AVG(vl_salario) AS media_salarial
FROM tb_funcionario;

-- 05) Calcular a média salarial por departamento
SELECT
    nm_departamento,
    AVG(vl_salario) AS media_salarial
FROM tb_funcionario
GROUP BY nm_departamento;

-- 06) Mostrar o maior salário de cada departamento
SELECT
    nm_departamento,
    MAX(vl_salario) AS maior_salario
FROM tb_funcionario
GROUP BY nm_departamento;

-- 07) Mostrar o menor salário de cada departamento
SELECT
    nm_departamento,
    MIN(vl_salario) AS menor_salario
FROM tb_funcionario
GROUP BY nm_departamento;

-- 08) Calcular a soma dos salários por departamento
SELECT
    nm_departamento,
    SUM(vl_salario) AS folha_salarial
FROM tb_funcionario
GROUP BY nm_departamento;

-- 09) Mostrar departamentos com média salarial maior que 5000
SELECT
    nm_departamento,
    AVG(vl_salario) AS media_salarial
FROM tb_funcionario
GROUP BY nm_departamento
HAVING AVG(vl_salario) > 5000;

-- 10) Mostrar departamentos com mais de 2 funcionários
SELECT
    nm_departamento,
    COUNT(*) AS quantidade_funcionarios
FROM tb_funcionario
GROUP BY nm_departamento
HAVING COUNT(*) > 2;
