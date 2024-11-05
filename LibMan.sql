create database library_db;
use library_db;

-- Tạo bảng tblNguoidung447 (1)
CREATE TABLE tblNguoidung447 (
    id INT PRIMARY KEY AUTO_INCREMENT,
    tendangnhap VARCHAR(255) NOT NULL UNIQUE,
    matkhau VARCHAR(255) NOT NULL,
    hoten VARCHAR(255),
    ngaysinh DATE,
    gioitinh TINYINT(1),
    email VARCHAR(255),
    sodienthoai VARCHAR(255),
    diachi VARCHAR(255),
    vaitro VARCHAR(255)
);

INSERT INTO tblNguoidung447 (tendangnhap, matkhau, hoten, ngaysinh, gioitinh, email, sodienthoai, diachi, vaitro) 
VALUES ('huynh', '123', 'Huynh', '2003-03-20', 1, 'huynh@gmail.com', '0123456789', 'Hà Nội', 'Doc gia');

INSERT INTO tblNguoidung447 (tendangnhap, matkhau, hoten, ngaysinh, gioitinh, email, sodienthoai, diachi, vaitro) 
VALUES ('nam', '123', 'Nam', '2000-01-06', 1, 'nam@gmail.com', '0345165987', 'Thanh Hóa', 'Doc gia');

INSERT INTO tblNguoidung447 (tendangnhap, matkhau, hoten, ngaysinh, gioitinh, email, sodienthoai, diachi, vaitro) 
VALUES ('tung', '123', 'Tùng', '2003-03-19', 1, 'tung@gmail.com', '0346518616', 'Thanh Hóa', 'Doc gia');

INSERT INTO tblnguoidung447 (tendangnhap, matkhau, hoten, ngaysinh, gioitinh, email, sodienthoai, diachi, vaitro) 
VALUES ('nhi', '123', 'Nhi', '2003-01-19', 0, 'nhi@gmail.com', '0348948766', 'Nghệ An', 'Doc gia');

INSERT INTO tblNguoidung447 (tendangnhap, matkhau, hoten, ngaysinh, gioitinh, email, sodienthoai, diachi, vaitro) 
VALUES ('admin', '123', 'Trần Thị B', '1985-01-01', 0, 'admin@example.com', '0987654321', 'Hà Nội', 'Nhan vien');

select * from tblNguoidung447;
drop table tblNguoidung447;
drop table tblDocgia447;
drop table tblNhaxuatban447;


-- Tạo bảng tblThuvien447 (2)
CREATE TABLE tblThuvien447 (
    id integer(10) PRIMARY KEY AUTO_INCREMENT,
    ten varchar(255),
    mota varchar(255)
);
insert into tblThuvien447 (ten, mota) values ('Học viện Công nghệ Bưu chính Viễn thông', 'Học viện hoàng gia');
select * from tblThuvien447;
drop table tblThuvien447;

-- Tạo bảng tblNhaxuatban447 (3)
CREATE TABLE tblNhaxuatban447 (
    id integer(10) PRIMARY KEY AUTO_INCREMENT,
    ten varchar(255),
    mota varchar(255),
    diachi varchar(255)
);
INSERT INTO tblNhaxuatban447 (ten, mota, diachi) VALUES ('Học viện Công nghệ Bưu chính Viễn thông', 'HVCNBCVT', 'Km10, Đường Nguyễn Trãi, Q. Hà Đông, Hà Nội');
INSERT INTO tblNhaxuatban447 (ten, mota, diachi) VALUES ('Chính trị Quốc gia Sự thật', 'Sự thật', '6/86 Duy Tân, Cầu Giấy, Hà Nội');
INSERT INTO tblNhaxuatban447 (ten, mota, diachi) VALUES ('Kim Đồng', 'Kim Đồng', '55 Quang Trung, Hà Nội, Việt Nam');
INSERT INTO tblNhaxuatban447 (ten, mota, diachi) VALUES ('Hồng Đức', 'Hồng Đức', '65 Tràng Thi, Hà Nội');
INSERT INTO tblNhaxuatban447 (ten, mota, diachi) VALUES ('Thời đại', 'Thời đại', 'Nhà B15, Lô 2, Mỹ Đình 1, Từ Liêm, Hà Nội');
select * from tblNhaxuatban447;


