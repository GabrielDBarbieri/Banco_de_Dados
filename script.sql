
CREATE DATABASE CMO;
USE CMO;

CREATE TABLE Cliente(
	ID_Cliente INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	Nome VARCHAR(200) NOT NULL,
	Email VARCHAR(200) NOT NULL,
	CPF CHAR(14) NOT NULL,
	CEP CHAR(10) NOT NULL,
	Rua VARCHAR(200) NOT NULL,
	Numero INT NOT NULL,
	Bairro VARCHAR(50) NOT NULL,
	Cidade VARCHAR(100) NOT NULL,
	Genero CHAR(1)
);

INSERT INTO Cliente( Nome, Email, CPF, CEP, Rua, Numero, Bairro, Cidade, Genero)
VALUES ("Gabriel", "gabriel@gmail.com", "119.662.799-48", "81.060-340", "Rua Tabajaras", 73, "Portao", "Curitiba", "M");
INSERT INTO Cliente(Nome, Email, CPF, CEP, Rua, Numero, Bairro, Cidade, Genero)
VALUES ("Carlos", "carlos@gmail.com", "890.062.712-48", "81.380-120", "Rua Fábio Fanuchi", 120, "Santa Cândida", "Curitiba", "M");
INSERT INTO Cliente(Nome, Email, CPF, CEP, Rua, Numero, Bairro, Cidade, Genero)
VALUES ("Maria", "maria@gmail.com", "906.659.845-90", "82015-430", "Rua Jacob Breda", 90, "São Braz", "Curitiba", "F");
INSERT INTO Cliente(Nome, Email, CPF, CEP, Rua, Numero, Bairro, Cidade, Genero) 
VALUES ("Ana", "ana@example.com", "123.456.789-00", "80520-000", "Rua Marechal Deodoro", 123, "Centro", "Curitiba", "F");
INSERT INTO Cliente(Nome, Email, CPF, CEP, Rua, Numero, Bairro, Cidade, Genero) 
VALUES ("Pedro", "pedro@example.com", "987.654.321-00", "80020-320", "Rua das Flores", 456, "Jardim Botânico", "Curitiba", "M");


CREATE TABLE Microondas(
	ID_Microondas INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	Estado_Produto VARCHAR(200) NOT NULL,
    FK_ID_Cor INT NOT NULL,
    FK_ID_Marca INT NOT NULL,
	FK_ID_Modelo INT NOT NULL
);

INSERT INTO Microondas(Estado_Produto, FK_ID_Cor, FK_ID_Marca, FK_ID_Modelo)
VALUES ("Não esquenta", 1, 1, 1);
INSERT INTO Microondas(Estado_Produto, FK_ID_Cor, FK_ID_Marca, FK_ID_Modelo)
VALUES ("Prato não gira", 2, 2, 2);
INSERT INTO Microondas(Estado_Produto, FK_ID_Cor, FK_ID_Marca, FK_ID_Modelo)
VALUES ("Porta não fecha corretamente", 3, 3, 3);
INSERT INTO Microondas(Estado_Produto, FK_ID_Cor, FK_ID_Marca, FK_ID_Modelo)
VALUES ("Faz barulho estranho durante o funcionamento", 1, 4, 4);
INSERT INTO Microondas(Estado_Produto, FK_ID_Cor, FK_ID_Marca, FK_ID_Modelo)
VALUES ("Luz interna não funciona", 2, 5, 5);

CREATE TABLE OrdemdeServiço(
	ID_Ordem INT NOT NULL  PRIMARY KEY AUTO_INCREMENT,
	Dat_Entrada DATE NOT NULL,
	Dat_Saida DATE NULL,
	Defeitos_Relatados VARCHAR(2000) NOT NULL,
	Sintomas_Constatados VARCHAR(2000) NULL,
	Valor_Orçamento FLOAT NULL,
    FK_ID_Cliente INT NOT NULL,
    FK_ID_Microondas INT NOT NULL
);

