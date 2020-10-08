create database QUAN_LY_HS_GV
﻿create database QUAN_LY_HS_GV
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
('2012DH01',N'Lê Công Tuấn Anh','TH48','6/7/1994','',''),
('2012DH04',N'Nguyễn Anh Dũng','TH48','6/7/1994','',''),
('2012DH05',N'Nguyễn Trọng Thứ','XM48','6/7/1994','',''),
('2012DH06',N'Lữ Văn Chung','XM48','6/7/1994','',''),
('2012DH07',N'Tống Quyết Thắng','OTO48','6/7/1994','',''),
('2012DH08',N'Bùi Quốc Huy','OTO48','6/7/1994','',''),
('2012DH09',N'Phan Văn Thắng','DA48','6/7/1994','',''),
('2012DH10',N'Đỗ Văn Cường','VK48','6/7/1994','','')
go
insert into Lop
values
('TH48','MH01','GV001',2),
('OTO48','MH01','GV002',2),
('VK48','MH02','GV004',2),
('XM48','MH03','GV007',2),
('DA48','MH04','GV008',2)
go
alter table GiaoVien add constraint PK_GV primary key (ID_GiaoVien)
alter table Lop add constraint PK_L primary key (ID_Lop)
alter table HocSinh add constraint PK_HS primary key (ID_HocSinh)
go
alter table Lop	add constraint PK_L_GV foreign key (MaGV) references GiaoVien(ID_GiaoVien)
alter table HocSinh add constraint PK_L_HS foreign key (Lop) references Lop(ID_Lop)
go