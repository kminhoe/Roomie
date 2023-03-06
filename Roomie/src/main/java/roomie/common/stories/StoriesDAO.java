package roomie.common.stories;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository("storiesDAO")
public class StoriesDAO {

	
	@Resource(name = "sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;
	
	// 사용자 이름 중복체크
	public List<Map<String, Object>> selectStories(Map<String, Object> map) throws Exception {
		return sqlSessionTemplate.selectList("stories.selectStories", map);
	}
	
	// 메인화면 > 스토리 리스트
	public List<Map<String, Object>> storiesList(Map<String, Object> map) throws Exception {
		return sqlSessionTemplate.selectList("stories.storiesList", map);
	}
}
