[¼ºÀûÅ×ÀÌºí »ı¼º]
create table sungjuk(
    name varchar(10),
    kor int ,
    eng int,
    mat int,
    tot int, --ÃÑÁ¡
    aver int --Æò±Õ
    );
desc sungjuk;
insert into sungjuk(name,kor,eng,mat) values 
    ('È«±æµ¿', 70,85,100);
select * from sungjuk;
rollback;
commit;
drop table sungjuk;
create table sungjuk(
    uname varchar(10),
    kor int ,
    eng int,
    mat int,
    tot int, --ÃÑÁ¡
    aver int --Æò±Õ
    );
    
    drop table sungjuk;
  create table sungjuk(
    uname varchar(20),
    kor int ,
    eng int,
    mat int,
    tot int, --ÃÑÁ¡
    aver int --Æò±Õ
    );
insert into sungjuk(uname, kor, eng, mat)
values ('È«±æµ¿', 70, 85, 100);

insert into sungjuk(uname,kor,eng,mat)
values ('¹«±ÃÈ­',30,30,40);

insert into sungjuk(uname,kor,eng,mat)
values ('Áø´Ş·¡',90,90,20);

insert into sungjuk(uname,kor,eng,mat)
values ('°³³ª¸®',100,60,30);

insert into sungjuk(uname,kor,eng,mat)
values ('¶óÀÏ¶ô',30,80,40);
insert into sungjuk(uname,kor,eng,mat)
values ('ºÀ¼±È­',80,80,20);

insert into sungjuk(uname,kor,eng,mat)
values ('´ëÇÑ¹Î±¹',10,65,35);

insert into sungjuk(uname,kor,eng,mat)
values ('ÇØ¹Ù¶ó±â',30,80,40);

insert into sungjuk(uname,kor,eng,mat)
values ('³ªÆÈ²É',30,80,20);

insert into sungjuk(uname,kor,eng,mat)
values ('´ëÇÑ¹Î±¹',100,100,100);
select * from sungjuk;
select count(*) from sungjuk;
commit;