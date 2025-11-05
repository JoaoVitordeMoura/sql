CREATE DATABASE db_jaoM_lucasD

USE db_jaoM_lucasD

CREATE TABLE Clientes (
    ID_Cliente INT NOT NULL IDENTITY,
    Nome_Cliente VARCHAR(100),
    Email VARCHAR(100),
    CONSTRAINT pk_clientes PRIMARY KEY (ID_Cliente)
);
CREATE TABLE Produtos (
    ID_Produto INT NOT NULL,
    Nome_Produto VARCHAR(100),
    Preco DECIMAL(10, 2)
    CONSTRAINT pk_Produtos PRIMARY KEY (ID_Produto)
);
CREATE TABLE Vendas (
    ID_Venda INT NOT NULL IDENTITY,
    ID_Cliente_FK INT,  
    ID_Produto_FK INT,  
    Quantidade INT,
    CONSTRAINT pk_vendas PRIMARY KEY (ID_Venda),
    CONSTRAINT fk_id_cliente FOREIGN KEY (ID_Cliente_FK) REFERENCES Clientes(ID_Cliente),
    CONSTRAINT fk_id_produto FOREIGN KEY (ID_Produto_FK) REFERENCES Produtos(ID_Produto)
);
INSERT INTO Clientes VALUES ('Ana Beatriz', 'ana@email.com'),('Bruno Dias', 'bruno@email.com'), 
('Marcos Lima', 'marcos@email.com'),('Julia Mendes', 'julia@email.com'),('Sofia Reis', 'sofia@email.com');
INSERT INTO Produtos VALUES(101, 'Teclado Mecânico', 350.00), (102, 'Mouse Óptico', 120.50),
(103, 'Headset Gamer', 499.90),(104, 'Webcam HD', 210.00), (105, 'Monitor 4K', 1800.00);
INSERT INTO Vendas (ID_Cliente_FK, ID_Produto_FK, Quantidade)
VALUES (1, 101, 1),
(2, 102, 2), 
(1, 103, 1), 
(3, 101, 1), 
(3, 104, 1); 

--verificando inserts
SELECT * FROM Clientes;
SELECT * FROM Produtos;
SELECT * FROM Vendas;

--INNER JOIN (ta dentro)
--LEFT JOIN (primeiro a ser chamado)
--RIGHT JOIN (segundo a ser chamado) 
--OUTTER JOIN (ta fora)
--FULL JOIN (traz TUDO)

SELECT clientes.Nome_Cliente, produtos.Nome_Produto, vendas.Quantidade
FROM vendas

JOIN clientes ON vendas.ID_Cliente_FK = clientes.ID_Cliente
JOIN produtos ON vendas.ID_Produto_FK = produtos.ID_Produto

/*PTBR
SELECIONE tabelaCliente.nomeCliente, tabelaProduto.nomeProduto, tabelaVendas.Quantidade
DE tabelaVendas

JUNTO COM tabelaCliente LIGADAS PELO id_cliente EM AMBAS AS TABELAS
JUNTO COM tabelaProduto LIGADAS PELO id_produto EM AMBAS AS TABELAS

*/


--USANDO O ALIASING(TRAZER NOME PRODUTO E QUANTIDADE DE VENDA)
SELECT p.Nome_Produto, v.Quantidade
FROM Produtos AS p
JOIN Vendas AS v 
ON p.ID_Produto = v.ID_Produto_FK

--clientes que fizeram uma compra

SELECT Nome_Cliente FROM Clientes 
JOIN Vendas ON Clientes.ID_Cliente = Vendas.ID_Cliente_FK

--usando o distinct(tirar duplicados)

SELECT DISTINCT c.Nome_Cliente FROM Clientes AS c
JOIN Vendas AS v ON c.ID_Cliente = v.ID_Cliente_FK

--usando LEFT JOIN (traz TUDO da tabela da esquerda)

SELECT c.Nome_Cliente, v.ID_Venda
FROM Clientes AS c
LEFT JOIN Vendas AS v
ON c.ID_Cliente = v.ID_Cliente_FK

--usando RIGHT JOIN (traz TUDO da tabela da direita)

