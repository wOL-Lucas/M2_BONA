CREATE TABLE multas (
  id_multa INT NOT NULL AUTO_INCREMENT,
  emprestimo INT NOT NULL,
  valor_multa DECIMAL(5,2) NOT NULL,
  pagamento_multa DATE NOT NULL,
  PRIMARY KEY (id_multa) USING BTREE
);

INSERT INTO Multas (emprestimo, valor_multa, pagamento_multa)
VALUES (1, 10.50, '2022-01-15');