package roomie.common.option;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import roomie.common.user.UserService;

@Controller
public class OptionController {

	@Resource
	private OptionService optionService;

	@GetMapping(value = "/optionList.ya")
	public ModelAndView getOptionList(HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView("option/optionList");

		Map<String, Object> map = new HashMap<>();

		System.out.println(session.getAttribute("MEM_IDX"));

		map.put("MEM_IDX", session.getAttribute("MEM_IDX"));

		System.out.println(optionService.memSelect(map));

		mv.addObject("boardList", optionService.memSelect(map));

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

		Map<String, Object> map = new HashMap<>();

		System.out.println(session.getAttribute("MEM_IDX"));

		map.put("MEM_IDX", session.getAttribute("MEM_IDX"));

		System.out.println(optionService.memSelect(map));

		mv.addObject("boardList", optionService.memSelect(map));

		return mv;

	}

	@PostMapping(value = "/DeleteMem.ya")
	@ResponseBody
	public String DeleteMem(@RequestParam Map<String, Object> map) throws Exception {
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
	public ModelAndView LockList(HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView("option/lockList");
		int idx = Integer.parseInt(String.valueOf(session.getAttribute("MEM_IDX")));

		System.out.println(session.getAttribute("MEM_IDX"));
		Map<String, Object> map = new HashMap<>();
		map = optionService.lockList(idx);
		if (map.get("MEM_OPEN") == null || map.get("MEM_OPEN") == "") {
			map.put("MEM_OPEN", "N");
			optionService.updateOpen(idx);
		}
		System.out.println(map);
		mv.addObject("lockList", map);

		return mv;
	}

	@PostMapping(value = "/updatelock.ya")
	@ResponseBody
	public void updateLock(@RequestParam Map<String, Object> map) throws Exception {

		optionService.updateLock(map);
	}

	@GetMapping(value = "/logoutForm.ya")
	@ResponseBody
	public ModelAndView logoutForm(HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView("option/logoutForm");
		Map<String, Object> map = new HashMap<>();

		System.out.println(session.getAttribute("MEM_IDX"));

		map.put("MEM_IDX", session.getAttribute("MEM_IDX"));

		System.out.println(optionService.memSelect(map));

		mv.addObject("boardList", optionService.memSelect(map));

		return mv;
	}

	@GetMapping(value = "/memlogout.ya")
	public String logout(HttpSession session) throws Exception {

		System.out.println(session.getAttribute("MEM_IDX"));
		session.invalidate();

		return "/member/login";
	}
	
	@GetMapping(value="/blockList.ya")
	public ModelAndView BlockList(HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView("option/blockList");
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		
		int idx = Integer.parseInt(session.getAttribute("MEM_IDX").toString());
		System.out.println("idx : " +idx);
		list = optionService.blockList(idx);
		System.out.println("result list : " +list);
		mv.addObject("blocklist", list);		
		
		return mv;
	}
	
	@PostMapping(value="/unlockbl.ya")
	@ResponseBody
	public void unlockBlock(@RequestParam Map<String, Object> req) throws Exception{
		System.out.println(req);
		
		optionService.unlockBlock(req);
	
	}

}
