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
	
public void likeinsert(Map<String, Object> map) throws Exception{
		
		sqlSessionTemplate.insert("board.likeinsert", map);
	}


public List<Map<String, Object>> likeCheck(Map<String, Object> map) throws Exception {
	return (List<Map<String, Object>>) selectList("board.likeCheck", map);
}

public List<Map<String, Object>> selectBoard(Map<String, Object> map) throws Exception {
	return (List<Map<String, Object>>) selectList("board.selectBoard", map);
}


} 
