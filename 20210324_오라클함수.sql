[����Ŭ �Լ� �н�~~]

--nvl()�Լ� : null���� �ٸ� ������ �ٲپ��ش�

select max(kor)
from sungjuk
where addr = 'Incheon';

select max(kor) +1
from sungjuk
where addr = 'Incheon';  --null���� 1�� ���ص� null �� ���´�

select nvl(max(kor),0) --null���̸� 0���� �ٲپ� �޶�. 
from sungjuk
where addr = 'Incheon'; 

select nvl(max(kor),0) +1
from sungjuk
where addr = 'Incheon';  --��갡������

select sysdate from dual;

[dual] : ������ ���̺�. 
[ASCII���� ���ڷ� ��ȯ�����ִ� �Լ�]
SELECT CHR(65)
FROM DUAL;

SELECT CHR(99)
FROM DUAL;

select uname||'�� ����� '||aver||' �Դϴ�' as ���
from sungjuk;

select uname || kor from sungjuk;

[concat()] 
- �÷��� �ش��ϴ� ���ڿ��� ���δ�
- ����) concat(a,b)
select concat ('�ι̿�' , '�ٸ���' )from dual;
select concat(addr , kor ) from sungjuk;
select concat ('�ּ� : ' ,addr) from sungjuk;

�� ������ �����ö� �̷������� ������ ���� �ֱ���.... ����� �����Ҷ� S_�� ���⼭ �ٿ��� 
ã�ƿ´ٴ���? �ٵ� select�Ҷ� �����ʹϱ� insert�Ҷ��� ���� �ڹٴܿ��� �ؾ��� ��?

///////////////////////////////////////////////////////////////////////
[��¥ ���� �Լ�]
- sysdate : �ý����� ���� ��¥/�ð� ����
select sysdate from dual;
select sysdate + 100 from dual; --���糯¥ + 100�� ����

select to_char(sysdate, 'yyyy-mm-dd')from dual;
select to_char(sysdate, 'yyyy-mm-dd hh:mi:ss')from dual;

select MONTHS_BETWEEN
       (TO_DATE('02-02-1995','MM-DD-YYYY'),
        TO_DATE('01-01-1995','MM-DD-YYYY') ) "Months"
  FROM DUAL;
  
select MONTHS_BETWEEN
       ('2020-11-01', '2021-03-24') "Months"
  FROM DUAL;

select to_date('2020-10-05') from dual;

select to_date('2020-11-01') -to_date( '2021-03-24') as day from dual;

------------------------------------------------------------------------
[���� ���� �Լ�]
select avg(kor) from sungjuk;

select ceil(avg(kor)) from sungjuk;

select floor(avg(kor)) from sungjuk;
select round(avg(kor),3) from sungjuk; --���° �ڸ������� �ݿø�?
select trunc(avg(kor),1) from sungjuk; -- ���° �ڸ������� ����? 

SELECT TO_NUMBER('123')FROM DUAL;
SELECT TO_NUMBER('123') +1 FROM DUAL;

SELECT '123'+1 FROM DUAL; --���� ���� ���. �ڵ����� TO_NUMBERȣ����
SELECT '123'||'1'FROM DUAL; --1231. ���ڿ� ��ħ
----------------------------------------------------------------------

[���ڰ����Լ�]
- SUBSTR()�Լ�
SELECT SUBSTR('89121223', 5) FROM DUAL;
SELECT SUBSTR('89121223', 1) FROM DUAL;-- �ε��� 1�������� ī��Ʈ��(�ڹٶ��ٸ�����!!)

- LPAD()�Լ�
SELECT RPAD(KOR,5,'*') FROM SUNGJUK;
SELECT LPAD(UNAME, 10,'*')FROM SUNGJUK; --����Ʈ������ ����
-------------------------------------------------------------------
[�����÷�]
 -��¥�÷� 
 -ROWNUM, ROWID( ����Ŭ��) 
SELECT ROWNUM, KOR
FROM
SUNGJUK;

SELECT UNAME, ADDR, ROWNUM AS RN
FROM SUNGJUK;

SELECT UNAME, ADDR , ROWID
FROM SUNGJUK;
--ROWID: �� �����Ͱ� ����� �ּҰ�

select addr, rownum, uname
FROM SUNGJUK 
WHERE ADDR ='Seoul';

select uname, addr, rownum
from sungjuk
order by uname;

select sub.*, rownum as rn
from (
select uname, addr from sungjuk
order by uname) sub;

commit;
