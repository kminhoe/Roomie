package roomie.common.user;

import java.util.List;
import java.util.Map;

public interface ReplyService {
	
	public List<Map<String,Object>> commentList(int idx) throws Exception;
	
	public Map<String,Object> commentCounter(int idx) throws Exception;
	
	public int insertComment(Map<String,Object>map) throws Exception;
	
	public int insertReply(Map<String,Object>map) throws Exception;
	
	public int deleteComment(int COM_IDX) throws Exception;
	
	

}
