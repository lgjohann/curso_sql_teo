-- qual dia da semana tem mais pedidos em 2025?
SELECT
    case cast(strftime ('%w', DATE(DtCriacao)) as integer)
        when 0 then 'Sunday'
        when 1 then 'Monday'
        when 2 then 'Tuesday'
        when 3 then 'Wednesday'
        when 4 then 'Thursday'
        when 5 then 'Friday'
        else 'Saturday'
    end as diaSemana,
    count(IdTransacao) as qtdeTransacoes
FROM
    transacoes
WHERE
    DtCriacao >= '2025-01-01'
    AND DtCriacao < '2026-01-01'
GROUP BY diaSemana
ORDER BY qtdeTransacoes DESC