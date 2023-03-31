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
	
	/* 좋아요 알림 데이터 추가 */
	@Override
	public void insertNotifLike(Map<String, Object> map) throws Exception {
		likeDAO.insertNotifLike(map);
	}

	@Override
	public void deleteNotifLike(Map<String, Object> map) throws Exception {
		likeDAO.deleteNotifLike(map);
	}
	
	/* 좋아요 알림 데이터 조회 */
	@Override
	public List<Map<String, Object>> selectNotifLike(Map<String, Object> map) throws Exception {
		return likeDAO.selectNotifLike(map);
	}
	
	/* 확인하지 않은 좋아요 알림 데이터 조회 */
	@Override
	public List<Map<String, Object>> selectNotifLike2(Map<String, Object> map) throws Exception {
		return likeDAO.selectNotifLike2(map);
	}

	/* 좋아요 알림 체크 */
	@Override
	public void checkNotifLike(Map<String, Object> map) throws Exception {
		likeDAO.checkNotifLike(map);
		System.out.println(map);
	}

	/*
	 * @Override public List<Map<String, Object>> likeBcount(int idx) throws
	 * Exception { // TODO Auto-generated method stub likeDAO.likeBcount(idx); }
	 */
	
	

}
