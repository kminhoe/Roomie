package roomie.common.search;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.json.simple.JSONArray;

import org.json.simple.JSONObject;

import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import roomie.common.member.MemberService;

@Controller
public class SearchController {
	
	@Resource
	private SearchService searchService;
	
	@RequestMapping(value = "searchForm.ya")
	public ModelAndView searchForm(@RequestParam HashMap<String, Object> param) throws Exception{
		
		ModelAndView mv = new ModelAndView("/search/searchForm");
		
		String idx = "x";
		
		List<Map<String, Object>> list = searchService.hashList(idx);
		
		List<Map<String, Object>> mem = searchService.memberList(idx);
		
		mv.addObject("hash", list);
		mv.addObject("mem", mem);
		
		return mv;
	} 
	


	
	@RequestMapping(value = "searchResult.ya")
	@ResponseBody
	public ModelAndView searchResult(@RequestParam Map<String, Object> data) throws Exception{
		
		ModelAndView mv = new ModelAndView("/search/searchForm");
		
		System.out.println(data);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("SEARCH_KEYWORD", data.get("keyword"));
		map.put("SEARCH_MEM", 1);
		
		searchService.insertKeyword(map);
		
		
		
		return mv;
	}

}
