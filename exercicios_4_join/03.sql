-- qual mes tivemos mais lista de presença assinada?
-- DescCategoriaProduto = present
SELECT
    substr(transacoes.DtCriacao, 1, 7) as ano_mes,
    count(*) AS qtdeTransacoes
FROM
    transacoes
    JOIN transacao_produto ON transacoes.IdTransacao = transacao_produto.IdTransacao
    JOIN produtos ON transacao_produto.IdProduto = produtos.IdProduto
WHERE produtos.DescCategoriaProduto = 'present'
GROUP BY ano_mes