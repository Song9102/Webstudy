package dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import vo.BoardVo;

public class BoardDao {

	
	SqlSession sqlSession;

	public SqlSession getSqlSession() {
		return sqlSession;
	}

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	public List<BoardVo> selectList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("board.board_list");
	}
	
	public List<BoardVo> selectList(Map map) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("board.board_condition_list", map);
	}
	
	public BoardVo selectOne(int b_idx) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("board.board_one", b_idx);
	}

	public int insert(BoardVo vo) {
		// TODO Auto-generated method stub
		return sqlSession.insert("board.board_insert",vo);
	}

	public int update_readhit(int b_idx) {
		// TODO Auto-generated method stub
		return sqlSession.update("board.board_update_readhit",b_idx);
	}

	public int update_step(BoardVo baseVo) {
		// TODO Auto-generated method stub
		return sqlSession.update("board.board_update_step",baseVo);
	}

	public int reply(BoardVo vo) {
		// TODO Auto-generated method stub
		return sqlSession.insert("board.board_reply",vo);
	}

	public int delete(int b_idx) {
		// TODO Auto-generated method stub
		//      b_use_yn='y' => b_use_yn='n' 
		return sqlSession.update("board.board_update_delete",b_idx);
	}

	public int selectRowTotal(Map map) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("board.board_row_total", map);
	}
	
	public int update(BoardVo vo) {
		// TODO Auto-generated method stub
		return sqlSession.update("board.board_update", vo);
	}
	
	
	
	
	
}
