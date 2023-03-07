package roomie.common.like;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import roomie.common.dao.AbstractDAO;

@Repository("likeDAO")
public class LikeDAO extends AbstractDAO {
	
	@Resource(name = "sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;
	
public void likeBinsert(Map<String, Object> map) throws Exception{
		
		sqlSessionTemplate.insert("like.likeBinsert", map);
	}



public void likeBdelete(Map<String, Object> map) throws Exception{
	
	sqlSessionTemplate.delete("like.likeBdelete", map);
}


public List<Map<String, Object>> likeBcount(int idx) throws Exception {
	return (List<Map<String, Object>>) selectList("like.likeBcount", idx);
}

}
