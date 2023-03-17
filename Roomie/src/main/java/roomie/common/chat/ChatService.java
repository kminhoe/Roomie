package roomie.common.chat;

import java.util.List;
import java.util.Map;

public interface ChatService {
	
	public List<String> selectChatRoomList(Map<String, Object> map) throws Exception;
	
	public List<Map<String, Object>> selectChatContent(Map<String, Object> map) throws Exception;
	
	public Map<String, Object> selectChatAll(Map<String, Object> map) throws Exception;

	public Map<String, Object> addMessage(Map<String, Object> param) throws Exception;
	
	public void addNotifMsg(Map<String, Object> map) throws Exception;
	
	public void updateNotifMsgCheck2(Map<String, Object> map) throws Exception;
	
	public List<Map<String, Object>> showFriendList() throws Exception;
	
	public int selectChatRoomCount(Map<String, Object> map) throws Exception;
	
	public String selectNotifMsg1(Map<String, Object> map) throws Exception;
	
	public List<Map<String, Object>> selectNotifMsg2(Map<String, Object> map) throws Exception;
	
	public void addChatRoom(Map<String, Object> map) throws Exception;
	
	public void updateChatRoomDate(Map<String, Object> map) throws Exception;
	
	public void updateNotifMsgCheck(Map<String, Object> map) throws Exception;
	
	//@@@@@@@테스트 메소드@@@@@@@@@@@@@@@@
	public List<Map<String, Object>> testChatContent(String chat_myId);
	//@@@@@@@테스트 메소드@@@@@@@@@@@@@@@@
	
	
}
