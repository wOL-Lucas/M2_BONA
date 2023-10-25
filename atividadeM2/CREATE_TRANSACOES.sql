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
)