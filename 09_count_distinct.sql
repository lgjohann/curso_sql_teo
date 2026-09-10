-- distinct traz as combinações únicas a nível de **LINHA**
-- mas óbvio que se você passar apenas um campo para ser analisado, voltará os registros distintos da coluna
SELECT 
    -- count(*),
    -- count(DISTINCT IdTransacao)
    count(DISTINCT idCliente) qtdeClientesDistintos

FROM transacoes

WHERE DtCriacao >= '2025-07-01'
AND DtCriacao < '2025-08-01'
