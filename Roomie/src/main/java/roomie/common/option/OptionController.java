package roomie.common.option;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
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
	public ResponseEntity<String> passwordCheck(@RequestParam Map<String, Object> map) throws Exception{
		Map<String, Object> result = new HashMap<String, Object>();
		
		System.out.println("먼데?:" + map);
		System.out.println(map.get("MEM_IDX"));
		int a = Integer.parseInt(String.valueOf(map.get("MEM_IDX")));
		result = optionService.checkpass(a);
		
//		if(map.get("originalpass") == null || != result) {
//			return 
//		}
		
		//String original = (String)map.get("originalpass");
//		int idx = Integer.parseInt((String) map.get("MEM_IDX"));
//		result = optionService.checkpass(idx);
		
		
		return new ResponseEntity<String>("map", HttpStatus.OK);
	}

}
