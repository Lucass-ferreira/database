CREATE TABLE produtos(
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    preco DECIMAL(8,2) NOT NULL,
    estoque INT NOT NULL
);

INSERT INTO produtos (nome, preco, estoque) VALUES ('oleo', 9.00, 9);
select * from produtos;