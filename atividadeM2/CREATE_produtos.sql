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
)