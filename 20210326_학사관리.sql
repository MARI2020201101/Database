create table tb_student(
   hakno    char(5)      not null
  ,uname    varchar(50)  not null
  ,email    varchar(100) unique
  ,address  varchar(100) not null
  ,phone    varchar(20)
  ,regdt    date         default sysdate
  ,primary key(hakno)
);
create table tb_gwamok(
   gcode    char(4)       not null
  ,gname    varchar(100)  not null
  ,ghakjum  number(2)     default 1
  ,regdt    date          default sysdate
  ,primary key(gcode)
);

create table tb_sugang(
   sno    number     not null
  ,hakno  char(5)    not null
  ,gcode  char(4)    not null
  ,primary key(sno)
);

create sequence sugang_seq;
insert into tb_student(hakno,uname,address,phone,email)
values('g1001','ȫ�浿','����','111-5558','11@naver.com');

insert into tb_student(hakno,uname,address,phone,email)
values('g1002','ȫ�浿','����','787-8877','33@daum.net');

insert into tb_student(hakno,uname,address,phone,email)
values('g1003','������','����','554-9632','77@naver.com');
insert into tb_student(hakno,uname,address,phone,email)
values('g1004','ȫ�浿','�λ�','555-8844','88@daum.net');

insert into tb_student(hakno,uname,address,phone,email)
values('g1005','���޷�','����','544-6996','33@nate.com');

insert into tb_student(hakno,uname,address,phone,email)
values('g1006','������','����','777-1000','66@naver.com');
insert into tb_gwamok(gcode,gname,ghakjum)
values('p001','OOP',3);

insert into tb_gwamok(gcode,gname,ghakjum)
values('p002','Oracle',3);

insert into tb_gwamok(gcode,gname,ghakjum)
values('p003','JSP',2);

insert into tb_gwamok(gcode,gname,ghakjum)
values('d001','��ǥ��',1);
insert into tb_gwamok(gcode,gname,ghakjum)
values('d002','���伥',5);

insert into tb_gwamok(gcode,gname,ghakjum)
values('d003','�÷���',3);

insert into tb_gwamok(gcode,gname,ghakjum)
values('p004','MVC',3);

insert into tb_sugang(sno,hakno,gcode)
values(sugang_seq.nextval,'g1001','p001');

insert into tb_sugang(sno,hakno,gcode)
values(sugang_seq.nextval,'g1002','p002');

insert into tb_sugang(sno,hakno,gcode)
values(sugang_seq.nextval,'g1002','p001');

insert into tb_sugang(sno,hakno,gcode)
values(sugang_seq.nextval,'g1001','p003');
insert into tb_sugang(sno,hakno,gcode)
values(sugang_seq.nextval,'g1005','d001');

insert into tb_sugang(sno,hakno,gcode)
values(sugang_seq.nextval,'g1005','d002');

insert into tb_sugang(sno,hakno,gcode)
values(sugang_seq.nextval,'g1001','d001');

select count(*) from tb_student;
select count(*) from tb_gwamok;
select count(*) from tb_sugang;
commit;

��1)�л����̺��� ������ �ο����� �ο��������� ��ȸ�Ͻÿ�

select* from tb_student;
select address, count(*) �ο���
from tb_student
group by address
order by count(*) ;

��2)�л����̺��� ���������� �� ������� ��ȸ�Ͻÿ�

select * from tb_student;
select count(distinct uname) from tb_student;

select uname, count(*)
from tb_student
group by uname;

select a.*
from tb_student as a, tb_student as b;

select a.*
from tb_student a
self join tb_student b 
on a.uname = b.uname;

��3)�л����̺��� �й�, �̸�, �ּҸ� ��ȸ�Ͻÿ� (�ּҴ� �������� ���)

select hakno, uname, 
    case when address = '����' then 'seoul'
        when address='����' then 'jeju'
        when address='�λ�' then 'busan'
    end as address
from tb_student;

��4)�л����̺��� �ּҺ� �ο����� 3��̸� ���� ��ȸ�Ͻÿ�
select *
from tb_student
order by address
;

select count(*), address
from tb_student
group by address;

select count(*), address
from tb_student
group by address
having count(address)<3;

commit;

//////////////////////////////////////////////////////////////////////////

--�����ڵ� ���� ���� : �ַ� ������ + ���� ����. �ѱ��� X(��賻�� �����)
--��) �����ڵ� : ���α׷��� p~~~, ������ d~~,  ���� c~~~
--��) ���Ӱ��� / �ð����� / ����... 
--��) ���ϳ��� ���θ� : ��� apple100 .. / ������ orange101.../ �ٳ���/...

��5) �������̺��� ���α׷� ������ ��ȸ
select *
from tb_gwamok
where gcode like 'p%';
select * from tb_gwamok;

��6) �������̺��� ������ ������ �� 3������ ��ȸ
select *
from tb_gwamok
where gcode like 'd%' and ghakjum =3;

����7) �������̺��� ���α׷� �������� ���� ��պ��� ���� ���α׷� ������ ��ȸ

select * from tb_gwamok;

select  *
from tb_gwamok 
where ghakjum< (select  
avg(ghakjum)
from tb_gwamok                                                                         
where gcode like 'p%')
and gcode like 'p%';

select 
avg(ghakjum)
from tb_gwamok
where gcode like 'p%'; 

////////////////////////////////////////////////////////////////////////
[���̺� ����]