/*
--일련번호
	create sequence seq_board_idx
	drop sequence seq_b_idx
	drop table board
	
	create table board
	(
		b_idx 		int,			--일련번호
		b_subject	varchar2(200),	--제목
		b_content	varchar2(500),	--내용
		b_ip		varchar2(100),	--아이피
		b_regdate	date,			--작성일자
		b_readhit	int,			--조회수
		b_like		int,			--좋아요 갯수
		m_idx		int,			--글작성자번호
		m_nickname	varchar2(100)	--글작성자닉네임
	)
	
	--기본키
	alter table board
		add constraint pk_board_idx primary key(b_idx);
		
	--외래키
	alter table board
		add constraint fk_board_m_idx foreign key(m_idx)
			references member(m_idx);
	
		
	--1.새글쓰기
	insert into board values(
								seq_board_idx.nextVal,
								'1등',
								'또 내가 1등',
								'192.168.7.3',
								sysdate,
								0,
								'y',
								1,
								'관리자',
								seq_board_idx.currVal
							)
select * from board
	
	
	
	
	
	
	
	 
	
	
	
*/