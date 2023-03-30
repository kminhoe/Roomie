package roomie.common.user;

import java.util.List;
import java.util.Map;

public interface ReplyService {
	
	public List<Map<String,Object>> commentList(Map<String,Object> map) throws Exception;
	
	public void insertComment(Map<String,Object>map) throws Exception;

}
