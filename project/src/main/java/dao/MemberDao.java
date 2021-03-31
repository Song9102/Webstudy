package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.MemberVo;

public class MemberDao {
	
	SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	
	public List<MemberVo> selectList() {

		return sqlSession.selectList("member.member_list");
	}
	
	public MemberVo selectOne(int m_idx) {

		return sqlSession.selectOne("member.member_one_idx", m_idx);
	}
	
	public MemberVo selectOne(String m_id) {

		return sqlSession.selectOne("member.member_one_id", m_id);
	}
	
	public int insert(MemberVo vo) {
		// TODO Auto-generated method stub
		return sqlSession.insert("member.member_insert", vo);
	}
	
	public int update(MemberVo vo) {
		// TODO Auto-generated method stub
		return sqlSession.update("member.member_update", vo);
	}
	
	public int delete(int m_idx) {
		// TODO Auto-generated method stub
		return sqlSession.delete("member.member_delete", m_idx);
	}
}
