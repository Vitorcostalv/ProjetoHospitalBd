USE hospital;

/*******************************
* Preenchendo a tabela medicos 
*/
INSERT INTO medicos(id, nome, crm, cargo)
VALUES (DEFAULT, 'Julia Alves', 120935, 'especialista' ),
(DEFAULT, 'Alissom Sacreamento', 158918, 'generalista'),
(DEFAULT, 'Flávio Correa', 178105, 'especialista'),
(DEFAULT, 'Alberto Veríssimo', 109156, 'residente'),
(DEFAULT, 'Lívia Veloso', 178974,'especialista'),
(DEFAULT, 'Carlos Rabello', 218877, 'residente'),
(DEFAULT, 'Agelica Brasil', 171350, 'generalista'),
(DEFAULT, 'Eduardo Fernando', 225921, 'especialista'),
(DEFAULT, 'Lucas Aguiar', 256515, 'generalista'),
(DEFAULT, 'Ana Paula', 546698, 'generalista');

/*******************************
* Preenchendo a tabela especialidades
*/
INSERT INTO especialidades
values (DEFAULT, 'Pediatra'),
(DEFAULT, 'Clinico Geral'),
(DEFAULT, 'Dermatologista'),
(DEFAULT, 'Gastroenterologista'),
(DEFAULT, 'Ortopedista'),
(DEFAULT, 'Urologista'),
(DEFAULT, 'Oftalmologista');

/*******************************
* Preenchendo a tabela medicos especialidades
*/
INSERT INTO medicos_especialidades
VALUES(DEFAULT, 2, 1),
(DEFAULT, 7, 1),
(DEFAULT, 2, 2),
(DEFAULT, 6, 2),
(DEFAULT, 3, 3),
(DEFAULT, 7, 3),
(DEFAULT, 5, 4),
(DEFAULT, 1, 5),
(DEFAULT, 4, 5),
(DEFAULT, 7, 6),
(DEFAULT, 4, 7),
(DEFAULT, 3, 7),
(DEFAULT, 2, 8),
(DEFAULT, 7, 8),
(DEFAULT, 3, 9),
(DEFAULT, 4, 9),
(DEFAULT, 1, 10),
(DEFAULT, 6, 10);

/*******************************
* Preenchendo a tabela convenio
*/
INSERT INTO convenio
VALUES(DEFAULT, 'MedMais', '80140722000180', 'S'),
(DEFAULT, 'UniSaude', '71106036000100', 'S'),
(DEFAULT,'Pro Health', '29643769000100', 'N'),
(DEFAULT,'MedPRO', '06165643000171', 'N');

/*******************************
* Preenchendo a tabela pacientes
*/
INSERT INTO pacientes
VALUES(16,'Gustavo Enzo','2000-03-25','Rua da pitaia 65','enzo@email.com','53459819065','390708094','1'),
(17,'Carlos Alves','1994-05-24','Rua Alemanha 110', 'carlos@email.com','79439543000','365355197','2'),
(18,'Sophia Alana','1973-06-16','Avenida Esbertalina','sophia@email.com','04961000094','409381299','3'),
(19,'Elisa Giovana','1999-11-24','Avenida Desembargador 300','elisa@email.com','76709773027','275145712','4'),
(20,'Luan Edson','1984-09-24','Rua Paracatu 90','luan@email.com','44854854049','435001589','4'),
(21,'Iago Pedro','2013-04-07','Rua Serra de Bragança 9','iagop@email.com.br','59273688080','374294069','1'),
(22,'Cristiane Sara','1962-12-28','Avenida Almirante 98','cristiane@email.com','67180200018','244295049','2'),
(23,'Raquel Almada','1980-03-19','Avenida Esbertalina 10','raquel@email.com.br','15274325050','157740316','3'),
(24,'Marcelo Silva','2000-06-09','Avenida Afonso Pena 89','marcelos@email.com','16562334012','484398088','3'),
(25,'Filipe Carvalho','1962-10-04','Rua Carlos Augusto 45','filipeca@email.com','85314516047','270609763','2'),
(26,'Nina Nunes','1970-02-02','Rua da Imprensa 74','ninanunes@email.com','28797194026','292075698','2'),
(27,'Luciana Emily','1995-08-12','Avenida São João 104','luciana@email.com','00437552080','279249652','1'),
(28,'Lara Silva','1998-05-06','Rua dos Carijós 55','larasilva@email.com','67629959001','424830802','1'),
(29,'Mário Nascimento','2007-01-20','Rua Cristiano Olsen 801','marionasc@gmail.com.br','93772668070','464558931','3'),
(30,'Laura Gomes','2002-11-02','Avenida Rio Branco 46','laura@email.com','58876905006','411174174','2');

