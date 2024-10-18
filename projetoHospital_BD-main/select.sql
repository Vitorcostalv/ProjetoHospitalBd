/*Todos os dados e o valor médio das consultas do ano de 2020 
e das que foram feitas sob convênio.*/

SELECT *, avg(valor)as valor_media 
FROM consultas 
WHERE (data BETWEEN'2020-01-01' AND '2020-12-31')
AND convenio_id IS NOT NULL;

/*Todos os dados das internações que tiveram data de alta maior
que a data prevista para a alta.*/

UPDATE internacao SET data_alta='2021-01-11' WHERE id=5;
UPDATE internacao SET data_alta='2021-06-21' WHERE id=6;
UPDATE internacao SET data_alta='2015-08-02' WHERE id=7;
UPDATE internacao SET data_alta='2016-04-13' WHERE id=8;

SELECT * FROM internacao
WHERE data_alta>data_prev_auta;

/*Receituário completo da primeira consulta registrada
com receituário associado.*/

SELECT R.id, R.medicamentos, R.quantidade, R.instrucoes, C.valor,C.data, C.horas, P.nome as paciente, M.nome as medico, E.especialidade 
FROM receitas as R join consultas as C on(R.consultas_id = C.id)
join pacientes as P on(C.pacientes_id=P.id)
join medicos as M on(C.medicos_id=M.id)
join especialidades as E on(C.especialidade_id=E.id)
where R.id = (select min(id) from receitas);

/*Todos os dados da consulta de maior valor 
e também da de menor valor (ambas as consultas não foram realizadas sob convênio).*/

select * from consultas where convenio_id is null and valor = (select min(valor) from consultas)
union
select * from consultas where convenio_id is null and valor = (select max(valor) from consultas);

/*Todos os dados das internações em seus respectivos quartos, 
calculando o total da internação a partir do valor de diária do quarto
e o número de dias entre a entrada e a alta.*/

SELECT I.id, I.data_entrada, I.data_alta, Q.tipo, TQ.valor_diaria, DATEDIFF(I.data_alta, I.data_entrada) AS numero_dias,
DATEDIFF(I.data_alta, I.data_entrada) * TQ.valor_diaria AS total
FROM internacao AS I JOIN quarto AS Q ON(I.quarto_id=Q.id)
JOIN tipo_quarto AS TQ ON(Q.tipo_quarto_id = TQ.id);

/*Data, procedimento e número de quarto de internações em quartos do tipo “apartamento”.*/

SELECT I.data_entrada, I.data_alta, I.procedimento, Q.tipo, count(Q.tipo) AS numInternacao
FROM internacao AS I JOIN quarto AS Q ON(I.quarto_id=Q.id)
WHERE Q.tipo='Apartamento'
GROUP BY Q.tipo;

/*Nome do paciente, data da consulta e especialidade de todas as consultas em que os pacientes eram menores de 18 anos
na data da consulta e cuja especialidade não seja “pediatria”, ordenando por data de realização da consulta.*/

INSERT INTO consultas 
VALUES (DEFAULT, '110.0', 'S', '2019-02-06', '09:20', 29, 1, 3, 2),
(DEFAULT, '150.0', 'S', '2019-02-06', '09:20', 29, 5, 3, 1);

SELECT P.nome, C.data, E.especialidade
FROM consultas C JOIN pacientes P ON(C.pacientes_id=P.id)
JOIN especialidades E ON(C.especialidade_id=E.id)
WHERE TIMESTAMPDIFF(YEAR, P.DATA_NASCIMENTO, C.data) < 18 AND especialidade != 'Pediatra'
ORDER BY C.data;

/*Nome do paciente, nome do médico, data da internação e procedimentos das internações
realizadas por médicos da especialidade “gastroenterologia”, 
que tenham acontecido em “enfermaria”.*/
INSERT INTO internacao(data_entrada, data_prev_auta, data_alta, procedimento, quarto_id, paciente_id, medicos_id)
VALUES('2016-11-30','2016-12-05','2016-12-06','Pocedimento no estomago','3','24','7');

INSERT INTO internacao(data_entrada, data_prev_auta, data_alta, procedimento, quarto_id, paciente_id, medicos_id)
VALUES('2015-07-04','2015-07-10','2015-07-08','Pocedimento no estomago','3','22','9');

INSERT INTO internacao(data_entrada, data_prev_auta, data_alta, procedimento, quarto_id, paciente_id, medicos_id)
VALUES('2017-02-28','2017-03-05','2017-03-06','Pocedimento no estomago','3','30','9');

SELECT P.nome , M.nome , I.data_entrada , I.procedimento , E.especialidade , Q.tipo
FROM internacao I JOIN pacientes P ON (I.paciente_id =P.id)
JOIN medicos M ON (I.medicos_id = M.id)
JOIN quarto Q on (I.quarto_id = Q.id)
JOIN medicos_especialidades ME ON (ME.medicos_id=M.id)
JOIN especialidades E ON (ME.especialidades_id = E.id)
WHERE E.especialidade = 'Gastroenterologista' and Q.tipo = 'Enfermaria'
ORDER BY I.data_entrada;

/*Os nomes dos médicos, seus CRMs e a quantidade de consultas que cada um realizou.*/

select M.nome, M.crm, count(C.medicos_id) as quantidade_consulta
from consultas C JOIN medicos M ON(C.medicos_id=M.id)
GROUP BY M.nome
ORDER BY quantidade_consulta desc;

/*Os nomes, CREs e número de internações de enfermeiros 
que participaram de mais de uma internação.*/

SELECT E.nome, E.cre, I.id, count(E.nome) AS internacao
FROM internacao_enfermeiro IE JOIN internacao I ON (IE.id_internacao=I.id)
join enfermeiro E ON (IE.id_enfermeiro=E.id)
group by E.nome
having  internacao > 1;