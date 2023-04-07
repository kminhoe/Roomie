package roomie.common.like;

import java.util.List;
import java.util.Map;

public interface LikeService {
	
	public void likeBinsert(Map<String, Object> map) throws Exception;
	
	public void likeBdelete(Map<String, Object> map) throws Exception;
	
	public void insertNotifLike(Map<String, Object> map) throws Exception; /* 좋아요 알림 데이터 추가 */
	
	public void deleteNotifLike(Map<String, Object> map) throws Exception; /* 좋아요 알림 데이터 삭제 */
	
	public List<Map<String, Object>> selectNotifLike(Map<String, Object> map) throws Exception; /* 좋아요 알림 데이터 조회 */
	
	public List<Map<String, Object>> selectNotifLike2(Map<String, Object> map) throws Exception; /* 확인하지 않은 좋아요 알림 데이터 조회 */
	
	public void checkNotifLike(Map<String, Object> map) throws Exception; /* 좋아요 알림 체크 */
	/* public List<Map<String, Object>> likeBcount(int idx) throws Exception; */
}
