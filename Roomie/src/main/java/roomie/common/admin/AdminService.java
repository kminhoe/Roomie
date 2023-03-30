package roomie.common.admin;

import java.util.List;
import java.util.Map;

public interface AdminService {
	
	public List<Map<String, Object>> memberSelect(Map<String, Object> map) throws Exception;
	
	public List<Map<String, Object>> memberSelectOne(Map<String, Object> map) throws Exception;
	
	public int warning (Map<String, Object> map) throws Exception;
	
	public int nothing (Map<String, Object> map) throws Exception;
	
	public int lockMember (Map<String, Object> map) throws Exception;
	
	public int delMember (Map<String, Object> map) throws Exception;
	
	public int changeStatus (Map<String, Object> map) throws Exception;
	
	public List<Map<String, Object>> boardSelect() throws Exception;
	
	public List<Map<String, Object>> boardSelectOne(Map<String, Object> map) throws Exception;
	
	public Map<String, Object> boardLike(Map<String, Object> map) throws Exception;
	

}
