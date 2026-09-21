-- produto que mais movimentou pontos
SELECT
    idProduto,
    sum(vlProduto) AS totalPontos
FROM
    transacao_produto
    JOIN produtos ON produtos.IdProduto = 
GROUP BY idProduto
ORDER BY totalPontos DESC