[��� �ε���]
create / replace view view�̸�
alter�Ҽ��� ����. 
drop view ���̸�
���� + ��������� ���� ����
--------------------------------------------------------
select * from tab where tabtype='TABLE';
select * from tab where tabtype='VIEW';
SELECT * FROM SUNGJUK;
SELECT *
FROM SUNGJUK
WHERE ADDR IN('Seoul','Jeju');

SELECT UNAME,KOR,MAT,ENG,ADDR
FROM SUNGJUK
WHERE ADDR IN('Seoul','Jeju');

CREATE OR REPLACE VIEW V_SEOUL_JEJU AS
SELECT UNAME,KOR,MAT,ENG,ADDR
FROM SUNGJUK
WHERE ADDR IN('Seoul','Jeju');

SELECT * FROM TAB WHERE TABTYPE='VIEW';

SELECT * FROM V_SEOUL_JEJU;

DROP VIEW V_SEOUL_JEJU;
COMMIT;

SELECT COUNT(*) FROM V_SEOUL_JEJU;
SELECT *
FROM V_SEOUL_JEJU;

SELECT *
FROM V_SEOUL_JEJU
WHERE KOR>50;

SELECT * FROM TB_SUGANG;
SELECT * FROM TB_GWAMOK;

CREATE OR REPLACE VIEW V_SU_GW 
    AS 
    SELECT HAKNO �й�, SUM(GHAKJUM) ������ FROM TB_SUGANG SU JOIN TB_GWAMOK GW ON SU.GCODE = GW.GCODE
GROUP BY HAKNO;

SELECT * FROM V_SU_GW;

SELECT * FROM TB_STUDENT;
SELECT * FROM V_SU_GW V JOIN TB_STUDENT S ON V.�й� = S.HAKNO;
SELECT HAKNO ,UNAME, ������ FROM V_SU_GW V JOIN TB_STUDENT S ON V.�й� = S.HAKNO;

-- �����ͻ���(user_views���̺�) ���� ��������Ȯ��
select view_name from dba_views;
select * from dba_views where view_name = 'V_SU_GW';

//////////////////////////////////////////////////////
[�ε���]
-- ���̺� ���� (PK�� ���� ���̺�)
create table c_emp(
  id        number(5)    
  ,name     varchar2(25)
  ,salary   number(7, 2)
  ,phone    varchar2(15)
  ,dept_id  number(7)
);

-- ���߰�
insert into c_emp(id,name) values (10,'kim');
insert into c_emp(id,name) values (20,'park');
insert into c_emp(id,name) values (30,'hong');

select * from c_emp;
commit;

--�ε��������� : full scan
select * from c_emp 
where name ='hong'; --full scan
--�ε��������� : range scan 
create index �ε����� on ���̺��(Į����)
create index c_emp_idx on c_emp(name);
commit;

select * from c_emp where name ='hong';

create table emp3 (
  no    number       primary key
  ,name varchar2(10)
  ,sal  number
);

--unique scan. ( primary key ��ĵ) : �ڵ��ε��� �����ؼ� full��ĵ ��������
-- �ڵ����ĵǰ��ִ�
desc emp3;
select * from emp3 where no=3;

------------------------------------------------------------
create table MASK_INFO(
 REGDATE DATE
 ,MASK_ID NUMBER(19) NOT NULL PRIMARY KEY
 ,MASKNAME VARCHAR(100) NOT NULL
 ,SHOPNAME VARCHAR(50) 
 ,PRICE NUMBER(10) DEFAULT 0
 ,WORK_ID NUMBER(10)
 ) ; 
 CREATE SEQUENCE MASK_INFO_SEQ;
 --------------------------------------------------------------
 drop sequence mask_info_seq;
 commit;
 
 ---------------------------------------------------------------
 desc tb_mask;
 ---------------------------------------------------------------
 [������ ���� ���ν���]
 create table emp4(
    no     number
   ,name  varchar2(100)
   ,sal   number
);

drop table emp4;
���ν����� ���ؼ� ������ insert�Ѵ�!! 100���� �߰��ϱ�
declare 
    i number :=1;
    name varchar(20) := 'SEOUL';
    sal number := 0;
begin
    while i<=1000000 loop
        if i mod 2 = 0 then 
            name := 'SEOUL' || TO_CHAR(i);
            sal := 200;
            elsif i mod 3 = 0 then
                name := 'JEJU' || TO_CHAR(i);
                sal := 250;
            elsif i mod 4 = 0 then
                name := 'BUSAN' || TO_CHAR(i);
                sal := 300;
            elsif i mod 5 = 0 then
                name := 'SUWON' || TO_CHAR(i);
                sal := 275;
            else
                name := 'INCHEON' || TO_CHAR(i);
                sal := 400;
            end if;
            insert into emp4(no,name,sal) values(i, name, sal);
            -- ���� �÷���, values�ڴ� ���� ������ ������
        i := i+1;
    end loop;
end;
/

desc emp4;
select count(*) from emp4;
select * from emp4 where no < 30;

select * from emp4 where name = 'SEOUL466'; --fullscan��. cost 957

create index emp4_name_idx on emp4(name);
commit;
select * from user_indexes ;
select * from user_indexes where table_name='EMP4';

SELECT * FROM EMP4 WHERE NAME = 'SEOUL456'
CREATE INDEX EMP4_SAL_IDX ON EMP4(SAL) ;
SELECT * FROM USER_INDEXES WHERE TABLE_NAME = 'EMP4';

SELECT * FROM EMP4 WHERE SAL=275 AND NO<100;