INSERT INTO OrdemdeServiço(Dat_Entrada, Defeitos_Relatados, Sintomas_Constatados, FK_ID_Cliente, FK_ID_Microondas)
VALUES ('2024-04-14', 'Não esquenta', 'Fusível queimado', 1, 1);
INSERT INTO OrdemdeServiço(Dat_Entrada, Defeitos_Relatados, FK_ID_Cliente, FK_ID_Microondas)
VALUES ('2024-04-15', 'Prato não gira', 2, 2);
INSERT INTO OrdemdeServiço(Dat_Entrada, Defeitos_Relatados, Sintomas_Constatados, FK_ID_Cliente, FK_ID_Microondas)
VALUES ('2024-04-16', 'Porta não fecha corretamente', 'Dobradiça quebrada', 3, 3);
INSERT INTO OrdemdeServiço(Dat_Entrada, Defeitos_Relatados, Sintomas_Constatados, FK_ID_Cliente, FK_ID_Microondas)
VALUES ('2024-04-17', 'Faz barulho estranho durante o funcionamento', 'Rolamentos desgastados', 1, 4);
INSERT INTO OrdemdeServiço(Dat_Entrada, Defeitos_Relatados, FK_ID_Cliente, FK_ID_Microondas)
VALUES ('2024-04-18', 'Luz interna não funciona', 2, 5);

CREATE TABLE PeçaRep(
	ID_Peça_Rep INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    Quant_Peça INT NOT NULL,
    FK_ID_Ordem INT NOT NULL,
    FK_ID_Peça_Fornecedor INT NOT NULL
);

INSERT INTO PeçaRep (Quant_Peça, FK_ID_Ordem, FK_ID_Peça_Fornecedor)
VALUES (3, 1, 1);
INSERT INTO PeçaRep (Quant_Peça, FK_ID_Ordem, FK_ID_Peça_Fornecedor)
VALUES (2, 2, 2);
INSERT INTO PeçaRep (Quant_Peça, FK_ID_Ordem, FK_ID_Peça_Fornecedor)
VALUES (1, 3, 3);
INSERT INTO PeçaRep (Quant_Peça, FK_ID_Ordem, FK_ID_Peça_Fornecedor)
VALUES (4, 4, 4);
INSERT INTO PeçaRep (Quant_Peça, FK_ID_Ordem, FK_ID_Peça_Fornecedor)
VALUES (2, 5, 5);

CREATE TABLE Cor(
ID_Cor INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
Cores VARCHAR(50) NOT NULL
);

INSERT INTO Cor(Cores)
VALUES ("Branco");
INSERT INTO Cor(Cores)
VALUES ("Preto");
INSERT INTO Cor(Cores)
VALUES ("Prata");
INSERT INTO Cor(Cores)
VALUES ("Cinza");
INSERT INTO Cor(Cores)
VALUES ("Azul");

CREATE TABLE Marca(
ID_Marca INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
Marca VARCHAR(50) NOT NULL
);

INSERT INTO Marca(Marca)
VALUES ("Electrolux");
INSERT INTO Marca(Marca)
VALUES ("Brastemp");
INSERT INTO Marca(Marca)
VALUES ("Consul");
INSERT INTO Marca(Marca)
VALUES ("LG");
INSERT INTO Marca(Marca)
VALUES ("Samsung");

CREATE TABLE Modelo(
ID_Modelo INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
Modelos VARCHAR(100) NOT NULL
);

INSERT INTO Modelo(Modelos)
VALUES ("M1234");
INSERT INTO Modelo(Modelos)
VALUES ("X5678");
INSERT INTO Modelo(Modelos)
VALUES ("A91011");
INSERT INTO Modelo(Modelos)
VALUES ("B121314");
INSERT INTO Modelo(Modelos)
VALUES ("C151617");

