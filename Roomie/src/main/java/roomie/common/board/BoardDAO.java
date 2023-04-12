package roomie.common.board;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import roomie.common.dao.AbstractDAO;

@Repository("boardDAO")
public class BoardDAO extends AbstractDAO {
	
	@Resource(name = "sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;
	
	public int register(Map<String, Object> map) throws Exception{
		System.out.println("DAO:" + map);
		
		
		return sqlSessionTemplate.insert("board.boardregister", map);
	}
	
	public void hashinsert(Map<String, Object> map) throws Exception{
		
		sqlSessionTemplate.insert("board.hashinsert", map);
	}
	

public List<Map<String, Object>> likeCheck(Map<String, Object> map) throws Exception {
	return (List<Map<String, Object>>) selectList("board.likeCheck", map);
}

public List<Map<String, Object>> selectBoard(Map<String, Object> map) throws Exception {
	return (List<Map<String, Object>>) selectList("board.selectBoard", map);
}

//본인 확인
public Map<String, Object> memCheck(Map<String, Object> map) throws Exception{
	
	return sqlSessionTemplate.selectOne("board.memCheck",map);
	}

//친구가 아닌 멤버 리스트 출력
public List<Map<String, Object>> notFriend(Map<String, Object> map) throws Exception {
	return (List<Map<String, Object>>) selectList("board.notFriend", map);
}

//댓글 입력
public void insertComment(Map<String, Object> map) throws Exception{
	
	sqlSessionTemplate.insert("board.insertComment", map);
}

//댓글 리스트
public List<Map<String, Object>> selectComment() throws Exception {
	return (List<Map<String, Object>>) selectList("board.selectComment");
}



} 
