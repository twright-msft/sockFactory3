CREATE TABLE TABLE4KB(
ID INT,
VALUE1 CHAR(1000), --1KB
VALUE2 CHAR(1000), --1KB
VALUE3 CHAR(1000), --1KB
VALUE4 CHAR(1000), --1KB
)
GO


--sp_help TABLE4KB

Declare @count int
Set @count = 1

While @count <= 20000
Begin

 INSERT INTO TABLE4KB(ID, VALUE1,VALUE2,VALUE3,VALUE4) VALUES(@count,'00000','00000','00000','00000')

 Print @count
 Set @count = @count + 1
End
GO
