-- Criação do banco de dados (caso ainda não exista)
CREATE DATABASE IF NOT EXISTS hotel
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_unicode_ci;
USE hotel;

-- Criação da tabela "hotel"
CREATE TABLE IF NOT EXISTS hotel (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    stars INT NOT NULL,
    address VARCHAR(255) NOT NULL,
    city VARCHAR(100) NOT NULL,
    country VARCHAR(50) NOT NULL
) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;


CREATE TABLE IF NOT EXISTS regime (
    id INT AUTO_INCREMENT PRIMARY KEY,
    type VARCHAR(50) NOT NULL,
    price DECIMAL(10,2) NOT NULL
) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;


CREATE TABLE IF NOT EXISTS room_type (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description VARCHAR(255),
    capacity INT NOT NULL
) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;


CREATE TABLE IF NOT EXISTS guest (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    id_card VARCHAR(20) NOT NULL,
    phone VARCHAR(20) NOT NULL,
    address VARCHAR(255) NOT NULL,
    country VARCHAR(50) NOT NULL
) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;




-- CriaÃ§Ã£o da tabela "quarto"
CREATE TABLE IF NOT EXISTS room (
    id INT AUTO_INCREMENT PRIMARY KEY,
    hotel_id INT NOT NULL,
    room_type_id INT NOT NULL,
    number INT NOT NULL,
    price DECIMAL(10,2) NOT NULL, 
    CONSTRAINT FK_room_hotel FOREIGN KEY (hotel_id) REFERENCES hotel(id),
    CONSTRAINT FK_room_type FOREIGN KEY (room_type_id) REFERENCES room_type(id),
    CONSTRAINT UC_room UNIQUE (hotel_id, number)
) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS reservation (
    id INT AUTO_INCREMENT PRIMARY KEY,
    date DATE NOT NULL,
    booking_method VARCHAR(20) NOT NULL, 
    guest_count INT NOT NULL, -- num_hospede 
    credit_card VARCHAR(20) NOT NULL, 
    guest_name VARCHAR(150), 
    address VARCHAR(255) NOT NULL, 
    contact_phone VARCHAR(20) NOT NULL, 
    guest_id INT,
    CONSTRAINT FK_reservation_guest FOREIGN KEY (guest_id) REFERENCES guest(id)
) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS reservation_guest (
    id INT AUTO_INCREMENT PRIMARY KEY,
    guest_id INT,
    reservation_id INT,
    room_id INT,
    check_in DATE NOT NULL, 
    nights INT NOT NULL, 
    regime_id INT,
    CONSTRAINT FK_reservation_guest_guest FOREIGN KEY (guest_id) REFERENCES guest(id),
    CONSTRAINT FK_reservation_guest_reservation FOREIGN KEY (reservation_id) REFERENCES reservation(id),
    CONSTRAINT FK_reservation_guest_room FOREIGN KEY (room_id) REFERENCES room(id),
    CONSTRAINT FK_reservation_guest_regime FOREIGN KEY (regime_id) REFERENCES regime(id)
) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;


-- CriaÃ§Ã£o da tabela "restaurante"
CREATE TABLE IF NOT EXISTS restaurant (
    id INT AUTO_INCREMENT PRIMARY KEY,
    hotel_id INT,
    name VARCHAR(255) NOT NULL,
    category VARCHAR(16) NOT NULL,
    meal_type VARCHAR(50) NOT NULL, 
    CONSTRAINT FK_restaurant_hotel FOREIGN KEY (hotel_id) REFERENCES hotel(id)
) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CriaÃ§Ã£o da tabela "servico"
CREATE TABLE IF NOT EXISTS service (
    id INT AUTO_INCREMENT PRIMARY KEY,
    hotel_id INT,
    name VARCHAR(255) NOT NULL,
    CONSTRAINT FK_service_hotel FOREIGN KEY (hotel_id) REFERENCES hotel(id)
) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;


CREATE TABLE IF NOT EXISTS reservations (
    id INT AUTO_INCREMENT PRIMARY KEY,
    guest_id INT NOT NULL,
    hotel_id INT NOT NULL,  
    room_id INT NOT NULL,
    room_type_id INT NOT NULL,  
    check_in DATE NOT NULL,
    nights INT NOT NULL,
    regime_id INT NOT NULL,
    booking_method VARCHAR(20) NOT NULL,
    guest_count INT NOT NULL,
    credit_card VARCHAR(20) NOT NULL,
    address VARCHAR(255) NOT NULL,
    contact_phone VARCHAR(20) NOT NULL,
    date DATE NOT NULL,
    guest_name VARCHAR(150) NOT NULL,
    FOREIGN KEY (guest_id) REFERENCES guest(id),
    FOREIGN KEY (room_id) REFERENCES room(id),
    FOREIGN KEY (hotel_id) REFERENCES hotel(id),  
    FOREIGN KEY (room_type_id) REFERENCES room_type(id),  
    FOREIGN KEY (regime_id) REFERENCES regime(id)
) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;


