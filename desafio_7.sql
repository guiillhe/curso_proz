-- criando as tabelas

CREATE TABLE clientes (
  id SERIAL NOT NULL,
  nome VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL,
  idade INT NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE pedidos (
  id SERIAL NOT NULL,
  cliente_id INT NOT NULL,
  produto VARCHAR(255) NOT NULL,
  quantidade INT NOT NULL,
  valor FLOAT NOT NULL,
  data_pedido TIMESTAMP NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (cliente_id) REFERENCES clientes (id)
);

-- inserindo dados --
INSERT INTO clientes (nome, email, idade) VALUES
  ('Fulano de Tal', 'fulano@exemplo.com', 30),
  ('Beltrano da Silva', 'beltrano@exemplo.com', 25),
  ('Ciclano Pereira', 'ciclano@exemplo.com', 40);

INSERT INTO pedidos (cliente_id, produto, quantidade, valor, data_pedido) VALUES
  (1, 'Carro', 1, 100000, '2023-12-20 12:00:00'),
  (2, 'Televisão', 2, 5000, '2023-12-21 13:00:00'),
  (3, 'Geladeira', 1, 3000, '2023-12-22 14:00:00');


-- consultas --

SELECT
  clientes.nome,
  clientes.email,
  pedidos.produto,
  pedidos.quantidade,
  pedidos.valor,
  pedidos.data_pedido
FROM clientes
INNER JOIN pedidos
ON clientes.id = pedidos.cliente_id;

SELECT
  pedidos.produto,
  pedidos.quantidade,
  pedidos.valor,
  pedidos.data_pedido
FROM pedidos
WHERE cliente_id = 1;

SELECT
  SUM(pedidos.valor) AS valor_total
FROM pedidos
WHERE cliente_id = 1;


-- inserindo a trigger--

CREATE OR REPLACE FUNCTION incrementar_total_pedidos()
RETURNS TRIGGER AS $$
BEGIN
  UPDATE pedidos SET quantidade = quantidade + 1 WHERE id = NEW.id;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_incrementar_total_pedidos
AFTER INSERT ON pedidos
FOR EACH ROW
EXECUTE FUNCTION incrementar_total_pedidos();
