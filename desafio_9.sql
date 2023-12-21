CREATE PROCEDURE gerar_relatorio_vendas_dia(
  data_dia DATE
)
BEGIN
  SELECT
    produto.nome,
    SUM(pedidos.quantidade) AS quantidade_vendida
  FROM pedidos
  INNER JOIN produtos
    ON pedidos.produto_id = produtos.id
  WHERE pedidos.data_pedido = data_dia;
END;
