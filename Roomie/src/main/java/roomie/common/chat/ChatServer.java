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

import org.springframework.web.socket.handler.TextWebSocketHandler;

@ServerEndpoint("/roomieChat")
public class ChatServer extends TextWebSocketHandler {
	
	private static final long MAX_SESSION_IDLE_TIMEOUT = 30 * 60 * 1000; // 30분
	
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
			session.setMaxIdleTimeout(MAX_SESSION_IDLE_TIMEOUT); //세션의 타임아웃을 설정.
			sessionList.add(memberMap);//List<Map>에 주입.
			System.out.println("@@@@@@@@@@@@   웹소켓 접속 멤버: " + sessionList);
		}else if(keyWord.equals("2")) { //특정 대상에게 메시지를 보내는 경우.
			System.out.println("@@@@@@@@@@@@   웹소켓 접속 멤버: " + sessionList);
			System.out.println("@@@@@@@@@@@@   keyWord는 2입니다.");
			for(int i=0;i<sessionList.size();i++) { //sessionList를 모두 둘러본다.
				for(String key : sessionList.get(i).keySet()) { //sessionList에 들어있는 모든 항목의 key값을 둘러본다.
					if(key.equals(msg.split("#")[1])) { //key값과 메시지 내부의 아이디가 일치한다면,
						System.out.println("@@@@@@@@@@@@   메시지 내용: " + msg.substring(msg.indexOf("#",2) + 1));
						System.out.println("@@@@@@@@@@@@   메시지를 받는 웹소켓세션: " + sessionList.get(i).get(key));
						if(!sessionList.get(i).get(key).isOpen()) {
							System.out.println("세션이 닫혀있습니다.");
						}else {
							System.out.println("@@@@@@@@@@@@   해당 세션에게 메시지를 전송!");
							sessionList.get(i).get(key).getBasicRemote().sendText(msg);//해당 key값과 매치되는 session으로 메시지를 보낸다.
						}
					}
				}
			}
		}else if(keyWord.equals("3")) { //접속을 종료할 경우.
			System.out.println("@@@@@@@@@@@@   keyWord는 3입니다.");
			for(int i=0;i<sessionList.size();i++) { //sessionList를 모두 둘러본다.
				for(String key : sessionList.get(i).keySet()) { //sessionList에 들어있는 모든 항목의 key값을 둘러본다.
					if(key.equals(msg.split("#")[1])) { //key값과 메시지 내부의 아이디가 일치한다면,
						sessionList.remove(i); //해당 Session을 삭제.
						
					}
				}
				System.out.println("@@@@@@@@@@@@   웹소켓 접속 멤버: " + sessionList);
			}
		}else if(keyWord.equals("4")) {
			session.setMaxIdleTimeout(30 * 60 * 1000); //웹소켓 세션의 유효기간을 30분 연장.
			System.out.println("@@@@@@@@@@@@   웹소켓 시간 연장");
			System.out.println("@@@@@@@@@@@@   웹소켓 접속 멤버: " + sessionList);
		}else if(keyWord.equals("5")) { //좋아요 알림 기능.
			System.out.println("@@@@@@@@@@@@   keyWord는 5입니다.(좋아요 알림)");
			for(int i=0;i<sessionList.size();i++) { //sessionList를 모두 둘러본다.
				for(String key : sessionList.get(i).keySet()) { //sessionList에 들어있는 모든 항목의 key값을 둘러본다.
					if(key.equals(msg.split("#")[1])) { //key값과 메시지 내부의 아이디가 일치한다면(받는사람 아이디)
						System.out.println("@@@@@@@@@@@@   좋아요를 받는 웹소켓세션: " + sessionList.get(i).get(key));
						if(!sessionList.get(i).get(key).isOpen()) {
							System.out.println("세션이 닫혀있습니다.");
						}else {
							System.out.println("@@@@@@@@@@@@   해당 세션의 게시글을 좋아합니다.");
							sessionList.get(i).get(key).getBasicRemote().sendText("like#true");//해당 key값과 매치되는 session으로 "true"를 보낸다.
						}
					}
				}
			}
		}
		System.out.println("@@@@@@@@@@@@" + "\n" + "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@" + "\n");
	}
	
	@OnClose
	public void handleClose() {
		System.out.println("\n" + "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ ChatServer/handleClose @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@" + "\n" + "@@@@@@@@@@@@   ");
		System.out.println("@@@@@@@@@@@@   웹소켓 세션 만료");
		System.out.println("@@@@@@@@@@@@   웹소켓 접속 멤버: " + sessionList);
		System.out.println("@@@@@@@@@@@@" + "\n" + "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@" + "\n");
	}
	
	@OnError
	public void handleError(Throwable t) {
		System.out.println("에러 발생");
	}

}