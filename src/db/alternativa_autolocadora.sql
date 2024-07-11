-- Criar o banco de dados se não existir
CREATE DATABASE IF NOT EXISTS alternativa_autolocadora;

-- Usar o banco de dados criado
USE alternativa_autolocadora;

-- Criar a tabela endereco
CREATE TABLE IF NOT EXISTS endereco (
    endereco_id INT AUTO_INCREMENT PRIMARY KEY,
    rua VARCHAR(100) NOT NULL,
    numero VARCHAR(10) NOT NULL,
    complemento VARCHAR(50),
    bairro VARCHAR(50),
    cep VARCHAR (10) NOT NULL,
    cidade VARCHAR(50) NOT NULL,
    estado VARCHAR(50) NOT NULL,
    pais VARCHAR(50) NOT NULL
);

-- Criar a tabela situacao
CREATE TABLE IF NOT EXISTS situacao (
    situacao_id INT AUTO_INCREMENT PRIMARY KEY,
    descricao VARCHAR(50) NOT NULL
);

-- Inserir valores iniciais na tabela situacao se não existirem
INSERT INTO situacao (descricao) 
SELECT * FROM (SELECT 'disponível' AS descricao) AS tmp
WHERE NOT EXISTS (SELECT descricao FROM situacao WHERE descricao = 'disponível')
UNION ALL
SELECT * FROM (SELECT 'alugado' AS descricao) AS tmp
WHERE NOT EXISTS (SELECT descricao FROM situacao WHERE descricao = 'alugado')
UNION ALL
SELECT * FROM (SELECT 'manutenção' AS descricao) AS tmp
WHERE NOT EXISTS (SELECT descricao FROM situacao WHERE descricao = 'manutenção');

-- Criar a tabela veiculo
CREATE TABLE IF NOT EXISTS veiculo (
    veiculo_id INT AUTO_INCREMENT PRIMARY KEY,
    marca VARCHAR(50) NOT NULL,
    modelo VARCHAR(50) NOT NULL,
    ano INT NOT NULL,
    placa VARCHAR(10) NOT NULL UNIQUE,
    cor VARCHAR (50) NOT NULL,
    valor_diaria DECIMAL(10, 2) NOT NULL,
    situacao_id INT,
    FOREIGN KEY (situacao_id) REFERENCES situacao(situacao_id) DEFAULT 1 -- 1 representando 'disponível'
);

-- Criar a tabela cliente
CREATE TABLE IF NOT EXISTS cliente (
    cliente_id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf_cnpj VARCHAR (100) NOT NULL,
    telefone VARCHAR(20) NOT NULL,
    email VARCHAR(100) NOT NULL,
    cnh INT (20) NOT NULL,
    endereco_id INT,
    FOREIGN KEY (endereco_id) REFERENCES endereco(endereco_id)
);

-- Criar a tabela locacao
CREATE TABLE IF NOT EXISTS locacao (
    locacao_id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT,
    veiculo_id INT,
    data_inicio DATE NOT NULL,
    data_fim DATE,
    valor_total DECIMAL(10, 2),
    FOREIGN KEY (cliente_id) REFERENCES cliente(cliente_id),
    FOREIGN KEY (veiculo_id) REFERENCES veiculo(veiculo_id)
);

-- Criar a tabela pagamento
CREATE TABLE IF NOT EXISTS pagamento (
    pagamento_id INT AUTO_INCREMENT PRIMARY KEY,
    locacao_id INT,
    data_pagamento DATE NOT NULL,
    valor_pago DECIMAL(10, 2) NOT NULL,
    metodo_pagamento VARCHAR(50) NOT NULL,
    FOREIGN KEY (locacao_id) REFERENCES locacao(locacao_id)
);

-- Criar a tabela perfis_acesso
CREATE TABLE IF NOT EXISTS perfis_acesso (
    perfil_id INT AUTO_INCREMENT PRIMARY KEY,
    nome_perfil VARCHAR(50) NOT NULL,
    descricao VARCHAR(255)
);

-- Criar a tabela usuarios
CREATE TABLE IF NOT EXISTS usuarios (
    usuario_id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    senha VARCHAR(255) NOT NULL,
    perfil_id INT,
    FOREIGN KEY (perfil_id) REFERENCES perfis_acesso(perfil_id)
);
