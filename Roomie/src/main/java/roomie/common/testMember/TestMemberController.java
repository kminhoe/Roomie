package roomie.common.testMember;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class TestMemberController {
	
	@Resource(name = "testMemberService")
	private TestMemberLoginService testMemberService;
	
	//test로그인 폼 
	@RequestMapping(value = "/testLoginForm.ya")
	public String testLoginForm(TestMemberDTO member, BindingResult result, Model model) throws Exception {
		return "/chat/testLogin";
	}

	@RequestMapping(value = "testLogin.ya")
	public ModelAndView testLogin(@RequestParam HashMap<String, Object> param, TestMemberDTO testMember, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView("/chat/testLogin");
		Map<String, Object> map = new HashMap<String, Object>();
		
		map = testMemberService.selectMemberId(testMember);
		
		System.out.println(testMember.getMEM_ID());
		session.setAttribute("MEM_ID", testMember.getMEM_ID());
		
		System.out.println("session: " + session.getAttribute("MEM_ID"));
		
		mv.addObject("testMember", map);
		
		System.out.println("session: " + session.getAttribute("MEM_ID"));
		System.out.println("test1 로그인");
		
		return mv;
	}
	
	@RequestMapping(value = "testLogout.ya")
	public ModelAndView testLogout(@RequestParam HashMap<String, Object> param, HttpServletRequest request, Model model) throws Exception {
		ModelAndView mv = new ModelAndView("/chat/testLogin");
		
		request.getSession().invalidate();
		
		return mv;
	}
	
}
