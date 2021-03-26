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
values('g1001','홍길동','서울','111-5558','11@naver.com');

insert into tb_student(hakno,uname,address,phone,email)
values('g1002','홍길동','제주','787-8877','33@daum.net');

insert into tb_student(hakno,uname,address,phone,email)
values('g1003','개나리','서울','554-9632','77@naver.com');
insert into tb_student(hakno,uname,address,phone,email)
values('g1004','홍길동','부산','555-8844','88@daum.net');

insert into tb_student(hakno,uname,address,phone,email)
values('g1005','진달래','서울','544-6996','33@nate.com');

insert into tb_student(hakno,uname,address,phone,email)
values('g1006','개나리','제주','777-1000','66@naver.com');
insert into tb_gwamok(gcode,gname,ghakjum)
values('p001','OOP',3);

insert into tb_gwamok(gcode,gname,ghakjum)
values('p002','Oracle',3);

insert into tb_gwamok(gcode,gname,ghakjum)
values('p003','JSP',2);

insert into tb_gwamok(gcode,gname,ghakjum)
values('d001','웹표준',1);
insert into tb_gwamok(gcode,gname,ghakjum)
values('d002','포토샵',5);

insert into tb_gwamok(gcode,gname,ghakjum)
values('d003','플래시',3);

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

문1)학생테이블에서 지역별 인원수를 인원수순으로 조회하시오

select* from tb_student;
select address, count(*) 인원수
from tb_student
group by address
order by count(*) ;

문2)학생테이블에서 동명이인이 각 몇명인지 조회하시오

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

문3)학생테이블의 학번, 이름, 주소를 조회하시오 (주소는 영문으로 출력)

select hakno, uname, 
    case when address = '서울' then 'seoul'
        when address='제주' then 'jeju'
        when address='부산' then 'busan'
    end as address
from tb_student;

문4)학생테이블에서 주소별 인원수가 3명미만 행을 조회하시오
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

--구분코드 생성 예시 : 주로 영문자 + 숫자 조합. 한글은 X(통계내기 어려움)
--예) 과목코드 : 프로그래밍 p~~~, 디자인 d~~,  건축 c~~~
--예) 전임강사 / 시간강사 / 조교... 
--예) 과일나라 쇼핑몰 : 사과 apple100 .. / 오렌지 orange101.../ 바나나/...

문5) 과목테이블에서 프로그램 교과목 조회
select *
from tb_gwamok
where gcode like 'p%';
select * from tb_gwamok;

문6) 과목테이블에서 디자인 교과목 중 3학점만 조회
select *
from tb_gwamok
where gcode like 'd%' and ghakjum =3;

문제7) 과목테이블에서 프로그램 교과목의 학점 평균보다 낮은 프로그램 교과목 조회

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
[테이블 조인]