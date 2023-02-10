package roomie.common.member;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MemberController {
	
	@Resource(name = "memberService")
	private MemberService memberService;

	// 로그인 페이지
	@RequestMapping(value = "/index.ya", method= {RequestMethod.GET})
	public ModelAndView login() {
		ModelAndView mv = new ModelAndView("member/login");
		
		return mv;
	}
	
	// 이메일 > 회원가입 페이지
	@RequestMapping(value = "/emailsignup.ya", method= {RequestMethod.GET})
	public void emailsignup() throws Exception {}

	
	// 이메일 > 회원가입 > 생년월일 페이지 (RequestParam email, password, repassword, user, name, mbti)
	@RequestMapping(value = "/birthday.ya", method= {RequestMethod.POST})
	public ModelAndView birthday (@RequestParam Map<String, Object> map) throws Exception {
		
		ModelAndView mv = new ModelAndView();
		
		mv.addAllObjects(map);
		
		return mv;
	}

	// 이메일 > 회원가입 > 생년월일 페이지 > 이메일 인증 페이지
	@RequestMapping(value = "/emailconfirmation.ya", method= {RequestMethod.POST})
	public ModelAndView emailconfirmation (@RequestParam Map<String, Object> map) throws Exception {
		
		ModelAndView mv = new ModelAndView();
		
		System.out.println("Map : " + map);
		mv.addAllObjects(map);
		
		return mv;
	}
}
