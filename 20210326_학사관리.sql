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
-����)
    from ���̺�1 join ���̺�2 on ������ ; --ǥ��SQL(ANSI)
    
    FROM ���̺�1, ���̺�2 ON ������; -- ORACLE DB
    
    SELECT T1.*,T2.*,T3.*
    FROM T1 JOIN T2
    ON T1.X=T2.X
    JOIN T3 
    ON T1.Y = T3.Y--3������
    
    SELECT *
    FROM T1 JOIN T2
    ON T1.X = T2.X JOIN T3
    ON T1.Y = T3.Y JOIN T4
    ON T1.Z = T4.Z; --4������
    
- ������ : WHERE, HAVING( GROUP BY �� �Բ� ), ON (JOIN�� �Բ�)
- ������ ���̺� : ������ DB�� CREATE �� ���̺�
- ���� ���̺� : SQL���� ���� ������ ���̺�. �����ֱ�� 

������ ���̺�� ���� ���̺��� ���� ������ ����

--�й��� �������� �������̺�� �л����̺��� �����ϱ�

SELECT * FROM TB_SUGANG;

SELECT *
FROM TB_STUDENT ST
JOIN TB_SUGANG  SG ON ST.HAKNO = SG.HAKNO;
--INNER��� ���� ���� ����. ���� �⺻��
--HAKNO ��� �÷��� �̸��� ���Ƽ� HAKNO_1�ϴ� ������ �˾Ƽ� �ٲ�� ������ ����

SELECT *
FROM TB_STUDENT ST
LEFT JOIN TB_SUGANG  SG ON ST.HAKNO = SG.HAKNO;

SELECT ST.*, SG.*
FROM TB_STUDENT ST
JOIN TB_SUGANG  SG ON ST.HAKNO = SG.HAKNO;

SELECT ST.*, SG.GCODE, SG.SNO
FROM TB_STUDENT ST
JOIN TB_SUGANG  SG ON ST.HAKNO = SG.HAKNO;

SELECT *
FROM TB_STUDENT ST
JOIN TB_SUGANG  SG ON ST.HAKNO = SG.HAKNO
JOIN TB_GWAMOK GM ON SG.GCODE = GM.GCODE;

SELECT SG.*, gm.ghakjum,gm.gname,gm.regdt
FROM TB_SUGANG SG
JOIN TB_GWAMOK  GM ON SG.GCODE = GM.GCODE;

--��ȸ�� �� ���̺��� �ߺ����� �ʴ� �÷����� ���̺���� ������ �� �ִ�. 
SELECT SG.*, ghakjum, gname, regdt
FROM TB_SUGANG SG
JOIN TB_GWAMOK  GM ON SG.GCODE = GM.GCODE;

��1)������û�� �� �л��� �߿��� '����'�� ��� �л��鸸 �й�, �̸�, �ּҸ� ��ȸ�Ͻÿ�

SELECT * FROM TB_STUDENT;

SELECT HAKNO, UNAME, ADDRESS
FROM TB_STUDENT
WHERE ADDRESS = '����';

--��� ���̺��� �������� �������ΰ�..

SELECT ADDRESS,SG.HAKNO,UNAME
FROM TB_SUGANG SG JOIN TB_STUDENT ST
                ON SG.HAKNO = ST.HAKNO
                WHERE ADDRESS = '����';
                
SELECT A.ADDRESS, A.HAKNO, A.UNAME               
FROM(
SELECT ADDRESS,SG.HAKNO,UNAME
FROM TB_SUGANG SG JOIN TB_STUDENT ST
                ON SG.HAKNO = ST.HAKNO) A
WHERE A.ADDRESS = '����';

��2)�������� ������û �ο���, ������ ��ȸ�Ͻÿ�
     ���� 2��
     ���� 1��
     
SELECT * FROM TB_SUGANG SU
JOIN TB_STUDENT ST ON SU.HAKNO = ST.HAKNO
;     

SELECT COUNT(SU.HAKNO), MAX(ST.UNAME) FROM TB_SUGANG SU
GROUP BY SU.HAKNO
JOIN TB_STUDENT ST ON SU.HAKNO = ST.HAKNO; 


SELECT HAKNO , COUNT(HAKNO)
FROM TB_SUGANG
GROUP BY HAKNO; 

SELECT A.HAKNO,TB_STUDENT.ADDRESS,TB_STUDENT.UNAME
FROM
(SELECT HAKNO , COUNT(HAKNO)
FROM TB_SUGANG
GROUP BY HAKNO) A JOIN TB_STUDENT 
ON TB_STUDENT.HAKNO = A.HAKNO;

