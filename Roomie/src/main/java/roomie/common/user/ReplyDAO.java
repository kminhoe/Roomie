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
	
	public List<Map<String,Object>> commentList(int idx) throws Exception {
		return sqlSessionTemplate.selectList("reply.commentList", idx);
	}
	
	public Map<String,Object> commentCounter(int idx) throws Exception{
		return sqlSessionTemplate.selectOne("reply.commentCounter", idx);
	}
	
	public int insertComment(Map<String,Object> map) throws Exception {
		return sqlSessionTemplate.insert("reply.insertComment", map);
	}
	
	public int insertReply(Map<String,Object>map)throws Exception{
		return sqlSessionTemplate.insert("reply.insertReply", map);
	}
	
	public int deleteComment(int COM_IDX) throws Exception {
		return sqlSessionTemplate.update("reply.deleteComment", COM_IDX);
	}
	
}
