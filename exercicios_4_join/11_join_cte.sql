-- 11. Quem iniciou o curso no primeiro dia, em média assistiu quantas aulas?
WITH
    tb_primeiro_dia AS (
        SELECT DISTINCT
            idCliente
        FROM
            transacoes
        WHERE
            DATE (dtCriacao) = '2025-08-25'
    ),
    tb_dias_curso AS (
        SELECT DISTINCT
            idCliente,
            DATE (dtCriacao) AS presenteDia
        FROM
            transacoes
        WHERE
            DATE (dtCriacao) >= '2025-08-25'
            AND DATE (dtCriacao) < '2025-08-30'
        ORDER BY
            idCliente,
            presenteDia
    ),
    tb_cliente_dias AS (
        SELECT
            t1.idCliente,
            count(t2.presenteDia) AS qtdeDias
        FROM
            tb_primeiro_dia AS t1
            LEFT JOIN tb_dias_curso AS t2 ON t1.idCliente = t2.idCliente
        GROUP BY
            t1.idCliente
    )

    SELECT avg(qtdeDias) FROM tb_cliente_dias