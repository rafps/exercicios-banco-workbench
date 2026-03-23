create database db_agro;

use db_agro;


create table tb_cargo (
cd_cargo int primary key auto_increment,
cargo varchar(50)
);

create table tb_setor (
cd_setor int primary key auto_increment,
setor varchar(50)
);

create table tb_funcionario (
matricula int primary key auto_increment,
funcionario varchar(100),
dt_nascimento date,
cd_setor int,
cd_cargo int,
salario decimal (10,2),

foreign key (cd_setor) references tb_setor(cd_setor),
foreign key (cd_cargo) references tb_cargo(cd_cargo)
);


--Testando com dados
INSERT INTO tb_cargo (cargo) VALUES ('Analista'), ('Gerente');
INSERT INTO tb_setor (setor) VALUES ('RH'), ('TI');
INSERT INTO tb_funcionario (funcionario, dt_nascimento, cd_setor, cd_cargo, salario)
VALUES ('Maria', '1990-06-10', 1, 2, 5000.00);



-- 01)  Alterar na tabela tb_funcionario  matricula = 1  salario (6000) 
UPDATE tb_funcionario
SET salario = 6000
WHERE matricula = 1;

 -- 02)  Alterar – aumentar os salarios dos tb_funcionarios em 10%
UPDATE tb_funcionario
SET salario = salario * 1.10
WHERE matricula > 0;

 -- 03)  Listar a tabela (tb_funcionario)  salario > 5000
SELECT * FROM tb_funcionario
WHERE salario > 5000;

--    04) Lista os funcionários começa com a letra J
SELECT * FROM tb_funcionario
WHERE funcionario LIKE 'J%';

--    05) Lista os funcionários que termina com a letra a
SELECT * FROM tb_funcionario
WHERE funcionario LIKE '%a';

--    06) Lista os funcionários que tem salario entre 5000 e 10000
SELECT * FROM tb_funcionario
WHERE salario BETWEEN 5000 AND 10000;

--    07) Lista os funcionários do setor 1 e cargo 1
SELECT * FROM tb_funcionario
WHERE cd_setor = 1 AND cd_cargo = 1;

--    08) Lista os funcionários do setor 1 ou setor 2
SELECT * FROM tb_funcionario
WHERE cd_setor = 1 OR cd_setor = 2;
