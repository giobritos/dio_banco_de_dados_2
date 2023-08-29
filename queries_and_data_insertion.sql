-- inserção de dados e queries
USE Oficina;

-- VEICULO
INSERT INTO Veiculo (Placa)
VALUES
('AAA-1234'),
('BBB-5678'),
('CCC-9012');

-- CLIENTES
INSERT INTO Clientes (idVeiculo)
VALUES
(1),
(2),
(3);

-- PESSOA FISICA
INSERT INTO PessoaFisica (Nome, CPF, Endereço, Contato)
VALUES
('João da Silva', '123.456.789-00', 'Rua A, 123', '11-99999-9999'),
('Maria de Souza', '987.654.321-00', 'Rua B, 456', '22-88888-8888'),
('Pedro Santos', '098.765.432-10', 'Rua C, 789', '33-77777-7777');

-- PESSOA JURIDICA
INSERT INTO PessoaJuridica (RazaoSocial, CNPJ, Endereço, Contato)
VALUES
('Empresa A', '12.345.678/9001-23', 'Rua D, 123', '44-66666-6666'),
('Empresa B', '98.765.432/1000-11', 'Rua E, 456', '55-55555-5555'),
('Empresa C', '098.765.432/2000-22', 'Rua F, 789', '66-44444-4444');

-- CONSERTO
INSERT INTO Conserto (Descricao)
VALUES
('Conserto de motor'),
('Conserto de câmbio'),
('Conserto de freio');

-- REVISÃO
INSERT INTO Revisão (Descricao)
VALUES
('Revisão 10.000 km'),
('Revisão 20.000 km'),
('Revisão 30.000 km');

-- MECANICO
INSERT INTO Mecanico (Nome, Endereço, Especialidade)
VALUES
('João Silva', 'Rua G, 123', 'Motorista'),
('Maria Souza', 'Rua H, 456', 'Câmbio'),
('Pedro Santos', 'Rua I, 789', 'Freio');

-- EQUIPE MECÂNICOS
INSERT INTO EqpMecanicos (idMecanico)
VALUES
(1),
(2),
(3);

-- ORDEM DE SERVIÇO
INSERT INTO OdServiço (DataEmissão, ValorServiço, ValorPeça, ValorTotal, Status, DataConclusão)
VALUES
('2023-07-20', 1000, 200, 1200, 'AGUARDANDO', NULL),
('2023-07-21', 2000, 300, 2300, 'EM ANDAMENTO', NULL),
('2023-07-22', 3000, 400, 3400, 'CONCLUIDO', '2023-07-25');

-- REFERENCIA DE PREÇOS
INSERT INTO ReferenciaPreços (idReferenciaPreços)
VALUES
(1),
(2),
(3);

-- AUTORIZAÇÃO CLIENTE
INSERT INTO Autorização (idAutorização, Autorizado)
VALUES
(1, TRUE),
(2, FALSE),
(3, TRUE);

-- PEÇAS
INSERT INTO Pecas (Descricao, Valor)
VALUES
('Pneu', 500),
('Óleo', 300),
('Pastilha de freio', 200);

-- Retornar todos os dados da tabela Veiculo:
SELECT * FROM Veiculo;

-- Retornar apenas os dados da tabela Clientes onde o campo idVeiculo é igual a 1:
SELECT * FROM Clientes WHERE idVeiculo = 1;

-- Retornar todos os dados da tabela OdServiço onde o status é 'AGUARDANDO':
SELECT * FROM OdServiço WHERE Status = 'AGUARDANDO';

-- Retornar todos os dados da tabela Peças onde o valor é maior que 500:
SELECT * FROM Pecas WHERE Valor > 500;

-- Criar um novo campo chamado ValorTotalServiço que seja a soma dos campos ValorServiço e ValorPeça da tabela OdServiço:
SELECT
  idOdServiço,
  DataEmissão,
  ValorServiço,
  ValorPeça,
  ValorServiço + ValorPeça AS ValorTotalServiço
FROM OdServiço;

-- Ordenar os dados da tabela OdServiço por data de emissão, do mais recente para o mais antigo:
SELECT * FROM OdServiço ORDER BY DataEmissão DESC;

-- Ordenar os dados da tabela Clientes por nome, em ordem alfabética:
SELECT * FROM Clientes ORDER BY Nome;

-- Retornar todos os grupos de dados da tabela OdServiço onde o total de valor é maior que 1000:
SELECT
  idOdServiço,
  SUM(ValorServiço + ValorPeça) AS ValorTotal
FROM OdServiço
GROUP BY idOdServiço
HAVING ValorTotal > 1000;

-- Retornar todos os dados da tabela OdServiço junto com os dados da tabela Veiculo onde o campo idVeiculo é igual:
SELECT
  OdServiço.idOdServiço,
  OdServiço.DataEmissão,
  OdServiço.ValorServiço,
  OdServiço.ValorPeça,
  OdServiço.ValorTotal,
  Veiculo.Placa
FROM OdServiço
INNER JOIN Veiculo ON OdServiço.idVeiculo = Veiculo.idVeiculo;