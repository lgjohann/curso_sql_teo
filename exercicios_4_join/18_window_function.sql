WITH
    tb_sumario_dias AS (
        SELECT
            DATE (DtCriacao) as dtDia,
            count(DISTINCT idTransacao) AS qtdeTransacao
        FROM
            transacoes
        WHERE
            DtCriacao >= '2025-08-25'
            AND DtCriacao < '2025-08-30'
        GROUP BY
            dtDia
    )
    SELECT *,
            sum(qtdeTransacao) OVER (ORDER BY dtDia) as qtdeTransacaoAcum
    FROM tb_sumario_dias