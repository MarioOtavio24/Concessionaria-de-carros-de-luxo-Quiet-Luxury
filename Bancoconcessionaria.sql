CREATE DATABASE IF NOT EXISTS BancoConcessionaria2;
USE BancoConcessionaria2;

CREATE TABLE cliente (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(90) NOT NULL,
    cpf VARCHAR(30) NOT NULL,
    telefone VARCHAR(20) NOT NULL UNIQUE,
    email VARCHAR(60) NOT NULL UNIQUE, 
    endereco VARCHAR(60) NOT NULL
);

CREATE TABLE vendedor (
    id INT PRIMARY KEY AUTO_INCREMENT, 
    nome VARCHAR(90) NOT NULL,
    cpf VARCHAR(30) NOT NULL,
    telefone VARCHAR(20) NOT NULL UNIQUE,
    email VARCHAR(60) NOT NULL UNIQUE, 
    comissao DOUBLE
);

CREATE TABLE veiculo (
    id INT PRIMARY KEY AUTO_INCREMENT,
    quilometragem DOUBLE,
    modelo VARCHAR(60) NOT NULL,
    marca VARCHAR(60) NOT NULL,
    categoria VARCHAR(60) NOT NULL,
    placa VARCHAR(15) NOT NULL UNIQUE,
    preco DOUBLE NOT NULL,
    ano INT NOT NULL,
    cor VARCHAR(60) NOT NULL,
    status VARCHAR(30) DEFAULT 'disponivel', -- ADICIONADO PARA CORRIGIR O DAO
    imagem VARCHAR(255)
);

CREATE TABLE estoque (
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_veiculo INT NOT NULL UNIQUE,
    quantidade INT NOT NULL,
    localizacao VARCHAR(120),
    data_entrada DATE NOT NULL,
    FOREIGN KEY (id_veiculo) REFERENCES veiculo(id)
);

CREATE TABLE venda (
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_cliente INT NOT NULL,
    id_vendedor INT NOT NULL,
    id_veiculo INT NOT NULL,
    data_venda DATE NOT NULL,
    valor_total DOUBLE,
    status VARCHAR(30),
    FOREIGN KEY (id_vendedor) REFERENCES vendedor(id),
    FOREIGN KEY (id_veiculo) REFERENCES veiculo(id),
    FOREIGN KEY (id_cliente) REFERENCES cliente(id)
);

CREATE TABLE formapagamento (
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_venda INT NOT NULL,
    tipo VARCHAR(30),
    parcelas INT,
    valor DOUBLE,
    FOREIGN KEY (id_venda) REFERENCES venda(id)
);

SELECT * FROM veiculo;

INSERT INTO veiculo (placa, marca, modelo, ano, cor, preco, quilometragem, categoria, imagem) 
VALUES ('LAN-850', 'Ferrari', '812', 2026, 'Vermelho', 1000000.00, 15000.00, 'Esportivo', 'Ferrari_812_2026.jpeg');
INSERT INTO veiculo (placa, marca, modelo, ano, cor, preco, quilometragem, categoria, imagem) 
VALUES ('MSE-780', 'Maserati', 'Gracale', 2026,'Branco', 500000.00, 25000.00, 'SUV', 'Maserati_2026.jpeg' );
INSERT INTO veiculo (placa, marca, modelo, ano, cor, preco, quilometragem, categoria, imagem)
VALUES ('BEM-180', 'Bentley','Continental GT',2026,'Preto',4100000.00, 5000.00,'Esportivo', '2026-Bentley-Continental-GT-Speed.jpg');
INSERT INTO veiculo (placa, marca, modelo, ano, cor, preco, quilometragem, categoria, imagem)
VALUES('MCL-456','McLaren','McLaren Senna',2026,'Laranja',8200000.00, 20000.00,'Esportivo','mclata_Senna_2026.png');
INSERT INTO veiculo (placa, marca, modelo, ano, cor, preco, quilometragem, categoria, imagem)
VALUES ('PSC-063', 'Porsche','911 GT3', 2026,'Vermelho e preto',1620000.00, 30000.00,'Esportivo','2026-porsche-911-gt3.jpeg');
INSERT INTO veiculo (placa, marca, modelo, ano, cor, preco, quilometragem, categoria, imagem)
VALUES('AMV-896','Aston Martin','Valhalla', 2026,'Marrom', 14000000.00, 10000.00,'Esportivo','Aston_Martin_Valhalla.jpeg');
 
INSERT INTO vendedor (nome, cpf, telefone, email, comissao)
VALUES ('Mario Silva', '123.456.789-00', '(11) 99999-0000', 'mario@luxurycars.com', 0.05);