-- Tạo bảng tblNhacungcap447 (4)
CREATE TABLE tblNhacungcap447 (
    id integer(10) PRIMARY KEY AUTO_INCREMENT,
    ten varchar(255),
    mota varchar(255),
    diachi varchar(255)
);

insert into tblNhacungcap447 (ten, mota, diachi) values ('Mộ Lao', 'Hà Đông', 'Mộ Lao, Hà Đông, Hà Nội');
insert into tblNhacungcap447 (ten, mota, diachi) values ('Văn Quán', 'Hà Đông', 'Văn Quán, Hà Đông, Hà Nội');
insert into tblNhacungcap447 (ten, mota, diachi) values ('La Khê', 'Hà Đông', 'La Khê, Hà Đông, Hà Nội');
insert into tblNhacungcap447 (ten, mota, diachi) values ('Văn Khê', 'Hà Đông', 'Văn Khê, Hà Đông, Hà Nội');
insert into tblNhacungcap447 (ten, mota, diachi) values ('Yên Nghĩa', 'Hà Đông', 'Yên Nghĩa, Hà Đông, Hà Nội');
select * from tblNhacungcap447;
drop table tblNhacungcap447;

-- Tạo bảng tblDocgia447 (5)
CREATE TABLE tblDocgia447 (
    tblNguoidung447id integer(10),
    FOREIGN KEY (tblNguoidung447id) REFERENCES tblNguoidung447(id)
);
insert into tblDocgia447 (tblNguoidung447id) values (1);
insert into tblDocgia447 (tblNguoidung447id) values (2);
insert into tblDocgia447 (tblNguoidung447id) values (3);
insert into tblDocgia447 (tblNguoidung447id) values (4);
select * from tblDocgia447;
drop table tblDocgia447;

-- Tạo bảng tblNhanvien447 (6)
CREATE TABLE tblNhanvien447 (
    vitri varchar(255),
    tblNguoidung447id integer(10),
    FOREIGN KEY (tblNguoidung447id) REFERENCES tblNguoidung447(id)
);
insert into tblNhanvien447 (vitri, tblNguoidung447id) values ('Nhân viên thư viện', 5);
select * from tblNhanvien447;
drop table tblNhanvien447;

-- Tạo bảng tblNhanvienthuvien447 (7)
CREATE TABLE tblNhanvienthuvien447 (
    tblNhanvien447id integer(10),
    tblThuvien447id integer(10),
    FOREIGN KEY (tblNhanvien447id) REFERENCES tblNhanvien447(tblNguoidung447id),
    FOREIGN KEY (tblThuvien447id) REFERENCES tblThuvien447(id)
);
insert into tblNhanvienthuvien447 (tblNhanvien447id, tblThuvien447id) values (5, 1);
select * from tblNhanvienthuvien447;
drop table tblNhanvienthuvien447;


