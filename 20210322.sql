[�������̺� ����]
create table sungjuk(
    name varchar(10),
    kor int ,
    eng int,
    mat int,
    tot int, --����
    aver int --���
    );
desc sungjuk;
insert into sungjuk(name,kor,eng,mat) values 
    ('ȫ�浿', 70,85,100);
select * from sungjuk;
rollback;
commit;
drop table sungjuk;
create table sungjuk(
    uname varchar(10),
    kor int ,
    eng int,
    mat int,
    tot int, --����
    aver int --���
    );
    
    drop table sungjuk;
  create table sungjuk(
    uname varchar(20),
    kor int ,
    eng int,
    mat int,
    tot int, --����
    aver int --���
    );
insert into sungjuk(uname, kor, eng, mat)
values ('ȫ�浿', 70, 85, 100);

insert into sungjuk(uname,kor,eng,mat)
values ('����ȭ',30,30,40);

insert into sungjuk(uname,kor,eng,mat)
values ('���޷�',90,90,20);

insert into sungjuk(uname,kor,eng,mat)
values ('������',100,60,30);

insert into sungjuk(uname,kor,eng,mat)
values ('���϶�',30,80,40);
insert into sungjuk(uname,kor,eng,mat)
values ('����ȭ',80,80,20);

insert into sungjuk(uname,kor,eng,mat)
values ('���ѹα�',10,65,35);

insert into sungjuk(uname,kor,eng,mat)
values ('�عٶ��',30,80,40);

insert into sungjuk(uname,kor,eng,mat)
values ('���Ȳ�',30,80,20);

insert into sungjuk(uname,kor,eng,mat)
values ('���ѹα�',100,100,100);
select * from sungjuk;
select count(*) from sungjuk;
commit;