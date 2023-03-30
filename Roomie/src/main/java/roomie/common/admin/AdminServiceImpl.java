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
	public List<Map<String, Object>> memberSelectOne(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return adminDAO.memberSelectOne(map);
	}

	@Override
	public int warning(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return adminDAO.warning(map);
	}

	@Override
	public int nothing(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return adminDAO.nothing(map);
	}

	@Override
	public int lockMember(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return adminDAO.lockMember(map);
	}

	@Override
	public int delMember(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return adminDAO.delMember(map);
	}

	@Override
	public int changeStatus(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return adminDAO.changeStatus(map);
	}

	@Override
	public List<Map<String, Object>> boardSelect() throws Exception {
		// TODO Auto-generated method stub
		return adminDAO.boardSelect();
	}

	@Override
	public List<Map<String, Object>> boardSelectOne(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return adminDAO.boardSelectOne(map);
	}

	@Override
	public Map<String, Object> boardLike(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return adminDAO.boardLike(map);
	}
	
	

	
}
