create table MonHoc(
MaMon varchar(5) primary key,
TenMon varchar(20),
SoTC int,
)
go

create table Diem(
MaSV varchar(5) primary key,
MaMon varchar(5) ,
DiemThi float,
constraint fk_Mamon foreign key(MaMon) references monhoc(MaMon)
)

create table SinhVien(
MaSV varchar(5) primary key,
HoTen varchar(20),
NgaySinh smalldatetime,
)
go

insert MonHoc values('MH01','Anh Van','3'),('MH02','Toan','3'),('MH03','Van','3') 
insert Diem values('SV01','MH02','3'),('SV02','MH03','4'),('SV03','MH01','4'),('SV04','MH02','3'),('SV05','MH03','5')
INSERT SinhVien VALUES('SV01','TRINH HOANG VIET','2/2/2000'),('SV02','TRAN HOANG','3/3/2000'),('SV03','TRINH HOANG LUAN','2/4/2000')

Select* from DIEM
select* from MonHoc
select* from SinhVien

---câu 2------
go
create function duoi5 (@tmh nvarchar(20))
returns int
as
begin
 declare @dem int
 set @dem = (select count(*)
 from Diem
where @dem<5)
 return @dem
end
go
select dbo.duoi5('Anh Van')


---Câu 3---------------
CREATE PROCEDURE nhapdiem (@masv CHAR(10), @mamon CHAR(10), @diemthi FLOAT)
AS
BEGIN
	INSERT INTO DIEM (MASV, MAMON, DIEMTHI)
	VALUES (@masv, @mamon, @diemthi)
END

select DBO.nhapdiem('SV07','MH05','9')
-----cau4-----------------
create trigger trg_Diem 
on Diem 
for insert,update as
begin
	declare @diem float
	set @diem = select diemthi from diem
	if  @diem between 0 and 10
	print 'Khong hop le'
	rollback transaction
end