-- Tạo bảng tblTailieu447 (8)
CREATE TABLE tblTailieu447 (
    id integer(10) PRIMARY KEY AUTO_INCREMENT,
    ten varchar(255),
    namxuatban integer(10),
    sotrang integer(10),
    soluongcosan integer(10),
    ngonngu varchar(255),
    theloai varchar(255),
    tblNhaxuatban447id integer(10),
    FOREIGN KEY (tblNhaxuatban447id) REFERENCES tblNhaxuatban447(id)
);
insert into tblTailieu447 (ten, namxuatban, sotrang, soluongcosan, ngonngu, theloai, tblNhaxuatban447id) values
('An toàn và bảo mật hệ thống thông tin', 2017, 152, 30, 'Tiếng Việt', 'Giáo trình', 1),
('Giáo dục thể chất 1', 2019, 111, 20, 'Tiếng Việt', 'Giáo trình', 1),
('Giao tiếp trong kinh doanh', 2020, 112, 25, 'Tiếng Việt', 'Giáo trình', 1),
('Lập trình hướng đối tượng', 2020, 250, 40, 'Tiếng Việt', 'Giáo trình', 1),
('Lập trình mạng', 2020, 248, 50, 'Tiếng Việt', 'Giáo trình', 1),
('Ngôn ngữ lập trình C++', 2020, 296, 100, 'Tiếng Việt', 'Giáo trình', 1),
('Ngôn ngữ lập trình Java', 2019, 130, 50, 'Tiếng Việt', 'Giáo trình', 1),
('Thực hành cần, kiệm, liêm, chính', 2024, 240, 5, 'Tiếng Việt', 'Sách Chủ tịch Hồ Chí Minh viết', 2),
('Nhật ký của một bộ trưởng', 2023, 714, 30, 'Tiếng Việt', 'Lịch sử', 2),
('Chứng nhân lịch sử', 2023, 394, 35, 'Tiếng Việt', 'Lịch sử', 2),
('Mưu lược Mao Trạch Đông', 2016, 554, 21, 'Tiếng Việt', 'Lịch sử', 2),
('Chuyện kể lúc hoàng hôn', 2020, 180, 30, 'Tiếng Anh', 'Kinh dị', 3),
('Lô số 249', 2020, 504, 35, 'Tiếng Anh', 'Kinh dị', 3),
('Think And Grow Rich', 2021, 425, 10, 'Tiếng Anh', 'Sách tự lực', 4),
('Okitegami Kyoko I', 2020, 396, 10, 'Tiếng Nhật', 'Tiểu thuyết', 4),
('Chiến dịch Hồ Chí Minh giữa lòng Paris', 2020, 252, 40, 'Tiếng Pháp', 'Hồi ký', 5),
('Giáo trình chuẩn HSK1', 2023, 141, 5, 'Tiếng Trung Quốc', 'Giáo trình', 5);
SELECT * FROM tblTailieu447 WHERE ten LIKE '%a%';
truncate table tblTailieu447;
drop table tblTailieu447;

-- Tạo bảng tblHoadoncungcap447 (9)
create table tblHoadoncungcap447 (
	id integer(10) primary key auto_increment,
    tblNhacungcap447id integer(10)
);
insert into tblHoadoncungcap447 (tblNhacungcap447id) values 
(1), (1), (1), (1), (2), (1), (3), (4), (2), (3), (1), (2);
select * from tblHoadoncungcap447;

-- Tạo bảng tblChitietHoadon447 (10)
create table tblChitietHoadon447 (
	id integer(10) primary key auto_increment,
    tblHoadonCungcap447id integer(10),
    tblTailieu447id integer(10)
);
insert into tblChitietHoadon447 (tblHoadonCungcap447id, tblTailieu447id) values
(1, 1), (2, 1), (3, 2), (4, 3), (3, 5), (4, 5), (1, 6), (2, 7), (4, 8), (1, 9), (1, 10);
select * from tblChitietHoadon447;

-- Tạo bảng tblTacgia447 (11)
CREATE TABLE tblTacgia447 (
    id integer(10) PRIMARY KEY AUTO_INCREMENT,
    ten varchar(255),
    mota varchar(255),
    diachi varchar(255)
);
insert into tblTacgia447 (ten, mota, diachi) values
('Hoàng Xuân Dậu', 'Hoàng Xuân Dậu', 'Hà Nội'),
('Nguyễn Đức Thịnh', 'Nguyễn Đức Thịnh', 'Hà Nội'),
('Nguyễn Thị Minh An', 'Nguyễn Thị Minh An', 'Hà Nội'),
('Nguyễn Mạnh Sơn', 'Nguyễn Mạnh Sơn', 'Hà Nội'),
('Nguyễn Mạnh Hùng', 'Nguyễn Mạnh Hùng', 'Hà Nội'),
('Nguyễn Duy Phương', 'Nguyễn Duy Phương', 'Hà Nội'),
('Vũ Hữu Tiến', 'Vũ Hữu Tiến', 'Hà Nội'),
('Đỗ Thị Liên', 'Đỗ Thị Liên', 'Hà Nội'),
('Hồ Chí Minh', 'Hồ Chí Minh', 'Hà Nội'),
('Lê Văn Hiến', 'Lê Văn Hiến', 'Hà Nội'),
('Tạ Ngọc Tấn', 'Tạ Ngọc Tấn', 'Phú Thọ'),
('Tiêu Thi Mỹ', 'Tiêu Thi Mỹ', 'Trung Quốc'),
('Charles Dickens', 'Charles Dickens', 'Anh'),
('Arthur Conan Doyle', 'Arthur Conan Doyle', 'Anh'),
('Napoleon Hill', 'Napoleon Hill', 'Hoa Kỳ'),
('NISIOSIN', 'NISIOSIN', 'Nhật Bản'),
('Võ Văn Sung', 'Võ Văn Sung', 'Huế'),
('HANBAN', 'HANBAN', 'Trung Quốc');
select * from tblTacgia447;
truncate table tblTacgia447;
drop table tblTacgia447;

