
CREATE DATABASE store_management;
USE store_management;

create table product (
		id int primary key auto_increment,
        name varchar(50) not null,
        description varchar(150) null,
        price DECIMAL(15,2) NULL,
        stock int null
);
INSERT INTO product VALUES 
(NULL, 'Chuột không dây Logitech M331', 'Chuột êm, tiết kiệm pin', 350000, 20);

INSERT INTO product (name, description, price, stock) 
VALUES ('Bàn phím cơ Keychron K2', 'Switch Red, Bluetooth', 2300000, 15);

INSERT INTO product (name) 
VALUES ('Tai nghe Apple');
--- Liệt kê toàn bộ thông tin của product ---
SELECT * FROM product;

--- Liệt kê id, name, và price của tất cả sản phẩm ---
SELECT id, name, price FROM product;

--- Liệt kê id, name, và price của các sản phẩm có giá dưới 10 triệu ---
SELECT id, name, price 
FROM product 
WHERE price < 10000000;

---- Cập Nhật Dữ Liệu ----
--- Sử dụng lệnh mà không có điều kiện WHERE ---
SET SQL_SAFE_UPDATES = 0;
UPDATE product
SET stock = 30;
SET SQL_SAFE_UPDATES = 1;

--- Sử dụng lệnh với điều kiện WHERE ---
SET SQL_SAFE_UPDATES = 0;
UPDATE product
SET price = 2500000
WHERE name = 'Bàn phím cơ Keychron K2';
SET SQL_SAFE_UPDATES = 1;

--- Chỉnh Sửa Bảng ---
--- Thêm trường Barcode với tất cả dữ liệu từ trước là NULL  ---
ALTER TABLE product
ADD COLUMN barcode VARCHAR(50) NULL;

--- Thêm trường Warranty với giá trị mặc định là 6 tháng ---
ALTER TABLE product
ADD COLUMN warranty VARCHAR(20) DEFAULT '6 tháng';

--- Xóa Dữ Liệu ---
--- Sử dụng lệnh mà không có điều kiện WHERE ---
SET SQL_SAFE_UPDATES = 0;
DELETE FROM product;
SET SQL_SAFE_UPDATES = 1;

--- Sử dụng lệnh với điều kiện WHERE ---
DELETE FROM product 
WHERE name = 'Ổ cứng SSD';

--- Xóa Bảng ---
DROP TABLE product;
 
 --- Xóa Cơ Sở Dữ Liệu ---
 --- Xóa mà không có điều kiện (Lỗi xảy ra nếu database không tồn tại) ---
 DROP DATABASE store_management;
 
 --- Xóa bằng cách kiểm tra database đã tồn tại chưa rồi tiến hành xóa ---
 DROP DATABASE IF EXISTS store_management;





