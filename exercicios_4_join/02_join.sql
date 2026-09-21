-- Quais clientes assinaram a lista de presença no dia 2025/08/25?
SELECT
    'galera',
    count(*)
FROM
    transacao_produto
    JOIN produtos ON transacao_produto.IdProduto = produtos.IdProduto
    JOIN transacoes on transacao_produto.IdTransacao = transacoes.IdTransacao
WHERE
    produtos.DescCategoriaProduto = 'present'
    AND DATE (transacoes.DtCriacao) = '2025-08-25'