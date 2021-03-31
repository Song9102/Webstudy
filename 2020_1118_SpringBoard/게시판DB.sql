/*
--일련번호 
	drop		sequence seq_board_idx
	create sequence seq_board_idx
	
--테이블생성
	drop		table board
	create table board 
	(
		b_idx 			int,    					--일련번호
		b_subject  	varchar2(200), 	--제목
		b_content  	clob,   					--내용
		b_ip 				varchar2(100),    --IP
		b_regdate   date,						--작성일자
		b_readhit		int,     					--조회수
		b_use_yn		char(1),      			--사용유무(y,n)
		m_idx			int,           			--회원 번호(글작성자)
		m_name		varchar2(100),    -- 회원 이름(글작성자)
		ref				int, 						--그룹 글번호
		step				int,						--글 순서
		depth			int						--글 깊이
	)

	--제약조건(기본키)
	alter table board add constraint pk_board_idx primary key(b_idx);
	
	--제약조건(외래키) m_idx가 먼저잇고 유니크거나 프라이머리여야만 가능
	alter table board add constraint fk_board_m_idx foreign key(m_idx)
		references member (m_idx);
	
	--제약조건(체크제약)
	alter table board add constraint ck_board_use_yn 
			check( b_use_yn in( 'y' , 'n' ) ); 
	
--Sample Data 
   --새글쓰기(메인글)
	insert into board values( 
		seq_board_idx.nextVal,
		'내가 1등이다',
		'항상 내가 1등이다',
		'192.168.7.17',
		sysdate,
		0,
		'y',
		1,
		'김관리',
		seq_board_idx.currVal,
		0,
		0
	   );	
	   
	--답글쓰기 ( 댓글)
	insert into board values( 
		seq_board_idx.nextVal,
		'답글은 내가 1등이다ㅎㅎ',
		'답글은 내가 1등할게',
		'192.168.7.17',
		sysdate,
		0,
		'y',
		1,
		'김관리',
		1,
		1,
		1
	 );	
	-- 대댓글
	 	insert into board values( 
		seq_board_idx.nextVal,
		'그래 담엔 게시물1등해라',
		'아쉽지만 내가 할게 ^^',
		'192.168.7.17',
		sysdate,
		0,
		'y',
		1,
		'김관리',
		1,
		2,
		2
	 );	
  commit
  
  -- paging메뉴에 필요한 SQL문 작성
  
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
  
  --전체 레코드수 구하기
  select nvl(count(*),0) from board
  
  
	
select * from member
select * from board order by ref desc, step asc
*/