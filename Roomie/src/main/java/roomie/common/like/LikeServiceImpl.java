package roomie.common.like;

import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;

@Service("likeService")
public class LikeServiceImpl implements LikeService {

	@Resource(name="likeDAO")
	private LikeDAO likeDAO;
	
	@Override
	public void likeBinsert(Map<String, Object> map) throws Exception {
		likeDAO.likeBinsert(map);
	}

	@Override
	public void likeBdelete(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		likeDAO.likeBdelete(map);
	}

	/*
	 * @Override public List<Map<String, Object>> likeBcount(int idx) throws
	 * Exception { // TODO Auto-generated method stub likeDAO.likeBcount(idx); }
	 */
	
	

}
