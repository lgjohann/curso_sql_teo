-- lista de pedidos realizados no fim de semana
SELECT IdTransacao FROM transacoes
WHERE strftime('%w', datetime(transacoes.DtCriacao)) = '0' OR strftime('%w', datetime(transacoes.DtCriacao)) = '1'