package roomie.common.admin;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.log4j.Log4j;


@Controller
@Log4j
public class AdminController {
	
	@Resource
	private AdminService adminService;
	
	@RequestMapping(value="/adminMember.ya")
	public ModelAndView adminMember(HttpSession session)throws Exception{
		
		ModelAndView mv = new ModelAndView("admin/admin_m");
		
		//멤버 리스트
		Map<String, Object> mem = new HashMap<String, Object>();
		mem.put("x", "x");
		List<Map<String, Object>> list = adminService.memberSelect(mem);
		
		System.out.println(list);
		
		mv.addObject("member", list);
		
		//신고 수 구하기
		

		return mv; 
	}
	
	@RequestMapping(value="/adminBoard.ya")
	public ModelAndView adminBoard(HttpSession session, @RequestParam Map<String, Object> map)throws Exception{
		
		ModelAndView mv = new ModelAndView("admin/admin_b");

		return mv; 
	}
	
	@RequestMapping(value="/adminComment.ya")
	public ModelAndView adminComment(HttpSession session, @RequestParam Map<String, Object> map)throws Exception{
		
		ModelAndView mv = new ModelAndView("admin/admin_c");

		return mv; 
	}
	
}
