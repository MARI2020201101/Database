[��������]

select avg(kor)
from
sungjuk;

select round(avg(kor))
from
sungjuk;

����1) ���������� ��պ��� ���ϴ� ���� ���� ��ȸ
select kor||'��' as ��������, uname
from sungjuk
where kor>=(
select
round(avg(kor))
from sungjuk);

����2) ���������� �������� ��պ��� ���� �̸�, ����, �������� ��ȸ

select
uname, addr, kor
from sungjuk
where kor>=(
select round(avg(kor)) as s_avg
from sungjuk
where addr='Seoul');

����3) ���������� �������� ��պ��� ���� ���������� �ٸ������� �ִ��� ��ȸ

select addr, uname, kor 
from sungjuk
where kor>=(
select round(avg(kor)) 
from sungjuk
where addr='Seoul') and addr <> 'Seoul';

--where ���� ������ ���� ���� and�� �����ϱ�
����4)���������� �ּڰ����� ���� ������ ���а� ��� �ִ°�

select uname,kor, mat, eng
from sungjuk
where
mat<=
(select min(kor)
from sungjuk) or
eng<= (select min(kor)
from sungjuk);  

commit;