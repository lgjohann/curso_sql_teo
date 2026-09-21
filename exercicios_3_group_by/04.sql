-- Quantos produtos são de rpg?
SELECT
    DescCategoriaProduto,
    count(*) as QtdeProduto
FROM
    produtos
GROUP BY
    DescCategoriaProduto
ORDER BY
    QtdeProduto DESC