package Moble;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

// WebSocket 호스트 설정
@ServerEndpoint("/socket")
public class Socket {
// 접속 된 클라이언트 WebSocket session 관리 리스트
	private static List<Session> sessionUsers = Collections.synchronizedList(new ArrayList<>());
// 메시지에서 유저 명을 취득하기 위한 정규식 표현
	private static Pattern pattern = Pattern.compile("^\\{\\{.*?\\}\\}");
	private static int count = 0;
// WebSocket으로 브라우저가 접속하면 요청되는 함수
	@OnOpen
	public void handleOpen(Session userSession) {
		++count;
// 클라이언트가 접속하면 WebSocket세션을 리스트에 저장한다.
		sessionUsers.add(userSession);
// 콘솔에 접속 로그를 출력한다.
		System.out.println("client is now connected...");
		
	}

// WebSocket으로 메시지가 오면 요청되는 함수
	@OnMessage
	public void handleMessage(String message, Session userSession) throws IOException {
// 메시지 내용을 콘솔에 출력한다.
		System.out.println(message);
// 초기 유저 명
		String name = "";
// 메시지로 유저 명을 추출한다. 패턴이 올바르면 True 반환
		Matcher matcher = pattern.matcher(message);
// 메시지 예: {{유저명}}메시지
		if (matcher.find()) {
			name = matcher.group();
		}
// 받은 메세지를 내용부분과 이름 부분을 나누어서 저장한다.
		final String msg = message.replaceAll(pattern.pattern(), "");
		final String username = name.replaceFirst("^\\{\\{", "").replaceFirst("\\}\\}$", "");
// session관리 리스트에서 Session을 취득한다.
		sessionUsers.forEach(session -> {
// 리스트에 있는 세션과 메시지를 보낸 세션이 같으면 메시지 송신할 필요없다.
			if (session == userSession) {
				return;
			}
			try {
// 리스트에 있는 모든 세션(메시지 보낸 유저 제외)에 메시지를 보낸다.
// getBasicRemote 는 같은 엔드포인트 안에있는 세션에게 메세지를 보내주는 메서드
				session.getBasicRemote().sendText(username + " => " + msg);
			} catch (IOException e) {
// 에러가 발생하면 콘솔에 표시한다.
				e.printStackTrace();
			}
		});
	}

// WebSocket과 브라우저가 접속이 끊기면 요청되는 함수
	@OnClose
	public void handleClose(Session userSession) {
// session 리스트로 접속 끊은 세션을 제거한다.
		sessionUsers.remove(userSession);
// 콘솔에 접속 끊김 로그를 출력한다.
		--count;
		if(count<0)
			count = 0;
		System.out.println("클라이언트와의 연결이 끊어졌습니다.");
	}
	
    public static int getCount() {
        return count;
    }



}
