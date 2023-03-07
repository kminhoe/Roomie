package roomie.common.option;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
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
	public ResponseEntity<String> passwordCheck(@RequestBody Map<String, Object> map) throws Exception{
		Map<String, Object> result = new HashMap<String, Object>();
		String original = (String)map.get("originalpass");
		int idx = Integer.parseInt((String) map.get("MEM_IDX"));
		result = optionService.checkpass(idx);
		
		if(original.equals(result)) {
			map.get("newpass");
		}
		
		return new ResponseEntity<String>("sdf", HttpStatus.OK);
	}

}
