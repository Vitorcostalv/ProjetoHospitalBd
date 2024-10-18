CREATE DATABASE hospital;
USE hospital;

CREATE TABLE convenio (
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(255) NOT NULL,
cnpj VARCHAR(45),
carencia CHAR(1)
);

CREATE TABLE pacientes (
id INT NOT NULL AUTO_INCREMENT,
nome VARCHAR(255) NOT NULL,
DATA_NASCIMENTO DATE NOT NULL,
endereco VARCHAR(255),
email VARCHAR(255) NOT NULL,
cpf VARCHAR(11) NOT NULL,
rg VARCHAR(45),
convenio_id INT NOT NULL,
PRIMARY KEY(id),
FOREIGN KEY (convenio_id) REFERENCES convenio(id)
);

CREATE TABLE medicos (
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(255) NOT NULL,
crm VARCHAR(45) NOT NULL,
cargo VARCHAR(45)
);

CREATE TABLE especialidades (
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
especialidade VARCHAR(255)
);

CREATE TABLE medicos_especialidades(
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
especialidades_id INT NOT NULL,
medicos_id INT NOT NULL,
FOREIGN KEY (medicos_id) REFERENCES medicos(id),
FOREIGN KEY (especialidades_id) REFERENCES especialidades(id)
);

CREATE TABLE consultas (
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
valor DECIMAL(9,2),
convenio BOOLEAN, 
data DATE, 
horas TIME,
pacientes_id INT NOT NULL,
medicos_id INT NOT NULL,
convenio_id INT NOT NULL,
especialidade_id INT NOT NULL,
FOREIGN KEY (medicos_id) REFERENCES medicos(id),
FOREIGN KEY (pacientes_id) REFERENCES pacientes(id),
FOREIGN KEY (convenio_id) REFERENCES convenio(id),
FOREIGN KEY (especialidade_id) REFERENCES especialidades(id)
);

CREATE TABLE receitas (
id INT NOT NULL AUTO_INCREMENT,
medicamentos VARCHAR(255),
quantidade INT NOT NULL,
instrucoes VARCHAR(255),
consultas_id INT NOT NULL,
PRIMARY KEY(id),
FOREIGN KEY (consultas_id) REFERENCES consultas(id)
);

CREATE TABLE tipo_quarto (
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
descricao TEXT,
valor_diaria DECIMAL(9,2) NOT NULL
);

CREATE TABLE quarto (
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
numero VARCHAR(45),
tipo VARCHAR(45),
tipo_quarto_id INT NOT NULL,
FOREIGN KEY (tipo_quarto_id) REFERENCES tipo_quarto(id)
);


CREATE TABLE enfermeiro (
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(255) NOT NULL,
cpf VARCHAR(11) NOT NULL,
cre VARCHAR(45)
);

CREATE TABLE internacao (
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
data_entrada DATE NOT NULL,
data_prev_auta DATE NOT NULL,
data_alta DATE NOT NULL,
procedimento VARCHAR(255),
quarto_id INT NOT NULL,
enfermeiro_id INT NOT NULL,
paciente_id INT NOT NULL,
medicos_id INT NOT NULL,
FOREIGN KEY (quarto_id) REFERENCES quarto(id),
FOREIGN KEY (enfermeiro_id) REFERENCES enfermeiro(id),
FOREIGN KEY (paciente_id) REFERENCES pacientes(id),
FOREIGN KEY (medicos_id) REFERENCES medicos(id)   
);

CREATE TABLE internacao_enfermeiro (
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
id_enfermeiro INT NOT NULL,
id_internacao INT NOT NULL,
FOREIGN KEY (id_enfermeiro) REFERENCES enfermeiro(id),
FOREIGN KEY (id_internacao) REFERENCES internacao(id)
);

