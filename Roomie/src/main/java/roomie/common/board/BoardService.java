package roomie.common.board;

import java.util.List;
import java.util.Map;

public interface BoardService {
	
	public int registerBoard(Map<String, Object> map) throws Exception;
	
	public void inserthasg(Map<String, Object> map) throws Exception;
	
	public void likeinsert(Map<String, Object> map) throws Exception;
	
	public List<Map<String, Object>> likeCheck(Map<String, Object> map) throws Exception;
	
	public List<Map<String, Object>> selectBoard(Map<String, Object> map) throws Exception;
	
} 
