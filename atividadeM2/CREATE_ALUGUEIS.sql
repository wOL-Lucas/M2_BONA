CREATE TABLE `alugueis` (
`AluguelID` INT AUTO_INCREMENT,
`ClienteID` INT,
`FilmeID` INT,
`DataAluguel` DATE NULL DEFAULT NULL,
`DataDevolucao` DATE NULL DEFAULT NULL,
PRIMARY KEY (`AluguelID`) USING BTREE,
FOREIGN KEY (`ClienteID`) REFERENCES clientes(`ClienteID`),
FOREIGN KEY (`FilmeID`) REFERENCES filmes(`FilmeID`)
)