-- Remover chaves estrangeiras existentes
ALTER TABLE Vilao_Arma DROP CONSTRAINT fk_vilao_arma_vilao;
ALTER TABLE Vilao_Arma DROP CONSTRAINT fk_vilao_arma_arma;

ALTER TABLE Vilao_Veiculo DROP CONSTRAINT fk_vilao_veiculo_vilao;
ALTER TABLE Vilao_Veiculo DROP CONSTRAINT fk_vilao_veiculo_veiculo;

ALTER TABLE Vilao DROP CONSTRAINT fk_localizacao;

-- Remover tabelas existentes
DROP TABLE Vilao_Arma CASCADE CONSTRAINTS;
DROP TABLE Vilao_Veiculo CASCADE CONSTRAINTS;
DROP TABLE Vilao CASCADE CONSTRAINTS;
DROP TABLE Arma CASCADE CONSTRAINTS;
DROP TABLE Veiculo CASCADE CONSTRAINTS;
DROP TABLE Localizacao CASCADE CONSTRAINTS;

-- Criar tabelas com suas constraints e relacionamentos

-- Tabela Localização
CREATE TABLE Localizacao (
    ID_Localizacao NUMBER PRIMARY KEY,
    Nome_Localizacao VARCHAR2(255) NOT NULL,
    Tipo_Localizacao VARCHAR2(50)
);

-- Tabela Vilão
CREATE TABLE Vilao (
    ID_Vilao NUMBER PRIMARY KEY,
    Nome_Vilao VARCHAR2(255) NOT NULL,
    Nome_Verdadeiro VARCHAR2(255),
    Localizacao NUMBER,
    Nivel_Periculosidade VARCHAR2(50),
    CONSTRAINT fk_localizacao FOREIGN KEY (Localizacao) REFERENCES Localizacao(ID_Localizacao) ON DELETE CASCADE
);

-- Tabela Arma
CREATE TABLE Arma (
    ID_Arma NUMBER PRIMARY KEY,
    Tipo_Arma VARCHAR2(255) NOT NULL,
    Descricao_Arma VARCHAR2(255)
);

-- Tabela Veículo
CREATE TABLE Veiculo (
    ID_Veiculo NUMBER PRIMARY KEY,
    Tipo_Veiculo VARCHAR2(255) NOT NULL,
    Descricao_Veiculo VARCHAR2(255)
);

-- Tabela de associação Vilão-Arma (muitos-para-muitos)
CREATE TABLE Vilao_Arma (
    ID_Vilao NUMBER,
    ID_Arma NUMBER,
    PRIMARY KEY (ID_Vilao, ID_Arma),
    CONSTRAINT fk_vilao_arma_vilao FOREIGN KEY (ID_Vilao) REFERENCES Vilao(ID_Vilao) ON DELETE CASCADE,
    CONSTRAINT fk_vilao_arma_arma FOREIGN KEY (ID_Arma) REFERENCES Arma(ID_Arma) ON DELETE CASCADE
);

-- Tabela de associação Vilão-Veículo (muitos-para-muitos)
CREATE TABLE Vilao_Veiculo (
    ID_Vilao NUMBER,
    ID_Veiculo NUMBER,
    PRIMARY KEY (ID_Vilao, ID_Veiculo),
    CONSTRAINT fk_vilao_veiculo_vilao FOREIGN KEY (ID_Vilao) REFERENCES Vilao(ID_Vilao) ON DELETE CASCADE,
    CONSTRAINT fk_vilao_veiculo_veiculo FOREIGN KEY (ID_Veiculo) REFERENCES Veiculo(ID_Veiculo) ON DELETE CASCADE
);
