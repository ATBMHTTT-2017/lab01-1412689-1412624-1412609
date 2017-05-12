------------------DROP---------------------
/*
Drop table ChiNhanh;
DROP TABLE NhanVien CASCADE CONSTRAINTS;
DROP TABLE ChiNhanh CASCADE CONSTRAINTS;
DROP TABLE PhongBan CASCADE CONSTRAINTS;
Drop table NhanVien;
Drop table PhanCong;
Drop table PhongBan;
Drop table ChiTieu;
Drop table DuAn;
*/

--Bang Chi Nhanh
CREATE TABLE ChiNhanh(
maCN VARCHAR2(8) NOT NULL,
tenCN VARCHAR2(50) NOT NULL,
truongChiNhanh VARCHAR2(8) NOT NULL
);

ALTER TABLE ChiNhanh
ADD CONSTRAINT PK_ChiNhanh
PRIMARY KEY(maCN);

--Bang Nhan Vien
CREATE TABLE NhanVien(
maNV VARCHAR2(8) NOT NULL,
hoTen VARCHAR2(50) NOT NULL,
diaChi VARCHAR2(100) NOT NULL,
dienThoai VARCHAR2(20),
email VARCHAR2(100),
maPhong VARCHAR2(8),
chiNhanh VARCHAR2(8),
luong FLOAT
);
ALTER TABLE NhanVien
ADD CONSTRAINT PK_NhanVien
PRIMARY KEY(maNV);

--Bang Phong Ban
CREATE TABLE PhongBan(
maPhong VARCHAR2(8) NOT NULL,
tenPhong VARCHAR2(50) NOT NULL,
truongPhong VARCHAR2(8) NOT NULL,
ngayNhamChuc VARCHAR2(50),
soNhanVien NUMBER,
chiNhanh VARCHAR2(8) NOT NULL
);
ALTER TABLE PhongBan
ADD CONSTRAINT PK_PhongBan
PRIMARY KEY(maPhong);

--Bang Du An
CREATE TABLE  DuAn(
maDA VARCHAR2(8) NOT NULL,
tenDA VARCHAR2(50) NOT NULL,
kinhPhi FLOAT,
phongChuTri VARCHAR2(8),
truongDA VARCHAR2(8)
);
ALTER TABLE DuAn
ADD CONSTRAINT PK_DuAn
PRIMARY KEY(maDA);

--B?ng Chi Tieu
CREATE TABLE ChiTieu(
maChiTieu VARCHAR2(8) NOT NULL,
tenChiTieu VARCHAR2(50) NOT NULL,
soTien FLOAT,
duAn VARCHAR2(8) NOT NULL
);
ALTER TABLE ChiTieu
ADD CONSTRAINT PK_ChiTieu
PRIMARY KEY(maChiTieu);

--Bang Phan Cong
CREATE TABLE PhanCong(
maNV VARCHAR2(8) NOT NULL,
duAn VARCHAR2(8) NOT NULL,
vaiTro VARCHAR2(200),
phuCap FLOAT
);
ALTER TABLE PhanCong
ADD CONSTRAINT PK_PhanCong
PRIMARY KEY(maNV, duan);
------------------------------------------------
--------khoa ngoai ChiNhanh
ALTER TABLE ChiNhanh
ADD CONSTRAINT FK1_ChiNhanh_NhanVien 
FOREIGN KEY(truongChiNhanh) 
REFERENCES NhanVien(maNV);

---------khoa ngoai NhanVien
ALTER TABLE NhanVien
ADD CONSTRAINT FK1_NhanVien_PhongBan 
FOREIGN KEY(maPhong) 
REFERENCES Phongban(maPhong);

ALTER TABLE NhanVien
ADD CONSTRAINT FK2_NhanVien_ChiNhanh 
FOREIGN KEY(chiNhanh) 
REFERENCES ChiNhanh(maCN);
------Khoa ngoai Phong Ban
ALTER TABLE Phongban
ADD CONSTRAINT FK1_PhongBan_ChiNhanh
FOREIGN KEY(chiNhanh) 
REFERENCES ChiNhanh(maCN);

ALTER TABLE Phongban
ADD CONSTRAINT FK2_PhongBan_NhanVien 
FOREIGN KEY(truongPhong) 
REFERENCES NhanVien(maNV);

-------Bang Du An
ALTER TABLE DuAn
ADD CONSTRAINT FK1_DuAn_NhanVien
FOREIGN KEY(truongDA) 
REFERENCES NhanVien(maNV);

ALTER TABLE DuAn
ADD CONSTRAINT FK2_DuAn_PhongBan
FOREIGN KEY(phongChuTri) 
REFERENCES Phongban(maPhong);

------Bang Chi Tieu
ALTER TABLE ChiTieu
ADD CONSTRAINT FK1_ChiTieu_DuAn 
FOREIGN KEY(duAn) 
REFERENCES DuAn(maDA);

-------Bang Phan Cong
ALTER TABLE PhanCong
ADD CONSTRAINT FK1_PhanCong_DuAn 
FOREIGN KEY(duAn) 
REFERENCES DuAn(maDA);

ALTER TABLE PhanCong
ADD CONSTRAINT FK2_PhanCong_NhanVien
FOREIGN KEY(maNV) 
REFERENCES NhanVien(maNV);