package roomie.common.search;

import java.util.List;
import java.util.Map;

public interface SearchService {
	
	public List<Map<String, Object>> hashList(String idx) throws Exception;
	
	public List<Map<String, Object>> memberList(String idx) throws Exception;
	
	public void insertKeyword(Map<String, Object> map) throws Exception;

	public List<Map<String, Object>> searchList(int id) throws Exception;
	
	public void searchDelete(Map<String, Object> map) throws Exception;
	
	public List<Map<String, Object>> boardList(Map<String, Object> map) throws Exception;
	
	public Map<String, Object> memCheck(Map<String, Object> map) throws Exception;
	
	
	
} 
