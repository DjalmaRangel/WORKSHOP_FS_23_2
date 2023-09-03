/* DJALMA ARAUJO RANGEL */
/* CRIANDO O DATABASE */
CREATE DATABASE  filmes;
USE filmes;

/* CRIANDO TABELAS */

/*TABELA COM DADOS DO FILME*/
CREATE TABLE filmes
		(
            id_filme INT,
            filme_titulo VARCHAR(100) NOT NULL,
            data_cinema DATE NOT NULL,
            
            PRIMARY KEY (id_filme)
		);

/*TABELA COM DADOS DO ELENCO PRINCIPAL*/
CREATE TABLE elenco
		(
            id_filme INT,
            id_ator INT
		);
        
CREATE TABLE atores
		(
            id_ator INT,
            nome_ator VARCHAR(100) NOT NULL,
            genero_ator VARCHAR(1) NOT NULL,
			data_nascimento DATE NOT NULL,
            nacionalidade_ator VARCHAR(30),
			
            PRIMARY KEY (id_ator)
		);
        
        /*TABELA COM DADOS DOS DIRETORES DO FILME*/
CREATE TABLE diretores_filme
		(
			id_filme INT NOT NULL,
            id_diretor INT NOT NULL
		);
        
/*TABELA COM DADOS DOS DIRETORES*/
CREATE TABLE diretores
		(
            id_diretor INT NOT NULL,
            nome_diretor VARCHAR(100) NOT NULL,
            genero_diretor VARCHAR(1) NOT NULL,
			
            PRIMARY KEY (nome_diretor)
		);

/* ADICIONANDO COLUNA NA TABELA DIRETORES e FILMES */
ALTER TABLE diretores ADD COLUMN nacionalidade_diretor VARCHAR(20);
ALTER TABLE filmes ADD COLUMN filme_titulo_original VARCHAR(100) NOT NULL;

/* INSERINDO DADOS*/

/* Inserindo dados dos filmes */
INSERT INTO
	filmes(id_filme, filme_titulo, data_cinema, filme_titulo_original)
    VALUES
    (1, 'A procura da felicidade','2007-2-02','The pursuit of hapyness'),
    (2, 'Homens de Preto 3','2012-5-25','Men in black III'),
	(3, 'Homens de Preto 2','2002-7-12','Men in black II'),
    (4, 'O homem que mudou o jogo','2002-2-17','Moneyball');
    
    /* Inserindo dados dos elencos */

INSERT INTO
	atores(id_ator, nome_ator, genero_ator, data_nascimento, nacionalidade_ator)
    VALUES
    (1,'WILL SMITH','M','1968-9-25','EUA'),
    (2,'THANDIWE NEWTON','F','1972-11-06','Zambia'),
    (3,'JADEN SMITH','M','1998-7-08','EUA'),
    (4,'TOMMY LEE JONES','M','1946-9-15','EUA'),
    (5,'JOSH BROLIN','M','1968-2-12','EUA'),
	(6,'RIP TORN','M','1931-2-06','EUA'),
    (7,'BRAD PITT','M','1963-12-18','EUA'),
    (8,'JONAH HILL','M','1983-12-20','EUA'),
    (9,'PHILIP SEYMOUR HOFFMAN','M','1967-7-23','EUA');
    
INSERT INTO
	elenco(id_filme, id_ator)
    VALUES
    (1,1),
    (1,2),
    (1,3),
    (2,1),
    (2,4),
    (2,5),
    (3,1),
    (3,4),
    (3,6),
    (4,7),
    (4,8),
    (4,9);
    
    INSERT INTO
	diretores_filme(id_filme, id_diretor)
    VALUES
    ('1','1'),
    ('2','2'),
    ('3','2'),
    ('4','3');
    
    INSERT INTO
	diretores(id_diretor, nome_diretor, genero_diretor, nacionalidade_diretor)
    VALUES
    ('1','GABRIELE MUCCINO','M','Italia'),
    ('2','BARRY SONNENFELD','M','EUA'),
	('3','BENNETT MILLER','M','EUA');

/* APRESENTANDO O CONTEÚDO DAS TABELAS */
SELECT * FROM filmes;
SELECT * FROM elenco;
SELECT * FROM atores;
SELECT * FROM diretores;
SELECT * FROM diretores_filme;

/* APRESENTANDO O CONTEÚDO DAS TABELAS COM CONDIÇÕES */
-- Apresentando titulo e data de lancamento no cinema dos filmes que tiveram participacao do ator Will Smith
SELECT 
	filme_titulo, data_cinema
FROM 
	filmes f, atores a, elenco e
WHERE 
	a.nome_ator='WILL SMITH' 
    and a.id_ator = e.id_ator 
    and e.id_filme = f.id_filme;

-- Apresentando o elenco do filme O homem que mudou o jogo
SELECT 
	nome_ator
FROM 
	filmes f, elenco e, atores a
WHERE 
	f.filme_titulo='O homem que mudou o jogo' 
    and f.id_filme = e.id_filme
    and e.id_ator = a.id_ator 