package roomie.common.board;

import java.util.List;
import java.util.Map;

public interface BoardService {
	
	public int registerBoard(Map<String, Object> map) throws Exception;
	
	public void inserthasg(Map<String, Object> map) throws Exception;
	
	
	public List<Map<String, Object>> likeCheck(Map<String, Object> map) throws Exception;
	
	public List<Map<String, Object>> selectBoard(Map<String, Object> map) throws Exception;
	
	public Map<String, Object> memCheck(Map<String, Object> map) throws Exception; // 본인 확인
	
	public List<Map<String, Object>> notFriend(Map<String, Object> map) throws Exception;
	
	public void insertComment(Map<String, Object> map) throws Exception;
	
	public List<Map<String, Object>> selectComment() throws Exception;
	

	
} 
