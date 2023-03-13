package roomie.common.option;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

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
	
	@GetMapping(value ="/optionList.ya")
	public ModelAndView getOptionList()throws Exception{
		ModelAndView mv = new ModelAndView("option/optionList");
		
		return mv;
	}
	
	@PostMapping(value = "/checkpass.ya")
	@ResponseBody
	public int passwordCheck(@RequestParam Map<String, Object> request) throws Exception{
		Map<String, Object> result = new HashMap<String, Object>();
		
		int idx = Integer.parseInt((String) request.get("MEM_IDX"));
//		String ori = (String)request.get("oripw");
//		String newpw = (String)request.get("MEM_PWD");

		
		result = optionService.checkpass(idx);
		System.out.println(request);

		if(result.get("MEM_PWD").equals(request.get("oripw"))) {
			System.out.println("비밀번호 맞음");
			
			optionService.changepass(request);
			
			return 0;
		}else {
			return 2;
		}
	
	}

}
