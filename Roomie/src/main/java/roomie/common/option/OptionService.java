package roomie.common.option;

import java.util.List;
import java.util.Map;

public interface OptionService {
	
	public Map<String, Object> checkpass(int idx) throws Exception;
	
	public void changepass(Map<String, Object> map) throws Exception;

}
