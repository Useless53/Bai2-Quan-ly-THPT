create database QUAN_LY_HS_GV
go
use QUAN_LY_HS_GV
go
create table GiaoVien
(	
	ID_GiaoVien varchar(10)not null, 
	TenGV nvarchar(50) null, 
	SDT bigint null , 
	Email varchar(50)null, 
	GT nvarchar(3)null,
	HocHam varchar(10) check (HocHam in ('TS', 'ThS', 'KS')), 
	HocVi varchar(10) check (HocVi in ('GV', 'GVC', 'TG')),
	NgaySinh datetime null
) 
go
create table HocSinh
(	
	ID_HocSinh varchar(10) not null, 
	TenHS nvarchar(50)null, 
	Lop varchar(10)not null,
	NgSinh date null,
	GT nvarchar(3) null,
	Diachi nvarchar(50) null
)
go 
create table Lop
(    
	ID_Lop varchar(10) not null,
	TenL nvarchar(50) null,
	MaGV varchar(10) null, 
	DVHT Int null
)	
go
create table DangNhap
(
	Username varchar(50), 
	Pass varchar(50)
)
go
insert into GiaoVien values
('GV001',N'Chu Thị Hường','23','ChuHuong','Nu','ThS','GV',''),
('GV002',N'Đỗ Thị Mai Hường','34','DoHuong','Nu','ThS','GV',''),
('GV003',N'Bùi Thu Lâm','44','ThuLam','Nam','TS','GVC',''),
('GV004',N'Tống Minh Đức','67', 'MinhDuc','Nam','TS','GVC',''),
('GV005',N'Nguyễn Mậu Uyên','89','MauUyen','Nam','ThS','GV',''),
('GV006',N'Đỗ Đình Nghĩa','12','DoNghia','Nam','TS','GV',''),
('GV007',N'Phan Anh Tú','27','PhanTu','Nam','TS','GV',''),
('GV008',N'Phạm Văn Biển','26','VanBien','Nam','TS','GV',''),
('GV009',N'Ngô Thành Long','78','ThanhLong','Nam','TS','GVC',''),
('GV010',N'Ngô Hữu Phúc','79','HuuPhuc','Nam','TS','GVC',''),
('GV011',N'Nguyễn Văn Tuấn','45','VanTuan','Nam','TS','GV',''),
('GV012',N'Phan Thị Hồng Lê','25','HongLe','Nu','TS','GV',''),
('GV013',N'Trịnh Quang Từ','80','QuangTu','Nam','TS','GVC',''),
('GV014',N'Nguyễn Sĩ Đình','26','SiDinh','Nam','TS','GV',''),
('GV015',N'Phan Việt Anh','25','VietAnh','Nam','TS','GV',''),
('GV016',N'Phan Nguyên Hải','89','NguyenHai','Nam','TS','GV',''),
('GV017',N'Nguyễn Văn Hưng','88','VanHung','Nam','TS','GV',''),
('GV018',N'Đặng Văn Thành','98','VanThanh','Nam','TS','GV',''),
('GV019',N'Ngô Văn Long','99','VanLong','Nam','TS','GV',''),
('GV020',N'Bùi Thị Xoan','33','BuiXoa','Nu','TS','GV','')
go
insert into HocSinh
values
('2012DH01',N'Lê Công Hoàng Anh','TH53','6/7/1999','',''),
('2012DH04',N'Nguyễn Anh Dũng','TH53','6/7/1999','',''),
('2012DH05',N'Nguyễn Trọng Quyết','XM53','6/7/1999','',''),
('2012DH06',N'Lữ Văn Lâm','XM53','6/7/1999','',''),
('2012DH07',N'Tống Quyết Thắng','OTO53','6/7/1999','',''),
('2012DH08',N'Bùi Quốc Duy','OTO53','6/7/1999','',''),
('2012DH09',N'Phan Văn Thắng','DA53','6/7/1999','',''),
('2012DH10',N'Đỗ Văn Cường','VK53','6/7/1999','','')
('2012DH05',N'Nguyễn Viết Thông','TH53','16/8/1999','',''),
go
insert into Lop
values
('TH53','MH01','GV001',2),
('OTO53','MH01','GV002',2),
('VK53','MH02','GV004',2),
('XM53','MH03','GV007',2),
('DA53','MH04','GV008',2)
go
alter table GiaoVien add constraint PK_GV primary key (ID_GiaoVien)
alter table Lop add constraint PK_L primary key (ID_Lop)
alter table HocSinh add constraint PK_HS primary key (ID_HocSinh)
go
alter table Lop	add constraint PK_L_GV foreign key (MaGV) references GiaoVien(ID_GiaoVien)
alter table HocSinh add constraint PK_L_HS foreign key (Lop) references Lop(ID_Lop)
go
CREATE PROC INSERTHOCSINH
(
	@ID CHAR(10),
	@NAME NVARCHAR(50),
	@CLASS CHAR(10),
	@DATE DATETIME,
	@SEX CHAR(10),
	@DIACHI NVARCHAR(50),
	@CHECK INT OUTPUT
)
AS
BEGIN
	IF(@CLASS NOT IN(SELECT lOP.ID_Lop  FROM LOP)) 
	BEGIN 
		SET @CHECK=2  
		RETURN 
	END  
	IF(@ID IN(SELECT HocSinh.ID_HocSinh FROM HocSinh)) 
	BEGIN 
		SET @CHECK=1  
		RETURN  
	END 
	INSERT INTO HocSinh
	VALUES(@ID,@NAME,@CLASS,@DATE,@SEX,@DIACHI)
	SET @CHECK=0
