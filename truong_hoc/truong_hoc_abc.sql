CREATE DATABASE truong_abc;
USE truong_abc;

CREATE TABLE giao_vien (
    id_giao_vien INT PRIMARY KEY AUTO_INCREMENT,
    ten VARCHAR(255) NOT NULL
);

CREATE TABLE hoc_sinh (
    id_hoc_sinh INT PRIMARY KEY AUTO_INCREMENT,
    ten VARCHAR(255) NOT NULL,
    giao_vien_id INT,
    FOREIGN KEY (giao_vien_id) REFERENCES giao_vien(id_giao_vien)
);




