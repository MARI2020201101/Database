drop table sungjuk;
create table sungjuk(
    uname varchar(50) not null  
    ,kor int          not null
    ,eng int        not null
    ,mat int        not null
    ,tot int        null --�� ���
    ,aver int       --null ��������
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
commit;
select kor as korea, eng as english, mat as math from sungjuk;
select max(kor), max(uname) as name from sungjuk;

-- ����Ŭ ���� �Լ� : max, min, sum, avg ��
select count(eng) as english from sungjuk;
select avg(mat) as ������� from sungjuk; --�ӽ� Į�������� �̸��� ����
select count(uname) as �̸�, max(uname)  from sungjuk group by uname;

select count(aver) from sungjuk; --null���� ī��Ʈ���� ����. //0
--��1) ���� ������ 50�̻� ���� ��ȸ�Ͻÿ�

select * from sungjuk where kor >= 50;

--��2) ���������� 50�� �̸� ���� ��ȸ�Ͻÿ�
select * from sungjuk where eng< 50;
--��3) �̸��� '���ѹα�' ���� ��ȸ(���)�Ͻÿ�
select * from sungjuk where uname ='���ѹα�'; --���ڿ������ʹ� ��������ǥ. ���⵵ ���ԵǴ� ����

--��4) �̸��� '���ѹα�' �ƴ� ���� ��ȸ�Ͻÿ�
select * from sungjuk where uname != '���ѹα�';
select * from sungjuk where uname not like '���ѹα�';
select * from sungjuk where uname <> '���ѹα�';
select * from sungjuk where not uname = '���ѹα�'; 

--��5) ����, ����, ���� �������� ������ ��� 90�̻� ���� ��ȸ�Ͻÿ�
select *from sungjuk where kor>=90 and eng>= 90 and mat>=90; 
--��6) ����, ����, ���� �߿��� �Ѱ����̶� 40�̸� ���� ��ȸ�Ͻÿ�
select *from sungjuk where kor<40 or eng<40 or mat<40; 
    -- select �Ҷ� ���� �θ� Į������ ������
    
--��7) ���������� 80~89�� ���� ���� ��ȸ�Ͻÿ�
select * from sungjuk where kor between 80 and 89;
    --and ������ ���� =�� ���ش�.. �����ϱ�
select * from sungjuk where kor>=80 and kor<=89;
--��8) �̸��� '����ȭ', '����ȭ'�� ��ȸ�Ͻÿ�
select * from sungjuk where uname in('����ȭ', '����ȭ');
select * from sungjuk where uname = '����ȭ' or uname = '����ȭ';

[LIKE ������]
- ���ڿ� �����Ϳ��� ����� ������ �˻��� ��
- ���ڰ��� ������� %
- ���ڰ��� ��ġ �ʿ� _

--�� 9)�̸����� 'ȫ'���� �����ϴ� �̸��� ��ȸ�Ͻÿ�
select * from sungjuk where uname like 'ȫ%';
--��10)�̸����� 'ȭ'�� ������ �̸��� ��ȸ�Ͻÿ�
select * from sungjuk where uname like '%ȭ';
select uname as �̸�
from sungjuk 
where uname like '%ȭ';
--��11)�̸��� '��'���� �ִ� �̸��� ��ȸ�Ͻÿ�
select * from sungjuk where uname like '%��%';

--����
where subject like '%trim%';
--trim�� ����ó���ؼ� �˻���ȸ

--��12)�α��� �̸����� 'ȭ'�� ������ �̸��� ��ȸ�Ͻÿ�
select * from sungjuk where uname like '_ȭ';

select * from sungjuk;

select uname as �̸� from sungjuk where uname like '_��_';
--��������
select * from
from board
where subject like '%happy%' or content like '%happy%';

[sort����]
- �������� asc, ��������, �⺻��. 1->10 A->Z a->z
- �������� desc
- 1������ �Ŀ��� n������ ����!!
- ����) order by �÷�1, �÷�2, �÷�3,..
- ���ϴ� ������ ������ -> �� �������� �������Բ� �������ִ� ����. 

-- ��ü ���ڵ带 �̸������� �����ؼ� ��ȸ�Ͻÿ�
select * 
from sungjuk
order by uname asc; --�������� ����, �����ټ�, asc��������

select *
from sungjuk
order by kor;

-- 1������ : ���� ���� asc
-- 2������ : ���� ������ ���ٸ� -> �̸��� �������� �������� ����
select * 
from sungjuk
order by kor, uname desc;
select *
from sungjuk 
order by kor, eng, mat;

--��13) ���� ������ 50���̻��� �࿡ ���ؼ� ������ ����� ���Ͻÿ�
select
kor+mat+eng as ���� , round((kor+mat+eng)/3) as ��� 
from sungjuk
where kor >=50;
commit;
update sungjuk
set tot = kor+ mat+ eng , aver = (kor+mat+eng)/3 
where kor >= 50;
select * from sungjuk;
select * from sungjuk order by uname;
select * from sungjuk order by kor desc;

--��14) ��� 70�� �̻� ���� �̸������� ��ȸ�Ͻÿ�
select *
from sungjuk
where aver >= 70 
order by uname;

select *
from sungjuk 
where (kor+mat+eng)/3 >= 70 order by uname;

select count(*) 
from sungjuk 
where tot is null;

select *
from sungjuk 
where aver is not null;

select *
from sungjuk
where not aver is null 
order by uname;
--��15) ����ִ� ������ ����� ��� ���Ͻÿ�
select *
from sungjuk
where tot is null and aver is null;

update sungjuk
set
tot = eng+kor+mat , aver = (eng+kor+mat)/3
where tot is null and aver is null;

select * from sungjuk;

[alter] 
- ���̺��� ���� ���� �� ����
1. �÷��߰�
����) alter table table�� add ( �÷��� ������Ÿ��);

--music�÷� �߰�
alter table sungjuk add (music int null);

2. �÷��� ����
���� ) alter table ���̺�� rename column �÷��� to �ٲ��÷���;

alter table sungjuk rename column kor to korea;

3. �÷� ������ Ÿ�� ����
����) alter table ���̺�� modify (�÷��� ������Ÿ��);
--music �÷� �ڷ����� varchar�� ����
alter table sungjuk modify ( music varchar(5));
desc sungjuk;

4. �÷� ����
���� ) alter table ���̺�� drop (�÷���);
    alter table ���̺�� drop column �÷���;
alter table sungjuk drop column music;
desc sungjuk;

[as]
- Į���� �ӽ� ���� �� �ο�
select count (*) from sungjuk;
select count (*) as cnt from sungjuk;
select count (*) cnt from sungjuk;

[commit �� rollback]
commit;
select * from sungjuk;
rollback;
delete from sungjuk where korea >= 50;

[between]
A���� B����
select 
*
from sungjuk
where korea between 80 and 89;

[in]
���ڿ� ��Ͽ��� ã��
select *
from sungjuk
where uname in('����ȭ', '����ȭ');

select * from sungjuk;
select *
from sungjuk
where not (korea = 100 and eng = 100 and mat = 100);

��