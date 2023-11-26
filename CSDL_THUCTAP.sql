IF EXISTS (SELECT * FROM SYSDATABASES WHERE NAME='THUCTAP')
	DROP DATABASE THUCTAP
CREATE DATABASE THUCTAP
USE THUCTAP
CREATE TABLE Khoa(
	makhoa char(10) PRIMARY KEY, 
	tenkhoa nvarchar(30), 
	dienthoai char(15)
) 
CREATE TABLE GiangVien(
	magv int PRIMARY KEY, 
	hotengv nvarchar(30), 
	luong decimal(8,2), 
	makhoa char(10),
	FOREIGN KEY (makhoa) REFERENCES Khoa(makhoa)
	ON UPDATE CASCADE ON DELETE CASCADE
)
CREATE TABLE SinhVien(
	masv int PRIMARY KEY, 
	hotensv nvarchar(50),
	makhoa char(10),
	namsinh int,
	quequan nvarchar(50)
	FOREIGN KEY(makhoa) REFERENCES Khoa(makhoa)
	ON UPDATE CASCADE ON DELETE CASCADE
)
CREATE TABLE DeTai(
	madt char(10) PRIMARY KEY, 
	tendt nvarchar(30), 
	kinhphi int, 
	NoiThucTap nvarchar(50)
)
CREATE TABLE HuongDan(
	masv int,
	madt char(10), 
	magv int, 
	ketqua decimal(5,2)
	PRIMARY KEY(masv, madt, magv)
	FOREIGN KEY(masv) REFERENCES SinhVien(masv) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY(madt) REFERENCES DeTai(madt)  ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY(magv) REFERENCES GiangVien(magv) 
)
--
INSERT INTO Khoa VALUES 
	('K001',N'Quản lý và tài nguyên','098765432'),
	('K002',N'Điện tử','088756754'),
	('K003',N'Công nghệ thông tin','034653546')
SELECT * FROM Khoa 
--
INSERT INTO SinhVien VALUES
	(1,N'Nguyễn Thị Hà','K001',2000,N'Hà Nội'),
	(2,N'Phạm Văn Hà','K001',2001,N'Hà Nam'),
	(3,N'Vũ Việt Thắng','K002',1990,N'Hà Nội'),
	(4,N'Nguyễn Thị Hải Dương','K003',2000,N'Hải Phòng'),
	(5,N'Trần Phương Hoa','K003',1999,N'Hà Nội')
SELECT * FROM SinhVien
--
INSERT INTO GiangVien VALUES
	(1,N'Đặng Đen Nhít', 3000,'K001'),
	(2,N'Hòa Min Di', 3000,'K002'),
	(3,N'Minh Đan Bin Rét', 5000,'K001'),
	(4,N'Nu Phước Thịnh', 3000,'K003'),
	(5,N'Trần Sơn', 3000,'K001')
SELECT * FROM GiangVien
--
INSERT INTO DeTai VALUES
	('DT001',N'Ca sĩ thời tik tok',5000,N'Hà Nội'),
	('DT002',N'I0T và ti tỉ thứ',3500,N'Hà Nội'),
	('DT003',N'Deep Learning trong y học',5000,N'Thanh Hóa'),
	('DT004',N'Chất bán dẫn chất liệu mới',6000,N'Hà Nội')
SELECT * FROM DeTai
--
INSERT INTO HuongDan VALUES
	(1,'DT001',1,7.5),
	(2,'DT001',1,7.5),
	(3,'DT002',2,7.5),
	(4,'DT002',3,7.5),
	(1,'DT004',3,7.5),
	(4,'DT004',2,7.5),
	(3,'DT004',4,7.5)
SELECT * FROM HuongDan
