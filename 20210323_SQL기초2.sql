DROP SUNGJUK ;
drop table sungjuk;
create table sungjuk(
sno int not null--�Ϸù�ȣ
,uname varchar(50) not null
,kor int not null
,eng int not null
,mat int not null
,aver int null
,addr varchar(50)
,wdate date --����� (����Ͻú���)
);
desc sungjuk;

[sequence] : �Ϸù�ȣ �ڵ� ���� 
��κ� �ϳ��� �������� �ϳ��� ���̺�. �����ϴ� ��� ���� X
--������ ���� : create sequence ��������
--������ ���� : drop sequence ��������
�������� alter ����. ����� �ٽø����

--�������̺��� ����� ������ �����ϱ� : ��κ� ���̺��_seq�� ���� ��(����)
create sequence sungjuk_seq;
����Ʈ�� 1���� ���� . 1�� ���� . �ѹ� ������ ��������ȣ�� ������. ���ư��� X
�ɼ��� ������ �� �� ����
drop sequence sungjuk_seq;
create sequence sungjuk_seq;
select sungjuk_seq.currval from dual;
select sequence_name from user_sequences;

[sysdate]
-- ()�� ���� �Լ�. ���� �ý����� ���� ��¥ ���� ��ȯ

-- ���߰�
insert into sungjuk(sno, uname, kor, eng, mat, addr, wdate)
values(sungjuk_seq.nextval, '�����',100,100,100,'Seoul',sysdate);

--��¥������ �������� �Է��� �� : - ��ȣ �̿�. ���ڿ������� ��� 
insert into sungjuk(sno, uname, kor, eng, mat, addr, wdate)
values(sungjuk_seq.nextval, '�迬��',100,100,100,'Jeju','2021-02-05');

select * from sungjuk;
select sungjuk_seq.currval from dual;

--�ڷ��� ����. ������ ���� �� �������� �ɱ� ex) ������ 0���� 100����, �ּҴ� ��¼��~
commit;