CREATE TABLE PagamentoDaOrdem(
ID_Pagamento_Ordem INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
Descontos FLOAT NOT NULL,
Quant_Pagamento INT NOT NULL,
FK_ID_Ordem_Pagamento_Da_Ordem INT NOT NULL
);

INSERT INTO PagamentoDaOrdem (Descontos, Quant_Pagamento, FK_ID_Ordem_Pagamento_Da_Ordem)
VALUES (0.00, 1, 1);
INSERT INTO PagamentoDaOrdem (Descontos, Quant_Pagamento, FK_ID_Ordem_Pagamento_Da_Ordem)
VALUES (0.00, 1, 2);
INSERT INTO PagamentoDaOrdem (Descontos, Quant_Pagamento, FK_ID_Ordem_Pagamento_Da_Ordem)
VALUES (0.00, 1, 3);
INSERT INTO PagamentoDaOrdem (Descontos, Quant_Pagamento, FK_ID_Ordem_Pagamento_Da_Ordem)
VALUES (0.00, 1, 4);
INSERT INTO PagamentoDaOrdem (Descontos, Quant_Pagamento, FK_ID_Ordem_Pagamento_Da_Ordem)
VALUES (0.00, 1, 5);

CREATE TABLE PagOrdemFormPagamento(
	ID_Pag_Ordem_Form_Pagamento INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    FK_ID_Pagamento_Ordem INT NULL,
    FK_ID_Formas INT NOT NULL
);

INSERT INTO PagOrdemFormPagamento (FK_ID_Pagamento_Ordem, FK_ID_Formas)
VALUES (6, 1);
INSERT INTO PagOrdemFormPagamento (FK_ID_Pagamento_Ordem, FK_ID_Formas)
VALUES (2, 2);
INSERT INTO PagOrdemFormPagamento (FK_ID_Pagamento_Ordem, FK_ID_Formas)
VALUES (7, 3);
INSERT INTO PagOrdemFormPagamento (FK_ID_Pagamento_Ordem, FK_ID_Formas)
VALUES (4, 1);
INSERT INTO PagOrdemFormPagamento (FK_ID_Pagamento_Ordem, FK_ID_Formas)
VALUES (5, 2);

CREATE TABLE FormaDePagamento(
	ID_Forma INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    Formas_de_Pagamento VARCHAR(50) NOT NULL
);

INSERT INTO FormaDePagamento(Formas_de_Pagamento)
VALUES ('Dinheiro');
INSERT INTO FormaDePagamento(Formas_de_Pagamento)
VALUES ('Cartão de Crédito');
INSERT INTO FormaDePagamento(Formas_de_Pagamento)
VALUES ('Cartão de Débito');
INSERT INTO FormaDePagamento(Formas_de_Pagamento)
VALUES ('Transferência Bancária');
INSERT INTO FormaDePagamento(Formas_de_Pagamento)
VALUES ('PIX');

CREATE TABLE PeçaFornecedor(
	ID_Peça_Fornecedor INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    Preço_de_Custo FLOAT NOT NULL,
    FK_ID_Peça INT NOT NULL,
    FK_ID_Fornecedor INT NOT NULL
);

INSERT INTO PeçaFornecedor(Preço_de_Custo, FK_ID_Peça, FK_ID_Fornecedor)
VALUES (2.50, 1, 3);
INSERT INTO PeçaFornecedor(Preço_de_Custo, FK_ID_Peça, FK_ID_Fornecedor)
VALUES (15.00, 2, 1);
INSERT INTO PeçaFornecedor(Preço_de_Custo, FK_ID_Peça, FK_ID_Fornecedor)
VALUES (8.75, 3, 5);
INSERT INTO PeçaFornecedor(Preço_de_Custo, FK_ID_Peça, FK_ID_Fornecedor)
VALUES (5.25, 4, 4);
INSERT INTO PeçaFornecedor(Preço_de_Custo, FK_ID_Peça, FK_ID_Fornecedor)
VALUES (3.00, 5, 2);

