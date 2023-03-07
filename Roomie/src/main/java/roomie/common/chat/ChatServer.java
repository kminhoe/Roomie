package roomie.common.chat;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint("/roomieChat")
public class ChatServer {
	
	// 현재 채팅 서버에 접속한 클라이언트(WebSocket Session) 목록
	private static List<Map<String,Session>> sessionList = new ArrayList<Map<String,Session>>(); 
	
	@OnOpen
	public void handleOpen(Session session) {
		System.out.println("\n" + "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ ChatServer/handleOpen @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@" + "\n" + "@@@@@@@@@@@@   ");
		System.out.println("@@@@@@@@@@@@   클라이언트 연결");
		System.out.println("@@@@@@@@@@@@" + "\n" + "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@" + "\n");
	}
	
	@OnMessage
	public void handleMessage(String msg, Session session) throws IOException {
		System.out.println("\n" + "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ ChatServer/handleMessage @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@" + "\n" + "@@@@@@@@@@@@   ");
		Map<String, Session> memberMap = new HashMap<String, Session>();//list<Map>에 넣어줄 Map 선언.
		System.out.println("@@@@@@@@@@@@   chatForm.jsp로부터의 msg: " + msg);
		String keyWord = msg.split("#")[0]; //msg를 "#"으로 나눈후 첫번째 항목(1 or 2)으로 msg의 종류를 구분.
		System.out.println("@@@@@@@@@@@@   keyWord: " + keyWord);
		
		if(keyWord.equals("1")) { //onOpen 시 session을 추가하는 메시지일 경우.
			System.out.println("@@@@@@@@@@@@   keyWord는 1입니다.");
			memberMap.put(msg.split("#")[1], session);//회원아이디, 웹소켓세션을 Map형식으로 저장.
			sessionList.add(memberMap);//List<Map>에 주입.
			System.out.println("@@@@@@@@@@@@   웹소켓 접속 멤버: " + sessionList);
		}else if(keyWord.equals("2")) { //특정 대상에게 메시지를 보내는 경우.
			System.out.println("@@@@@@@@@@@@   keyWord는 2입니다.");
			for(int i=0;i<sessionList.size();i++) { //sessionList를 모두 둘러본다.
				for(String key : sessionList.get(i).keySet()) { //sessionList에 들어있는 모든 항목의 key값을 둘러본다.
					if(key.equals(msg.split("#")[1])) { //key값과 메시지 내부의 아이디가 일치한다면,
						int msgIndex = msg.indexOf("#",2); //문자열 msg중 두번째 "#"의 위치를 확인.(CHAT_CONTENT의 시작위치를 확인하기 위해 필요)
						System.out.println("@@@@@@@@@@@@   해당 세션에게 메시지를 전송!");
						sessionList.get(i).get(key).getBasicRemote().sendText(msg.substring(msgIndex + 1)); //해당 key값과 매치되는 session으로 메시지를 보낸다.
					}
				}
			}
		}else if(keyWord.equals("3")) { //접속을 종료할 경우.
			System.out.println("@@@@@@@@@@@@   keyWord는 3입니다.");
			for(int i=0;i<sessionList.size();i++) { //sessionList를 모두 둘러본다.
				for(String key : sessionList.get(i).keySet()) { //sessionList에 들어있는 모든 항목의 key값을 둘러본다.
					if(key.equals(msg.split("#")[1])) { //key값과 메시지 내부의 아이디가 일치한다면,
						sessionList.remove(i); //해당 Session을 삭제.
						System.out.println("@@@@@@@@@@@@   웹소켓 접속 멤버: " + sessionList);
					}
				}
			}
		}
		System.out.println("@@@@@@@@@@@@" + "\n" + "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@" + "\n");
	}
	
	@OnClose
	public void handleClose() {
		
	}
	
	@OnError
	public void handleError(Throwable t) {
		
	}

}