-- Tạo bảng tblTacgiaTailieu447 (12)
CREATE TABLE tblTacgiaTailieu447 (
    id integer(10) PRIMARY KEY AUTO_INCREMENT,
    tblTailieu447id integer(10),
    tblTacgia447id integer(10),
    FOREIGN KEY (tblTailieu447id) REFERENCES tblTailieu447(id),
    FOREIGN KEY (tblTacgia447id) REFERENCES tblTacgia447(id)
);
insert into tblTacgiaTailieu447 (tblTailieu447id, tblTacgia447id) values
(1, 1), (2, 2), (3, 3), (4, 4), (4, 5), (5, 5), (6, 5), (7, 6), (8, 7), (9, 8), (10, 9), (11, 10), (12, 11), (13, 12), (14, 13), (15, 14), (16, 15), (17, 16);
select * from tblTacgiaTailieu447;
drop table tblTacgiaTailieu447;

select * from tblTacgiaTailieu447;
truncate table tblTacgiaTailieu447;
drop table tblTacgiaTailieu447;

-- Tạo bảng tblTheThuvien447 (13)
CREATE TABLE tblTheThuvien447 (
    anhthe varchar(255),
    ngaydangky date,
    tblDocgia447id integer(10) PRIMARY KEY,
    FOREIGN KEY (tblDocgia447id) REFERENCES tblDocgia447(id)
);
drop table tblTheThuvien447;

-- Tạo bảng tblPhieumuon447 (14)
CREATE TABLE tblPhieumuon447 (
    id integer(10) PRIMARY KEY AUTO_INCREMENT,
    tblNhanvienthuvien447id integer(10),
    tblDocgia447id integer(10),
    FOREIGN KEY (tblNhanvienthuvien447id) REFERENCES tblNhanvienthuvien447(tblNhanvien447id),
    FOREIGN KEY (tblDocgia447id) REFERENCES tblDocgia447(tblNguoidung447id)
);
insert into tblPhieumuon447 (tblNhanvienthuvien447id, tblDocgia447id) values
(5, 1), (5, 2), (5, 1), (5, 3), (5, 1), (5, 4), (5, 2), (5, 3), (5, 4);
select * from tblPhieumuon447;
drop table tblPhieumuon447;


-- Tạo bảng tblChitietPhieumuon447 (15)
CREATE TABLE tblChitietPhieumuon447 (
    id integer(10) PRIMARY KEY AUTO_INCREMENT,
    tblTailieu447id integer(10),
    tblPhieumuon447id integer(10),
    FOREIGN KEY (tblTailieu447id) REFERENCES tblTailieu447(id),
    FOREIGN KEY (tblPhieumuon447id) REFERENCES tblPhieumuon447(id)
);
insert into tblChitietPhieumuon447 (tblTailieu447id, tblPhieumuon447id) values
(1, 4), (2, 5), (3, 9), (3, 2), (2, 4), (2, 7), (5, 2), (6, 3), (5, 6), (1, 4), (5, 5);
select * from tblChitietPhieumuon447;
drop table tblChitietphieumuon447;

drop database library_db;
