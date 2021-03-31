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

	//��ü��ȸ
	public List<MemberVo> selectList() {

		return  sqlSession.selectList("member.member_list");
	}
	
	//1�� ��ü ��������
	public MemberVo selectOne(int idx) {

		return  sqlSession.selectOne("member.member_one_idx", idx);
	}
	
	// ID�� �̿��� ��ü ���� ��ȸ
	public MemberVo selectOne(String m_id) {
		
		return sqlSession.selectOne("member.member_one_id", m_id);
	}
	
	//�Է�
	public int insert(MemberVo vo) {
				
			return sqlSession.insert("member.member_insert",vo);
		}
		
	//����
	public int delete(int idx) {
		
			return sqlSession.delete("member.member_delete",idx);
		}
	
	//����
	public int update(MemberVo vo) {
			
			return sqlSession.update("member.member_update",vo);
		}
	
		
}