/*modificando coluna para char*/
alter table consultas modify column convenio char(1);
/*modificando coluna para int*/
alter table consultas modify column convenio_id int;

/*******************************
* Registrar consultas
*/
INSERT INTO consultas 
VALUES (DEFAULT, '110.0', 'S', '2019-02-06', '09:20', 23, 1, 1, 2);

INSERT INTO consultas 
VALUES (DEFAULT, '110.0', 'S', '2019-03-01', '09:30', 23, 1, 1, 5),
(DEFAULT, '110.0', 'S', '2019-03-01', '09:30', 23, 1, 1, 5),
(DEFAULT, '150.0', 'S', '2019-03-10', '11:30', 17, 2, 2, 2),
(DEFAULT, '110.0', 'S', '2019-03-25', '09:30', 18, 10, 4, 6);


INSERT INTO consultas
VALUES (DEFAULT, '110.0', 'N', '2019-03-01', '15:30', 22, 5, DEFAULT, 1),
(DEFAULT, '180.0', 'S', '2019-02-22', '08:15', 30, 7, 1, 4),
(DEFAULT, '100.0', 'S', '2019-10-10', '09:20', 30, 7, 1, 3);

INSERT INTO consultas
VALUES (DEFAULT, '150.0', 'S', '2019-05-14', '10:10', 20, 4, 2, 5),
(DEFAULT, '130.0', 'S', '2020-12-12', '14:45', 24, 2, 3, 6),
(DEFAULT, '110.0', 'S', '2021-02-08', '08:15', 24, 1, 3, 2);

INSERT INTO consultas
VALUES (DEFAULT, '180.0', 'N', '2020-11-21', '16:10', 26, 8, DEFAULT, 2),
(DEFAULT, '110.0', 'N', '2021-01-30', '08:30', 26, 3, DEFAULT, 7),
(DEFAULT, '110.0', 'S', '2020-11-23', '8:05', 19, 1, 1, 2);

INSERT INTO consultas
VALUES (DEFAULT, '100.0', 'S', '2021-12-19', '14:14', 20, 10, 2, 6),
(DEFAULT, '130.0', 'S', '2021-07-14', '10:50', 17, 5, 2, 4),
(DEFAULT, '130.0', 'S', '2021-09-13', '08:20', 27, 8, 2, 2),
(DEFAULT, '120.0', 'S', '2021-02-28', '15:15', 18, 5, 4, 4),
(DEFAULT, '132.0', 'N', '2021-07-27', '11:15', 25, 1, DEFAULT, 7),
(DEFAULT, '100.0', 'N', '2020-02-01', '08:30', 29, 1, DEFAULT, 2);

INSERT INTO consultas
VALUES(DEFAULT, '160.0', 'S', '2021-12-30', '15:30', 16, 1, 4, 2);

/*******************************
* Registrar receitas
*/
INSERT INTO receitas
VALUES(DEFAULT,'Paracetamol, anti-alergico','1','Tomar de 8 em 8 horas', '1'),
(DEFAULT,'Gelou, Dorflex', '2', 'Tomar de 6 em 6h e aplicar o gelou na dor com massagem', '18'),
(DEFAULT,'Sabonete Liquido, pomada anti-acne', '1', 'Passar pomada a noite em cima das acnes, e lavar de manhã com o sabonete', '14'),
(DEFAULT,'Cimegripe, neosoro', '1', 'Aplicar 2 gotas quando o nariz estiver entupido e tomar o cimegripe de 8 em 8h', '17'),
(DEFAULT,'Dipirona, xarope', '1', 'Tomar dipirona quando da febre e tomar o xarope de 8 em 8h', '12'),
(DEFAULT,'Dipirona, ibuprofeno', '1', 'Tomar dipirona quando da febre e tomar o ibuprofeno de 8 em 8h', '15'),
(DEFAULT,'Colirio, anti-inflamatorio', '3', 'Aplicar o colirio 3x ao dia e tomar o anti inflmatorio de 6 em 6h', '18'),
(DEFAULT,'Paracetamol, anti-inflamatorio', '2', 'Tomar os remédios de 12 em 12h', '21'),
(DEFAULT,'Antibiotico, antidiarreico', '2', 'Tomar os remédios de 8 em 8h', '13'),
(DEFAULT,'Dipirona, anti-inflamatorio', '2', 'Tomar dipirona quando da febre e tomar o anti-inflamatorio de 8 em 8h','5');

