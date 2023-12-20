CREATE FUNCTION contar_clientes_dia(
  data_dia DATE
)
RETURNS INT
BEGIN
  
  SELECT COUNT(*) AS total_clientes
  FROM clientes
  WHERE data_cadastro = data_dia;

  RETURN total_clientes;
END;
