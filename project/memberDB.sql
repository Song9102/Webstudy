/*

create sequence seq_member_idx
drop sequence cc

create table member
	(
		m_idx 		int,			--회원번호
		m_id		varchar2(100),	--아이디
		m_pwd		varchar2(100),	--비밀번호
		m_name		varchar2(100),	--이름
		m_nickname	varchar2(100),	--닉네임
		m_age		int,			--나이
		m_sex		varchar2(100),	--성별
		m_regdate	date			--가입일자
	)

alter table member
    add constraint pk_member_m_idx primary key(m_idx);


alter table member
    add constraint unique_member_m_id unique(m_id);



	insert into member values(
								seq_member_idx.nextVal, --회원번호
								'admin', --아이디
								'1234', --비밀번호
								'관리자', --이름
								'관리자', --닉네임
								99, --나이
								'남자', --성별
								sysdate --가입일자
							)

select * from member


































*/