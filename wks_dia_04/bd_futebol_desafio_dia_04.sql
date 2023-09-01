/* CRIANDO O DATABASE */

CREATE DATABASE  futebol;
USE futebol;

/* CRIANDO TABELAS */

/*TABELA COM DADOS DO JOGADOR*/
CREATE TABLE jogador
		(
            id_jogador INT,
            nome_jogador VARCHAR(100) NOT NULL,
            nome_social_jogador VARCHAR(40) NOT NULL,
            data_nasc_jogador DATE NOT NULL,
            id_clube VARCHAR(6) NOT NULL,
            
            PRIMARY KEY (id_jogador)
		);

/*TABELA COM DADOS DO CLUBE*/
CREATE TABLE clube
		(
            id_clube VARCHAR(6),
            nome_clube VARCHAR(100) NOT NULL,
            cep VARCHAR(9) NOT NULL,
            estadio VARCHAR(40) NOT NULL,
			
            PRIMARY KEY (id_clube)
		);
/*TABELA COM DADOS DO ENDEREÇO*/
CREATE TABLE endereco
	(
			cep VARCHAR(9),
            rua VARCHAR(100),			
			bairro VARCHAR(100),
			cidade VARCHAR(100),
            
            PRIMARY KEY(cep)
	);

/* ALTERANDO TABELAS */

/* Adicionando colunas */
ALTER TABLE jogador ADD COLUMN altura FLOAT;
ALTER TABLE clube ADD COLUMN ano_fundacao INT;
ALTER TABLE endereco ADD COLUMN estado_sigla VARCHAR(2);

/* Inserir Dados */

/* Inserindo dados dos jogadores */
INSERT INTO
	jogador(id_jogador, nome_jogador, nome_social_jogador, data_nasc_jogador, id_clube, altura)
    VALUES
    (1, 'Gabriel Barbosa','Gabigol','1996-8-30', 'FLA-RJ', 1.78),
    (2, 'Eduardo Pereira Rodrigues','Dudu','1992-1-07', 'PAL-SP', 1.66),
    (3, 'Givanildo Vieira de Sousa','Hulk','1986-7-25', 'ATL-MG', 1.8),
    (4, 'Pedro Guilherme Abreu dos Santos','Pedro','1997-6-20', 'FLA-RJ', 1.85),
    (5, 'Francisco das Chagas Soares dos Santos','Tiquinho','1991-1-17', 'BOT-RJ', 1.87)
    ;

/* Inserindo dados dos clubes */
INSERT INTO
	clube(id_clube, nome_clube, cep, estadio, ano_fundacao)
    VALUES
    ('FLA-RJ', 'Flamengo','22430-041','Maracana', 1895),
    ('PAL-SP', 'Palmeiras','05005-030','Allianz Parque', 1914),
    ('ATL-MG', 'Atletico Mineiro','30180-111','Mineirão', 1908),
    ('BOT-RJ', 'Botafogo','22290-140','Engenhão', 1908)
    ;
    
    /* Inserindo dados dos clubes */
INSERT INTO
	endereco(cep, rua, bairro, cidade, estado_sigla)
    VALUES
    ('22430-041','Av. Borges de Medeiros','Lagoa','Rio de Janeiro','RJ'),
    ('05005-030','Rua Palestra Italia','Perdizes ','São Paulo','SP'),
    ('30180-111','Av. Olegário Maciel','Lourdes','Belo Horizonte','MG'),
    ('22290-140','Av. Venceslau Brás','Botafogo','Rio de Janeiro','RJ')
    ;

/* REMOVENDO UMA COLUNA DE CADA TABELA */
ALTER TABLE jogador DROP COLUMN altura;
ALTER TABLE clube DROP COLUMN estadio;
ALTER TABLE endereco DROP COLUMN bairro;

/* APRESENTANDO O CONTEÚDO DAS TABELAS */
SELECT * FROM jogador;
SELECT * FROM clube;
SELECT * FROM endereco;

/* APRESENTANDO O CONTEÚDO DAS TABELAS COM CONDIÇÕES */

-- Apresentando nome dos jogadores do Flamengo
SELECT 
	nome_social_jogador, data_nasc_jogador
FROM 
	jogador
WHERE 
	id_clube='FLA-RJ';

-- Apresentando o nome do Clube cujo ano de fundação é maior que 1910
SELECT 
	nome_clube, ano_fundacao
FROM 
	clube
WHERE 
	ano_fundacao>1910;

-- Apresentando o Endereço das sedes dos clubes que ficam em Minas Gerais
SELECT 
	*
FROM 
	endereco
WHERE 
	estado_sigla='MG';

-- Apresentando os nome dos Jogadores e do Clube que 
SELECT 
	nome_social_jogador, nome_clube
FROM 
	jogador j, clube c, endereco e
WHERE 
	e.cidade = 'Rio de Janeiro'
    and j.id_clube = c.id_clube 
    and c.cep = e.cep;