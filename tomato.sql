CREATE DATABASE tomatoDB;
USE tomatoDB;


CREATE TABLE users (
    id INT(11) NOT NULL AUTO_INCREMENT ,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    role ENUM('admin','manager','user') NOT NULL DEFAULT 'user',
    is_verified TINYINT(1) DEFAULT 1,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
);


CREATE TABLE container (
    containerID INT(11) NOT NULL AUTO_INCREMENT,
    user_id INT(11) DEFAULT NULL,
    temperature DECIMAL(5,2) NOT NULL,
    humidity DECIMAL(5,2) NOT NULL,
    recorded_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (containerID)
);


CREATE TABLE user_activity_logs (
    id INT(11) NOT NULL AUTO_INCREMENT,
    user_id INT(11) NOT NULL,
    action VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
);



ALTER TABLE container
ADD CONSTRAINT fk_container_user
FOREIGN KEY (user_id)
REFERENCES users(id)
ON DELETE SET NULL
ON UPDATE CASCADE;



ALTER TABLE user_activity_logs
ADD CONSTRAINT fk_logs_user
FOREIGN KEY (user_id)
REFERENCES users(id)
ON DELETE CASCADE
ON UPDATE CASCADE;



INSERT INTO users (name, email, password, role) VALUES
('Sander Admin', 'admin@example.com', 'admin123', 'admin'),
('Trisha Manager', 'manager@example.com', 'manager123', 'manager'),
('Pauline User', 'user@example.com', 'user123', 'user');



INSERT INTO container (user_id, temperature, humidity) VALUES
(2, 25.50, 70.20),
(2, 26.10, 68.90),
(3, 24.75, 72.40);



INSERT INTO user_activity_logs (user_id, action) VALUES
(1, 'Logged in as admin'),
(2, 'Viewed dashboard'),
(3, 'Updated profile'),
(2, 'Added temperature record');