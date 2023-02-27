package roomie.common.search;

import java.util.HashMap;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class SearchController {
	
	@RequestMapping(value = "searchForm.ya")
	public ModelAndView searchForm(@RequestParam HashMap<String, Object> param) throws Exception{
		
		ModelAndView mv = new ModelAndView("/search/searchForm");
		
		return mv;
	} 
	
	
	@RequestMapping(value = "searchResult.ya")
	public ModelAndView searchResult(@RequestParam HashMap<String, Object> param) throws Exception{
		
		ModelAndView mv = new ModelAndView("/search/searchResult");
		
		return mv;
	}

}
