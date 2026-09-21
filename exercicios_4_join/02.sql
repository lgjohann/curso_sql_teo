-- Em 2024, quantas transações de Lovers tivemos?
SELECT
    produtos.DescCategoriaProduto,
    count(*) as qtdeTotal
FROM
    transacao_produto
    JOIN produtos ON transacao_produto.IdProduto = produtos.IdProduto
    JOIN transacoes ON transacao_produto.IdTransacao = transacoes.IdTransacao
WHERE
    produtos.DescCategoriaProduto = 'lovers'
    AND transacoes.DtCriacao >= '2024-01-01'
    AND transacoes.DtCriacao < '2025-01-01'