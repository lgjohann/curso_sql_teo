-- Listar toads as transações adicionando uma coluna nova sinalizando "alto", "médio"e "baixo" 
-- para o valor dos pontos [<10, <500, >=500]
SELECT *,
       CASE 
           WHEN vlProduto < 10 THEN 'BAIXO'
           WHEN vlProduto < 500 THEN 'MÉDIO'
           ELSE 'ALTO'
       END AS categoria_pontos
FROM transacao_produto;
