package roomie.common.like;

import java.util.List;
import java.util.Map;

public interface LikeService {
	
	public void likeBinsert(Map<String, Object> map) throws Exception;
	
	
	public void likeBdelete(Map<String, Object> map) throws Exception;
	

	/* public List<Map<String, Object>> likeBcount(int idx) throws Exception; */
}
