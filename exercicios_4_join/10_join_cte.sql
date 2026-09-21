-- 10. Como foi a curva de Churn (cancelamento) do Curso de SQL?
-- SELECT
--     DATE(DtCriacao) as dtDia,
--     count(DISTINCT idCliente) as qtdeCliente
-- FROM
--     transacoes
-- WHERE
--     DATE (dtCriacao) >= '2025-08-25'
--     AND DATE (dtCriacao) < '2025-08-30'
-- GROUP BY dtDia 
--
-- ESSA PRIMEIRA CTE NÃO LEVA EM CONSIDERAÇÃO APENAS OS IDs CONTIDOS DENTRO DO PRIMEIRO DIA 
-- SENDO ASSIM, PODERÍAMOS TER GENTE NOVA TODOS OS DIAS, É MAIS UMA CURVA DE PÚBLICO DO QUE UMA CURVA DE CHURN
WITH
    tb_clientes_d1 AS (
        SELECT DISTINCT
            idCliente
        FROM
            transacoes
        WHERE
            DtCriacao >= '2025-08-25'
            AND DtCriacao < '2025-08-26'
    )
SELECT
    DATE (t2.DtCriacao) as dtDia,
    count(DISTINCT t1.idCliente) as qtdeCliente,
    1. * count(DISTINCT t1.idCliente) / (SELECT COUNT(*) FROM tb_clientes_d1) AS pctRetencao,
    1 - 1. * count(DISTINCT t1.idCliente) / (SELECT COUNT(*) FROM tb_clientes_d1) AS pctChurn
FROM
    tb_clientes_d1 AS t1
    LEFT JOIN transacoes AS t2 ON t1.idCliente = t2.idCliente
WHERE
    t2.DtCriacao >= '2025-08-25'
    AND t2.DtCriacao < '2025-08-30'
GROUP BY
    dtDia