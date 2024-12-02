-- Criação do banco de dados (caso ainda não exista)
CREATE DATABASE IF NOT EXISTS hotel;
USE hotel;

-- Criação da tabela "hotel"
CREATE TABLE IF NOT EXISTS hotel (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    stars INT NOT NULL,
    address VARCHAR(255) NOT NULL,
    city VARCHAR(100) NOT NULL,
    country VARCHAR(50) NOT NULL
);


CREATE TABLE IF NOT EXISTS regime (
    id INT AUTO_INCREMENT PRIMARY KEY,
    type VARCHAR(50) NOT NULL,
    price DECIMAL(10,2) NOT NULL
);


CREATE TABLE IF NOT EXISTS room_type (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description VARCHAR(255),
    capacity INT NOT NULL
);


CREATE TABLE IF NOT EXISTS guest (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    id_card VARCHAR(20) NOT NULL,
    phone VARCHAR(20) NOT NULL,
    address VARCHAR(255) NOT NULL,
    country VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS reservation (
    id INT AUTO_INCREMENT PRIMARY KEY,
    guest_id INT NOT NULL,
    room_id INT NOT NULL,
    check_in DATE NOT NULL,
    nights INT NOT NULL,
    regime_id INT NOT NULL,
    booking_method VARCHAR(20) NOT NULL,
    guest_count INT NOT NULL,
    credit_card VARCHAR(20) NOT NULL,
    address VARCHAR(255) NOT NULL,
    contact_phone VARCHAR(20) NOT NULL,
    date DATE NOT NULL,
    guest_name VARCHAR(150),
    FOREIGN KEY (guest_id) REFERENCES guest(id),
    FOREIGN KEY (room_id) REFERENCES room(id),
    FOREIGN KEY (regime_id) REFERENCES regime(id)
);

-- Criação da tabela "quarto"
CREATE TABLE IF NOT EXISTS room (
    id INT AUTO_INCREMENT PRIMARY KEY,
    hotel_id INT NOT NULL,
    room_type_id INT NOT NULL,
    number INT NOT NULL,
    price DECIMAL(10,2) NOT NULL, 
    CONSTRAINT FK_room_hotel FOREIGN KEY (hotel_id) REFERENCES hotel(id),
    CONSTRAINT FK_room_type FOREIGN KEY (room_type_id) REFERENCES room_type(id),
    CONSTRAINT UC_room UNIQUE (hotel_id, number)
);


-- Criação da tabela "restaurante"
CREATE TABLE IF NOT EXISTS restaurant (
    id INT AUTO_INCREMENT PRIMARY KEY,
    hotel_id INT,
    name VARCHAR(255) NOT NULL,
    category VARCHAR(16) NOT NULL,
    meal_type VARCHAR(50) NOT NULL,
    CONSTRAINT FK_restaurant_hotel FOREIGN KEY (hotel_id) REFERENCES hotel(id)
);

-- Criação da tabela "servico"
CREATE TABLE IF NOT EXISTS service (
    id INT AUTO_INCREMENT PRIMARY KEY,
    hotel_id INT,
    name VARCHAR(255) NOT NULL,
    CONSTRAINT FK_service_hotel FOREIGN KEY (hotel_id) REFERENCES hotel(id)
);


CREATE TABLE IF NOT EXISTS reservations (
    id INT PRIMARY KEY,
    guest_id INT NOT NULL,
    room_id INT NOT NULL,
    check_in DATE NOT NULL,
    nights INT NOT NULL,
    regime_id INT NOT NULL,
    booking_method VARCHAR(20) NOT NULL,
    guest_count INT NOT NULL,
    credit_card VARCHAR(20) NOT NULL,
    address VARCHAR(255) NOT NULL,
    contact_phone VARCHAR(20) NOT NULL,
    date DATE NOT NULL,
    guest_name VARCHAR(150) NOT NULL
);
