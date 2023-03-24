package roomie.common.admin;

import java.util.List;
import java.util.Map;

public interface AdminService {
	
	public List<Map<String, Object>> memberSelect(Map<String, Object> map) throws Exception;
	
	public Map<String, Object> reportCheck(Map<String, Object> map) throws Exception;

}
