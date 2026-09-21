-- qual cliente fez mais transações no ano de 2024
SELECT
    idCliente,
    count(*) as QtdeTransacao
FROM
    transacoes
WHERE
    DtCriacao >= "2025-01-01"
    AND DtCriacao < "2026-01-01"
GROUP BY
    idCliente
ORDER BY 
    QtdeTransacao DESC
