-- qual cliente juntou mais pontos postiivos em 2025-05?
SELECT
    IdCliente,
    sum(qtdePontos) AS totalPontos
FROM
    transacoes
WHERE DtCriacao >= "2025-05-01"
AND DtCriacao < "2025-06-01"
AND qtdePontos > 0

GROUP BY IdCliente

ORDER BY totalPontos DESC

LIMIT 1