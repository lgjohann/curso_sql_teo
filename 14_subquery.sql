SELECT
    *
FROM
    transacao_produto AS tp
WHERE
    tp.idProduto IN (
        SELECT
            IdProduto
        FROM
            produtos
        WHERE
            DescNomeProduto = 'Resgatar Ponei'
    )