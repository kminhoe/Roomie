package roomie.common.option;

import java.util.ArrayList;
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

	@Override
	public void MemberDelete(Map<String, Object> map) throws Exception {
		System.out.println("Service : "+ map);
		optionDAO.memberDelete(map);
		
	}

	@Override
	public void lockChange(Map<String, Object> map) throws Exception {
		
		optionDAO.lockChange(map);
	}

	@Override
	public Map<String, Object> lockList(int idx) throws Exception {
		return optionDAO.lockList(idx);
		
	}

	@Override
	public void updateLock(Map<String, Object> map) throws Exception {
		optionDAO.updateLock(map);
		
	}

	@Override
	public void updateOpen(int idx) throws Exception {
		optionDAO.updateOpen(idx);
		
	}

	@Override
	public List<Map<String, Object>> memSelect(Map<String, Object> map) throws Exception {
		
		return optionDAO.memSelect(map);
	}

	@Override
	public List<Map<String, Object>> blockList(int idx) throws Exception {
		List<Map<String, Object>> list = new ArrayList<>();
		
		list = optionDAO.blockList(idx);
		
		System.out.println("Service : " + idx);
		return list;
	}

	@Override
	public void unlockBlock(Map<String, Object> map) throws Exception {
		optionDAO.deleteblock(map);
		
	}
	
	
	
	

}
