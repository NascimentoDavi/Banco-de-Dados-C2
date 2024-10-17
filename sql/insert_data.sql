-- Inserir localizações
INSERT INTO Localizacao (ID_Localizacao, Nome_Localizacao, Tipo_Localizacao)
VALUES 
(1, 'Asilo Arkham', 'Asilo');

INSERT INTO Localizacao (ID_Localizacao, Nome_Localizacao, Tipo_Localizacao)
VALUES 
(2, 'Gotham City', 'Cidade');

INSERT INTO Localizacao (ID_Localizacao, Nome_Localizacao, Tipo_Localizacao)
VALUES 
(3, 'Nômade', 'Diversos');

-- Inserir vilões
INSERT INTO Vilao (ID_Vilao, Nome_Vilao, Nome_Verdadeiro, Localizacao, Nivel_Periculosidade)
VALUES
(1, 'Coringa', 'Desconhecido', 1, 'Cidade');

INSERT INTO Vilao (ID_Vilao, Nome_Vilao, Nome_Verdadeiro, Localizacao, Nivel_Periculosidade)
VALUES
(2, 'Mulher Gato', 'Selina Kyle', 2, 'Pessoal');

INSERT INTO Vilao (ID_Vilao, Nome_Vilao, Nome_Verdadeiro, Localizacao, Nivel_Periculosidade)
VALUES
(3, 'Josh Blackfire', 'Joseph Blackfire', 1, 'Cidade');

INSERT INTO Vilao (ID_Vilao, Nome_Vilao, Nome_Verdadeiro, Localizacao, Nivel_Periculosidade)
VALUES
(4, 'Arlequina', 'Harleen Quinzel', 1, 'Cidade');

INSERT INTO Vilao (ID_Vilao, Nome_Vilao, Nome_Verdadeiro, Localizacao, Nivel_Periculosidade)
VALUES
(5, 'Vagalume', 'Garfield Lynns', 3, 'Bairro');

INSERT INTO Vilao (ID_Vilao, Nome_Vilao, Nome_Verdadeiro, Localizacao, Nivel_Periculosidade)
VALUES
(6, 'Exterminador', 'Slade Wilson', 3, 'Pessoal');

INSERT INTO Vilao (ID_Vilao, Nome_Vilao, Nome_Verdadeiro, Localizacao, Nivel_Periculosidade)
VALUES
(7, 'Morcego Humano', 'Kirk Langstrom', 2, 'Pessoal');

-- Inserir armas
INSERT INTO Arma (ID_Arma, Tipo_Arma, Descricao_Arma)
VALUES
(1, 'Armas corpo a corpo', 'Facas e truques sujos');

INSERT INTO Arma (ID_Arma, Tipo_Arma, Descricao_Arma)
VALUES
(2, 'Garras', 'Garras da Mulher Gato');

INSERT INTO Arma (ID_Arma, Tipo_Arma, Descricao_Arma)
VALUES
(3, 'Pirotecnia', 'Lança-chamas de Vagalume');

INSERT INTO Arma (ID_Arma, Tipo_Arma, Descricao_Arma)
VALUES
(4, 'Espadas e Facas', 'Habilidade em combate do Exterminador');

INSERT INTO Arma (ID_Arma, Tipo_Arma, Descricao_Arma)
VALUES
(5, 'Força Bruta', 'Garras e dentes afiados do Morcego Humano');

-- Inserir veículos
INSERT INTO Veiculo (ID_Veiculo, Tipo_Veiculo, Descricao_Veiculo)
VALUES
(1, 'Carro', 'Carro do Coringa');

INSERT INTO Veiculo (ID_Veiculo, Tipo_Veiculo, Descricao_Veiculo)
VALUES
(2, 'Moto', 'Moto da Mulher Gato');

INSERT INTO Veiculo (ID_Veiculo, Tipo_Veiculo, Descricao_Veiculo)
VALUES
(3, 'Mochila a jato', 'Mochila-foguete do Vagalume');

INSERT INTO Veiculo (ID_Veiculo, Tipo_Veiculo, Descricao_Veiculo)
VALUES
(4, 'Avião', 'Avião do Exterminador');

INSERT INTO Veiculo (ID_Veiculo, Tipo_Veiculo, Descricao_Veiculo)
VALUES
(5, 'Asas', 'Asas do Morcego Humano');

-- Inserir associação entre vilão e arma
INSERT INTO Vilao_Arma (ID_Vilao, ID_Arma)
VALUES
(1, 1); -- Coringa usa facas e truques sujos

INSERT INTO Vilao_Arma (ID_Vilao, ID_Arma)
VALUES
(2, 2); -- Mulher Gato usa garras

INSERT INTO Vilao_Arma (ID_Vilao, ID_Arma)
VALUES
(5, 3); -- Vagalume usa pirotecnia

INSERT INTO Vilao_Arma (ID_Vilao, ID_Arma)
VALUES
(6, 4); -- Exterminador usa espadas e facas

INSERT INTO Vilao_Arma (ID_Vilao, ID_Arma)
VALUES
(7, 5); -- Morcego Humano usa força bruta (garras e dentes)

-- Inserir associação entre vilão e veículo
INSERT INTO Vilao_Veiculo (ID_Vilao, ID_Veiculo)
VALUES
(1, 1); -- Coringa usa um carro

INSERT INTO Vilao_Veiculo (ID_Vilao, ID_Veiculo)
VALUES
(2, 2); -- Mulher Gato usa uma moto

INSERT INTO Vilao_Veiculo (ID_Vilao, ID_Veiculo)
VALUES
(5, 3); -- Vagalume usa uma mochila a jato

INSERT INTO Vilao_Veiculo (ID_Vilao, ID_Veiculo)
VALUES
(6, 4); -- Exterminador usa um avião

INSERT INTO Vilao_Veiculo (ID_Vilao, ID_Veiculo)
VALUES
(7, 5); -- Morcego Humano usa suas asas

-- Verificar se as inserções foram feitas corretamente
SELECT * FROM Vilao;
SELECT * FROM Arma;
SELECT * FROM Veiculo;
SELECT * FROM Vilao_Arma;
SELECT * FROM Vilao_Veiculo;

-- Criar um exemplo de consulta com JOIN para obter detalhes completos de vilões, suas armas e veículos
SELECT v.Nome_Vilao, v.Nome_Verdadeiro, l.Nome_Localizacao, a.Tipo_Arma, ve.Tipo_Veiculo
FROM Vilao v
JOIN Localizacao l ON v.Localizacao = l.ID_Localizacao
LEFT JOIN Vilao_Arma va ON v.ID_Vilao = va.ID_Vilao
LEFT JOIN Arma a ON va.ID_Arma = a.ID_Arma
LEFT JOIN Vilao_Veiculo vv ON v.ID_Vilao = vv.ID_Vilao
LEFT JOIN Veiculo ve ON vv.ID_Veiculo = ve.ID_Veiculo;
