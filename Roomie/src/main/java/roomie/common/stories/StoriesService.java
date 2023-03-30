package roomie.common.stories;

import java.util.List;
import java.util.Map;

public interface StoriesService {

	public List<Map<String, Object>> selectStories (Map<String, Object> map) throws Exception; // 스토리 검색
	public List<Map<String, Object>> storiesList (Map<String, Object> map) throws Exception; // 메인화면 > 스토리 리스트
	public Map<String, Object> selectStoriesCheck (Map<String, Object> map) throws Exception; // 스토리 읽음 표시 검색
	public void insertStoriesCheck (Map<String, Object> map) throws Exception; // 스토리 읽음 표시하기
	public void insertStories (Map<String, Object> map) throws Exception; // 스토리 작성
}
