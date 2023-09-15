create database loja_carros;

use loja_carros;

create table carros
(
id_carro integer primary key,
nome varchar (100), 
descricao varchar(300),
preco numeric,
categoria varchar(100),
quantidadeEstoque numeric
 );
 
 insert into carros (id_carro, nome, descricao, preco, categoria, quantidadeEstoque) values
 
 (1,"Honda CIVIC", "Carro Sedã, versão 2.0 16V FLEXONE LX 4P CVT", 109900 , "coupe", 10),
 (2, "AUDI A5","Audi RS 5 Sportback Competition Plus é a impressionante personificação do alto desempenho.,", 397990, "Esportivo", 6),
 (3, "Porsche 911 carrera S", "Carro Super Esportivo", 997345, "cabriolet", 4);
 
 create table clientes
 (
 id_cliente integer primary key,
nome varchar (100),
cpf double,
endereco varchar (100),
telefone double,
email varchar (100)
); 

insert into clientes (id_cliente, nome, cpf, endereco, telefone, email) values

(1, "Julia Marques", 50087667855, "Alphaville", 1198763547, 'jumarques@gmail.com'),
(2, "Bianca Soares", 34546769589, "Santana de Parnaiba", 1196537625, "soaresbi@gmail.com"),
(3, "Rafael Soares", 67297439878, "Barueri", 11987364736, "rafmelo@gmail.com");

create table compras
(
id_compras integer primary key,
id_cliente integer,
dataCompra varchar (10),
totalCompra double,

foreign key (id_cliente) references Clientes (id_cliente)
);

insert into compras (id_compras, id_cliente, dataCompra, totalCompra) values

(1, 1, "12/05/2023", 997.345),
(2, 2, "03/04/2023", 109.900),
(3, 3, "18/08/2023", 397.990);

create table carros_compra
(
id_carros_compra integer primary key,
id_compras integer,
id_carro integer,
quantidade double,
subtotal double,

foreign key (id_compras) references Compras (id_compras),
foreign key (id_carro) references Carros (id_carro)
);

insert into carros_compra (id_carros_compra, id_compras, id_carro, quantidade, subtotal) values

(1, 1, 3, 1, 997345),
(2, 2, 1, 1,109900),
(3,3, 2, 1, 397990);

create table estoque 
(
id_estoque integer primary key,
id_carro integer,
quantidadeEstoque numeric,

foreign key (id_carro) references Carros (id_carro)
);

insert into Estoque (id_estoque, id_carro, quantidadeEstoque) values

(1, 3, 4),
(2, 1, 10),
(3, 2, 6);



select nome from carros;

select nome, cpf, email from clientes;

select nome, quantidadeEstoque from carros;

select * from carros where id_carro =1;

select sum(quantidadeEstoque) as 
quantidadeEstoque
from estoque;

select p.nome, d.dataCompra, d.totalCompra from clientes as p inner join compras as d on 
d.id_cliente = p.id_cliente where p.id_cliente = 1;

SELECT * FROM Carros WHERE Categoria = 'Categoria' AND Preço < 400000;

