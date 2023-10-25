INSERT INTO transacoes (TipoTransacao, ClienteID, ProdutoID, AluguelID, valor, DataTransacao, FuncionarioID)
VALUES ('Venda', 1, 2, NULL, 50.00, '2022-01-01', 1),
       ('Aluguel', 2, 1, 1, 10.00, '2022-01-02', 2),
       ('Devolução', 3, 3, 2, 0.00, '2022-01-03', 1);