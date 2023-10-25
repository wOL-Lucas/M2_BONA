ALTER TABLE transacoes
ADD COLUMN FuncionarioID INT NOT NULL,
ADD COLUMN MultaID INT,
ADD CONSTRAINT fk_transacoes_funcionarios
FOREIGN KEY (FuncionarioID)
REFERENCES funcionarios(FuncionarioID),
ADD CONSTRAINT fk_transacoes_multas
FOREIGN KEY (MultaID)
REFERENCES multas(id_multa);