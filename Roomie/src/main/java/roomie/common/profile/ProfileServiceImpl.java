package roomie.common.profile;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service("profileService")
public class ProfileServiceImpl implements ProfileService{
	
	@Resource(name="profileDAO")
	private ProfileDAO profileDAO;

	@Override
	public Map<String,Object> userProfile(HashMap<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return profileDAO.userProfile(map);
	}

}
