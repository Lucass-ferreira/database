
USE secao04;

CREATE TABLE tipos_produtos(
	id INT NOT NULL AUTO_INCREMENT,
    descricao VARCHAR(30) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE produtos(
	id INT NOT NULL AUTO_INCREMENT,
    descricao VARCHAR(30) NOT NULL,
    preco DECIMAL(8,2) NOT NULL,
    id_tipos_produtos INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (id_tipos_produtos) REFERENCES tipos_produtos(id)
);

INSERT INTO tipos_produtos (descricao) VALUES ('Computador');
INSERT INTO tipos_produtos (descricao) VALUES ('Impressora');

INSERT INTO produtos (descricao, preco, id_tipos_produtos) VALUES ('Desktop', 1200, 1);
INSERT INTO produtos (descricao, preco, id_tipos_produtos) VALUES ('Laptop', 1000, 1);
INSERT INTO produtos (descricao, preco, id_tipos_produtos) VALUES ('Impr. Jato Tinta', 300, 2);
INSERT INTO produtos (descricao, preco, id_tipos_produtos) VALUES ('Impr. Laser', 500, 2);

SELECT * FROM tipos_produtos;
SELECT * FROM produtos;

# DQL INICIO --
# Select
SELECT * FROM tipos_produtos;
SELECT id, descricao FROM tipos_produtos;

SELECT id, descricao FROM produtos;

# erro Select
SELECT cod, descr, pre, ctp FROM produtos;

# Alias
SELECT p.id AS cod, p.descricao AS descr, p.preco AS pre, p.id_tipos_produtos AS ctp FROM produtos AS p;

# order by
SELECT * FROM produtos ORDER BY preco;
# DQL FIM --

# DML INICIO --
#insert
INSERT INTO produtos VALUES (NULL, 'MacBock', 4000, 1);
INSERT INTO produtos VALUES (NULL, 'Iphone', 4000, 3);

INSERT INTO tipos_produtos VALUES (NULL, 'Apple');

#update

UPDATE produtos SET id_tipos_produtos = 3 WHERE id = 5;
UPDATE produtos SET descricao = 'Impressora Laser', preco = 700  WHERE id = 4;

UPDATE produtos set id = 6 WHERE id = 7;

# Nunca esqueca de usar o WHERE;
# UPDATE produtos set preco = 150;

# delete
# Nunca esqueca de usar o WHERE;
DELETE FROM produtos WHERE id = 4;
# DML FIM --

# DDL INICIO --
#create database/table
CREATE DATABASE secao04;
#cuidado a onde voce cria seu banco de dados, pois pode ta selecionado outro BD e todas coisas feitas vai pra esse BD selecionado;

#Alter
#cuidado pra não por com NOT NULL, pois se ja tiver dados na tabelas o campo vai esta com um valor que pode não ser bem aproveitado no que queremos;
#ALTER TABLE produtos ADD fornecedor VARCHAR(40) NOT NULL;
ALTER TABLE produtos ADD fornecedor VARCHAR(40);

#drop
#comando pra apagar uma tabela, uma estrutura;
#DROP DATABASE produtos;
DROP TABLE produtos;

ALTER TABLE produtos DROP COLUMN fornecedor;
# DLL FIM --

#DCL INICIO --
#parte de controle de qm tem acesso;

#DCL FIM --

#DTL INICIO --
# Transaction
START TRANSACTION;
	INSERT INTO tipos_produtos (descricao) VALUES ('Acessorios');
    INSERT INTO tipos_produtos (descricao) VALUES ('Equipamentos');

#comit se eu der o commit o rollback não vai funcionar
COMMIT;

#rollback quando eu executo a trasition e quero desfazer a mudança
ROLLBACK;

#DTL FIM --