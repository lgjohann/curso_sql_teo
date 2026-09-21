-- quanto cada pessoa transacionou por dia
WITH
    tb_cliente_dia AS (
        SELECT
            idCliente,
            DATE (DtCriacao) AS dtDia,
            count(DISTINCT IdTransacao) AS qtdeTransacao
        FROM
            transacoes
        WHERE
            dtCriacao >= '2025-08-25'
            AND dtCriacao < '2025-08-30'
        GROUP BY
            idCliente,
            dtDia
    ),
    tb_lag AS (
        SELECT
            *,
            sum(qtdeTransacao) OVER (
                PARTITION BY
                    idCliente
                ORDER BY
                    dtDia
            ) AS qtdeTransacaoAcum,
            lag (qtdeTransacao) OVER (
                PARTITION BY
                    idCliente
                ORDER BY
                    dtDia
            ) AS lagTransacao
        FROM
            tb_cliente_dia
    )

    SELECT *,
            1.* qtdeTransacao / lagTransacao AS pctEngajamento  
    
    FROM tb_lag