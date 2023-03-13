package roomie.common.option;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service("optionService")
public class OptionServiceImpl implements OptionService{
	
	@Resource(name="optionDAO")
	private OptionDAO optionDAO;

	@Override
	public Map<String, Object> checkpass(int idx) throws Exception {
		
		System.out.println("Service : "+ idx);
		
		return optionDAO.checkpassword(idx);
	}

	@Override
	public void changepass(Map<String, Object> map) throws Exception {
		
		System.out.println("Service : "+ map);
		optionDAO.changepass(map); 
		
	}
	
	

}
