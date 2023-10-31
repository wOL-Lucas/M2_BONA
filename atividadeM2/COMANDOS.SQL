/*Originalmente fiz um arquivo para cada script.*/

/*---------------------------- CREATE DB E TABLES--------------------------------------------*/
CREATE DATABASE Lucas_Eduardo_atividadeM2 CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

/*USE Lucas_Eduardo_atividadeM2;*/ /*rodei separado*/

CREATE TABLE `generos` (
`GeneroID` INT AUTO_INCREMENT,
`NomeGenero` VARCHAR(50) NOT NULL,
PRIMARY KEY(`GeneroID`) USING BTREE   
);

CREATE TABLE `filmes`(
`FilmeiD` INT AUTO_INCREMENT,
`Titulo` VARCHAR(100) NOT NULL,
`AnoLancamento` INT NULL DEFAULT NULL,
`Diretor` VARCHAR(50) NULL DEFAULT NULL,
`GeneroID` INT NOT NULL,
`DuracaoMinutos` INT null default null,
PRIMARY KEY (`FilmeID`) USING BTREE  
);

CREATE TABLE `midia` (
`MidiaID` INT AUTO_INCREMENT,
`FilmeID` INT,
`TipoMidia` VARCHAR(50) NOT NULL,
`Status` VARCHAR(10) NULL DEFAULT NULL,
PRIMARY KEY (`MidiaID`) USING BTREE,
FOREIGN KEY (`FilmeID`) REFERENCES filmes(`FilmeID`)
);

CREATE TABLE `clientes` (
`ClienteID` INT AUTO_INCREMENT,
`Nome` VARCHAR(50) NOT NULL,
`Email` VARCHAR(100) NULL DEFAULT NULL,
`telefone` VARCHAR(15) NULL DEFAULT NULL,
PRIMARY KEY(`ClienteID`) USING BTREE
);

CREATE TABLE `alugueis` (
`AluguelID` INT AUTO_INCREMENT,
`ClienteID` INT,
`FilmeID` INT,
`DataAluguel` DATE NULL DEFAULT NULL,
`DataDevolucao` DATE NULL DEFAULT NULL,
PRIMARY KEY (`AluguelID`) USING BTREE,
FOREIGN KEY (`ClienteID`) REFERENCES clientes(`ClienteID`),
FOREIGN KEY (`FilmeID`) REFERENCES filmes(`FilmeID`)
);

CREATE TABLE `produtos` (
`ProdutoID` INT AUTO_INCREMENT,
`NomeProduto` VARCHAR(100) NOT NULL,
`Categoria` VARCHAR(50) NOT NULL,
`Preco` DECIMAL(10,2) not null,
`Estoque` INT not null,
`Descricao` TEXT null default null,
`DataCadastro` DATE null default null,
`Fornecedor` VARCHAR(100) null default null,
PRIMARY KEY(`ProdutoID`) USING BTREE
);

CREATE TABLE `transacoes`(
`TransacaoID` INT AUTO_INCREMENT,
`TipoTransacao` VARCHAR(20) NOT NULL,
`ClienteID` INT,
`ProdutoID` INT,
`AluguelID` INT,
`Valor` DECIMAL(10,2) NOT NULL,
`DataTransacao` DATE NULL DEFAULT NULL,
PRIMARY KEY (`TransacaoID`) USING BTREE,
FOREIGN KEY (`ClienteID`) REFERENCES clientes(`ClienteID`),
FOREIGN KEY (`ProdutoID`) REFERENCES produtos(`ProdutoID`),
FOREIGN KEY (`AluguelID`)REFERENCES alugueis(`AluguelID`)
);

CREATE TABLE `funcionarios` (
`FuncionarioID` INT AUTO_INCREMENT,
`Nome` VARCHAR(50) NOT NULL,
`Cargo` VARCHAR(50) NULL DEFAULT NULL,
`DataContratacao` DATE NULL DEFAULT NULL,
`Salario` DECIMAL(10,2) NULL DEFAULT NULL,
PRIMARY KEY(`FuncionarioID`)
);

/*----------------------------------------------- END CREATE DATABASE E TABLES--------------------------------------------*/
/*----------------------------------------------------B-INSERTS-----------------------------------------------------------*/
INSERT INTO clientes (Nome, Email, Telefone)
VALUES 
('Maria Silva', 'maria@example.com', '(123) 456-7890'),
('João Santos', 'joao@example.com', '(456) 789-0123'),
('Ana Pereira', 'ana@example.com', '(789) 012-3456');

