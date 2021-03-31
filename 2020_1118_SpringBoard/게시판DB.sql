/*
--�Ϸù�ȣ 
	drop		sequence seq_board_idx
	create sequence seq_board_idx
	
--���̺����
	drop		table board
	create table board 
	(
		b_idx 			int,    					--�Ϸù�ȣ
		b_subject  	varchar2(200), 	--����
		b_content  	clob,   					--����
		b_ip 				varchar2(100),    --IP
		b_regdate   date,						--�ۼ�����
		b_readhit		int,     					--��ȸ��
		b_use_yn		char(1),      			--�������(y,n)
		m_idx			int,           			--ȸ�� ��ȣ(���ۼ���)
		m_name		varchar2(100),    -- ȸ�� �̸�(���ۼ���)
		ref				int, 						--�׷� �۹�ȣ
		step				int,						--�� ����
		depth			int						--�� ����
	)

	--��������(�⺻Ű)
	alter table board add constraint pk_board_idx primary key(b_idx);
	
	--��������(�ܷ�Ű) m_idx�� �����հ� ����ũ�ų� �����̸Ӹ����߸� ����
	alter table board add constraint fk_board_m_idx foreign key(m_idx)
		references member (m_idx);
	
	--��������(üũ����)
	alter table board add constraint ck_board_use_yn 
			check( b_use_yn in( 'y' , 'n' ) ); 
	
--Sample Data 
   --���۾���(���α�)
	insert into board values( 
		seq_board_idx.nextVal,
		'���� 1���̴�',
		'�׻� ���� 1���̴�',
		'192.168.7.17',
		sysdate,
		0,
		'y',
		1,
		'�����',
		seq_board_idx.currVal,
		0,
		0
	   );	
	   
	--��۾��� ( ���)
	insert into board values( 
		seq_board_idx.nextVal,
		'����� ���� 1���̴٤���',
		'����� ���� 1���Ұ�',
		'192.168.7.17',
		sysdate,
		0,
		'y',
		1,
		'�����',
		1,
		1,
		1
	 );	
	-- ����
	 	insert into board values( 
		seq_board_idx.nextVal,
		'�׷� �㿣 �Խù�1���ض�',
		'�ƽ����� ���� �Ұ� ^^',
		'192.168.7.17',
		sysdate,
		0,
		'y',
		1,
		'�����',
		1,
		2,
		2
	 );	
  commit
  
  -- paging�޴��� �ʿ��� SQL�� �ۼ�
  
  select
  *
  from
  
  (
  select 
  	rank() over(order by ref desc, step asc) as no,
  	b.*
  from 
  	(select * from board) b
  )	
  
  where no between 1 and 5
  
  select * from (select rank() over(order by ref desc, step asc) as no, b.* from (select * from board) b ) where no between 1 and 5
  
  --��ü ���ڵ�� ���ϱ�
  select nvl(count(*),0) from board
  
  
	
select * from member
select * from board order by ref desc, step asc
*/