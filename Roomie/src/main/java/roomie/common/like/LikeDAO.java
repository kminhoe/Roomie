package roomie.common.like;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import roomie.common.dao.AbstractDAO;

@Repository("likeDAO")
public class LikeDAO extends AbstractDAO {
	
	@Resource(name = "sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;
	
public void likeBinsert(Map<String, Object> map) throws Exception{
		
		sqlSessionTemplate.insert("like.likeBinsert", map);
	}



public void likeBdelete(Map<String, Object> map) throws Exception{
	
	sqlSessionTemplate.delete("like.likeBdelete", map);
}


public List<Map<String, Object>> likeBcount(int idx) throws Exception {
	return (List<Map<String, Object>>) selectList("like.likeBcount", idx);
}

/* 좋아요 알림 데이터 추가 */
public void insertNotifLike(Map<String, Object> map) throws Exception{
	sqlSessionTemplate.insert("like.insertNotifLike", map);
}

/* 좋아요 알림 데이터 삭제 */
public void deleteNotifLike(Map<String, Object> map) throws Exception{
	sqlSessionTemplate.delete("like.deleteNotifLike", map);
}

/* 좋아요 알림 데이터 조회 */
public List<Map<String, Object>> selectNotifLike(Map<String, Object> map) throws Exception{
	return sqlSessionTemplate.selectList("like.selectNotifLike", map);
}

/* 확인하지 않은 좋아요 알림 데이터 조회 */
public List<Map<String, Object>> selectNotifLike2(Map<String, Object> map) throws Exception{
	return sqlSessionTemplate.selectList("like.selectNotifLike2", map);
}

public void checkNotifLike(Map<String, Object> map) throws Exception{
	sqlSessionTemplate.update("like.checkNotifLike", map);
}


}
