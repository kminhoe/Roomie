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
	
	// 메인화면 > 스토리 리스트 > 스토리 뷰
	public List<Map<String, Object>> selectStories(Map<String, Object> map) throws Exception {
		return sqlSessionTemplate.selectList("stories.selectStories", map);
	}
	
	// 메인화면 > 스토리 리스트
	public List<Map<String, Object>> storiesList(Map<String, Object> map) throws Exception {
		return sqlSessionTemplate.selectList("stories.storiesList", map);
	}
	
	// 메인화면 > 스토리 리스트 > 스토리 읽음 확인
	public Map<String, Object> selectStoriesCheck(Map<String, Object> map) throws Exception {
		return sqlSessionTemplate.selectOne("stories.selectStoriesCheck", map);
	}

	// 메인화면 > 스토리 리스트 > 스토리 읽음 표시
	public void insertStoriesCheck(Map<String, Object> map) throws Exception {
		sqlSessionTemplate.insert("stories.insertStoriesCheck", map);
	}
}
