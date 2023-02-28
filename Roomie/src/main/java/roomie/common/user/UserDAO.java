package roomie.common.user;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

@Repository("userDAO")
public class UserDAO {
	
	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;
	
	
	public Map<String,Object> userProfile(Map<String,Object>map) throws Exception {
		return sqlSessionTemplate.selectOne("user.userProfile", map);
	}
	
	public void userModify(Map<String,Object>map) throws Exception {
		sqlSessionTemplate.update("user.userModify", map);
	}
	
	public void uploadUserImage(Map<String, Object> map) throws Exception{
		sqlSessionTemplate.update("user.uploadUserImage", map);
	}
	
	public Map<String,Object> userFollower(Map<String,Object>map) throws Exception{
		return sqlSessionTemplate.selectOne("user.userFollower", map);
	}
	
	public Map<String,Object> userFollowing(Map<String,Object>map)throws Exception{
		return sqlSessionTemplate.selectOne("user.userFollowing", map);
	}
	
	public Map<String,Object> userBoard(Map<String,Object> map) throws Exception {
		return sqlSessionTemplate.selectOne("user.userBoard", map);
	}
	
	public void modifyMusic(Map<String,Object> map)throws Exception {
		sqlSessionTemplate.update("user.userMusic", map);
	}
	
	public List<Map<String,Object>> followerList(Map<String,Object>map)throws Exception{
		return sqlSessionTemplate.selectList("user.userFollowerList", map);
	}
	
	public List<Map<String,Object>> followingList(Map<String,Object>map)throws Exception{
		return sqlSessionTemplate.selectList("user.userFollowingList", map);
	}
	

}
