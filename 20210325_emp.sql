create table emp(
  empno       number(4)     --���(-9999~9999)
  ,ename      varchar2(10)  --�̸�
  ,job        varchar2(9)   --����
  ,mgr        number(4)     --�Ŵ�������
  ,hiredate   date          --�Ի���
  ,sal        number(7,2)   --�޿�(�Ҽ��� 2�ڸ�)
  ,comm       number(7,2)   --Ŀ�̼�(���ʽ�)
  ,deptno     number(2)     --�μ��ڵ�(-99~99)
);
insert into emp(empno, ename, job, mgr, hiredate, sal, deptno)
values(7369, '������', '���', 7902, '2000-12-17', 200, 20);

insert into emp(empno, ename, job, mgr, hiredate, sal, deptno)
values(7499, '���޷�', '����', 7698, '2001-12-15', 360, 20);

insert into emp(empno, ename, job, mgr, hiredate, sal, deptno)
values(7521, '���϶�', '����', 7698, '2001-02-17', 355, 30);

insert into emp(empno, ename, job, mgr, hiredate, sal, deptno)
values(7654, '�����', '����', 7839, '2002-01-11', 400, 30);
insert into emp(empno, ename, job, mgr, hiredate, sal, deptno)
values(7698, '������', '����', 7698, '2000-07-12', 325, 20);

insert into emp(empno, ename, job, mgr, hiredate, sal, deptno)
values(7782, '�迬��', '���', 7698, '2001-12-17', 225, 10);

insert into emp(empno, ename, job, mgr, hiredate, sal, deptno)
values(7778, '����ȭ', '���', 7839, '2005-11-14', 200, 10);

insert into emp(empno, ename, job, mgr, hiredate, sal, deptno)
values(7839, 'ȫ�浿', '����', 7566, '2006-06-17', 450, 20);

select * from emp;
commit;

insert into emp(empno, ename, job, mgr, hiredate, sal, deptno)
values(7844, '�۰�ȣ', '����', 7566, '2018-09-17', 400, 30);

insert into emp(empno, ename, job, mgr, hiredate, sal, deptno)
values(7876, '���켺', '��ǥ', 7839, '2004-09-09', 500, 30);

insert into emp(empno, ename, job, mgr, hiredate, sal, deptno)
values(7900, '������', '���', 7902, '2001-12-03', 200, 20);

��ü �� ���� ��ȸ
select count(*) from emp;

drop table emp;
create table emp(
  empno       number(4)     primary key --���(-9999~9999)
  ,ename      varchar2(50)              --�̸�
  ,job        varchar2(10)              --����
  ,mgr        number(4)                 --�Ŵ�������
  ,hiredate   date                      --�Ի���
  ,sal        number(7,2)               --�޿�(�Ҽ��� 2�ڸ�)
  ,comm       number(7,2)               --Ŀ�̼�(���ʽ�)
  ,deptno     number(2)                 --�μ��ڵ�(-99~99)
);

��4) ���̺��� Į��(�ʵ�) ����� Ȯ���Ͻÿ�

select * from emp;

��5) ����̸���(��������) �����Ͻÿ�
select *
from emp
order by ename; 

��6) ����̸���(��������) �����Ͻÿ�
select *
from emp
order by ename desc; 

��7) �޿� ������������ ����̸�(ename), �޿�(sal), �μ��ڵ�(deptno)�� ��ȸ�Ͻÿ�
select ename, sal, deptno
from emp 
order by sal desc;

��8) �μ��ڵ� ��������, �޿� ������������
     ����̸�(ename), �޿�(sal), �μ��ڵ�(deptno)�� ��ȸ�Ͻÿ�

select ename, sal, deptno
from emp
order by deptno , sal desc;

��9) �̸�(ename)/�Ի�����(hiredate)/�μ��ڵ�(deptno)��
      �μ��ڵ� ��������, �Ի�����(hiredate) ������������ ��ȸ�Ͻÿ�
select ename, hiredate, deptno
from emp
order by deptno, hiredate ;

��10) ����(job) Į���� �ߺ������͸� �ϳ����� ��ȸ�Ͻÿ�
select distinct job
from emp;
��11) emp���̺��� job ��������, sal ������������ �����ؼ�
      ename �̸�, job ����, sal �޿� Į�������� ��Ī�� �ٲ㼭 ��ȸ�Ͻÿ�
select ename �̸�, job ����, sal �޿�
from emp
order by job, sal desc;

��12) �̸�(ename)/�Ի�����(hiredate)/�μ��ڵ�(deptno)��
      �μ��ڵ� ��������, �Ի�����(hiredate) ������������ ��ȸ�Ͻÿ�
select ename, hiredate, deptno
from emp
order by deptno , hiredate ;

��13) ����(job) Į���� �ߺ������͸� �ϳ����� ��ȸ�Ͻÿ�

select distinct job from emp;
��14) emp���̺��� job ��������, sal ������������ �����ؼ�
      ename �̸�, job ����, sal �޿� Į�������� ��Ī�� �ٲ㼭 ��ȸ�Ͻÿ�
select ename �̸�, job ����, sal �޿�      
from emp
order by job, sal desc;


��15) �μ��ڵ�(deptno)�� 30�� ������ ��ȸ�Ͻÿ�
select *
from emp
where deptno = 30;

��16) �ߺ��� �μ��ڵ带 �Ѱ����� ��ȸ�Ͻÿ�
select distinct deptno from emp;

��12) �޿��� 100���� ���� 400���� ���� ���� ��ȸ�ϱ�(�޿� ��������)
select *
from emp
where sal >100 and sal<400
order by sal desc;

��13) �޿��� 100���� �Ǵ� 400 �̻��� ���� �˻��ϱ�(�޿� ��������)
select *
from emp
where sal <=100 or sal>=400
order by sal desc;

��14) ����(job)�� ���� �Ǵ� ������ �������� �̸������� ��ȸ�Ͻÿ�

select *
from emp
where job in('����', '����')
order by ename;

��17) �μ��ڵ尡 10 �Ǵ� 20 �Ǵ� 30�� ������ ��ȸ�Ͻÿ�
      (or, in������ ���� Ȱ���ؼ� ��ȸ)
select *
from emp
where deptno in(10,20,30);



��18) �޿��� 300~500�� ������ �޿������� ��ȸ�Ͻÿ�
      (and, between������ ���� Ȱ���ؼ� ��ȸ)
select *
from emp
where sal between 300 and 500;

��19) �̸��� ����ȭ ��ȸ�Ͻÿ�

select * from emp where ename = '����ȭ';

��20) �达���� ��ȸ�Ͻÿ�

select * from emp where ename like '��%';
select * from emp;

��21) �̸��� 'ȭ' ���Ե� ���� ��ȸ�Ͻÿ�

select * from emp where ename like '%ȭ%';

��22) �μ��ڵ尡 20�� ���ڵ忡 ���ؼ�
      �޿��� 1%�� Ŀ�̼����� å���Ͻÿ�
update emp set comm = sal*0.01
where deptno =20;

select * from emp;
��23) ������ �Ʒ��� ���� ������ �̸�, �޿�, Ŀ�̼�, ������ ��ȸ�Ͻÿ�
      �������ϴ� �� : �޿�(sal)*12����+���ʽ�(comm)

select (sal*12)+comm ����, ename, sal, comm
from emp;

��24) Ŀ�̼��� null�̸� 0���� �ٲ��� ������ �ٽ� ����ؼ�
      �̸�, �޿�, Ŀ�̼�, ������ ��ȸ�Ͻÿ�

select (sal*12)+nvl(comm,0) ����, ename, sal, nvl(comm,0)
from emp;

��25) �� ����� �޿��� �˻��ؼ� '���������� �޿��� ���Դϴ�'�� ��ȸ�Ͻÿ�
      (|| ���տ�����)
      
select ename||'�� �޿��� '||sal||'���� �Դϴ�' as result     
from emp;

��26) emp���̺��� �Ի���(hiredate)�� 2005�� 1�� 1�� ������ ����� ����
      ����� �̸�(ename), �Ի���, �μ���ȣ(deptno)�� �Ի��ϼ����� ��ȸ�Ͻÿ�
select ename, hiredate, deptno
from emp
where hiredate<TO_DATE('2005-01-01');

select ename, hiredate, deptno
from emp
where hiredate<'2005-01-01';
--��¥ �����ʹ� ''�ȿ� ������ �ȴ�!
��27) emp���̺��� �μ���ȣ�� 20���̳� 30���� �μ��� ����
     ����鿡 ���Ͽ� �̸�, �����ڵ�(job), �μ���ȣ�� �̸������� ��ȸ�Ͻÿ�
     (or, in������ ���� Ȱ���ؼ� ��� ��ȸ)
     
select ename, job, deptno
from emp
where deptno in(20, 30)
order by ename;

��28) ���, �̸�, �μ��� ��ȸ�Ͻÿ�
      (��, �μ��ڵ尡 10�̸� ������
                      20�̸� ������
                      30�̸� �����η� �ٲ㼭 ���)
                      
select * from emp;

select empno, ename, 
    case when deptno = 10 then '������'
        when deptno = 20 then '������'
        when deptno = 30 then '������'
    end as dept
from emp;

����29) ������ SQL���� �м��Ͻÿ�
      select empno, sal from emp
      where not(sal>200 and sal<300)
      order by sal;

����30) ������ SQL���� �м��Ͻÿ�
      select empno, sal from emp
      where not sal>200 and sal<300 
      order by sal;