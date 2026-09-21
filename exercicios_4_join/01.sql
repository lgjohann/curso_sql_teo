-- qual categoria tem mais produtos vendidos?
SELECT
    produtos.DescCategoriaProduto,
    count(idTransacaoProduto) as qtdeVendas
FROM
    transacao_produto
    JOIN produtos ON transacao_produto.IdProduto = produtos.IdProduto
GROUP BY
    produtos.DescCategoriaProduto
ORDER BY
    qtdeVendas DESC