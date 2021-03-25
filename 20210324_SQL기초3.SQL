drop table sungjuk;

[자료형]
1) 문자열
    - 시나리오 작업을 통해 어떤 자료형을 선택할 것인지 생각하기! 반드시라는 것은 없다.
    하지만 어느정도 만들어진 관례는 있으니 요구사항 분석하면서 판단하기. 
    - 최대입력 글자수는 DB에 따라 다르다. 
    
    varchar : 가변형 ''
    예) varchar(5) : 5바이트. 영문자 -> 1바이트 처리 / 한글은 기본 2바이트인데 오라클은 3바이트 먹음
                    'SKY'라고 적었을때 -> 2바이트가 남는다 -> 2바이트 없애버림. 
                    필요한 정보만 데이터에 저장하고 나머지는 없애버린다!!
                    메모리를 좀더 아껴가면서 쓸 수 있다.
                    검색 -> 계속 계산해야해서 char보다는 조금 느림
                    but.. 요새는 워낙 시스템이 좋고. 여하튼 내부에서는 그런식으로 돌아간다는 것. 
                    예 ) 글자 정보가 다이나믹한것 -> 로그인 아이디. 이름. 비밀번호 등
    char(character의 db형이다): 고정형 
    예) char(5) : 5칸 이내에서 문자열을 저장하시오. 
                    'SKY'라고 적었을때 -> 2바이트 비어도 그대로 남겨놓는다. 
                    검색 속도 측면에서 유리
                    예 ) 글자 개수가 천편일률적인 것 -> 우편번호. 주민번호. 휴대폰번호 등 
    long ( MySql : text) : 아주 많은 텍스트를 입력해야만 할 때 쓴다. 
2) 숫자
    int ( 표준안) 
    number( 오라클) 

3) 날짜
    date 

[제약조건]
- 데이터의 무결성을 위해 필요
- 왜 결점이 없는 데이터를 저장해야 할까? -> 유효한 정보를 효율적으로 얻어내기 위하여
ex) not null , default , unique, primary key, foreign key 등
- 자료의 요건을 컬럼에 강제적으로 부여

    1. primary key 
        : 해당 레코드만 딱 꼬집어서 수정, 삭제, 조회하기 위해 필요함
        테이블당 1개씩 반드시 존재해야함. ( 복수 키 존재 가능 ? -> DB에 따라 다름)
        유일성 보장. not null.
    2. not null 
        : 빈값허용 X
    3. check 제약 
        : 컬럼 입력값의 범위에 제한을 둘 수 있다.
        ex ) check( 컬럼명 in('서울', '부산', '대구'))
                check( 컬럼명 between 10 and 20)
    4. default 
        : 입력 안했을 시 해당 컬럼이 정의한 기본값을 자동으로 넣어준다.
    5. unique 
        : 중복 허용 안함, null값은 허용
    6. foreign key 
        : 외래키, 부모 자식간의 관계 명시. 테이블 조인할때 쓰인다

create table sungjuk(
    sno     int         primary key
    ,uname  varchar(50) not null
    ,kor    int         check(kor between 0 and 100)
    ,mat    int         check(mat between 0 and 100)
    ,eng    int         check(eng between 0 and 100)
    ,tot    int         default 0 
    ,aver   int         default 0
    ,addr   varchar(20) check(addr in('Seoul','Jeju','Busan','Suwon'))
    ,wdate  date        default sysdate
);
desc sungjuk;
그외 ) number(3) : 3자리수 넘버 -999 ~ + 999
        number(5,2) : 전체 자리수 5개중 소수점 2개 허용( double형)
MySQL자료형 )
 int 를 기준으로 tinyint, smallint, mediumint, int, bigint, float, double, boolean
 date, datetime, timestamp..
 char, varchar, tinytext, text...
 
 [제약조건에 위배되는 데이터를 넣으면??]
 -> 제약조건 에러 메시지가 뜬다! 
 insert into sungjuk(uname, sno, kor, eng, mat ) 
    values ('홍길동',1, 111,20,30); 
     -> check constraint violated
insert into sungjuk(sno, uname, kor, eng, mat)
    values(1, '손흥민', 100,90,80);
select * from sungjuk;
insert into sungjuk(sno, uname, kor, eng, mat)
    values (1, '김연아',100,100,100);
    ->unique constraint violated
insert into sungjuk(uname, kor, eng, mat)
    values ( '김연아',100,100,100);
    -> cannot insert null into ~~데이터베이스명 . 테이블명 . 컬럼명