--�� �л��� ������û�� ������ �� �� �����Ƿ� -> �л����� �׷����ؼ� �Ѱ� ���ڵ徿���� ����.
--���� �� �л��� ������ �л����̺�� �����ؼ� �����´� 

SELECT B.ADDRESS, COUNT(*) FROM
(SELECT A.HAKNO,TB_STUDENT.ADDRESS ,TB_STUDENT.UNAME FROM
(SELECT HAKNO , COUNT(HAKNO) FROM TB_SUGANG GROUP BY HAKNO) A 
    JOIN TB_STUDENT ON TB_STUDENT.HAKNO = A.HAKNO) B
    GROUP BY B.ADDRESS;

SELECT COUNT(ADDRESS)�����ο�, ADDRESS �ּ� 
FROM TB_SUGANG SG
    JOIN TB_STUDENT  ST ON SG.HAKNO= ST.HAKNO
    GROUP BY ADDRESS; 
        
��3)���� ���� ��û �ο���, �����ڵ�, ����� ��ȸ�Ͻÿ� 
     d001 ��ǥ�� 2�� 
     d002 ���伥 1��
     p001 OOP   2��
     
SELECT * FROM TB_GWAMOK;

SELECT GCODE, COUNT(GCODE)
FROM TB_SUGANG
GROUP BY GCODE;

SELECT GM.GCODE �����ڵ�, COUNT(GM.GCODE)||'��'�����ο�, MAX(GM.GNAME) �����
FROM TB_SUGANG SG
JOIN TB_STUDENT ST ON SG.HAKNO = ST.HAKNO
JOIN TB_GWAMOK GM ON GM.GCODE = SG.GCODE
GROUP BY GM.GCODE;

��4) �й��� ������û������ �������� �й��������� ��ȸ�Ͻÿ�
     g1001  ȫ�浿  6
     g1002  ȫ�浿  6
     g1005  ���޷�  6
     
SELECT * FROM TB_SUGANG ;

SELECT * FROM TB_STUDENT ST JOIN TB_SUGANG SG ON sg.hakno = st.hakno
                            JOIN TB_GWAMOK GM ON sg.GCODE = GM.GCODE 
                            ;
SELECT * FROM TB_GWAMOK;

----------------------��-------------------------------------------
SELECT SG.HAKNO ,SUM(GM.GHAKJUM),MAX(ST.UNAME) FROM TB_STUDENT ST 
                            JOIN TB_SUGANG SG ON sg.hakno = st.hakno
                            JOIN TB_GWAMOK GM ON sg.GCODE = GM.GCODE 
                            GROUP BY SG.HAKNO
                            ORDER BY sg.hakno;
                            
SELECT SG.HAKNO, COUNT(*) FROM TB_SUGANG SG JOIN TB_STUDENT ST ON sg.hakno = st.hakno
GROUP BY SG.HAKNO;
��5) �й� g1001�� ������û�� ������ �����ڵ庰�� ��ȸ�Ͻÿ�
     g1001  p001  OOP
     g1001  p003  JSP  
     g1001  d001  ��ǥ��
---------------------------------------��-------------
SELECT  A.HAKNO,A.GCODE, B.GNAME FROM     
(SELECT * FROM TB_SUGANG WHERE HAKNO = 'g1001') A 
JOIN TB_GWAMOK B ON A.GCODE = B.GCODE;

     
     
��6)������û�� �� �л����� �й�, �̸� ��ȸ
----------------------------------------------��
SELECT A.HAKNO, B.UNAME FROM
(SELECT HAKNO FROM TB_SUGANG 
GROUP BY HAKNO) A JOIN TB_STUDENT B ON A.HAKNO = B.HAKNO ;

     
��7)������û�� ���� ���� �л����� �й�, �̸� ��ȸ
SELECT SUB.HAKNO, SUB.UNAME FROM(
SELECT * FROM TB_STUDENT A LEFT JOIN TB_SUGANG B ON A.HAKNO = B.HAKNO) AS SUB
;

SELECT A.UNAME, A.HAKNO FROM TB_STUDENT A LEFT JOIN TB_SUGANG B ON A.HAKNO = B.HAKNO
WHERE B.SNO IS NULL;

SELECT SUB.* FROM (
SELECT * FROM(
SELECT * FROM TB_STUDENT A LEFT JOIN TB_SUGANG B ON A.HAKNO = B.HAKNO)
WHERE SNO IS NULL ) SUB;

-----------------------------------��
SELECT A.UNAME, A.HAKNO FROM TB_STUDENT A LEFT JOIN TB_SUGANG B ON A.HAKNO = B.HAKNO
WHERE B.SNO IS NULL;