CREATE DATABASE db_farmacia_bem_estar;

USE db_farmacia_bem_estar;

CREATE TABLE tb_categorias(
    id BIGINT AUTO_INCREMENT,
	tipo VARCHAR(255) NOT NULL,
	descricao VARCHAR(255) NOT NULL,
    PRIMARY KEY (id)
);

INSERT INTO tb_categorias (tipo, descricao)
VALUES ("antibiótico", "remédio vendido com receita usado para tratamentos");
INSERT INTO tb_categorias (tipo, descricao)
VALUES ("corpo e banho", "itens de limpeza pessoal e cuidados com o corpo");
INSERT INTO tb_categorias (tipo, descricao)
VALUES ("gripes e refriados", "remédios para o tratamento de gripes e refriados");
INSERT INTO tb_categorias (tipo, descricao)
VALUES ("antidepressivos", "remédios controlados para o tratamento da depressão");
INSERT INTO tb_categorias (tipo, descricao)
VALUES ("vida saudável", "itens fitness e suplementos");

SELECT * FROM tb_categorias;

CREATE TABLE tb_produtos(
    id BIGINT AUTO_INCREMENT,
	nome VARCHAR(255) NOT NULL,
	marca VARCHAR(255) NOT NULL,
    datavalidade DATE,
	preco DECIMAL(6,2) NOT NULL,
    PRIMARY KEY (id)
);

INSERT INTO tb_produtos(nome, marca, datavalidade, preco) 
values ("Loção Hidratante Corporal Milk", "Nivea", "2025-08-31", 4.20);
INSERT INTO tb_produtos(nome, marca, datavalidade, preco) 
values ("Cimegripe", "Cimed", "2025-12-25", 25.90);
INSERT INTO tb_produtos(nome, marca, datavalidade, preco) 
values ("Sabonete líquido", "Monange", "2025-10-15", 8.90);
INSERT INTO tb_produtos(nome, marca, datavalidade, preco) 
values ("Creatina", "Growth", "2026-02-28", 105.99);
INSERT INTO tb_produtos(nome, marca, datavalidade, preco) 
values ("Sertralina", "Eurofarma", "2024-04-01", 18.69);
INSERT INTO tb_produtos(nome, marca, datavalidade, preco) 
values ("Vitamina D 7.000UI", "Cimed", "2026-01-04", 13.59);
INSERT INTO tb_produtos(nome, marca, datavalidade, preco) 
values ("Amoxilina", "Eurofarma", "2025-06-16", 20.29);
INSERT INTO tb_produtos(nome, marca, datavalidade, preco) 
values ("Protetor Solar Facial", "Neutrogena", "2028-09-04", 46.19);

SELECT * FROM tb_produtos;

ALTER TABLE tb_produtos ADD categoriasid BIGINT;

ALTER TABLE tb_produtos ADD CONSTRAINT fk_produtos_categorias 
FOREIGN KEY (categoriasid) REFERENCES tb_categorias (id);

SELECT * FROM tb_produtos;

UPDATE tb_produtos SET categoriasid = 2 WHERE id = 1;
UPDATE tb_produtos SET categoriasid = 3 WHERE id = 2;
UPDATE tb_produtos SET categoriasid = 2 WHERE id = 3;
UPDATE tb_produtos SET categoriasid = 5 WHERE id = 4;
UPDATE tb_produtos SET categoriasid = 4 WHERE id = 5;
UPDATE tb_produtos SET categoriasid = 5 WHERE id = 6;
UPDATE tb_produtos SET categoriasid = 1 WHERE id = 7;
UPDATE tb_produtos SET categoriasid = 2 WHERE id = 8;

SELECT * FROM tb_produtos;

SELECT * FROM tb_produtos WHERE preco > 50.00;

SELECT * FROM tb_produtos WHERE preco > 5.00 AND preco < 60.00;

SELECT * FROM tb_produtos WHERE nome LIKE "%c%";

SELECT nome, preco, marca, tb_categorias.tipo
FROM tb_produtos INNER JOIN tb_categorias 
ON tb_produtos.categoriasid = tb_categorias.id;

SELECT tb_produtos.nome, tb_produtos.preco, tb_produtos.marca, tb_categorias.tipo FROM tb_produtos
INNER JOIN tb_categorias 
ON tb_produtos.categoriasid = tb_categorias.id
WHERE tb_categorias.tipo = 'corpo e banho';