CREATE TABLE Peça(
	ID_Peça INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    Nome_Peça VARCHAR(100) NOT NULL
);

INSERT INTO Peça(Nome_Peça)
VALUES ("Fusível");
INSERT INTO Peça(Nome_Peça)
VALUES ("Prato Giratório");
INSERT INTO Peça(Nome_Peça)
VALUES ("Dobradiça");
INSERT INTO Peça(Nome_Peça)
VALUES ("Rolamento");
INSERT INTO Peça(Nome_Peça)
VALUES ("Lâmpada Interna");

CREATE TABLE Fornecedor(
	ID_Fornecedor INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	Nome_Fornecedor VARCHAR(60) NOT NULL
);

INSERT INTO Fornecedor(Nome_Fornecedor)
VALUES ("ElectroSuprimentos");
INSERT INTO Fornecedor(Nome_Fornecedor)
VALUES ("Peças Rápidas Ltda.");
INSERT INTO Fornecedor(Nome_Fornecedor)
VALUES ("Fornecedora de Peças ABC");
INSERT INTO Fornecedor(Nome_Fornecedor)
VALUES ("Mega Peças Ltda.");
INSERT INTO Fornecedor(Nome_Fornecedor)
VALUES ("Global Parts");


ALTER TABLE Microondas ADD CONSTRAINT FK_ID_Cor
	FOREIGN KEY (FK_ID_Cor) REFERENCES COR(ID_Cor);
    
ALTER TABLE Microondas ADD CONSTRAINT FK_ID_Marca
    FOREIGN KEY (FK_ID_Marca) REFERENCES Marca(ID_Marca);
    
ALTER TABLE Microondas ADD CONSTRAINT FK_ID_Modelo
    FOREIGN KEY (FK_ID_Modelo) REFERENCES Modelo(ID_Modelo);
 
ALTER TABLE OrdemDeServiço ADD CONSTRAINT FK_ID_Cliente
	FOREIGN KEY (FK_ID_Cliente) REFERENCES Cliente(ID_Cliente);
    
ALTER TABLE OrdemDeServiço ADD CONSTRAINT FK_ID_Microondas
	FOREIGN KEY (FK_ID_Microondas) REFERENCES Microondas(ID_Microondas);

ALTER TABLE PeçaRep ADD CONSTRAINT FK_ID_Ordem
	FOREIGN KEY (FK_ID_Ordem) REFERENCES OrdemDeServiço(ID_Ordem);
    
ALTER TABLE PeçaRep ADD CONSTRAINT FK_ID_Peça_Fornecedor
	FOREIGN KEY (FK_ID_Peça_Fornecedor) REFERENCES PeçaFornecedor(ID_Peça_Fornecedor);

ALTER TABLE PeçaFornecedor ADD CONSTRAINT FK_ID_Peça
	FOREIGN KEY (FK_ID_Peça) REFERENCES Peça(ID_Peça);
    
ALTER TABLE PeçaFornecedor ADD CONSTRAINT FK_ID_Fornecedor
	FOREIGN KEY (FK_ID_Fornecedor) REFERENCES Fornecedor(ID_Fornecedor);

ALTER TABLE PagamentoDaOrdem ADD CONSTRAINT FK_ID_Ordem_Pagamento_Da_Ordem
	FOREIGN KEY (FK_ID_Ordem_Pagamento_Da_Ordem) REFERENCES OrdemDeServiço(ID_Ordem);

ALTER TABLE PagOrdemFormPagamento ADD CONSTRAINT FK_ID_Pagamento_Ordem
	FOREIGN KEY (FK_ID_Pagamento_Ordem) REFERENCES PagamentoDaOrdem(ID_Pagamento_Ordem);

ALTER TABLE PagOrdemFormPagamento ADD CONSTRAINT FK_ID_Formas
	FOREIGN KEY (FK_ID_Formas) REFERENCES FormaDePagamento(ID_Forma);
