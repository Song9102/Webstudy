/*

create sequence seq_member_idx
drop sequence cc

create table member
	(
		m_idx 		int,			--ȸ����ȣ
		m_id		varchar2(100),	--���̵�
		m_pwd		varchar2(100),	--��й�ȣ
		m_name		varchar2(100),	--�̸�
		m_nickname	varchar2(100),	--�г���
		m_age		int,			--����
		m_sex		varchar2(100),	--����
		m_regdate	date			--��������
	)

alter table member
    add constraint pk_member_m_idx primary key(m_idx);


alter table member
    add constraint unique_member_m_id unique(m_id);



	insert into member values(
								seq_member_idx.nextVal, --ȸ����ȣ
								'admin', --���̵�
								'1234', --��й�ȣ
								'������', --�̸�
								'������', --�г���
								99, --����
								'����', --����
								sysdate --��������
							)

select * from member


































*/