INSERT INTO generos (`NomeGenero`)
VALUES ('Crime'), ('Ficção Científica'), ('Terror');

INSERT INTO filmes (Titulo, AnoLancamento, Diretor, GeneroID, DuracaoMinutos)
VALUES 
('O Poderoso Chefão', 1972, 'Francis Ford Coppola', 1, 175),
('Star Wars: Uma Nova Esperança', 1977, 'George Lucas', 2, 121),
('Maximum Overdrive', 1985, 'Stephen King', 3, 136);

CREATE TABLE midia (
`MidiaID` INT AUTO_INCREMENT,
`FilmeID` INT,
`TipoMidia` VARCHAR(50) NOT NULL,
`Status` VARCHAR(10) NULL DEFAULT NULL,
PRIMARY KEY (`MidiaID`) USING BTREE,
FOREIGN KEY (`FilmeID`) REFERENCES filmes(`FilmeID`)
);

INSERT INTO alugueis (ClienteID, FilmeID, DataAluguel, DataDevolucao)
VALUES (1, 1, '2023-10-01', '2023-10-10'),
       (2, 3, '2023-10-02', '2023-10-09'),
       (3, 2, '2023-10-03', '2023-10-12');

INSERT INTO produtos (NomeProduto, Categoria, Preco, Estoque, Descricao)
VALUES ('Chocolate Ao Leite', 'Chocolates', 3.50, 200, 'Delicioso chocolate ao leite.'),
       ('Batata Frita', 'Salgados', 2.00, 150, 'Batatas fritas crocantes.'),
       ('Refrigerante Coca-Cola','Bebidas',2.50,100,'Refrigerante de cola gelado.');
/*------------------------------------------------------END------------------------------------------------------------*/
/*----------------------------------------------------LETRA C----------------------------------------------------------*/
ALTER TABLE filmes
DROP column DuracaoMinutos;
/*---------------------------------------------------------------------------------------------------------------------*/
/*----------------------------------------------------LETRA D----------------------------------------------------------*/
ALTER TABLE clientes
ADD CONSTRAINT unique(email);
/*---------------------------------------------------------------------------------------------------------------------*/

/*----------------------------------------------------LETRA E----------------------------------------------------------*/
CREATE TABLE multas (
  id_multa INT NOT NULL AUTO_INCREMENT,
  emprestimo INT NOT NULL,
  valor_multa DECIMAL(5,2) NOT NULL,
  pagamento_multa DATE NOT NULL,
  PRIMARY KEY (id_multa) USING BTREE
);

INSERT INTO Multas (emprestimo, valor_multa, pagamento_multa)
VALUES (1, 10.50, '2022-01-15');

/*---------------------------------------------------------------------------------------------------------------------*/
/*----------------------------------------------------LETRA F----------------------------------------------------------*/
ALTER TABLE multas
ADD CONSTRAINT fk_multas_alugueis
FOREIGN KEY (emprestimo)
REFERENCES alugueis(AluguelID);

/*---------------------------------------------------------------------------------------------------------------------*/
/*----------------------------------------------------LETRA G----------------------------------------------------------*/
INSERT INTO funcionarios (Nome, Cargo, DataContratacao, Salario)
VALUES ('Ana Silva', 'Atendente', '2022-03-15', 2500.00),
       ('Carlos Santos', 'Gerente', '2020-05-20', 4000.00);

/*---------------------------------------------------------------------------------------------------------------------*/
/*----------------------------------------------------LETRA H----------------------------------------------------------*/
ALTER TABLE transacoes
ADD COLUMN FuncionarioID INT NOT NULL,
ADD COLUMN MultaID INT,
ADD CONSTRAINT fk_transacoes_funcionarios
FOREIGN KEY (FuncionarioID)
REFERENCES funcionarios(FuncionarioID),
ADD CONSTRAINT fk_transacoes_multas
FOREIGN KEY (MultaID)
REFERENCES multas(id_multa);

/*---------------------------------------------------------------------------------------------------------------------*/
/*----------------------------------------------------LETRA I----------------------------------------------------------*/
INSERT INTO transacoes (TipoTransacao, ClienteID, ProdutoID, AluguelID, valor, DataTransacao, FuncionarioID)
VALUES ('Venda', 1, 2, NULL, 50.00, '2022-01-01', 1),
       ('Aluguel', 2, 1, 1, 10.00, '2022-01-02', 2),
       ('Devolução', 3, 3, 2, 0.00, '2022-01-03', 1);
/*---------------------------------------------------------------------------------------------------------------------*/
