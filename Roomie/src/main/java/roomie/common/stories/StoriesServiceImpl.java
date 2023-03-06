package roomie.common.stories;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service("storiesService")
public class StoriesServiceImpl implements StoriesService {

	@Resource(name = "storiesDAO")
	private StoriesDAO storiesDAO;
	
	@Override
	public List<Map<String, Object>> selectStories(Map<String, Object> map) throws Exception {
		return storiesDAO.selectStories(map);
	}

	@Override
	public List<Map<String, Object>> storiesList(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return storiesDAO.storiesList(map);
	}
}
