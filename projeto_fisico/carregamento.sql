USE UFPE_VIRTUS;

/*
criar uma transação única
*/

START TRANSACTION;
INSERT INTO MEMBRO
VALUES
('59094225026', 'João da Silva','1998/07/10', 'Farmácia'), 
('69336197452', 'Yuri Rosa Lins', '1994/11/06', 'Adminstração'),
('70163676062', 'Gabriela Lins Rosa', '2000/12/07', 'Educação Física'),
('24312322473', 'Maria Luíza Galindo', '1999/10/10', 'Publicidade e Propaganda'),
('17795859429', 'Carlos Junior Mozart', '2001/08/10', 'Geografia'),
('76995723007', 'Arthur Alves', '1998/10/10', 'Engenharia Civil'),
('27629856415', 'João Victor Afogados', '1998/09/15', 'Direito'),
('48417063480', 'João Sterben', '2000/08/10', 'Ciência da Computação'),
('42422304435', 'Marcos Assunção', '2001/10/01', 'Matemática'),
('35332675470', 'Gilberto Chaves', '1999/10/17', 'Fisioterapia'),
('41542138060', 'Raphael Shinzo Almeida', '1991/05/15', 'Psicologia'),
('28462405076', 'Rafael Garcia Melo', '1992/02/12', 'Psicologia'),
('22327102030', 'Walker Filho', '1993/03/14', 'Psicologia'),
('04346612440', 'Bruna Cervo', '1994/08/03', 'Psicologia'),
('77328907444', 'Marcelo Shiro', '1995/12/05', 'Psicologia'),
('26217158426', 'Djavan da Costa', '1993/04/15', 'Psicologia'),
('13918532453', 'Lucas Lima', '1992/05/12', 'Psicologia'),
('86679795460', 'Dorgival Dantas', '1995/06/10', 'Psicologia');

INSERT INTO JOGADOR
VALUES
('59094225026', 'Joni','MID', 'Platina', 2, 350, 0), 
('69336197452', 'Biscoito', 'ADC', 'Diamante', 1, 500,0),
('70163676062', 'DeusaDoUniverse', 'SUP', 'Diamante', 3, 420, 0),
('24312322473', 'Desiludida', 'MID', 'Platina', 1, 260, 0),
('17795859429', 'Beycar', 'TOP', 'Diamante', 4, 600, 1),
('76995723007', 'Dedicado', 'ADC', 'Diamante', 1, 500, 0),
('27629856415', 'Trepeça', 'JG', 'Diamante', 3, 310, 0),
('48417063480', 'Sterben', 'TOP', 'Diamante', 2, 520, 0);

INSERT INTO CAPITAO
VALUES
('24312322473'),
('48417063480'),
('59094225026');

INSERT INTO PSICOLOGO
VALUES
('28462405076', '59094225026'),
('41542138060', '69336197452'),
('22327102030', '70163676062'),
('04346612440', '24312322473'),
('77328907444', '17795859429'),
('26217158426', '76995723007'),
('86679795460', '27629856415'),
('13918532453', '48417063480');

INSERT INTO CAMPEAO_FAVORITO
VALUES
('59094225026', 'Talon'), 
('69336197452', 'Sion'),
('70163676062', 'Taric'),
('24312322473', 'Ahri'),
('17795859429', 'Graves'),
('76995723007', 'Janna'),
('27629856415', 'Lee Sin'),
('48417063480', 'Jayce');

INSERT INTO TITULAR
VALUES
('69336197452', '24312322473'),
('70163676062', '24312322473'),
('24312322473', '24312322473'),
('17795859429', '24312322473'),
('27629856415', '24312322473');

INSERT INTO RESERVA
VALUES
('59094225026'),
('48417063480'),
('76995723007');

INSERT INTO RANQUEADA
VALUES
('69336197452', '607050', 6.1, 'Taric', 1),
('70163676062', '890456', 7.2, 'Ahri', 1),
('17795859429', '876500', 8.6, 'Shen', 0),
('24312322473', '967580', 4.3, 'Corki', 0),
('27629856415', '567890', 8.0, 'Gragas', 1);

INSERT INTO CAMPEONATO
VALUES
('20121', '2020/02/10', 'Shen/Lee Sin/Zoe/Varus/Taric', 0, '17795859429', '27629856415', '24312322473', '69336197452', '70163676062'),
('20324', '2020/02/15', 'Sion/Rek Sai/Ahri/Corki/Sona', 1, '17795859429', '27629856415', '24312322473', '69336197452', '70163676062'),
('20839', '2020/03/15', 'Singed/Rengar/Talon/Ezreal/Taric', 1, '17795859429', '27629856415', '24312322473', '69336197452', '70163676062');

INSERT INTO JOGA
VALUES
('17795859429', '876500', '20121'),
('27629856415', '567890', '20839'),
('70163676062', '890456', '20121'),
('69336197452', '607050', '20839'),
('24312322473', '967580', '20839');
COMMIT;