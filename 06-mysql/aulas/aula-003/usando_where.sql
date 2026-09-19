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

SELECT * FROM produtos;
SELECT * FROM tipos_produtos;

-- Filtrando consultas com o WHERE
SELECT * FROM produtos WHERE id_tipos_produtos = 2;
SELECT * FROM produtos WHERE id_tipos_produtos = 1 AND preco >= 1200;

-- Consultas em multiplas tabelas
SELECT * FROM tipos_produtos;
SELECT * FROM produtos;

SELECT p.id, p.descricao, p.preco, tp.descricao
	FROM produtos AS p, tipos_produtos AS tp
    WHERE p.id_tipos_produtos = tp.id;






















