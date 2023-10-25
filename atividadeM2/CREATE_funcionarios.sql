CREATE TABLE `funcionarios` (
`FuncionarioID` INT AUTO_INCREMENT,
`Nome` VARCHAR(50) NOT NULL,
`Cargo` VARCHAR(50) NULL DEFAULT NULL,
`DataContratacao` DATE NULL DEFAULT NULL,
`Salario` DECIMAL(10,2) NULL DEFAULT NULL,
PRIMARY KEY(`FuncionarioID`)
)