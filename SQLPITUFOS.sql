create database jvl_trunks

use jvl_trunks

create table pessoas
(
	codigo int not null identity,
	nome varchar(50) not null,
	cpf varchar(12) not null unique,
	logradouro varchar(100) not null,
	constraint pk_pessoa primary key(codigo)
)

insert into pessoas values('Asgore', 'euvoudirigir', 'palacio subterraneo')
insert into pessoas values('Sans', 'eipivete', 'AAAHHHRRRRRRR')
insert into pessoas values('Asriel', 'DPSDEMORRER', 'palacio subterraneo subsolo')
insert into pessoas values('Togore', 'O_O', 'observando')
insert into pessoas values('Deletoing', 'oingoing', 'oingoingoingon') --foi deletado
insert into pessoas values('rataoing', 'oingoing', 'oingoingoingon')
insert into pessoas values('bataoing', 'bataoi', 'bataoingoingoingon')
insert into pessoas values('megacavaleiro', '27478823472', 'hhhhmmmmmmmmmrrrrrr', 'ex construtor do CoC agora fdp')
select * from pessoas

delete from pessoas where nome = 'Deletoing'



--"RESET DO IDENTITY (USAR COM RESALVAS)
DBCC CHECKIDENT ('pessoas', RESEED, 4)
--VOLTANDO O IDENTITY PARA A POSIÇÃO ORIGINAL
DBCC CHECKIDENT ('pessoas', RESEED, 6)

--ALTERANDO A TABELA E DEIXANDO UM VALOR DEFAULT PARA OS ELEMENTOS QUE JA FORAM CRIADOS
ALTER TABLE pessoas ADD profissao varchar(15) not null DEFAULT 'NOOB'

--ESSE JEITO DE DAR DROP DARA ERRO DEVIDO A CONSTRAINT
ALTER TABLE pessoas DROP COLUMN profissao

--PARA DROPAR UMA COLUNA QUE POSSUI UMA CONSTRAINT(restrição como default, pk, etc) É NECESSARIO
--DROPAR PRIMEIRO ESSA CONDIÇÃO
--O OBJETO TEM UM NOME "ESTRANHO" DEVIDO A NÃO TER RENOMEADO ELE
ALTER TABLE pessoas DROP CONSTRAINT DF__pessoas__profiss__117F9D94
ALTER TABLE pessoas DROP COLUMN profissao


--IMPORT JAVAX.SWING.* == SELECT * FROM "

--DETALHAMENTO DA TABELA
EXEC sp_help 'pessoas'

ALTER TABLE pessoas ADD profissao varchar(15) not null DEFAULT 'NOOB'

--ALTERAR O TIPO DE DADO DE UM ELEMENTO DA TABELA, NO CASO O TAMANHO DO VARCHAR

ALTER TABLE pessoas ALTER COLUMN profissao varchar(30)

SELECT nome, profissao FROM pessoas

--ALTERA UM VALOR DE UMA COLUNA
UPDATE pessoas set profissao = 'tecnico' WHERE nome = 'bataoing'

--CRIA UMA COLUNA BACKUP PARA PASSAR OS DADOS DA COLUNA ORIGINAL

ALTER TABLE pessoas ADD profissaoBkcp varchar(100)
UPDATE pessoas SET profissaoBkcp = profissao
SELECT nome, profissao, profissaoBkcp FROM pessoas

--TRUNKAMENTO(consiste nesse caso em atualizar os dados da coluna para os 3 primeiros caracteres)
UPDATE pessoas set profissao = LEFT (profissao, 3)

--TRUNCATE TABLE: Faz a limpeza mais rapida, reseta o identity, remove tudo sem o where
--DROP TABLE: Remove tudo mas de forma menos rapida
--DELETE FROM: Remove todas as linhas expecificas com o WHERE, REMOVE TUDO SEM O WHERE




