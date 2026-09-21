-- qual o valor medio de pontos positivos por dia
SELECT
    DATE(DtCriacao) AS dia,
    AVG(CASE
        WHEN qtdePontos > 0 THEN qtdePontos
    END) AS MediaPontosDoDia
FROM transacoes
GROUP BY dia
ORDER BY dia;

-- qual o valor medio de pontos positivos por dia
SELECT
    sum(QtdePontos) AS totalPontos,
    count(DISTINCT DATE (DtCriacao)) AS qtdeDias,
    sum(QtdePontos) / count(DISTINCT DATE (DtCriacao)) AS mediaPontosDiarios
FROM
    transacoes
WHERE
    qtdePontos > 0;
