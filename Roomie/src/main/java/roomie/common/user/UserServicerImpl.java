package roomie.common.user;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

//import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

@Service("userService")
public class UserServicerImpl implements UserService {
	
	@Resource(name="userDAO")
	private UserDAO userDAO;
	

	@Override
	public Map<String, Object> userProfile(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return userDAO.userProfile(map);
	}

	@Override
	public void userModify(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		userDAO.userModify(map);
	}

	@Override
	public void uploadUserImg(Map<String,Object> map) throws Exception {
		// TODO Auto-generated method stud
		userDAO.uploadUserImage(map);
		
	}

	@Override
	public Map<String, Object> userFollower(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return userDAO.userFollower(map);
	}
	
	public Map<String,Object> userFollowing(Map<String,Object>map)throws Exception{
		return userDAO.userFollowing(map);
	}

	@Override
	public Map<String, Object> userBoard(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return userDAO.userBoard(map);
	}

	@Override
	public void userModifyMusic(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		userDAO.modifyMusic(map);
		
	}

	@Override
	public List<Map<String, Object>> userFollowerList(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return userDAO.followerList(map);
	}

	@Override
	public List<Map<String, Object>> userFollowingList(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return userDAO.followingList(map);
	}

	@Override
	public void follow(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		userDAO.follow(map);
	}

	@Override
	public void unFollow(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		userDAO.unFollow(map);
	}

	@Override
	public List<Map<String, Object>> userBoardList(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return userDAO.userBoardList(map);
	}

	@Override
	public List<Map<String, Object>> commentList(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return userDAO.commentList(map);
	}

	@Override
	public Map<String, Object> selectComment(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return userDAO.selectComment(map);
	}

	
	
	
	

}
