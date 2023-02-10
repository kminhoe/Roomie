package roomie.common.profile;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository("profileDAO")
public class ProfileDAO {
	
	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;
	
	public Map<String,Object> userProfile(HashMap<String,Object> map) throws Exception {
		return sqlSessionTemplate.selectOne("profile.userProfile", map);
	}
		
}
