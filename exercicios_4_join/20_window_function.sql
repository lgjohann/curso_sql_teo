-- com que frequencia o pessoal volta a assistir o téo
WITH
    tb_cliente_dia AS (
        SELECT DISTINCT
            idCliente,
            DATE (DtCriacao) AS dtDia
        FROM
            transacoes
        WHERE
            substr (DtCriacao, 1, 4) = '2025'
        ORDER BY
            idCliente,
            dtDia
    ),
    tb_lag AS (
        SELECT
            *,
            lag (dtDia) OVER (
                PARTITION BY
                    idCliente
                ORDER BY
                    dtDia
            ) AS diaUltimoAcesso
        FROM
            tb_cliente_dia
    ),
    tb_diff_dt AS (
        SELECT
            *,
            julianday (dtDia) - julianday (diaUltimoAcesso) AS dtDiff
        FROM
            tb_lag
    ),
    avg_cliente AS (
        SELECT
            idCliente,
            avg(dtDiff) AS avgDia
        FROM
            tb_diff_dt
        GROUP BY
            idCliente
    )
    SELECT avg(avgDia) FROM avg_cliente,