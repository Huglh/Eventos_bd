-- | Criar o modelo Físico: Criação do banco de dados segundo sintaxe do MySQL. | --
CREATE database ProvaTrimestral3BD;
use ProvaTrimestral3BD;

create table Eventos
(
codigo int unsigned auto_increment primary key  not null,
Nome varchar(80) not null,
Rua varchar(45) not null,
Numero int unsigned not null,
Cidade varchar(45) not null,
Bairro varchar(45) not null,
Cep  char(9) not null,
UF  char(2) not null,
Telefone char(15) not null,
site varchar(150) not null,
email varchar(150) not null
)engine=InnoDB;

create table Inscritos(
cpf char(14) not null primary key,
Nome varchar(80) not null,
Rua varchar(45) not null,
Numero int unsigned not null,
Cidade varchar(45) not null,
Bairro varchar(45) not null,
Cep  char(9) not null,
UF  char(2) not null,
Telefone char(15) not null,
Evento_Codigo int unsigned  not null,
foreign key(Evento_Codigo) references Eventos(codigo)
)engine=InnoDB;

create table Cursos(
id int unsigned auto_increment not null primary key,
Nome varchar(70) not null,
data date not null,
horario time not null,
local varchar(45) not null,
preco double(9,2) not null,
duracao int not null,
Inscritos_lider char(14) not null,
Inscritos_Integrante char(14) not null,
foreign key(Inscritos_lider) references Inscritos(cpf),
foreign key(Inscritos_Integrante) references Inscritos(cpf)
)engine=InnoDB;

-- | Inserir 2 Eventos. | --
select * from eventos;
insert into  eventos (Nome, Rua, Numero, Cidade, Bairro,Cep, UF, Telefone, site, email) values ('Aulão ENEM', 'Rua Aripuanã', '43', 'Belo Horizonte', 'Buritis', '27580000', 'SC', '3132138666', 'https://www.cotemig.com.br/ensino/colegio-tecnico-em-informatica', 'cotemig@cottemig.com.br');
insert into eventos (Nome, Rua, Numero, Cidade, Bairro,Cep, UF, Telefone, site, email) values ('Aulão revisão Irajuba', 'Rua Aripuanã', '43', 'Belo Horizonte', 'Buritis', '27580000', 'SC', '3132138666', 'https://www.cotemig.com.br/ensino/colegio-tecnico-em-informatica', 'cotemig@cottemig.com.br');
select * from Inscritos;
insert into Inscritos (cpf, Nome, Rua,Numero, Cidade, Bairro, Cep, UF, Telefone,Evento_Codigo) values ('131.627.076-92', 'Hugo Thiago Lima Menezes', 'Rua Aripuanã', 'Belo Horizonte', '70', 'Buritis', ' 40028922', 'MG', '31973643098', '1');
insert into Inscritos (cpf, Nome, Rua,Numero, Cidade, Bairro, Cep, UF, Telefone,Evento_Codigo) values  ('131.627.076-91', 'Diogo Matheus Lima Menezes', 'Rua Aripuanã', '40', 'Belo Horizonte', 'Buritis', ' 40028922', 'MG', '31973643098', '2');
select * from cursos;
insert into cursos (Nome, data, horario, local, preco, duracao, Inscritos_lider, Inscritos_Integrante) values ('Desenvolvimento Web Mobile', '2021/06/18', '7:10', 'Colegio Cotemig', '1800', '365', '131.627.076-92', '131.627.076-91');
insert into cursos (Nome, data, horario, local, preco, duracao, Inscritos_lider, Inscritos_Integrante) values ('Redes', '2021/06/18', '7:10', 'Colegio Cotemig', '1200', '365', '131.627.076-91', '131.627.076-92');

-- | Selecionar o Evento que pertencem ao estado “SC” e com código menor que 50. | --

select * from eventos where codigo < 50 and UF = "SC";

-- | Selecionar nome do curso e cidade dos inscritos. | --

select cursos.nome, inscritos.cidade
from cursos join inscritos
on cursos.Inscritos_lider = inscritos.cpf;

-- | Selecionar a soma de preço dos Cursos com inscritos do bairro “Buritis”. | --
 select sum(cursos.preco)
 from cursos join inscritos
on cursos.Inscritos_lider = inscritos.cpf  where inscritos.bairro = "Buritis";