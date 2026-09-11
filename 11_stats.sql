SELECT
    avg(QtdePontos) AS mediaPontos,
    1. * sum(qtdePontos) / count(idCliente) AS alsoMediaPontos,
    round(avg(QtdePontos), 2) AS mediaPontosArredondado,
    min(qtdePontos) AS minCarteira,
    max(qtdePontos) AS maxCarteira,
    sum(flTwitch) AS qtdeTwitch,
    sum(flEmail) AS qtdeEmail
FROM
    clientes