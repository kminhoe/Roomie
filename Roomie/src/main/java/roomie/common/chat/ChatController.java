package roomie.common.chat;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import javax.websocket.OnOpen;
import javax.websocket.server.ServerEndpoint;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ChatController {
	
	@Resource(name = "chatService")
	private ChatService chatService;
	
	@RequestMapping(value = "echo.ya")
	public ModelAndView echo(@RequestParam HashMap<String, Object> param) throws Exception{
		ModelAndView mv = new ModelAndView("/chat/TestEndpointJspRun");
		
		return mv;
	}
	
	@RequestMapping(value = "chatForm.ya")
	@ResponseBody
	public ModelAndView chatForm(@RequestParam HashMap<String, Object> param, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView("/chat/chatForm");
		
		return mv;
	}
	
	@RequestMapping(value = "chatRoomList.ya", method= {RequestMethod.POST})
	@ResponseBody
	public List<Map<String, Object>> chatRoomList(@RequestParam Map<String, Object> param) throws Exception{
		
		List<Map<String, Object>> chatRoomKey = new ArrayList<Map<String,Object>>();
		
		String MEM_ID = (String) param.get("MEM_ID");
		
		//ROOM에서 데이터를 조회하기위한 형식으로 id를 가공.(roomMem1, roomMem2)
		String roomMem1 = MEM_ID + ",%";
		String roomMem2 = "%," + MEM_ID;
		Map<String, Object> roomMem = new HashMap<String, Object>();
		roomMem.put("ROOM_MEM1", roomMem1);
		roomMem.put("ROOM_MEM2", roomMem2);
		//조회된 ROOM_MEM의 값을 roomList에 담고, ArrayList인 roomList2에 옮겨 담는다.
		List<String> roomList = new ArrayList<String>();
		roomList = chatService.selectChatRoomList(roomMem);
		System.out.println("룸 리스트(변환 전): " + roomList);
		//roomList에 담긴 ROOM_MEM에서 로그인한 아이디와 ","를 제거한다. { (before) test1,test2 => (after) test2 }
		//2단계에 걸처서 chat_myId가 앞에 위치한경우와 뒤에 위치한경우 모두에 대응할 수 있도록 2번 replace한다.
		for(int i=0;i<roomList.size();i++) {
			String keyword1;
			String keyword2;
			keyword1 = roomList.get(i).replace(MEM_ID + ",", "");
			keyword2 = keyword1.replace("," + MEM_ID, "");
			roomList.set(i, keyword2);
		}
		System.out.println("룸 리스트(변환 후): " + roomList);
		
		//roomList를 ListMap형식의 chatRoomKey에 담아준다.
		Map<String, Object> keyMap = new HashMap<String, Object>();
		for(int i=0;i<roomList.size();i++) {
			keyMap.put("CHAT_OTHERID", roomList.get(i));
			keyMap.put("CHAT_MYID", MEM_ID);
			System.out.println(roomList.get(i));
			System.out.println("keyMap: " + keyMap);
			chatRoomKey.add(keyMap);	
			keyMap = new HashMap<String, Object>();//Map을 초기화
		}
		
		System.out.println("테스트 리스트:" + chatRoomKey);
		
		List<Map<String, Object>> result = new ArrayList<Map<String,Object>>();

		for(int i=0;i<roomList.size();i++) {
			Map<String, Object> map	= new HashMap<String, Object>();
			map.put("CHAT_OTHERID", roomList.get(i));
			map.putAll(chatService.selectChatAll(chatRoomKey.get(i)));
			
			Date chatDate = new Date();
			chatDate = (Date)map.get("CHAT_DATE");	//채팅 시간
			long currentDate = System.currentTimeMillis();	//현재 시간
			long diffSecond = (currentDate - chatDate.getTime()) / 1000; //현재시간과 채팅시간의 차이를 초단위로 변환.
			//시간의 범위에 따라 표시할 단위 선정. map에 다시 주입.
			if(diffSecond < 60) {
				map.put("CHAT_DATE", "방금 전");
			}else if(diffSecond < 60*60) {
				int diffMinute = (int) (diffSecond / 60);
				map.put("CHAT_DATE", diffMinute + "분 전");
			}else if(diffSecond < 60*60*24) {
				int diffHour = (int) (diffSecond / (60*60));
				map.put("CHAT_DATE", diffHour + "시간 전");
			}else if(diffSecond < 60*60*24*7) {
				int diffDay = (int) (diffSecond / (60*60*24));
				map.put("CHAT_DATE", diffDay + "일 전");
			}else{
				map.put("CHAT_DATE", "아주 오래 전");
			}
			
			result.add(i, map);
		}
		
		System.out.println("최종 리스트맵: " + result);
		
		return result;
	}
	
	@RequestMapping(value = "showFriend.ya", method= {RequestMethod.POST})
	@ResponseBody
	public List<Map<String, Object>> showFriend(@RequestParam Map<String, Object> param) throws Exception{
		//JSP에서 받아온 CHAT_MYID로 친구리스트를 조회
		//@@@@@@@@@@@@@@@@현재 친구 테이블이 없는 관계로, 멤버리스트로 대체한다@@@@@@@@@@@@@@@@@@@@@@@@
		
		List<Map<String, Object>> friendList = chatService.showFriendList();
		
		//@@@@@@@@@@@@@@@@현재 친구 테이블이 없는 관계로, 멤버리스트로 대체한다@@@@@@@@@@@@@@@@@@@@@@@@
				
		/* @@@@@@@@@@@@@@@@@@ chatRoomList()에서 가져온 부분 @@@@@@@@@@@@@@@@@@ */
				Map<String, Object> roomMem = new HashMap<String, Object>();
				List<String> roomList = new ArrayList<String>();
				String MEM_ID = (String) param.get("CHAT_MYID");
				String roomMem1 = MEM_ID + ",%";
				String roomMem2 = "%," + MEM_ID;
				roomMem.put("ROOM_MEM1", roomMem1);
				roomMem.put("ROOM_MEM2", roomMem2);
				roomList = chatService.selectChatRoomList(roomMem);
				for(int i=0;i<roomList.size();i++) {
					String keyword1;
					String keyword2;
					keyword1 = roomList.get(i).replace(MEM_ID + ",", "");
					keyword2 = keyword1.replace("," + MEM_ID, "");
					roomList.set(i, keyword2);
				}
		/* @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ */
				
		//roomList의 항목들(이미 존재하는 채팅룸)과 친구리스트를 비교하며 이미 존재하는 값은 제거.
		int count = friendList.size();
		for(int i=0;i<roomList.size();i++) {
			for(int j=count-1;j>=0;j--) {
				if(roomList.get(i).equals(friendList.get(j).get("MEM_ID"))) {
					friendList.remove(j);
					count--;
				}
			}
		}
		
		return friendList;
		
	}
	
	@RequestMapping(value = "chatRoom.ya", method= {RequestMethod.POST})
	@ResponseBody
	public List<Map<String, Object>> chatRoom(@RequestParam Map<String, Object> param, HttpSession session) throws Exception{
		Map<String, Object> chatMap = new HashMap<String, Object>();
		
		System.out.println("CHAT_MYID: " + session.getAttribute("MEM_ID"));
		System.out.println("선택한 채팅룸 CHAT_OTHERID: " + param.get("CHAT_OTHERID"));
		
		//chatForm에서 데이터를 전송받아 chatMap에 CHAT_MYID와 CHAT_OTHERID 주입.
		chatMap.put("CHAT_MYID", (String) session.getAttribute("MEM_ID"));
		chatMap.put("CHAT_OTHERID", (String) param.get("CHAT_OTHERID"));
		
		//chatMap을 매개로 CHAT_CONTENT, CHAT_MYID, CHAT_OTHERID SELECT.(대화내용)
		List<Map<String, Object>> chatContent = chatService.selectChatContent(chatMap);

		System.out.println("chatContent: " + chatContent);
		
		return chatContent;
		
	}
	
	@RequestMapping(value = "addMessage.ya", method= {RequestMethod.POST})
	@ResponseBody
	public List<Map<String, Object>> addMessage(@RequestParam Map<String, Object> param) throws Exception{
		
		System.out.println("MYID: " + param.get("CHAT_MYID"));
		System.out.println("OTHERID: " + param.get("CHAT_OTHERID"));
		System.out.println("CONTENT: " + param.get("CHAT_CONTENT"));
		
		//메시지 추가
		chatService.addMessage(param);
		
		Map<String, Object> chatMap = new HashMap<String, Object>();
		//chatMap에 CHAT_MYID와 CHAT_OTHERID 주입.
		chatMap.put("CHAT_MYID", param.get("CHAT_MYID"));
		chatMap.put("CHAT_OTHERID", param.get("CHAT_OTHERID"));
		
		//chatMap을 매개로 CHAT_CONTENT, CHAT_MYID, CHAT_OTHERID SELECT.
		List<Map<String, Object>> chatContent = chatService.selectChatContent(chatMap);
		
		System.out.println("대화 내용: " + chatContent);
		
		//ROOM조회
		String roomMem1 = param.get("CHAT_MYID") + "," + param.get("CHAT_OTHERID");
		String roomMem2	= param.get("CHAT_OTHERID") + "," + param.get("CHAT_MYID");
		Map<String, Object> roomMem = new HashMap<String, Object>();
		roomMem.put("ROOM_MEM1", roomMem1);
		roomMem.put("ROOM_MEM2", roomMem2);
		System.out.println(roomMem.get("ROOM_MEM1"));
		System.out.println(roomMem.get("ROOM_MEM2"));
		int chatRoomCount = chatService.selectChatRoomCount(roomMem);
		System.out.println(chatRoomCount);
		if(chatRoomCount == 0) {
			//roomMEM1을 ROOM_MEM으로하는 데이터를 ROOM에 INSERT.
			chatService.addChatRoom(roomMem);
		}else {
			chatService.updateChatRoomDate(roomMem);
		}
		
		return chatContent;
		
	}
	
}
