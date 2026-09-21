-- quais clientes mais perderam pontos por lover?
SELECT
    transacoes.IdCliente,
    sum(transacoes.QtdePontos) as totalPontos
FROM
    transacoes
    JOIN transacao_produto ON transacoes.IdTransacao = transacao_produto.IdTransacao
    JOIN produtos ON transacao_produto.IdProduto = produtos.IdProduto
WHERE
    DescCategoriaProduto = 'lovers'
GROUP BY
    transacoes.IdCliente
ORDER BY
    totalPontos ASC