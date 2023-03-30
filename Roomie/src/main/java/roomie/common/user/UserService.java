package roomie.common.user;

import java.util.List;
import java.util.Map;

public interface UserService {
	
	public Map<String,Object> userProfile(Map<String,Object> map) throws Exception;
	
	Map<String,Object> userFollower(Map<String,Object> map) throws Exception;
	
	Map<String,Object> userFollowing(Map<String,Object>map) throws Exception;
	
	Map<String,Object> userBoard(Map<String,Object> map) throws Exception;
	
	public void userModify(Map<String,Object> map) throws Exception;
	
	public void uploadUserImg(Map<String,Object> map) throws Exception;
	
	public void userModifyMusic(Map<String,Object> map) throws Exception;
	
	List<Map<String,Object>> userFollowerList(Map<String,Object>map)throws Exception;
	
	List<Map<String,Object>> userFollowingList(Map<String,Object>map)throws Exception;
	
	public void follow(Map<String,Object> map) throws Exception;
	
	public void unFollow(Map<String,Object>map) throws Exception;
	
	List<Map<String,Object>> userBoardList(Map<String,Object> map) throws Exception;
	
	public List<Map<String, Object>> likeCheck(Map<String, Object> map) throws Exception;
	

}
