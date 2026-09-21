-- CTE - Common Table Expression
WITH
    clientes_primeiro_dia AS (
        SELECT DISTINCT
            IdCliente AS primCliente
        FROM
            transacoes
        WHERE
            DATE (DtCriacao) = '2025-08-25'
    ),
    clientes_ultimo_dia AS (
        SELECT DISTINCT
            IdCliente as ultCliente
        FROM
            transacoes
        WHERE
            DATE (DtCriacao) = '2025-08-29'
    )
SELECT
    count(primCliente),
    count(ultCliente),
    1. * count(ultCliente) / count(primCliente) 
FROM
    clientes_primeiro_dia AS t1
    LEFT JOIN clientes_ultimo_dia AS t2 ON t1.primCliente = t2.ultCliente