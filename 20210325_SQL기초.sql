[서브쿼리]

select avg(kor)
from
sungjuk;

select round(avg(kor))
from
sungjuk;

문제1) 국어점수의 평균보다 잘하는 국어 점수 조회
select kor||'점' as 국어점수, uname
from sungjuk
where kor>=(
select
round(avg(kor))
from sungjuk);

문제2) 서울지역의 국어점수 평균보다 잘한 이름, 지역, 국어점수 조회

select
uname, addr, kor
from sungjuk
where kor>=(
select round(avg(kor)) as s_avg
from sungjuk
where addr='Seoul');

문제3) 서울지역의 국어점수 평균보다 잘한 국어점수가 다른지역에 있는지 조회

select addr, uname, kor 
from sungjuk
where kor>=(
select round(avg(kor)) 
from sungjuk
where addr='Seoul') and addr <> 'Seoul';

--where 조건 여러개 넣을 때는 and로 연결하기
문제4)국어점수의 최솟값보다 못한 점수가 수학과 영어에 있는가

select uname,kor, mat, eng
from sungjuk
where
mat<=
(select min(kor)
from sungjuk) or
eng<= (select min(kor)
from sungjuk);  

commit;