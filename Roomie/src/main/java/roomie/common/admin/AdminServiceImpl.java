package roomie.common.admin;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;


@Service("adminService")
public class AdminServiceImpl implements AdminService {

	@Resource(name="adminDAO")
	private AdminDAO adminDAO;
	
	@Override
	public List<Map<String, Object>> memberSelect(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return adminDAO.memberSelect(map);
	}

	@Override
	public Map<String, Object> reportCheck(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return adminDAO.reportCheck(map);
	}
	
	

	
}