END
go
CREATE PROC UPDATEHOCSINH
(
	@ID CHAR(10),
	@NAME NVARCHAR(50),
	@CLASS CHAR(10),
	@DATE DATETIME,
	@SEX CHAR(10),
	@HOME NVARCHAR(50),
	@CHECK INT OUTPUT
)
AS
BEGIN
	IF(@ID IN(SELECT HocSinh.ID_HocSinh FROM HocSinh WHERE HocSinh.ID_HocSinh<>@ID)) 
	BEGIN 
		SET @CHECK=1  
		RETURN  
	END 
	IF(@CLASS NOT IN(SELECT lOP.ID_Lop  FROM LOP)) 
	BEGIN 
		SET @CHECK=2  
		RETURN 
	END 
	SET @CHECK=0 
	UPDATE HocSinh SET TenHS=@NAME,Lop=@CLASS,NgSinh=@DATE,GT=@SEX,Diachi=@HOME 
		WHERE @ID=ID_HocSinh
END
go
CREATE PROC DELETEHOCSINH
(
	@ID CHAR(10)
)
AS
BEGIN
	DELETE HocSinh WHERE @ID=ID_HocSinh
END
go
CREATE PROC DELETELOP(@CLASSID CHAR(10))
AS
BEGIN
	DELETE Lop WHERE @CLASSID=ID_Lop
END
go
CREATE PROC DELETEGIAOVIEN
(
	@ID CHAR(10)
)
AS
BEGIN
	DELETE GiaoVien WHERE @ID=ID_GiaoVien
	UPDATE Lop SET LOP.MaGV='' WHERE Lop.MaGV=@ID
END
go
CREATE PROC INSERTLOP
(
	@CLASSID CHAR(10),
	@CLASSNAME NVARCHAR(50),
	@IDGV CHAR(10),
	@DVHT NVARCHAR(50),
	@CHECK INT OUTPUT
)
AS
BEGIN
	IF(@CLASSID IN (SELECT Lop.ID_Lop FROM LOP ))
	BEGIN 
		SET @CHECK=1 
		RETURN 
	END
	IF(@IDGV IN (SELECT LOP.MaGV FROM LOP))
	BEGIN 
		SET @CHECK=2 
		RETURN 
	END 
	IF(@IDGV NOT IN (SELECT GiaoVien.ID_GiaoVien FROM GiaoVien))
	BEGIN 
		SET @CHECK=3 
		RETURN 
	END
	INSERT INTO LOP VALUES(@CLASSID,@CLASSNAME,@IDGV,@DVHT)
	SET @CHECK=0
END
go
CREATE PROC UPDATELOP 
(
	@CLASSID CHAR(10),
	@CLASSNAME NVARCHAR(50),
	@IDGV CHAR(10),
	@DVHT NVARCHAR(50),
	@CHECK INT OUTPUT
)
AS
BEGIN
	IF(@CLASSID IN (SELECT Lop.ID_Lop FROM LOP WHERE ID_Lop<>@CLASSID))
	BEGIN 
		SET @CHECK=1  
		RETURN 
	END
	IF(@IDGV IN (SELECT LOP.MaGV FROM LOP WHERE ID_Lop<>@IDGV))
	BEGIN 
		SET @CHECK=2  
		RETURN  
	END
	IF(@IDGV NOT IN (SELECT GiaoVien.ID_GiaoVien FROM GiaoVien))
	BEGIN 
		SET @CHECK=3  
		RETURN 
	END
	SET @CHECK=0
	UPDATE LOP SET TenL=@CLASSNAME,MaGV=@IDGV,DVHT=@DVHT WHERE @CLASSID=ID_Lop
END
go
CREATE PROC UPDATEGIAOVIEN 
(
	@ID CHAR(10),
	@NAME NVARCHAR(50),
	@SDT BIGINT,
	@EMAIL NVARCHAR(50),
	@SEX CHAR(10),
	@HOCHAM VARCHAR(20),
	@HOCVI VARCHAR(20),
	@DATE DATETIME,
	@CHECK INT OUTPUT
)
AS 
BEGIN
	IF(@ID IN (SELECT GiaoVien.ID_GiaoVien FROM GiaoVien WHERE ID_GiaoVien<>@ID))
	BEGIN 
		SET @CHECK=1  
		RETURN 
	END
	SET @CHECK=0
	UPDATE GiaoVien SET TenGV=@NAME,SDT=@SDT,Email=@EMAIL,GT=@SEX,HocHam=@HOCHAM,HocVi=@HOCVI,NgaySinh=@DATE WHERE @ID=ID_GiaoVien
END
go
CREATE PROC INSERTGIAOVIEN 
(
	@ID CHAR(10),
	@NAME NVARCHAR(50),
	@SDT BIGINT,
	@EMAIL NVARCHAR(50),
	@SEX CHAR(10),
	@HOCHAM VARCHAR(20),
	@HOCVI VARCHAR(20),
	@DATE DATETIME,
	@CHECK INT OUTPUT
)
AS 
BEGIN
	IF(@ID IN (SELECT GiaoVien.ID_GiaoVien FROM GiaoVien ))
	BEGIN 
		SET @CHECK=1   
		RETURN 
	END 
	SET @CHECK=0 
	 INSERT INTO GiaoVien
	 VALUES(@ID,@NAME,@SDT,@EMAIL,@SEX,@HOCHAM,@HOCVI,@DATE)
END
go