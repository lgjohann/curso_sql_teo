-- QUANTOS ASSINARAM  PRESENÇA DURANTE O PERIODO DO CURSO (2025/08/25 a 2025/08/29)
SELECT
    'galera',
    count(DISTINCT idCliente)
FROM
    transacao_produto
    JOIN produtos ON transacao_produto.IdProduto = produtos.IdProduto
    JOIN transacoes on transacao_produto.IdTransacao = transacoes.IdTransacao
WHERE
    produtos.DescCategoriaProduto = 'present'
    AND DATE (transacoes.DtCriacao) >= '2025-08-25'
    AND DATE (transacoes.DtCriacao) < '2025-08-30'