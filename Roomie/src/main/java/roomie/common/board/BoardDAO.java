package roomie.common.board;

import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository("boardDAO")
public class BoardDAO {
	
	@Resource(name = "sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;
	
	public void register(Map<String, Object> map) throws Exception{
		
		sqlSessionTemplate.insert("board.boardregister", map);
	}

}
