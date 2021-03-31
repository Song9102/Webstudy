/*
--�Ϸù�ȣ
	create sequence seq_board_idx
	drop sequence seq_b_idx
	drop table board
	
	create table board
	(
		b_idx 		int,			--�Ϸù�ȣ
		b_subject	varchar2(200),	--����
		b_content	varchar2(500),	--����
		b_ip		varchar2(100),	--������
		b_regdate	date,			--�ۼ�����
		b_readhit	int,			--��ȸ��
		b_like		int,			--���ƿ� ����
		m_idx		int,			--���ۼ��ڹ�ȣ
		m_nickname	varchar2(100)	--���ۼ��ڴг���
	)
	
	--�⺻Ű
	alter table board
		add constraint pk_board_idx primary key(b_idx);
		
	--�ܷ�Ű
	alter table board
		add constraint fk_board_m_idx foreign key(m_idx)
			references member(m_idx);
	
		
	--1.���۾���
	insert into board values(
								seq_board_idx.nextVal,
								'1��',
								'�� ���� 1��',
								'192.168.7.3',
								sysdate,
								0,
								'y',
								1,
								'������',
								seq_board_idx.currVal
							)
select * from board
	
	
	
	
	
	
	
	 
	
	
	
*/