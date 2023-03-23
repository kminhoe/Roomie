package roomie.common.option;

import java.util.List;
import java.util.Map;

public interface OptionService {
	
	public Map<String, Object> checkpass(int idx) throws Exception;
	
	public void changepass(Map<String, Object> map) throws Exception;
	
	public void MemberDelete(Map<String, Object> map) throws Exception;
	
	public Map<String, Object> lockList(int idx) throws Exception;
	
	public void lockChange(Map<String, Object> map) throws Exception;

	public void updateLock(Map<String, Object> map) throws Exception;
	
	public void updateOpen(int idx) throws Exception;
	
	public List<Map<String, Object>> memSelect(Map<String, Object> map) throws Exception;
}
