[오라클 함수 학습~~]

--nvl()함수 : null값을 다른 값으로 바꾸어준다

select max(kor)
from sungjuk
where addr = 'Incheon';

select max(kor) +1
from sungjuk
where addr = 'Incheon';  --null에는 1을 더해도 null 이 나온다

select nvl(max(kor),0) --null값이면 0으로 바꾸어 달라. 
from sungjuk
where addr = 'Incheon'; 

select nvl(max(kor),0) +1
from sungjuk
where addr = 'Incheon';  --계산가능해짐

select sysdate from dual;

[dual] : 가상의 테이블. 
[ASCII값을 문자로 변환시켜주는 함수]
SELECT CHR(65)
FROM DUAL;

SELECT CHR(99)
FROM DUAL;

select uname||'의 평균은 '||aver||' 입니다' as 평균
from sungjuk;

select uname || kor from sungjuk;

[concat()] 
- 컬럼에 해당하는 문자열을 붙인다
- 형식) concat(a,b)
select concat ('로미오' , '줄리엣' )from dual;
select concat(addr , kor ) from sungjuk;
select concat ('주소 : ' ,addr) from sungjuk;

아 데이터 가져올때 이런식으로 가공할 수도 있구나.... 썸네일 저장할때 S_를 여기서 붙여서 
찾아온다던지? 근데 select할때 데이터니까 insert할때는 역시 자바단에서 해야할 듯?

///////////////////////////////////////////////////////////////////////
[날짜 관련 함수]
- sysdate : 시스템의 현재 날짜/시간 리턴
select sysdate from dual;
select sysdate + 100 from dual; --현재날짜 + 100일 리턴

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
[숫자 관련 함수]
select avg(kor) from sungjuk;

select ceil(avg(kor)) from sungjuk;

select floor(avg(kor)) from sungjuk;
select round(avg(kor),3) from sungjuk; --몇번째 자리수에서 반올림?
select trunc(avg(kor),1) from sungjuk; -- 몇번째 자리수에서 버림? 

SELECT TO_NUMBER('123')FROM DUAL;
SELECT TO_NUMBER('123') +1 FROM DUAL;

SELECT '123'+1 FROM DUAL; --위와 같은 결과. 자동으로 TO_NUMBER호출함
SELECT '123'||'1'FROM DUAL; --1231. 문자열 합침
----------------------------------------------------------------------

[문자관련함수]
- SUBSTR()함수
SELECT SUBSTR('89121223', 5) FROM DUAL;
SELECT SUBSTR('89121223', 1) FROM DUAL;-- 인덱스 1에서부터 카운트함(자바랑다름주의!!)

- LPAD()함수
SELECT RPAD(KOR,5,'*') FROM SUNGJUK;
SELECT LPAD(UNAME, 10,'*')FROM SUNGJUK; --바이트단위임 주의
-------------------------------------------------------------------
[모조컬럼]
 -가짜컬럼 
 -ROWNUM, ROWID( 오라클만) 
SELECT ROWNUM, KOR
FROM
SUNGJUK;

SELECT UNAME, ADDR, ROWNUM AS RN
FROM SUNGJUK;

SELECT UNAME, ADDR , ROWID
FROM SUNGJUK;
--ROWID: 그 데이터가 저장된 주소값

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
