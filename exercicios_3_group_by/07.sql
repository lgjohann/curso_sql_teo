-- qual o produto mais transacionado
SELECT
    produtos.DescNomeProduto,
    transacao_produto.IdProduto,
    count(*) as qtdeTransacaoProdutos
FROM
    transacao_produto
    JOIN produtos ON transacao_produto.IdProduto = produtos.IdProduto
GROUP BY
    produtos.DescNomeProduto
ORDER BY
    qtdeTransacaoProdutos DESC
LIMIT 1