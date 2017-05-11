------------------DROP---------------------
Drop table ChiNhanh

DROP TABLE NhanVien CASCADE CONSTRAINTS;
DROP TABLE ChiNhanh CASCADE CONSTRAINTS;
DROP TABLE PhongBan CASCADE CONSTRAINTS;
Drop table NhanVien


Drop table PhanCong

Drop table PhongBan


Drop table ChiTieu


Drop table DuAn

--B?ng Chi Nhánh
Create table ChiNhanh(
maCN varchar2(8) NOT NULL,
tenCN varchar2(50) NOT NULL,
truongChiNhanh varchar2(8) NOT NULL
)

ALTER TABLE ChiNhanh
ADD CONSTRAINT PK_ChiNhanh
PRIMARY KEY(maCN)

--B?ng Nhân Viên
Create table NhanVien(
maNV varchar2(8) NOT NULL,
hoTen varchar2(50) NOT NULL,
diaChi varchar2(100) NOT NULL,
dienThoai number,
email varchar2(100),
maPhong varchar2(8),
chiNhanh varchar2(8),
luong float
)
ALTER TABLE NhanVien
ADD CONSTRAINT PK_NhanVien
PRIMARY KEY(maNV)

--B?ng phòng ban
Create table PhongBan(
maPhong varchar2(8) NOT NULL,
tenPhong varchar2(50) NOT NULL,
truongPhong varchar2(8) NOT NULL,
ngayNhamChuc varchar2(50),
soNhanVien number,
chiNhanh varchar2(8) NOT NULL
)
ALTER TABLE PhongBan
ADD CONSTRAINT PK_PhongBan
PRIMARY KEY(maPhong)

--B?ng DuAn
Create table  DuAn(
maDA varchar2(8) NOT NULL,
tenDA varchar2(50) NOT NULL,
kinhPhi float,
phongChuTri varchar2(8),
truongDA varchar2(8)
)
ALTER TABLE DuAn
ADD CONSTRAINT PK_DuAn
PRIMARY KEY(maDA)

--B?ng Chi Tieu
Create table ChiTieu(
maChiTieu varchar2(8) NOT NULL,
tenChiTieu varchar2(50) NOT NULL,
soTien float,
duAn varchar2(8) NOT NULL
)
ALTER TABLE ChiTieu
ADD CONSTRAINT PK_ChiTieu
PRIMARY KEY(maChiTieu)

--B?ng Phân Công
Create table PhanCong(
maNV varchar2(8) NOT NULL,
duAn varchar2(8) NOT NULL,
vaiTro varchar2(200),
phuCap float
)
ALTER TABLE PhanCong
ADD CONSTRAINT PK_PhanCong
PRIMARY KEY(maNV, duan)
------------------------------------------------
//--------khóa ngo?i chiNhanh
ALTER TABLE ChiNhanh
ADD CONSTRAINT FK1_ChiNhanh_NhanVien 
FOREIGN KEY(truongChiNhanh) 
REFERENCES NhanVien(maNV)

//---------khóa ngo?i NhanVien
ALTER TABLE NhanVien
ADD CONSTRAINT FK1_NhanVien_PhongBan 
FOREIGN KEY(maPhong) 
REFERENCES Phongban(maPhong)

ALTER TABLE NhanVien
ADD CONSTRAINT FK2_NhanVien_ChiNhanh 
FOREIGN KEY(chiNhanh) 
REFERENCES ChiNhanh(maCN)
//------Khóa ngo?i Phòng ban
ALTER TABLE Phongban
ADD CONSTRAINT FK1_PhongBan_ChiNhanh
FOREIGN KEY(chiNhanh) 
REFERENCES ChiNhanh(maCN)

ALTER TABLE Phongban
ADD CONSTRAINT FK2_PhongBan_NhanVien 
FOREIGN KEY(truongPhong) 
REFERENCES NhanVien(maNV)

//-------B?ng D? Án
ALTER TABLE DuAn
ADD CONSTRAINT FK1_DuAn_NhanVien
FOREIGN KEY(truongDA) 
REFERENCES NhanVien(maNV)

ALTER TABLE DuAn
ADD CONSTRAINT FK2_DuAn_PhongBan
FOREIGN KEY(phongChuTri) 
REFERENCES Phongban(maPhong)

//------B?ng Chi Tiêu
ALTER TABLE ChiTieu
ADD CONSTRAINT FK1_ChiTieu_DuAn 
FOREIGN KEY(duAn) 
REFERENCES DuAn(maDA)

//-------B?ng Phân công
ALTER TABLE PhanCong
ADD CONSTRAINT FK1_PhanCong_DuAn 
FOREIGN KEY(duAn) 
REFERENCES DuAn(maDA)

ALTER TABLE PhanCong
ADD CONSTRAINT FK2_PhanCong_NhanVien
FOREIGN KEY(maNV) 
REFERENCES NhanVien(maNV)