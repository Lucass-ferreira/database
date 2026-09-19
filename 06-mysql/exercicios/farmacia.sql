-- Inserindo dados na tabela - DML

-- tipos produtos
insert into tipos_produtos (nome) values ('remedio');
insert into tipos_produtos (nome) values ('cosmeticos');
insert into tipos_produtos (nome) values ('fraldas');

-- medicos
insert into medico (nome, crm) values ('rodolfo', 121342);
insert into medico (nome, crm) values ('arnaldo', 243242);
insert into medico (nome, crm) values ('murilo', 146492);
insert into medico (nome, crm) values ('eliza', 875748);

-- fabricantes
insert into fabricantes (nome) values ('euroframa');
insert into fabricantes (nome) values ('huggies');
insert into fabricantes (nome) values ('natura');
insert into fabricantes (nome) values ('EMS');

-- clientes
insert into clientes (nome, endereco, telefone, cep, bairro, numero_contribuinte) values ('Lucas', 'Rua N', 991984576, 44600675, 'centro', '83287665409');
insert into clientes (nome, endereco, telefone, cep, bairro, numero_contribuinte) values ('Joao', 'Rua A', 908764576, 44786675, 'morro', '76372883612');
insert into clientes (nome, endereco, telefone, cep, bairro, numero_contribuinte) values ('Lucas', 'Rua B', 999764576, 44544908, '20 de abril', '83625665409');
insert into clientes (nome, endereco, telefone, cep, bairro, numero_contribuinte) values ('Lucas', 'Rua C', 986664576, 66578987, 'recreio', '77198065409');

-- compras
INSERT INTO compras (data_compra, id_clientes) VALUES
('2026-09-10', 1),
('2026-09-12', 2),
('2026-09-15', 3),
('2026-09-18', 1);

-- produtos
INSERT INTO produtos (produto, designacao, composicao, preco_venda, id_tipos_produtos, id_fabricantes)
VALUES
('Dipirona 500mg', 'Analgésico e antitérmico', 'Dipirona monoidratada', 12.90, 1, 1),
('Paracetamol 750mg', 'Analgésico e antitérmico', 'Paracetamol', 15.50, 1, 2),
('Fralda Huggies', 'Fralda descartável infantil', 'Celulose, polímeros e gel absorvente', 59.90, 2, 3),
('Hidratante Natura', 'Hidratante corporal', 'Óleos vegetais e agentes hidratantes', 49.90, 3, 4);

-- produtos_compras
INSERT INTO produtos_compras (id_compra, id_produtos, quantidade) VALUES
(1, 1, 5),
(2, 2, 6),
(3, 3, 3),
(4, 4, 1);

-- receitas_medicas
INSERT INTO receitas_medicas (receita, id_medico, id_produtos_compras)
VALUES
('Tomar 1 comprimido a cada 8 horas', 1, 1),
('Tomar 1 comprimido a cada 6 horas', 2, 2),
('Aplicar conforme orientação médica', 3, 3),
('Uso tópico duas vezes ao dia', 1, 4);

-- consultas simples

-- tipos produtos
select * from tipos_produtos;
select id, nome from tipos_produtos;
select nome, id from tipos_produtos;
select id, nome from tipos_produtos order by nome desc;

-- fabricantes
select * from frabicantes;

-- clientes
select * from clientes;

-- compras
select * from compras;

-- medico
select * from medico;

-- produtos
select * from produtos;

-- produtos_compras
select * from produtos_compras;

-- receitas_medicas
select * from receitas_medicas;

-- consultas complexas

-- atualizar dados
select * from tipos_produtos;
update tipos_produtos set nome = 'higiene' where id = 2;

select * from produtos;
update produtos set preco_venda = 59.90 where id = 4;

select * from produtos_compras;
update produtos_compras set quantidade = 10 where id = 4;

-- excluindo dados
select * from produtos_compras;
select * from receitas_medicas;

delete from receitas_medicas where id = 3;
delete from produtos_compras where id = 3;


