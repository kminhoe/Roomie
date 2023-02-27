package roomie.common.mail;

import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import roomie.common.member.MemberService;

@Controller
public class MailController {
	
	@Inject
	MailSendService mailSendService;  //@Service를 붙였었다.
	
	@Resource
	private MemberService memberService;
	


	@RequestMapping("emailcheck.ya")
	@ResponseBody
	public Map<String,Object> mailAuth(String mail, HttpServletResponse response, RedirectAttributes rttr) throws Exception {
		
		Map<String,Object> map = new HashMap<String,Object>();
		
		
		Map<String,Object> email = memberService.emailcheck(mail);
		
		if(email == null) {
			
			map.put("mail", "NO");
			
			return map;
			
		} else {
		
			System.out.println(mail);
	    	Random random = new Random();	
	        int checkNum = random.nextInt(888888) + 111111;
	        
	        String key = String.valueOf(checkNum);

		
	    String authKey = mailSendService.sendAuthMail(mail,key); //사용자가 입력한 메일주소로 메일을 보냄
   
	    map.put("key", key);
	    map.put("email", mail);
	    
	    return map; }
	}

}
