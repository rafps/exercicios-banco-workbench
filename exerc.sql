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

INSERT INTO tb_cargo (cargo) VALUES ('Analista'), ('Gerente');

INSERT INTO tb_setor (setor) VALUES ('RH'), ('TI');

INSERT INTO tb_funcionario (funcionario, dt_nascimento, cd_setor, cd_cargo, salario)
VALUES ('Maria', '1990-06-10', 1, 2, 5000.00);