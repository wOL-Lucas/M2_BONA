ALTER TABLE multas
ADD CONSTRAINT fk_multas_alugueis
FOREIGN KEY (emprestimo)
REFERENCES alugueis(AluguelID);