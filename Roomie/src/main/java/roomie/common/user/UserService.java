package roomie.common.user;

import java.util.Map;

public interface UserService {
	
	public Map<String,Object> userProfile(Map<String,Object> map) throws Exception;
	
	Map<String,Object> userFollowing(Map<String,Object> map) throws Exception;
	
	Map<String,Object> userBoard(Map<String,Object> map) throws Exception;
	
	public void userModify(Map<String,Object> map) throws Exception;
	
	public void uploadUserImg(Map<String,Object> map) throws Exception;
	
	public void userModifyMusic(Map<String,Object> map) throws Exception;

}