SELECT c.Nome_Cliente, v.ID_Venda
FROM Produtos AS c
RIGHT JOIN Produtos AS p
ON v.ID_Produto_FK = v.ID_Cliente_FK

--USANDO FULL JOIN(traz TUDO de todas as tabelas com nulos)

SELECT c.Nome_Cliente, p.Nome_Produto
FROM Clientes AS c
FULL JOIN Vendas AS v ON c.ID_Cliente = v.ID_Cliente_FK
FULL JOIN Produtos AS p ON v.ID_Produto_FK = p.ID_Produto

/*ESCREVENDO A PORRA TODA

LEFT JOIN - traz a intersecção entre as tabelas + todos os registros da tabela da esquerda 
(tabela que foi chamada primeiro) + nulos

RIGHT JOIN - traz a intersecção entre as tabelas + todos os registros da tabela da direita
(tabela que foi chamada depois) + nulos

FULL JOIN - traz intersecção entre as tabelas + TODOS OS REGISTROS DA TABELA + nulos
*/

--USANDO CROSS JOIN (junta tabela A + tabela B, sem critério) (BIZARRO)(NÃO TEM ON))
SELECT c.Nome_Cliente, p.Nome_Produto
FROM Clientes AS c
CROSS JOIN Produtos AS p

--DESAFIO - LISTAR QUEM NUNCA FEZ COMPRA

SELECT c.Nome_Cliente
FROM Clientes AS c
LEFT JOIN Vendas AS v 
ON c.ID_Cliente = v.ID_Cliente_FK
WHERE v.ID_Venda IS NULL

/*
	DESAFIO - MOSTRA NOME DOS CLIENTES QUE COMPRARAM UM TECLADO MECANICO
	DESAFIO - CALCULE FATURAMENTO TOTAL (PRECO*QUANTIDADE) DE CADA CLIENTE
	DESAFIO - LISTE TODOS CLIENTES QUE COMPRARAM MAIS QUE UM PRODUTO
	ENTREGAR UM UNICO SCRIPT DOS DESAFIOS DA AULA PASSADA + DESSA AULA
	Nome_Sobrenome_TRAB_NP2.SQL
	encurtador.com.br/VNcA
*/


--DESAFIO - MOSTRA NOME DOS CLIENTES QUE COMPRARAM UM TECLADO MECANICO

SELECT c.Nome_Cliente, p.Nome_Produto, v.Quantidade
FROM vendas AS v

JOIN clientes as c ON v.ID_Cliente_FK = c.ID_Cliente
JOIN produtos as p ON v.ID_Produto_FK = p.ID_Produto
WHERE p.Nome_Produto = 'Teclado Mecânico'

--DESAFIO - CALCULE FATURAMENTO TOTAL (PRECO*QUANTIDADE) DE CADA CLIENTE

SELECT c.Nome_Cliente, p.Nome_Produto, SUM(v.Quantidade * p.Preco) AS Total_Vendido
FROM vendas AS v
JOIN clientes AS c ON v.ID_Cliente_FK = c.ID_Cliente
JOIN produtos AS p ON v.ID_Produto_FK = p.ID_Produto
GROUP BY c.Nome_Cliente, p.Nome_Produto;


SELECT c.Nome_Cliente, COUNT(DISTINCT v.ID_Produto_FK) AS Total_Produtos_Distintos
FROM vendas AS v
JOIN clientes AS c ON v.ID_Cliente_FK = c.ID_Cliente
GROUP BY c.Nome_Cliente
HAVING COUNT(DISTINCT v.ID_Produto_FK) > 1;

--View Passada

create view analise_mercado_vendedores as
select
	EstadoVendedor as Estado,
	NomeVendedor as nome_vendedor,
	ProdutoId as Id,
	DescricaoProduto as Produto,
	PrecoProduto as Preco,
	case
		when RendaMensalVendedor >= 8001 then 'Alto'
		when RendaMensalVendedor between 5001 and 8000 then 'Médio'
		else 'Baixo'
	end as NivelRenda
from Vendas08OUT

select * from analise_mercado_vendedores
 




