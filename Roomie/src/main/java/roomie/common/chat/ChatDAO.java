package roomie.common.chat;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository("chatDAO")
public class ChatDAO {

	@Resource(name = "sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List<String> selectChatRoomList(Map<String, Object> map) throws Exception {
		return sqlSessionTemplate.selectList("chat.selectChatRoomList", map);
	}
	
	public List<Map<String, Object>> selectChatRoomList2(List<Map<String, Object>>map) throws Exception {
		return sqlSessionTemplate.selectList("chat.selectChatRoomList2", map);
	}
	
	public List<Map<String, Object>> selectChatContent(Map<String, Object> map) throws Exception {
		return sqlSessionTemplate.selectList("chat.selectChatContent", map);
	}
	
	
	 
	public Map<String, Object> selectChatAll(Map<String, Object> map) throws Exception {
		return sqlSessionTemplate.selectOne("chat.selectChatAll", map);
	}

	public void addMessage(Map<String, Object> param) throws Exception {
		sqlSessionTemplate.insert("chat.addMessage", param);
	}
	
	public List<Map<String, Object>> selectFriendList() throws Exception {
		return sqlSessionTemplate.selectList("chat.selectFriendList");
	}
	
	public int selectChatRoomCount(Map<String, Object> map) throws Exception{
		return sqlSessionTemplate.selectOne("chat.selectChatRoomCount", map);
	}
	
	public void addChatRoom(Map<String, Object> map) throws Exception{
		sqlSessionTemplate.insert("chat.addChatRoom", map);
	}
	
	public void updateChatRoomDate(Map<String, Object> map) throws Exception{
		sqlSessionTemplate.update("chat.updateChatRoomDate", map);
	}

	//@@@@@@@@@@@@@@@@@@테스트 함수@@@@@@@@@@@@@@@@@@@@@@
	public List<Map<String, Object>> testChatContent(String chat_myId) {
		return sqlSessionTemplate.selectList("chat.testChatContent", chat_myId);
	}
	//@@@@@@@@@@@@@@@@@@테스트 함수@@@@@@@@@@@@@@@@@@@@@@	
	
	
}