package roomie.common.option;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class OptionController {

	@Resource
	private OptionService optionService;

	@GetMapping(value = "/optionList.ya")
	public ModelAndView getOptionList() throws Exception {
		ModelAndView mv = new ModelAndView("option/optionList");

		return mv;
	}

	@PostMapping(value = "/checkpass.ya")
	@ResponseBody
	public int passwordCheck(@RequestParam Map<String, Object> request) throws Exception {
		Map<String, Object> result = new HashMap<String, Object>();

		int idx = Integer.parseInt((String) request.get("MEM_IDX"));
//		String ori = (String)request.get("oripw");
//		String newpw = (String)request.get("MEM_PWD");

		result = optionService.checkpass(idx);
		System.out.println(request);

		if (result.get("MEM_PWD").equals(request.get("oripw"))) {
			System.out.println("비밀번호 맞음");
			optionService.changepass(request);

			return 0;
		} else {
			return 2;
		}

	}

	@GetMapping(value = "/memberDelete.ya")
	public ModelAndView MemberDelete(HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView("option/memberDelete");

		return mv;



	}
	
	@PostMapping(value = "/DeleteMem.ya")
	@ResponseBody
	public String DeleteMem(@RequestParam Map<String, Object> map) throws Exception{
		int idx = Integer.parseInt((String) map.get("MEM_IDX"));

		Map<String, Object> result = optionService.checkpass(idx);
		
		System.out.println("결과값 : 	" + map);

		if (result.get("MEM_PWD").equals(map.get("MEM_PWD"))) {
			optionService.MemberDelete(map);
		}

		return "/roomie/login.ya";
		
	}
	
	@GetMapping(value = "/lockList.ya")
	@ResponseBody
	public ModelAndView LockList(Integer session) throws Exception{
		ModelAndView mv = new ModelAndView("option/lockList");
//		int idx = Integer.parseInt((String)session.getId());
		
		session = 2;
		Map<String, Object> map = new HashMap<>();
		map = optionService.lockList(session);
		if(map.get("MEM_OPEN") == null || map.get("MEM_OPEN") == "") {
			map.put("MEM_OPEN", "N");
			optionService.updateOpen(session);
		}
		System.out.println(map);
		mv.addObject("lockList", map);
		
		return mv;
	}
	
	@PostMapping(value="/updatelock.ya")
	@ResponseBody
	public void updateLock(@RequestParam Map<String, Object> map) throws Exception{
		
		optionService.updateLock(map);
	}

}
