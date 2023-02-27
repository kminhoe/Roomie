package roomie.common.board;

import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository("boardDAO")
public class BoardDAO {
	
	@Resource(name = "sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;
	
	public int register(Map<String, Object> map) throws Exception{
		System.out.println("DAO:" + map);
		
		
		return sqlSessionTemplate.insert("board.boardregister", map);
	}
	
	public void hashinsert(Map<String, Object> map) throws Exception{
		
		sqlSessionTemplate.insert("board.hashinsert", map);
	}

} 
