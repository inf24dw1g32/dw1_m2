-- Criação do banco de dados (caso ainda não exista)
CREATE DATABASE IF NOT EXISTS hotel;
USE hotel;

-- Criação da tabela "hotel"
CREATE TABLE hotel (
    hotel_id INT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    estrelas INT NOT NULL,
    morada VARCHAR(255) NOT NULL,
    cidade VARCHAR(100) NOT NULL,
    pais VARCHAR(50) NOT NULL
);

-- Criação da tabela "regime"
CREATE TABLE regime (
    regime_id INT PRIMARY KEY,
    tipo_regime VARCHAR(50) NOT NULL,
    preco_regime DECIMAL(10,2) NOT NULL
);

-- Criação da tabela "tipo_quarto"
CREATE TABLE tipo_quarto (
    tipo_quarto_id INT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    descricao VARCHAR(255) NOT NULL,
    capacidade INT NOT NULL
);

-- Criação da tabela "hospede"
CREATE TABLE hospede (
    hospede_id INT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    num_bi VARCHAR(20) NOT NULL,
    telefone VARCHAR(20) NOT NULL,
    morada VARCHAR(255) NOT NULL,
    pais VARCHAR(50) NOT NULL
);

-- Criação da tabela "reserva"
CREATE TABLE reserva (
    reserva_id INT PRIMARY KEY,
    data_reserva DATE NOT NULL,
    modo_reserva VARCHAR(20) NOT NULL,
    num_hospede INT NOT NULL,
    cartao_credito VARCHAR(20) NOT NULL,
    nome_hospede VARCHAR(150),
    morada_reserva VARCHAR(255) NOT NULL,
    telefone_contato VARCHAR(20) NOT NULL,
    hospede_id INT,
    CONSTRAINT FK_reserva_hospede_id FOREIGN KEY (hospede_id) REFERENCES hospede(hospede_id)
);

-- Criação da tabela "quarto"
CREATE TABLE quarto (
    quarto_id INT PRIMARY KEY,
    hotel_id INT NOT NULL,
    tipo_quarto_id INT NOT NULL,
    numero INT NOT NULL,
    preco_quarto_diaria DECIMAL(10,2) NOT NULL,
    CONSTRAINT FK_quarto_hotel_id FOREIGN KEY (hotel_id) REFERENCES hotel(hotel_id),
    CONSTRAINT FK_quarto_tipo_quarto_id FOREIGN KEY (tipo_quarto_id) REFERENCES tipo_quarto(tipo_quarto_id),
    CONSTRAINT UC_quarto UNIQUE (hotel_id, numero)
);

-- Criação da tabela "reserva_hospede"
CREATE TABLE reserva_hospede (
    reserva_hospede_id INT PRIMARY KEY,
    hospede_id INT,
    reserva_id INT,
    quarto_id INT,
    data_entrada DATE NOT NULL,
    num_noite INT NOT NULL,
    regime_id INT,
    CONSTRAINT FK_reserva_hospede_hospede_id FOREIGN KEY (hospede_id) REFERENCES hospede(hospede_id),
    CONSTRAINT FK_reserva_hospede_reserva_id FOREIGN KEY (reserva_id) REFERENCES reserva(reserva_id),
    CONSTRAINT FK_reserva_hospede_quarto_id FOREIGN KEY (quarto_id) REFERENCES quarto(quarto_id),
    CONSTRAINT FK_reserva_hospede_regime_id FOREIGN KEY (regime_id) REFERENCES regime(regime_id)
);

-- Criação da tabela "restaurante"
CREATE TABLE restaurante (
    restaurante_id INT PRIMARY KEY,
    hotel_id INT,
    nome VARCHAR(255) NOT NULL,
    categoria VARCHAR(16) NOT NULL,
    tipo_refeicao VARCHAR(50) NOT NULL,
    CONSTRAINT FK_restaurante_hotel_id FOREIGN KEY (hotel_id) REFERENCES hotel(hotel_id)
);

-- Criação da tabela "servico"
CREATE TABLE servico (
    servico_id INT PRIMARY KEY,
    hotel_id INT,
    nome VARCHAR(255) NOT NULL,
    CONSTRAINT FK_servico_hotel_id FOREIGN KEY (hotel_id) REFERENCES hotel(hotel_id)
);
