USE UFPE_VIRTUS;

/*
selecionar todos os dados de uma tabela 
\sigma(MEMBRO)
*/
SELECT * FROM MEMBRO;

/*
selecionar um subconjunto de atributos de uma tabela
selecionar dados de uma tabela mediante alguma condição
\sigma_{numero_de_partidas > 500}(\pi_{nick, rota\_principal})
 */

SELECT nick, rota_principal FROM JOGADOR WHERE numero_de_partidas > 500;


/* 
Realizar seleção de dados sem apresentar duplicadas
\pi_{curso}(MEMBRO)
*/

SELECT DISTINCT curso FROM MEMBRO;

/*
realizar consulta de seleção-projeção-junção
atribuir “apelidos”
JOGADORES\_CURSO $\leftarrow$ JOGADOR $\bowtie_{membro\_CPF = CPF}$ MEMBRO
RESULTADO $\leftarrow$ $\pi_{nick, curso}$(JOGADORES\_CURSO)
*/

SELECT A.nick, A.jogador_CPF, B.curso FROM JOGADOR AS A INNER JOIN MEMBRO AS B ON A.jogador_CPF = B.cpf;


/*
aplicar união
\sigma_{jogador\_membro\_cpf}(TITULAR) \bigcup \sigma_{jogador\_membro\_cpf}(RESERVA)
*/

SELECT jogador_titular_cpf FROM TITULAR UNION SELECT jogador_reserva_cpf FROM RESERVA;

/*
aplicar interseção
\sigma_{CPF}(MEMBRO) \bigcap \sigma_{memebro_CPF}(JOGADOR)
*/

SELECT CPF FROM MEMBRO INNER JOIN JOGADOR ON CPF = jogador_CPF;

/*
aplicar diferença
\sigma_{CPF}(MEMBRO) - \sigma_{membro_CPF}(JOGADOR)
*/

SELECT DISTINCT CPF FROM MEMBRO WHERE CPF NOT IN (SELECT jogador_CPF FROM JOGADOR);

/*
aplicar produto cartesiano
\sigma{*}(MEMBRO) X \sigma{*}(CAMPEAO_FAVORITO)
*/

SELECT * FROM MEMBRO CROSS JOIN CAMPEAO_FAVORITO;

/*
realizar seleção sob condição que envolva outra seleção
\sigma_{nome, CPF}(\sigma_{membro_CPF}(JOGADOR))
*/

SELECT nome, CPF FROM MEMBRO WHERE CPF IN (SELECT jogador_CPF FROM JOGADOR);

/*
consultar valores de atributos que iniciem por algum termo
*/

SELECT nome FROM MEMBRO WHERE nome LIKE 'J%';

/*
ordenar resultados de consultas de forma ascendente
*/

SELECT * FROM MEMBRO ORDER BY nome;

/*
utilizar função de agregação
*/

SELECT AVG(numero_de_partidas) FROM JOGADOR;

/*
realizar agrupamento de resultado de consulta
*/

SELECT * FROM MEMBRO GROUP BY curso;

/*
criar regra apenas para consultas do banco criado
*/

CREATE ROLE CONSULTA;
GRANT SELECT ON UFPE_VIRTUS.* TO CONSULTA;

/*
criar regra para execução de comandos DML(insert update delete) e DQL(select)
*/

CREATE ROLE DML_DQL;
GRANT INSERT, UPDATE, DELETE, SELECT ON UFPE_VIRTUS.* TO DML_DQL;

/*
criar regra para execução de comandos DDL
*/

CREATE ROLE DDL;
GRANT CREATE, ALTER, DROP ON UFPE_VIRTUS.* TO DDL;


/*
criar usuário que possua a regra padrão para consulta (criada anteriormente)
criar usuário que possua a regra padrão para comandos DML e DQL (criada anteriormente)
criar usuário que possua a regra padrão para comandos DDL (criada anteriormente)
*/

CREATE USER 'bolinha'@'localhost' IDENTIFIED BY 'paraiba';
GRANT CONSULTA, DML_DQL, DDL TO 'bolinha'@'localhost';
SET DEFAULT ROLE CONSULTA, DML_DQL, DDL TO 'bolinha'@'localhost';

/*
criar uma view a partir de mais de uma tabela
*/

CREATE VIEW nomeTitular AS SELECT nome FROM MEMBRO WHERE CPF IN (SELECT jogador_titular_cpf FROM TITULAR);

/*
criar uma regra para consulta apenas na visualização criada
*/

CREATE ROLE select_view;
GRANT SELECT ON UFPE_VIRTUS.* TO select_view;

/*
criar usuário que possua a regra padrão para consulta da view (criadas anteriormente)
*/

CREATE USER 'tierry'@'localhost' IDENTIFIED BY 'rita';
GRANT select_view TO 'tierry'@'localhost';
SET DEFAULT ROLE select_view TO 'tierry'@'localhost';