insert into sungjuk(sno,uname, kor, eng, mat,addr)
    values ( 2, '김연아',100,100,100,'daejeon');
    ->check constraint violated
 insert into sungjuk(sno,uname, kor, eng, mat)
    values ( 2, '김연아',100,100,-20);
/////////////////////////////////////////////////////////////////////

select * from sungjuk;
delete from sungjuk where sno= 1;

[자동으로 일련번호 부여]
Oracle : sequence
MySQL: identity

select sequence_name from dba_sequences;

drop sequence sungjuk_seq;
commit;
select count(*) from sungjuk;
create sequence sungjuk_seq;
insert into sungjuk(sno, uname, kor, eng, mat, addr, wdate)
values(sungjuk_seq.nextval,'솔데스크', 90, 85, 95, 'Seoul',sysdate);

insert into sungjuk(sno,uname,kor,eng,mat,addr,wdate)
values(sungjuk_seq.nextval,'무궁화',40,50,20,'Seoul',sysdate);

insert into sungjuk(sno,uname,kor,eng,mat,addr,wdate)
values(sungjuk_seq.nextval,'진달래',90,50,90,'Jeju',sysdate);

insert into sungjuk(sno,uname,kor,eng,mat,addr,wdate)
values(sungjuk_seq.nextval,'개나리',20,50,20,'Jeju',sysdate);
insert into sungjuk(sno,uname,kor,eng,mat,addr,wdate)
values(sungjuk_seq.nextval,'봉선화',90,90,90,'Seoul',sysdate);

insert into sungjuk(sno,uname,kor,eng,mat,addr,wdate)
values(sungjuk_seq.nextval,'나팔꽃',50,50,90,'Suwon',sysdate);

insert into sungjuk(sno,uname,kor,eng,mat,addr,wdate)
values(sungjuk_seq.nextval,'선인장',70,50,20,'Seoul',sysdate);

insert into sungjuk(sno,uname,kor,eng,mat,addr,wdate)
values(sungjuk_seq.nextval,'소나무',90,60,90,'Busan',sysdate);
insert into sungjuk(sno,uname,kor,eng,mat,addr,wdate)
values(sungjuk_seq.nextval,'참나무',20,20,20,'Jeju',sysdate);

insert into sungjuk(sno,uname,kor,eng,mat,addr,wdate)
values(sungjuk_seq.nextval,'홍길동',90,90,90,'Suwon',sysdate);

insert into sungjuk(sno,uname,kor,eng,mat,addr,wdate)
values(sungjuk_seq.nextval,'무궁화',80,80,90,'Suwon',sysdate);
select count(*) from sungjuk;
select * from sungjuk;
commit;
select
kor+mat+eng as total , round((kor+mat+eng)/3) as aver, uname
from sungjuk

update sungjuk
set tot= kor+mat+eng, aver =(kor+mat+eng)/3;

commit;
select * from sungjuk;

2)
select
* 
from sungjuk
where uname like '%나%';

3)
select *
from sungjuk
where addr in('Seoul', 'Jeju');

4)
select count(*)
from sungjuk 
where mat>=90 and eng>= 90 and kor >=90;

