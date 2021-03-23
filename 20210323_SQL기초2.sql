DROP SUNGJUK ;
drop table sungjuk;
create table sungjuk(
sno int not null--일련번호
,uname varchar(50) not null
,kor int not null
,eng int not null
,mat int not null
,aver int null
,addr varchar(50)
,wdate date --등록일 (년월일시분초)
);
desc sungjuk;

[sequence] : 일련번호 자동 생성 
대부분 하나의 시퀀스에 하나의 테이블. 공유하는 경우 거의 X
--시퀀스 생성 : create sequence 시퀀스명
--시퀀스 제거 : drop sequence 시퀀스명
시퀀스는 alter 없음. 지우고 다시만들기

--성적테이블에서 사용할 시퀀스 생성하기 : 대부분 테이블명_seq로 많이 함(관례)
create sequence sungjuk_seq;
디폴트는 1에서 시작 . 1씩 증가 . 한번 삭제된 시퀀스번호는 없어짐. 돌아갈수 X
옵션을 여러개 줄 수 있음
drop sequence sungjuk_seq;
create sequence sungjuk_seq;
select sungjuk_seq.currval from dual;
select sequence_name from user_sequences;

[sysdate]
-- ()가 없는 함수. 현재 시스템의 현재 날짜 정보 반환

-- 행추가
insert into sungjuk(sno, uname, kor, eng, mat, addr, wdate)
values(sungjuk_seq.nextval, '손흥민',100,100,100,'Seoul',sysdate);

--날짜데이터 수동으로 입력할 때 : - 기호 이용. 문자열데이터 취급 
insert into sungjuk(sno, uname, kor, eng, mat, addr, wdate)
values(sungjuk_seq.nextval, '김연아',100,100,100,'Jeju','2021-02-05');

select * from sungjuk;
select sungjuk_seq.currval from dual;

--자료형 공부. 정해진 서식 및 제약조건 걸기 ex) 점수는 0에서 100사이, 주소는 어쩌구~
commit;