----------------create tai khoan nhan vien-------------------
--GRANT dba, connect to USER; lenh cap quen admin--
--DROP  USER  User  CASCADE; lenh drop user neu can--
--alter session set "_oracle_script"=true;
----------Tai khoan truong du an---------------
CREATE USER TDA01 IDENTIFIED BY tda01;
CREATE USER TDA02 IDENTIFIED BY tda02;
CREATE USER TDA03 IDENTIFIED BY tda03;
CREATE USER TDA04 IDENTIFIED BY tda04;
CREATE USER TDA05 IDENTIFIED BY tda05;
----------Tai khoan truong phong------------------
CREATE USER TP01 IDENTIFIED BY tp01;
CREATE USER TP02 IDENTIFIED BY tp02;
CREATE USER TP03 IDENTIFIED BY tp03;
CREATE USER TP04 IDENTIFIED BY tp04;
CREATE USER TP05 IDENTIFIED BY tp05;
-----------Tai khoan truong chi nhanh---------------
CREATE USER TCN01 IDENTIFIED BY tcn01;
CREATE USER TCN02 IDENTIFIED BY tcn02;
CREATE USER TCN03 IDENTIFIED BY tcn03;
CREATE USER TCN04 IDENTIFIED BY tcn04;
CREATE USER TCN05 IDENTIFIED BY tcn05;
-----------Tai khoan nhan vien-----------------
CREATE USER NV01 IDENTIFIED BY nv01;
CREATE USER NV02 IDENTIFIED BY nv02;
CREATE USER NV03 IDENTIFIED BY nv03;
CREATE USER NV04 IDENTIFIED BY nv04;
CREATE USER NV05 IDENTIFIED BY nv05;
-----------Tai khoan giam doc-------------------
CREATE USER GD01 IDENTIFIED BY gd01;
CREATE USER GD02 IDENTIFIED BY gd02;
CREATE USER GD03 IDENTIFIED BY gd03;
CREATE USER GD04 IDENTIFIED BY gd04;
CREATE USER GD05 IDENTIFIED BY gd05;


-- Tao cac role
CREATE ROLE rGiamDoc;
CREATE ROLE rTruongDuAn;
CREATE ROLE rTruongPhong;
CREATE ROLE rTruongChiNhanh;
CREATE ROLE rNhanVien;


-- DAC Giam doc duoc phep xem thong tin cac du an
-- Tao views cho Giam Doc
CREATE VIEW vGiamDoc 
AS 
SELECT DA.maDA, DA.tenDA, DA.kinhPhi, PB.tenPhong, CN.tenCN, NV.hoTen TruongDuAn, SUM(CT.soTien)TongChi FROM DuAn DA 
JOIN PhongBan PB ON PB.maPhong = DA.phongChuTri
JOIN NhanVien NV ON NV.maNV = DA.TRUONGDA
JOIN ChiNhanh CN ON CN.maCN = PB.ChiNhanh
JOIN ChiTieu CT ON CT.duAn = DA.maDA
GROUP BY  DA.maDA, DA.tenDA, DA.kinhPhi, PB.tenPhong, CN.tenCN, NV.hoTen;
-- Gan quyen xem vGiamDoc vao role rGiamDoc
GRANT SELECT ON vGiamDoc to rGiamDoc;
-- Gan role rGiamDoc cho cac user GiamDoc
GRANT rGiamDoc to GD01,GD02, GD03, GD04, GD05;
-- tao ket noi cho cac Giam Doc
GRANT CREATE SESSION TO GD01,GD02, GD03, GD04, GD05;



-- OLS
-- tao user dbo_sec chiu trach nhiem quan ly nhung user nao duoc phep truy xuat du lieu trong chema dbo
GRANT connect, create user, drop user,
create role, drop any role
to dbo_sec IDENTIFIED BY dbosec;

--DAC Truong Phong 
--Gan quyen update va them thong tin vao Du An cho role truong phong
GRANT SELECT, INSERT, UPDATE ON DuAn TO rTruongPhong;
--Gan role cho cac user truong phong
GRANT rTruongPhong TO TP01, TP02, TP03, TP04, TP05;
--Tao ket noi cac truong phong
GRANT CREATE SESSION TO TP01, TP02, TP03, TP04, TP05;