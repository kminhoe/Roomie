package roomie.common.user;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository("replyDAO")
public class ReplyDAO {
	
	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List<Map<String,Object>> commentList(Map<String,Object> map) throws Exception {
		return sqlSessionTemplate.selectList("user.commentList", map);
	}
	
	public void insertComment(Map<String,Object> map) throws Exception {
		sqlSessionTemplate.insert("user.insertComment", map);
	}

}
