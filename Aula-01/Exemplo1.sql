/*
REVISÃO DDL - DATA DEFINITION LANGUAGE
1. Criar um banco de dados chamado IFSP
2. Criar uma tabela "Cidade", 
   com os seguintes campos: id (PK, AI), nome (NN) e estado (NN)
3. Criar uma tabela "Cliente",
   com os seguintes campos: id (PK, AI), nome (NN), email (NN),
   id da cidade (FK),  endereco, 
   numero, bairro e data nascimento. 
 */
 
-- DELETAR O BANCO
DROP DATABASE IF EXISTS IFSP;

-- CRIAÇÃO DO BANCO DE DADOS COM CONFIGURAÇÃO DE ACENTOS
 CREATE DATABASE IFSP
 DEFAULT CHARSET = utf8 
 DEFAULT COLLATE = utf8_general_ci;

 -- SELECIONAR O BANCO DE DADOS
 USE IFSP;

 -- CRIAÇÃO TABELA CIDADE
 CREATE TABLE cidade
 (
    id      INT AUTO_INCREMENT,
    nome    VARCHAR(100) NOT NULL,
    estado  VARCHAR(002) NOT NULL,
    PRIMARY KEY (id)
 );

-- CRIAÇÃO TABELA CLIENTE
 CREATE TABLE cliente
 (
    id          INT AUTO_INCREMENT,
    nome        VARCHAR(100) NOT NULL,
    email       VARCHAR(100) NOT NULL,
    id_cidade   INT,
    endereco    VARCHAR(100),
    numero      INT,
    bairro      VARCHAR(100),
    data_nasc   DATETIME,
    PRIMARY KEY (id),
    CONSTRAINT fk_cliente_cidade 
        FOREIGN KEY (id_cidade) REFERENCES cidade (id)
 );

-- INSERIR DADOS NA TABELA CIDADE
INSERT INTO cidade (id, nome, estado) VALUES (1, 'Birigui', 'SP');
INSERT INTO cidade (id, nome, estado) VALUES (100, 'Araçatuba', 'SP');
INSERT INTO cidade (nome, estado) VALUES ('Guararapes', 'SP');
INSERT INTO cidade (nome) VALUES ('Rio de Janeiro');

-- MOSTRA REGISTROS DA TABELA CIDADE
SELECT * FROM cidade;

-- INSERIR DADOS NA TABELA CLIENTE
INSERT INTO cliente (nome, email, id_cidade, endereco, numero, bairro, data_nasc)
VALUES ('Murilo Silva', 'murilo@mail.com', 100, 'Rua Pedro Cavalo', 750, 
'Portal da Pérola', '1999/01/15');

INSERT INTO cliente (nome, email, id_cidade, endereco, numero, bairro, data_nasc)
VALUES ('Cássio Stersi', 'cassio@mail.com', 1, 'Rua Pedro Cavalo', 750, 
'Centro', '1980/01/15');


-- MOSTRA REGISTROS DA TABELA CLIENTE
SELECT * FROM cliente;

-- ATUALIZA TABELA CIDADE
UPDATE cidade SET
    nome = 'Belo Horizonte',
    estado = 'MG'
WHERE id = 1;

-- UPDATE TABELA CLIENTE
UPDATE cliente SET
    nome = 'Cocão',
    email = 'cocao@mail.com',
    id_cidade = 101
WHERE id = 2;

-- DELETA REGISTRO CIDADE
DELETE FROM cidade WHERE id = 1;