5)
select *
from sungjuk
order by addr asc , sno asc
////////////////////////////////////////////////////////////////////////
[distinct]
select distinct addr from sungjuk;
[group by]
 - 컬럼에 동일 내용끼리 그룹화
 - 형식) group by 컬럼1, 컬럼2, 컬럼3~~
 - 1차그룹핑 2차그룹핑 .. n차 그룹핑 가능
 
 select addr, count(addr) 
 from sungjuk
 group by addr;
 
 select addr, uname
 from sungjuk
 group by addr;
 --> error! not a group by expression. 
 -- 한개의 값만 가지고 있지 않기 때문에 select할수없다. uname중 누구를 뽑을건데! 
 -- 따라서 group by는 집계함수와 함께 많이 사용된다. 
 
 select count(addr) cnt ,addr
 from sungjuk
 group by addr;
 
 select count(*) , addr
 from sungjuk 
 group by addr;
 
 select addr
 from sungjuk
 group by addr
 order by addr desc;
 
 select count(*), addr
 from sungjuk
 group by addr
 order by count(*) desc; --주소별 인원수를 내림차순 조회하기
 
 select count(*) cnt , addr
 from sungjuk
 group by addr
 order by cnt desc;
 --from 성적에서 -> group -> select -> order 정렬
 --sql을 분석할 때는 순차접근을 하면 안된다. 
 
 select addr, max(kor)
 from sungjuk
 group by addr;
 
  select addr, min(kor)
 from sungjuk
 group by addr;
 
  select addr, min(kor),max(kor),avg(kor),sum(kor)
 from sungjuk
 group by addr;
 
 select addr, min(kor),max(kor),avg(kor),sum(kor)
 from sungjuk
 group by addr 
 order by addr;
 
  select addr, min(kor),max(kor),round(avg(kor)) 평균 ,sum(kor)
 from sungjuk
 group by addr 
 order by 평균 desc;
 
   select addr, min(kor),max(kor),round(avg(kor),2) 평균 ,sum(kor)
 from sungjuk
 group by addr 
 order by 평균 desc;
 
 select addr as address
    , min(kor) as min_kor
    ,max(kor) as max_kor
    ,round(avg(kor),1) as avg_kor
    ,sum(kor) as sum_kor
 from sungjuk
 group by addr 
 order by avg_kor desc;
 
 select count(addr) cnt_addr, addr 
 from sungjuk
 where aver >= 70
 group by addr

 order by cnt_addr;
 
 --from -> where -> group ->select ->order by
 select addr, kor, eng, mat
 from sungjuk
 order by addr ,kor;
 
 [having 절]
 select addr, count(*)
 from sungjuk
 group by addr
 having addr in('Jeju','Suwon');
 
  select addr, count(*)
 from sungjuk
 group by addr
 having count(*) =3;
 
 select addr, count(*)
 from sungjuk
 group by addr
 having count(*) >=3;
 
 select addr, round(avg(kor))
 from sungjuk
 group by addr
 having round(avg(kor)) >=50;
 
select addr, round(avg(kor))
 from sungjuk
 group by addr
 having round(avg(kor)) >=50 
 order by round(avg(kor)) desc;
 
 select addr, round(avg(kor)) as avg_kor
 from sungjuk
 group by addr
 having round(avg(kor)) >=50 
 order by round(avg(kor)) desc;
 
 
 select
 count(*),addr
 from sungjuk
 where aver >= 70
 group by addr
 having count(addr) <2
 order by count(addr) ;
 
 //////////////////////////////////////////////////////////////////////
 [CASE WHEN ~ THEN END 구문]
 자바의 IF문과 비슷
    CASE WHEN 조건1 THEN 조건만족시 값1
        WHEN 조건2 THEN 조건만족시 값2
        WHEN 조건3 THEN 조건만족시 값3 ...
        ...
        ELSE 값
    END 결과컬럼명
    
SELECT UNAME, ADDR FROM SUNGJUK;
방식은 여러가지가 있다. 
자바에서 해결이 안되면 쿼리로 날려서 해결할 수도 있는 것이다!

SELECT ADDR, UNAME,
CASE WHEN ADDR = 'Seoul' THEN '서울'
    WHEN ADDR = 'Jeju' then '제주'
    when addr = 'Suwon' then '수원'
    else '기타'
end as juso
FROM SUNGJUK;

select uname, kor, 
case when kor >=90 then 'A학점'
    when kor >= 80 then 'B학점'
    when kor >=70 then 'C학점'
    when kor >=60 then 'D학점'
    else 'F학점'
end as 학점
from sungjuk;

select uname, kor, 
case when kor >=90 then 'A학점'
    when kor >= 80 then 'B학점'
    when kor >=70 then 'C학점'
    when kor >=60 then 'D학점'
    else 'F학점'
end 학점 --as 생략가능
from sungjuk;
-- case~when then 구문으로 가공된 컬럼을 select해서 보여주는 것이다.

select uname, kor, 
case when kor >=90 and kor <=100 then 'A학점'
    when kor >= 80 and kor <=89 then 'B학점'
    when kor >=70 and kor <=79 then 'C학점'
    when kor >=60 and kor <=69 then 'D학점'
    else 'F학점'
end 학점 --as 생략가능
from sungjuk;

select 학점, count(*) from(
select uname, kor, 
case when kor >=90 and kor <=100 then 'A학점'
    when kor >= 80 and kor <=89 then 'B학점'
    when kor >=70 and kor <=79 then 'C학점'
    when kor >=60 and kor <=69 then 'D학점'
    else 'F학점'
end 학점 --as 생략가능
from sungjuk)
group by 학점 ;

select uname, kor, 
case when kor between 90 and 100 then 'A학점'
    when kor between 80 and 89 then 'B학점'
    when kor between 70 and 79 then 'C학점'
    when kor between 60 and 69 then 'D학점'
    else 'F학점'
end 학점 --as 생략가능
from sungjuk;