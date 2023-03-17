package roomie.common.chat;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service("chatService")
public class ChatServiceImpl implements ChatService{
	
	@Resource(name = "chatDAO")
	private ChatDAO chatDAO;

	@Override
	public List<String> selectChatRoomList(Map<String, Object> map) throws Exception {
		
		return chatDAO.selectChatRoomList(map);
	}
	
	@Override
	public List<Map<String, Object>> selectChatContent(Map<String, Object> map) throws Exception {
		
		return chatDAO.selectChatContent(map);
	}
	
	//채팅룸 목록에 마지막 채팅과 날짜를 표시하기위한 함수.
	@Override
	public Map<String, Object> selectChatAll(Map<String, Object> map) throws Exception {
		return chatDAO.selectChatAll(map);
	}

	@Override
	public Map<String, Object> addMessage(Map<String, Object> param) throws Exception {
		chatDAO.addMessage(param);
		
		Map <String, Object> rs = new HashMap<>();
		
		rs.put("resultCode", "S-1");
		rs.put("msg", "채팅 메시지가 생성되었습니다.");
		String id = (String) param.get("MEM_ID");
		rs.put("id", id);
		
		return rs;
	}
	
	@Override
	public List<Map<String, Object>> showFriendList() throws Exception {
		return chatDAO.selectFriendList();
	}

	//@@@@@@@테스트 메소드@@@@@@@@@@@@@@@@
	@Override
	public List<Map<String, Object>> testChatContent(String chat_myId) {
		return chatDAO.testChatContent(chat_myId);
	}
	//@@@@@@@테스트 메소드@@@@@@@@@@@@@@@@

	@Override
	public int selectChatRoomCount(Map<String, Object> map) throws Exception {
		return chatDAO.selectChatRoomCount(map);
	}
	
	@Override
	public String selectNotifMsg1(Map<String, Object> map) throws Exception {
		return chatDAO.selectNotifMsg1(map);
	}
	
	@Override
	public List<Map<String, Object>> selectNotifMsg2(Map<String, Object> map) throws Exception {
		return chatDAO.selectNotifMsg2(map);
	}

	@Override
	public void addChatRoom(Map<String, Object> map) throws Exception {
		chatDAO.addChatRoom(map);
	}

	@Override
	public void updateChatRoomDate(Map<String, Object> map) throws Exception {
		chatDAO.updateChatRoomDate(map);
	}

	@Override
	public void updateNotifMsgCheck(Map<String, Object> map) throws Exception {
		chatDAO.updateNotifMsgCheck(map);
	}

	@Override
	public void addNotifMsg(Map<String, Object> map) throws Exception {
		chatDAO.addNotifMsg(map);
	}
	
	@Override
	public void updateNotifMsgCheck2(Map<String, Object> map) throws Exception {
		chatDAO.updateNotifMsgCheck2(map);
	}
	
}
