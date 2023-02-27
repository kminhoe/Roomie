package roomie.common.member;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.math.BigDecimal;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.JsonElement;
import com.google.gson.JsonParser;

@Controller
public class MemberController {
	
	@Resource(name = "memberService")
	private MemberService memberService;
	
	public void setMailService(MemberService memberService) {
		this.memberService = memberService;
	}

	// 메인 페이지
	@RequestMapping(value = "/main.ya")
	public void main() throws Exception {}
	
	// 로그인 페이지
	@RequestMapping(value = "/login.ya")
	public void login() throws Exception {}
	
	// 로그인 페이지 > 이메일 로그인
	@RequestMapping(value = "/loginSuccess")
	public ModelAndView loginSuccess(@RequestParam Map<String, Object> map, HttpSession session, RedirectAttributes dir) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		Map<String, Object> memberMap = new HashMap<String, Object>();

		memberMap = memberService.selectMemberId(map);
		
		// 등록된 아이디가 아닐 경우
		if (memberMap == null) {
			// 로그인 실패
			System.out.println("상태 : 아이디 틀림");
			dir.addFlashAttribute("login", "false");
			mv.setViewName("redirect:/login.ya");
		// 등록된 아이디일 경우	
		} else {

			// 입력한 비밀번호가 일치하는 경우
			if (map.get("MEM_PWD").equals(memberMap.get("MEM_PWD"))) {
				// 로그인 성공
				
				System.out.println(memberMap.get("MEM_DEL").getClass());

				// 회원탈퇴 여부
				if (memberMap.get("MEM_DEL").equals(new BigDecimal(0))) {
					System.out.println("상태 : 회원탈퇴");
					dir.addFlashAttribute("login", "del");
					mv.setViewName("redirect:/login.ya");
					return mv;
				}
				
				// 계정 잠금 여부
				if (memberMap.get("MEM_LOCK").equals("Y")) {
					System.out.println("상태 : 계정 잠금");
					dir.addFlashAttribute("login", "lock");
					dir.addFlashAttribute("mem_id", memberMap.get("MEM_ID"));
					mv.setViewName("redirect:/login.ya");
					return mv;
				}
				
				// 세션 등록
				session.setAttribute("MEM_ID", memberMap.get("MEM_PWD"));
				mv.setViewName("redirect:/main.ya");
			// 입력한 비밀번호가 일치하지 않는 경우
			} else {
				System.out.println("상태 : 비밀번호 틀림");
				dir.addFlashAttribute("login", "false");
				mv.setViewName("redirect:/login.ya");
			}
		}
		return mv;
	}
	
	// 이메일 > 회원가입 페이지
	@RequestMapping(value = "/emailSignup.ya", method= {RequestMethod.GET})
	public void emailSignup() throws Exception {}
	
	// 카카오 > 회원가입 페이지
	@RequestMapping(value = "/kakaoSignup.ya", method= {RequestMethod.GET})
	public ModelAndView kakaoSignup(@RequestParam Map<String, Object> map, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		String kakaoId = (String)session.getAttribute("kakaoId");

		System.out.println("kakaoId : " + kakaoId);
		
		// kakaoId 세션이 Null일 경우 로그인 페이지로 이동
		if (kakaoId == null) {
			mv.setViewName("redirect:/login.ya");
		}
		
		return mv;
	}
	
	// 이메일 > 회원가입 페이지 > 이메일 중복체크
	@ResponseBody
	@RequestMapping(value = "/selectMemberId.ya", method= {RequestMethod.GET})
	public boolean selectMemberId(@RequestParam Map<String, Object> map) throws Exception {

		if (memberService.selectMemberId(map) == null) {
			return true;
		} else {
			return false;
		}
	}
	
	// 이메일 > 회원가입 페이지 > 사용자 이름 중복체크
	@ResponseBody
	@RequestMapping(value = "/selectMemberUser.ya", method= {RequestMethod.GET})
	public boolean selectMemberUser(@RequestParam Map<String, Object> map) throws Exception {

		if (memberService.selectMemberUser(map) == null) {
			return true;
		} else {
			return false;
		}
	}
		
	// 이메일 > 회원가입 > 생년월일 페이지 (RequestParam email, password, repassword, user, name, mbti)
	@RequestMapping(value = "/birthday.ya", method= {RequestMethod.POST})
	public ModelAndView birthday (@RequestParam Map<String, Object> map) throws Exception {
		
		ModelAndView mv = new ModelAndView();
		
		mv.addAllObjects(map);

		return mv;
	}

	// 이메일 > 회원가입 > 생년월일 페이지 > 이메일 인증 페이지
	@RequestMapping(value = "/emailConfirmation.ya", method= {RequestMethod.POST})
	public ModelAndView emailConfirmation (@RequestParam Map<String, Object> map) throws Exception {
		
		ModelAndView mv = new ModelAndView();
		
		System.out.println("Map : " + map);
		mv.addAllObjects(map);
		
		return mv;
	}
	

	// 이메일 > 회원가입 > 생년월일 페이지 > 이메일 인증 번호 발송
	@ResponseBody
	@RequestMapping(value = "/emailConfirmationPro.ya", method = RequestMethod.POST)
	public Map<String,Object> sendMail(@RequestParam Map<String, Object> map, HttpSession session) throws Exception {

		try {
			System.out.println("입력받은 email의 값 : " + map.get("email")); // 요청 받은 이메일 값 출력

			String email = (String) map.get("email");
			int random = new Random().nextInt(100000) + 10000; // 10000 ~ 99999
			
			String joinCode = String.valueOf(random);

			session.removeAttribute("joinCode"); // joinCode 세션 비우기
			session.setAttribute("joinCode", joinCode); // joinCode 세션 저장
			
			System.out.println("joinCode : " + session.getAttribute("joinCode")); // 세션에 저장된 코드 값 출력
	
			String subject = "[Roomie] 회원가입 인증 메일";
			
			StringBuilder stringBuilder = new StringBuilder();
			stringBuilder.append("인증번호: " + joinCode);
			
			System.out.println(stringBuilder.toString());
	
			boolean finishSend = this.memberService.emailCodeSend(subject, stringBuilder.toString(), "RoomieAdmin", email); // 메일 발송
			System.out.println("상태 : " + finishSend);

			map.put("status", "OK");
		}catch(Exception e) {
			e.printStackTrace();
			map.put("status", "FAIL");
		}
		return map;
	}
	
	
	// 이메일 인증 코드 확인
	@ResponseBody
	@RequestMapping(value = "/emailCodeCheck.ya", method = RequestMethod.POST)
	public Map<String,Object> emailCodeCheck(@RequestParam Map<String, Object> map, HttpSession session) throws Exception {
		
		System.out.println(map);
		
		try {
			// 인증 코드 값이 비교
			if (session.getAttribute("joinCode").equals(map.get("joinCode"))) {
				map.put("status", "TRUE");
			} else {
				map.put("status", "FALSE");
			}
		}catch(Exception e) {
			e.printStackTrace();
			map.put("status", "FAIL");
		}

		return map;
	}
	
	// 이메일 회원가입 성공
	@RequestMapping(value = "/emailSignupSuccess.ya", method = RequestMethod.POST)
	public ModelAndView emailSignupSuccess(@RequestParam Map<String, Object> map) throws Exception {
		ModelAndView mv = new ModelAndView("/login");

		System.out.println(map);
		
		memberService.insertEmailMember(map); // 회원가입

		return mv;
	}
	
	// 카카오 회원가입 성공
	@RequestMapping(value = "/kakaoSignupSuccess.ya", method = RequestMethod.POST)
	public ModelAndView kakaoSignupSuccess(@RequestParam Map<String, Object> map) throws Exception {
		ModelAndView mv = new ModelAndView("/login");

		System.out.println(map);
		
		memberService.insertKakaoMember(map); // 회원가입

		return mv;
	}

	@RequestMapping(value = "/login/getKakaoAuthUrl.ya")
	public @ResponseBody String getKakaoAuthUrl(HttpServletRequest request) throws Exception {
		String reqUrl = 
				"https://kauth.kakao.com/oauth/authorize"
				+ "?client_id=67d7fcc02d23bda82141d67ff4efd7ee"
				+ "&redirect_uri=http://localhost:8090/roomie/login/oauth_kakao.ya"
				+ "&response_type=code";
		
		return reqUrl;
	}
	
	// 카카오 연동정보 조회
	@RequestMapping(value = "/login/oauth_kakao.ya")
	public ModelAndView oauthKakao (@RequestParam(value = "code", required = false) String code,
			RedirectAttributes dir, HttpSession session) throws Exception {

		ModelAndView mv = new ModelAndView();
		Map<String, Object> map = new HashMap<String, Object>();
		Map<String, Object> memberMap = new HashMap<String, Object>();
		
		System.out.println("code : " + code);
        String access_Token = getAccessToken(code);
        System.out.println("access_Token : " + access_Token);
        
        
        HashMap<String, Object> userInfo = getUserInfo(access_Token);
        System.out.println("access_Token : " + access_Token);
       
        JSONObject kakaoInfo =  new JSONObject(userInfo);
        
        String kakaoId = (String)kakaoInfo.get("id");

		session.removeAttribute("kakaoId"); // kakaoId 세션 비우기
		session.setAttribute("kakaoId", kakaoId); // kakaoId 세션 저장
		map.put("MEM_ID", "k_" + kakaoId);
		System.out.println("session : " + kakaoId);
        
        dir.addFlashAttribute("kakaoInfo", kakaoInfo);
        
        memberMap = memberService.selectMemberId(map);
        
		if (memberMap == null) {
			mv.setViewName("redirect:/kakaoSignup.ya");
		} else {
			// 회원탈퇴 여부
			if (memberMap.get("MEM_DEL").equals(new BigDecimal(0))) {
				System.out.println("상태 : 회원탈퇴");
				dir.addFlashAttribute("login", "del");
				mv.setViewName("redirect:/login.ya");
				return mv;
			}
			
			// 계정 잠금 여부
			if (memberMap.get("MEM_LOCK").equals("Y")) {
				System.out.println("상태 : 계정 잠금");
				dir.addFlashAttribute("login", "lock");
				mv.setViewName("redirect:/login.ya");
				return mv;
			}
			
			mv.setViewName("redirect:/main.ya");
		}
        
        return mv; // 경로 설정
	}
	
    // 토큰 발급
	public String getAccessToken (String authorize_code) {
        String access_Token = "";
        String refresh_Token = "";
        String reqURL = "https://kauth.kakao.com/oauth/token";

        try {
            URL url = new URL(reqURL);

            HttpURLConnection conn = (HttpURLConnection) url.openConnection();

            // URL연결은 입출력에 사용 될 수 있고, POST 혹은 PUT 요청을 하려면 setDoOutput을 true로 설정해야함.
            conn.setRequestMethod("POST");
            conn.setDoOutput(true);

            // POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송
            BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
            StringBuilder sb = new StringBuilder();
            sb.append("grant_type=authorization_code");
            sb.append("&client_id=67d7fcc02d23bda82141d67ff4efd7ee");	//본인이 발급받은 key
            sb.append("&redirect_uri=http://localhost:8090/roomie/login/oauth_kakao.ya");	// 본인이 설정해 놓은 경로
            sb.append("&code=" + authorize_code);
            bw.write(sb.toString());
            bw.flush();

            // 결과 코드가 200이라면 성공
            int responseCode = conn.getResponseCode();
            System.out.println("responseCode : " + responseCode);

            // 요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            String line = "";
            String result = "";

            while ((line = br.readLine()) != null) {
                result += line;
            }
            System.out.println("response body : " + result);

            // Gson 라이브러리에 포함된 클래스로 JSON파싱 객체 생성
            JsonParser parser = new JsonParser();
            JsonElement element = parser.parse(result);

            access_Token = element.getAsJsonObject().get("access_token").getAsString();
            refresh_Token = element.getAsJsonObject().get("refresh_token").getAsString();

            System.out.println("access_token : " + access_Token);
            System.out.println("refresh_token : " + refresh_Token);

            br.close();
            bw.close();
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return access_Token;
    }
	
    // 유저 정보 조회
    public HashMap<String, Object> getUserInfo (String access_Token) {
    	
    	System.out.println("access_Token : " + access_Token);

        // 요청하는 클라이언트마다 가진 정보가 다를 수 있기에 HashMap타입으로 선언
        HashMap<String, Object> userInfo = new HashMap<String, Object>();
        String reqURL = "https://kapi.kakao.com/v2/user/me";
        try {
            URL url = new URL(reqURL);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");

            // 요청에 필요한 Header에 포함될 내용
            conn.setRequestProperty("Authorization", "Bearer " + access_Token);

            int responseCode = conn.getResponseCode();
            System.out.println("responseCode : " + responseCode);

            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

            String line = "";
            String result = "";

            while ((line = br.readLine()) != null) {
                result += line;
            }
            System.out.println("response body : " + result);

            JsonParser parser = new JsonParser();
            JsonElement element = parser.parse(result);

            String id = element.getAsJsonObject().get("id").getAsString();
           
            userInfo.put("accessToken", access_Token);
            userInfo.put("id", id);

        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return userInfo;
    }
    
 // 로그인 잠금
 	@RequestMapping(value = "/passwordcheck.ya")
 	public ModelAndView passwordEmail(@RequestParam Map<String, Object> map) throws Exception {
 		ModelAndView mv = new ModelAndView("member/passwordcheck");
 		

 		return mv;
 	}
 	
 	@RequestMapping(value = "/emailconfirm.ya")
 	public ModelAndView emailcheck(@RequestParam Map<String, Object> map) throws Exception {
 		ModelAndView mv = new ModelAndView("member/emailconfirm");
 		
 		System.out.println("받아지는지 확인 : " + map);
 		
 		mv.addObject("key", map.get("key"));

 		return mv;
 	}
 	
 	@RequestMapping(value = "/passwordreset.ya")
 	public ModelAndView passwordreset(@RequestParam(required = false) Map<String, Object> map) throws Exception {
 		ModelAndView mv = new ModelAndView("member/passwordreset");
 		
 		 Map<String, Object> reset = new  HashMap<String, Object>();
 		
 		if(map.get("password") != null ) {

         reset.put("mem_id", map.get("email"));
         reset.put("mem_pwd", map.get("password"));
         
         System.out.println("reset map 확인 : " + reset);
 		
 		memberService.passwordreset(reset);
 		}
 		else if(map.get("password") == null) {
 			System.out.println("비밀번호 입력 X");
 		}


 		return mv;
 	}
	 
}