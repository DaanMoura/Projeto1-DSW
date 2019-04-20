/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  743509
 * Created: 15/04/2019
 */

CREATE TABLE SiteVendas(
    url   varchar(100) PRIMARY KEY,
    email varchar(50) UNIQUE,
    senha varchar(50),
    nome  varchar(50),
    telefone varchar(11)
);

CREATE TABLE SalaTeatro(
    CNPJ varchar(14) PRIMARY KEY,
    email varchar(50) UNIQUE,
    senha varchar(50),
    nome  varchar(50),
    cidade varchar(50)

); 

CREATE TABLE Promocao(
    url varchar(100),
    CNPJ varchar(14),
    nome varchar(50),
    preco float,
    horario timestamp,

CONSTRAINT pk_Promocao PRIMARY KEY(url,CNPJ,horario),
CONSTRAINT fk1_Promocao FOREIGN KEY(CNPJ) REFERENCES SalaTeatro(CNPJ),
CONSTRAINT fk2_Promocao FOREIGN KEY(url) REFERENCES SiteVendas(url)

);