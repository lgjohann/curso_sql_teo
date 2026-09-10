SELECT IdCliente,
       DtCriacao,
       -- datetime(DtCriacao) funcionaria aqui porque já está formatado bonitinho
       substr(DtCriacao, 1,19) AS DtCriacaoSubString,
       datetime(substr(DtCriacao, 1,19)) AS DtCriacaoDateTime,
       strftime('%w', datetime(substr(DtCriacao, 1,19))) AS diaSemana
FROM clientes