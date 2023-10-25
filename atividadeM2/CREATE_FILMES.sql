/*USE Lucas_Eduardo_atividadeM2; rodei separado xd*/
CREATE TABLE `filmes`(
`FilmeiD` INT AUTO_INCREMENT,
`Titulo` VARCHAR(100) NOT NULL,
`AnoLancamento` INT NULL DEFAULT NULL,
`Diretor` VARCHAR(50) NULL DEFAULT NULL,
`GeneroID` INT NOT NULL,
`DuracaoMinutos` INT null default null,
PRIMARY KEY (`FilmeID`) USING BTREE  
)