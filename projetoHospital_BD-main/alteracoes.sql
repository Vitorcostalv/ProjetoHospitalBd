/*Parte 2*/
/*Adicionando coluna e adicionando dados*/
ALTER TABLE medicos ADD em_atividade VARCHAR(45);

SET SQL_SAFE_UPDATES=0;
UPDATE medicos SET em_atividade='Ativo';

UPDATE medicos SET em_atividade='Inativo' WHERE id=4;
UPDATE medicos SET em_atividade='Inativo' WHERE id=7;
UPDATE medicos SET em_atividade='Inativo' WHERE id=10;

/*Atualizar as datas de alta nas internações em quartos de enfermaria*/
UPDATE internacao SET data_alta='2021-06-23' WHERE id=7;
UPDATE internacao SET data_alta='2021-01-13' WHERE id=6;
UPDATE internacao SET data_alta='2020-11-13' WHERE id=5;

/* excluir o último convênio cadastrado e todas as consultas realizadas com esse convênio*/

UPDATE pacientes SET convenio_id=3 WHERE convenio_id=4;
DELETE FROM receitas WHERE consultas_id IN (5,18,21);
DELETE FROM consultas WHERE convenio_id=4;
DELETE FROM convenio WHERE id=4;