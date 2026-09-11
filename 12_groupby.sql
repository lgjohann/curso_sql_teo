-- SELECT IdProduto,
--         count(*) AS qtde
-- FROM transacao_produto
-- GROUP BY IdProduto
SELECT
    idCliente,
    sum(qtdePontos) AS qtdePontosGanhosTotal,
    count(IdTransacao)
FROM
    transacoes
WHERE
    DtCriacao >= '2025-07-01'
    AND DtCriacao < '2025-08-01'
GROUP BY
    IdCliente
HAVING
    sum(qtdePontos) >= 4000
ORDER BY
    qtdePontosGanhosTotal DESC
LIMIT
    10