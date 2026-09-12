CREATE DATABASE bd_academia;
USE bd_academia;

CREATE TABLE tb_aluno (
    cd_aluno INT PRIMARY KEY AUTO_INCREMENT,
    nm_aluno VARCHAR(100) NOT NULL,
    nr_idade INT NOT NULL,
    ds_plano VARCHAR(50) NOT NULL,
    vl_mensalidade DECIMAL(10,2) NOT NULL
);

INSERT INTO tb_aluno
(nm_aluno, nr_idade, ds_plano, vl_mensalidade)
VALUES
('Rafael', 20, 'Mensal', 120.00),
('Carlos', 25, 'Trimestral', 300.00),
('Maria', 22, 'Mensal', 120.00),
('Ana', 31, 'Anual', 1000.00),
('Pedro', 18, 'Mensal', 120.00),
('Juliana', 27, 'Anual', 1000.00);

-- 01) Listar todos os alunos
SELECT *
FROM tb_aluno;

-- 02) Listar alunos maiores de 25 anos
SELECT *
FROM tb_aluno
WHERE nr_idade > 25;

-- 03) Listar alunos com plano mensal
SELECT *
FROM tb_aluno
WHERE ds_plano = 'Mensal';

-- 04) Listar alunos com mensalidade maior que 500
SELECT *
FROM tb_aluno
WHERE vl_mensalidade > 500;

-- 05) Listar alunos cujo nome começa com "A"
SELECT *
FROM tb_aluno
WHERE nm_aluno LIKE 'A%';

-- 06) Mostrar a média das mensalidades
SELECT AVG(vl_mensalidade) AS media_mensalidade
FROM tb_aluno;

-- 07) Mostrar a maior mensalidade
SELECT MAX(vl_mensalidade) AS maior_mensalidade
FROM tb_aluno;

-- 08) Contar quantos alunos existem
SELECT COUNT(*) AS quantidade_alunos
FROM tb_aluno;

-- 09) Contar quantos alunos existem em cada plano
SELECT
    ds_plano,
    COUNT(*) AS quantidade
FROM tb_aluno
GROUP BY ds_plano;

-- 10) Listar os alunos da maior para a menor mensalidade
SELECT *
FROM tb_aluno
ORDER BY vl_mensalidade DESC;
