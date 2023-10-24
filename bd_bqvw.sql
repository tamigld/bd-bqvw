CREATE DATABASE bd_bqvw;

USE bd_bqvw;

CREATE TABLE tb_chapa(
    id BINARY(16) NOT NULL,
    id_chapa BINARY(16) NOT NULL,
    nome VARCHAR(20) NOT NULL,
    PRIMARY KEY (id)
);

ALTER TABLE tb_chapa MODIFY nome VARCHAR(255);
ALTER TABLE tb_chapa CHANGE id_chapa cod_chapa VARCHAR(255);

CREATE TABLE tb_usuario(
	id BINARY(16) NOT NULL,
    id_chapa BINARY(16) NOT NULL,
    tipo_usuario TINYINT NOT NULL,
    nome VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    senha VARCHAR(255) NOT NULL,
    vwId INT NOT NULL UNIQUE,
    dataNascimento DATETIME NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (id_chapa) REFERENCES tb_chapa(id)
);

CREATE TABLE tb_pergunta(
	id_pergunta BINARY(16) NOT NULL,
    id_chapa BINARY(16) NOT NULL,
    titulo VARCHAR(255) NOT NULL,
    PRIMARY KEY (id_pergunta),
    FOREIGN KEY (id_chapa) REFERENCES tb_chapa(id)
);

CREATE TABLE tb_chamado(
	id BINARY(16) NOT NULL,
    id_usuario BINARY(16) NOT NULL,
    descricao VARCHAR(255) NOT NULL,
    data_chamado DATETIME NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY(id_usuario) REFERENCES tb_usuario(id)
);

ALTER TABLE tb_chamado ADD COLUMN status TINYINT NOT NULL;

INSERT INTO tb_chapa VALUES (
	UUID_TO_BIN(UUID()),
    0,
    "Produção"
);

INSERT INTO tb_chapa VALUES (
	UUID_TO_BIN(UUID()),
    1,
    "Adminstrativo"
);

INSERT INTO tb_chapa VALUES (
	UUID_TO_BIN(UUID()),
    2,
    "Gerência"
);

SELECT * FROM tb_chapa;
SELECT BIN_TO_UUID(id), nome FROM tb_chapa;

INSERT INTO tb_usuario VALUES (
	UUID_TO_BIN(UUID()),
    UUID_TO_BIN("69fe36bc-71fb-11ee-9beb-b445067b7b53"),
    1,
    "André Salezze Czerniak",
    "andre@email.com",
    "123456",
    "54321",
    "1996-01-18"
);

INSERT INTO tb_usuario VALUES (
	UUID_TO_BIN(UUID()),
    UUID_TO_BIN("e4993846-71fb-11ee-9beb-b445067b7b53"),
    0,
    "Ingrid Kyle",
    "ingrid@email.com",
    "123456",
    "65432",
    "1992-04-06"
);

INSERT INTO tb_usuario VALUES (
	UUID_TO_BIN(UUID()),
    UUID_TO_BIN("e659cc50-71fb-11ee-9beb-b445067b7b53"),
    0,
    "Thamires Galdino",
    "thamires@email.com",
    "123456",
    "98765",
    "2002-01-07"
);

INSERT INTO tb_usuario VALUES (
	UUID_TO_BIN(UUID()),
    UUID_TO_BIN("e659cc50-71fb-11ee-9beb-b445067b7b53"),
    0,
    "Júlia Athar",
    "julia@email.com",
    "123456",
    "65234",
    "2006-01-01"
);

INSERT INTO tb_usuario VALUES (
	UUID_TO_BIN(UUID()),
    UUID_TO_BIN("e659cc50-71fb-11ee-9beb-b445067b7b53"),
    0,
    "Leonardo Santos",
    "leonardo@email.com",
    "123456",
    "45879",
    "2003-01-19"
);

INSERT INTO tb_usuario VALUES (
	UUID_TO_BIN(UUID()),
    UUID_TO_BIN("e659cc50-71fb-11ee-9beb-b445067b7b53"),
    0,
    "Matheus Pereira",
    "matheus@email.com",
    "123456",
    "45216",
    "2006-01-01"
);

SELECT * FROM tb_usuario;

-- ALTERAR REGISTRO EM TABELA
UPDATE tb_usuario SET tipo_usuario = 1 WHERE vwId = "98765";
