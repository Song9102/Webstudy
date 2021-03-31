package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.MemberVo;

public class MemberDao {

	SqlSession sqlSession;
	
	public SqlSession getSqlSession() {
		return sqlSession;
	}

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	//전체조회
	public List<MemberVo> selectList() {

		return  sqlSession.selectList("member.member_list");
	}
	
	//1개 객체 가져오기
	public MemberVo selectOne(int idx) {

		return  sqlSession.selectOne("member.member_one_idx", idx);
	}
	
	// ID를 이용한 객체 정보 조회
	public MemberVo selectOne(String m_id) {
		
		return sqlSession.selectOne("member.member_one_id", m_id);
	}
	
	//입력
	public int insert(MemberVo vo) {
				
			return sqlSession.insert("member.member_insert",vo);
		}
		
	//삭제
	public int delete(int idx) {
		
			return sqlSession.delete("member.member_delete",idx);
		}
	
	//수정
	public int update(MemberVo vo) {
			
			return sqlSession.update("member.member_update",vo);
		}
	
		
}