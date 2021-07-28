CREATE DATABASE UFPE_VIRTUS;

USE UFPE_VIRTUS;

CREATE TABLE MEMBRO(CPF VARCHAR(11) DEFAULT '-' NOT NULL,		  /* atributo com valor padrão */
					nome VARCHAR(100) DEFAULT '-' NOT NULL,		  /* atributo com valor padrão */
					data_de_nascimento DATE DEFAULT '0000/00/00', /* atributo com valor padrão */
					curso VARCHAR(50) DEFAULT '-' NOT NULL,		  /* atributo com valor padrão */
					PRIMARY KEY(CPF));

CREATE TABLE CAPITAO(capitao_CPF VARCHAR(11) NOT NULL,
					 PRIMARY KEY(capitao_CPF),
					 FOREIGN KEY(capitao_CPF) REFERENCES MEMBRO(CPF) ON DELETE SET DEFAULT ON UPDATE CASCADE); /* ação de disparo referencial */

CREATE TABLE PSICOLOGO(psicologo_CPF VARCHAR(11) NOT NULL,
					   jogador_atendido_CPF VARCHAR(11) NOT NULL,
					   PRIMARY KEY (psicologo_cpf),
					   FOREIGN KEY(psicologo_CPF) REFERENCES MEMBRO(CPF) ON DELETE SET DEFAULT ON UPDATE CASCADE, /* ação de disparo referencial */
					   FOREIGN KEY(jogador_atendido_CPF) REFERENCES MEMBRO(CPF) ON DELETE SET DEFAULT ON UPDATE CASCADE); /* ação de disparo referencial */

CREATE TABLE JOGADOR(jogador_CPF VARCHAR(11) NOT NULL,
					 nick VARCHAR(16) DEFAULT '-' NOT NULL,				/* atributo com valor padrão */
					 rota_principal VARCHAR(3) DEFAULT '-' NOT NULL,	/* atributo com valor padrão */
					 elo VARCHAR(11) DEFAULT '-',						/* atributo com valor padrão */
					 divisao TINYINT DEFAULT NULL,						/* atributo com valor padrão */
					 numero_de_partidas SMALLINT DEFAULT NULL,			/* atributo com valor padrão */
					 treinador TINYINT(1) DEFAULT NULL, 				/* atributo com valor padrão */
					 PRIMARY KEY(jogador_CPF),
					 FOREIGN KEY(jogador_CPF) REFERENCES MEMBRO(CPF) ON DELETE SET DEFAULT ON UPDATE CASCADE); /* ação de disparo referencial */

CREATE TABLE CAMPEAO_FAVORITO(jogador_CPF VARCHAR(11) NOT NULL,
							  campeao VARCHAR(20) DEFAULT '-' NOT NULL,		/* atributo com valor padrão */
							  PRIMARY KEY(jogador_CPF),
							  FOREIGN KEY(jogador_CPF) REFERENCES MEMBRO(CPF) ON DELETE SET DEFAULT ON UPDATE CASCADE); /* ação de disparo referencial */

CREATE TABLE RANQUEADA(jogador_CPF VARCHAR(11) NOT NULL,
					   game_id VARCHAR(100) DEFAULT '-' NOT NULL,		/* atributo com valor padrão */
					   AMA FLOAT DEFAULT 0,								/* atributo com valor padrão */
					   campeao VARCHAR(20) DEFAULT '-' NOT NULL, 		/* atributo com valor padrão */
					   resultado TINYINT(1) DEFAULT NULL,				/* atributo com valor padrão */
					   PRIMARY KEY(game_id),
					   FOREIGN KEY(jogador_CPF) REFERENCES MEMBRO(CPF) ON DELETE SET DEFAULT ON UPDATE CASCADE); /* ação de disparo referencial */

CREATE TABLE CAMPEONATO(camp_id VARCHAR(100) DEFAULT '-' NOT NULL,
						data_do_camp DATE DEFAULT '2020/01/04',			/* atributo com valor padrão */
						composição VARCHAR(100) DEFAULT '-' NOT NULL,	/* atributo com valor padrão */
						resultado TINYINT(1) DEFAULT NULL,				/* atributo com valor padrão */
						jogador1_cpf VARCHAR(11) NOT NULL,
						jogador2_cpf VARCHAR(11) NOT NULL,
						jogador3_cpf VARCHAR(11) NOT NULL, 
						jogador4_cpf VARCHAR(11) NOT NULL,
						jogador5_cpf VARCHAR(11) NOT NULL, 
						PRIMARY KEY(camp_id),
						FOREIGN KEY(jogador1_cpf) REFERENCES MEMBRO(CPF) ON DELETE SET DEFAULT ON UPDATE CASCADE, /* ação de disparo referencial */
						FOREIGN KEY(jogador2_cpf) REFERENCES MEMBRO(CPF) ON DELETE SET DEFAULT ON UPDATE CASCADE, /* ação de disparo referencial */
						FOREIGN KEY(jogador3_cpf) REFERENCES MEMBRO(CPF) ON DELETE SET DEFAULT ON UPDATE CASCADE, /* ação de disparo referencial */
						FOREIGN KEY(jogador4_cpf) REFERENCES MEMBRO(CPF) ON DELETE SET DEFAULT ON UPDATE CASCADE, /* ação de disparo referencial */
						FOREIGN KEY(jogador5_cpf) REFERENCES MEMBRO(CPF) ON DELETE SET DEFAULT ON UPDATE CASCADE, /* ação de disparo referencial */
						CHECK(data_do_camp >= '2020/01/04'));  /* validação de dados a serem inseridos */

CREATE TABLE JOGA(jogador_CPF VARCHAR(11) NOT NULL,
				  ranqueada_gameid VARCHAR(100) NOT NULL,
				  campeonato_gameid VARCHAR(100) NOT NULL,
				  PRIMARY KEY(jogador_cpf, ranqueada_gameid, campeonato_gameid),
				  FOREIGN KEY(jogador_CPF) REFERENCES MEMBRO(CPF) ON DELETE SET DEFAULT ON UPDATE CASCADE, 					/* ação de disparo referencial */
				  FOREIGN KEY(ranqueada_gameid) REFERENCES RANQUEADA(game_id) ON DELETE SET DEFAULT ON UPDATE CASCADE, 		/* ação de disparo referencial */
				  FOREIGN KEY(campeonato_gameid) REFERENCES CAMPEONATO(camp_id) ON DELETE SET DEFAULT ON UPDATE CASCADE);   /* ação de disparo referencial */

CREATE TABLE TITULAR(jogador_titular_CPF VARCHAR(11) NOT NULL,
					 capitao_CPF VARCHAR(11) NOT NULL,
					 PRIMARY KEY(jogador_titular_CPF),
					 FOREIGN KEY(jogador_titular_CPF) REFERENCES MEMBRO(CPF) ON DELETE SET DEFAULT ON UPDATE CASCADE, /* ação de disparo referencial */
					 FOREIGN KEY(capitao_cpf) REFERENCES MEMBRO(CPF) ON DELETE SET DEFAULT ON UPDATE CASCADE); 		  /* ação de disparo referencial */

CREATE TABLE RESERVA(jogador_reserva_CPF VARCHAR(11) NOT NULL,
					 PRIMARY KEY(jogador_reserva_CPF),
					 FOREIGN KEY(jogador_reserva_CPF) REFERENCES MEMBRO(CPF) ON DELETE SET DEFAULT ON UPDATE CASCADE); /* ação de disparo referencial */