/*******************************
* Registrar tipo quartos
*/
INSERT INTO tipo_quarto VALUES(DEFAULT,'Horario de visita ilimitado, cama para acompanhante','270'),
(DEFAULT,'Leitos para dois pacientes com acompanhante e horario de visita marcado', '150'),
(DEFAULT, 'Vários leitos sem acompanhante (exceto para idosos), com hora de visita marcado','100');

/*******************************
* Registrar tipo quartos
*/
INSERT INTO quarto 
VALUES(DEFAULT, '33', 'Apartamento', '1'),
(DEFAULT, '22', 'Quarto duplo', '2'),
(DEFAULT, '11', 'Enfermaria', '3');

/*******************************
* Registrar enfermeiros
*/
INSERT INTO enfermeiro
VALUES(DEFAULT, 'Breno Melo','67860976005', '854519'),
(DEFAULT, 'Tania Mara','14603572050', '854519'),
(DEFAULT, 'Jose Maria','80704702088', '854519'),
(DEFAULT, 'Claudia Romano','35654160095', '854519'),
(DEFAULT, 'Pedro Barros','08700778052', '854519'),
(DEFAULT, 'Bruno Herrique','92623850054', '854519'),
(DEFAULT, 'Gabriela Martins','93694623094', '854519'),
(DEFAULT, 'Luana Vasconcelos','21473216052', '854519'),
(DEFAULT, 'Maria Fernanda','79277567023', '854519'),
(DEFAULT, 'Ana Abreu','64933028036', '854519');

/* modificando tabela, enfermeiro id nao era para esta nessa tabela*/
ALTER TABLE internacao DROP foreign key internacao_ibfk_2;
ALTER TABLE internacao DROP COLUMN enfermeiro_id;

/*******************************
* Registrar internações
*/
INSERT INTO internacao(data_entrada, data_prev_auta, data_alta, procedimento, quarto_id, paciente_id, medicos_id)
VALUES ('2020-02-05', '2020-02-16', '2020-02-13', 'Cirurgia no joelho', '2', '22', '4');

INSERT INTO internacao(data_entrada, data_prev_auta, data_alta, procedimento, quarto_id, paciente_id, medicos_id)
VALUES('2015-08-30','2015-09-08','2015-09-09','Pocedimento no estomago','1','27','5');

INSERT INTO internacao(data_entrada, data_prev_auta, data_alta, procedimento, quarto_id, paciente_id, medicos_id)
VALUES('2018-10-05','2018-10-20','2018-10-20','Procedimento de hernia','2','27','5');

INSERT INTO internacao(data_entrada, data_prev_auta, data_alta, procedimento, quarto_id, paciente_id, medicos_id)
VALUES('2020-11-10','2020-11-10','2020-11-10','Remoção de pinta','3','30','3');

INSERT INTO internacao(data_entrada, data_prev_auta, data_alta, procedimento, quarto_id, paciente_id, medicos_id)
VALUES('2021-01-10','2021-01-10','2021-01-10','Correção de cicatriz','3','24','3');

INSERT INTO internacao(data_entrada, data_prev_auta, data_alta, procedimento, quarto_id, paciente_id, medicos_id)
VALUES('2021-06-13','2021-06-20','2021-06-20','Cirurgia na perna','3','17','1');

INSERT INTO internacao(data_entrada, data_prev_auta, data_alta, procedimento, quarto_id, paciente_id, medicos_id)
VALUES('2015-07-22','2015-08-01','2015-08-03','Cirurgia no tornozelo','1','30','2');

INSERT INTO internacao(data_entrada, data_prev_auta, data_alta, procedimento, quarto_id, paciente_id, medicos_id)
VALUES('2016-04-05','2016-04-12','2015-04-13','Cirurgia no braço','3','30','2');

/*******************************
* Associar enfermeiros as internações
*/
INSERT INTO internacao_enfermeiro
VALUES(DEFAULT,'1','2'),
(DEFAULT,'7','2'),
(DEFAULT,'10','2'),

(DEFAULT,'2','3'),
(DEFAULT,'4','3'),
(DEFAULT,'5','3'),

(DEFAULT,'9','4'),
(DEFAULT,'10','4'),
(DEFAULT,'3','4'),

(DEFAULT,'6','5'),
(DEFAULT,'7','5'),

(DEFAULT,'8','6'),
(DEFAULT,'2','6'),

(DEFAULT,'8','7'),
(DEFAULT,'9','7'),
(DEFAULT,'5','7'),

(DEFAULT,'10','8'),
(DEFAULT,'3','8'),
(DEFAULT,'1','8');