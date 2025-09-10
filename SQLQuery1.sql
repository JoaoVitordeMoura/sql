INSERT INTO uf VALUES('SP', 'São Paulo')
INSERT INTO cidade VALUES('São José do Rio Preto', 'SP')
INSERT INTO cep VALUES('15047173', 3)
INSERT INTO pessoa VALUES('Zezin', 'Rua das Andorinhas, Jardim América', 'zezin@gmail.com', '51981666867', '15047173')
INSERT INTO pessoa VALUES('Zezao', 'Rua da Andorinha, Jardim Américano', 'zezao@gmail.com', '51981666869', '15047173')
INSERT INTO telefone VALUES('17381824835', 7)
INSERT INTO cliente VALUES(4, 7)
INSERT INTO funcionario VALUES(2002.03, 7)
INSERT INTO entregador VALUES(50.60, 9)
INSERT INTO entrega VALUES('a caminho', '2001-09-11', '00:00:00', 16)
INSERT INTO fabricante VALUES('cocacola')
INSERT INTO bebidas VALUES('coca cola', 600, 04.50, 1)
INSERT INTO categoria VALUES('hamburguer')
INSERT INTO lanches VALUES(5000, 'bigmac', 50.00, 1)
INSERT INTO pedido VALUES('2001-09-11', 'pronto', 54.50, 2, 3)
INSERT INTO lanche_pedido VALUES(1, 2, 1)
INSERT INTO bebida_pedido VALUES(2, 2, 1)

ALTER TABLE bebidas ALTER COLUMN preco numeric(4,2)
ALTER TABLE lanches ALTER COLUMN preco numeric(4,2)
ALTER TABLE pedido ALTER COLUMN total numeric(4,2)

SELECT * FROM uf
SELECT * FROM cidade
SELECT * FROM cep
SELECT * FROM pessoa
SELECT * FROM telefone
SELECT * FROM cliente
SELECT * FROM funcionario
SELECT * FROM entregador
SELECT * FROM entrega
SELECT * FROM fabricante
SELECT * FROM bebidas
SELECT * FROM categoria
SELECT * FROM lanches
SELECT * FROM pedido
SELECT * FROM bebida_pedido
SELECT * FROM lanche_pedido





