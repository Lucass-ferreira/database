CREATE DATABASE juncao;
USE juncao;

CREATE TABLE profissoes(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    cargo VARCHAR(60) NOT NULL
);

CREATE TABLE clientes (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(60) NOT NULL,
    data_nascimento DATE NOT NULL,
    telefone VARCHAR(10) NOT NULL,
    id_profissoes INT NOT NULL,
    FOREIGN KEY (id_profissoes) REFERENCES profissoes(id)
);

CREATE TABLE consumidor (
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    contato VARCHAR(50) NOT NULL,
    endereco VARCHAR(100) NOT NULL,
    cidade VARCHAR(100) NOT NULL,
    cep VARCHAR(20) NOT NULL,
    pais VARCHAR(50) NOT NULL
);

INSERT INTO profissoes (cargo) VALUES ('Programador');
INSERT INTO profissoes (cargo) VALUES ('Analista de Sistemas');
INSERT INTO profissoes (cargo) VALUES ('Suporte');
INSERT INTO profissoes (cargo) VALUES ('Gerente');

INSERT INTO clientes (nome, data_nascimento, telefone, id_profissoes) VALUES ('João Pereira', '1981-06-15', '1234-5688', 1);
INSERT INTO clientes (nome, data_nascimento, telefone, id_profissoes) VALUES ('Ricardo da Silva', '1973-10-10', '2234-5669', 2);
INSERT INTO clientes (nome, data_nascimento, telefone, id_profissoes) VALUES ('Felipe Oliveira', '1987-08-01', '4234-5640', 3);
INSERT INTO clientes (nome, data_nascimento, telefone, id_profissoes) VALUES ('Mário Pirez', '1991-02-05', '5234-5621', 1);

INSERT INTO consumidor (nome, contato, endereco, cidade, cep, pais) VALUES ('Alfredo Nunes', 'Maria Nunes', 'Rua da paz, 47', 'São Paulo', '123.456-87', 'Brasil');
INSERT INTO consumidor (nome, contato, endereco, cidade, cep, pais) VALUES ('Ana Trujillo', 'Guilherme Souza', 'Rua Dourada, 452', 'Goiânia', '232.984-23', 'Brasil');
INSERT INTO consumidor (nome, contato, endereco, cidade, cep, pais) VALUES ('Leandro Veloz', 'Pedro Siqueira', 'Rua Vazia, 72', 'São Paulo', '936.738-23', 'Brasil');


-- junção de tabelas

-- junção de produto cartesiano
SELECT c.id, c.nome, c.data_nascimento, c.telefone, p.cargo
	FROM clientes AS c, profissoes AS p
    WHERE c.id_profissoes = p.id;
    
-- Inner Join
SELECT c.id, c.nome, c.data_nascimento, c.telefone, p.cargo
	FROM clientes AS c INNER JOIN profissoes AS p
    ON c.id_profissoes = p.id;
    
-- Left Outer Join, tras todos os capos da tabelas da esquerda
SELECT * FROM clientes
LEFT OUTER JOIN profissoes
ON clientes.id_profissoes = profissoes.id;

-- Right Outer Join, tras todos os capos da tabelas da direita
SELECT * FROM clientes
RIGHT OUTER JOIN profissoes
ON clientes.id_profissoes = profissoes.id;

-- Full Outer Join(não funciona no MySQL)
SELECT * FROM clientes
FULL OUTER JOIN profissoes
ON clientes.id_profissoes = profissoes.id;

-- Full Outer Join(Versão MySQL) é a msm coisa que Right Join
SELECT * FROM clientes
LEFT OUTER JOIN profissoes
ON clientes.id_profissoes = profissoes.id
UNION
SELECT * FROM clientes
RIGHT OUTER JOIN profissoes
ON clientes.id_profissoes = profissoes.id;

-- Cross Join
SELECT c.id, c.nome, c.data_nascimento, c.telefone, p.cargo
FROM clientes AS c
CROSS JOIN profissoes AS p;

-- Self Join
SELECT a.nome AS Consumidor1, b.nome AS Consumidor2, a.cidade
FROM consumidor AS a
INNER JOIN consumidor AS b
ON a.id <> b.id
AND a.cidade = b.cidade
ORDER BY a.cidade;

SELECT * FROM profissoes;
SELECT * FROM clientes;
SELECT * FROM consumidor;