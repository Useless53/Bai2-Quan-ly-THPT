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