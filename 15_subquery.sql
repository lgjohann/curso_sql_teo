-- quantas pessoas chegaram ao quinto dia de curso?
SELECT
    count(*) AS qtdeGalera
FROM
    transacoes AS t1
WHERE
    t1.idCliente IN (
        SELECT DISTINCT
            IdCliente
        FROM
            transacoes
        WHERE
            DATE(DtCriacao) = '2025-08-25'
    )
AND DATE(DtCriacao) = '2025-08-29'