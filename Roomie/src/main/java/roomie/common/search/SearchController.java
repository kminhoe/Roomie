package roomie.common.search;

import java.util.Arrays;
import java.util.HashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import roomie.common.board.BoardService;


@Controller
public class SearchController {
	
	@Resource
	private SearchService searchService;
	
	@Resource
	private BoardService boardService;
	
	@RequestMapping(value = "searchForm.ya")
	public ModelAndView searchForm(@RequestParam HashMap<String, Object> param, HttpSession session) throws Exception{
		
		ModelAndView mv = new ModelAndView("/search/searchForm");
		
		String idx = "x";
		
		List<Map<String, Object>> list = searchService.hashList(idx);
		
		List<Map<String, Object>> mem = searchService.memberList(idx);
		
		mv.addObject("hash", list);
		mv.addObject("mem", mem);
		
        //세션 idx 값 받아오는 것
		int a = Integer.parseInt(String.valueOf(session.getAttribute("MEM_IDX")));
		List<Map<String, Object>> keyword = searchService.searchList(a);
		

		
		//like board 배열에 담기
		String[] list1 = new String[keyword.size()];
						
		for(int i=0; i < keyword.size(); i++) {
					
		
		list1[i] =  (String) keyword.get(i).get("SEARCH_KEYWORD");
					
		}
				
		System.out.println("배열확인 : " + list1);
		
		// 배열을 LinkedHashSet으로 변환합니다.
		LinkedHashSet<String> linkedHashSet = new LinkedHashSet<>( Arrays.asList(list1) );

		// LinkedHashSet을 배열로 변환홥니다.
		String[] strArrayWithoutDuplicates = 
		  linkedHashSet.toArray(new String[] {});

		System.out.println( Arrays.toString(strArrayWithoutDuplicates) );
		
		
		System.out.println(keyword);
		mv.addObject("keyword", strArrayWithoutDuplicates);
		
		
		//boardList
		Map<String, Object> mem_idx = new HashMap<String, Object>();
		
		mem_idx.put("MEM_IDX", a);
		Map<String, Object> MEMBER = searchService.memCheck(mem_idx);
		
	    System.out.println(MEMBER.get("MEM_MBTI"));
		
	    Map<String, Object> mbti = new HashMap<String, Object>();
	    mbti.put("MEM_MBTI", MEMBER.get("MEM_MBTI"));
	    List<Map<String, Object>> BOARD = searchService.boardList(mbti); 
	    
	    mv.addObject("BOARD", BOARD);
	    mv.addObject("BOARD2", BOARD);
	    
	    System.out.println("BOARD : " + BOARD);
	    
	 
	  //좋아요 확인
	  		Map<String, Object> map = new HashMap<>();
	  		
	  		map.put("LIKEB_MEM", a);


	  		List<Map<String, Object>> like = boardService.likeCheck(map);
	  		
	  		System.out.println(like);
	  		
	  		mv.addObject("LIKEB", like);
		
		return mv;
	}
	


	
	@RequestMapping(value = "searchResult.ya")
	@ResponseBody
	public ModelAndView searchResult(@RequestParam Map<String, Object> data, HttpSession session) throws Exception{
		
		ModelAndView mv = new ModelAndView("/search/searchForm");
		
		System.out.println(data);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("SEARCH_KEYWORD", data.get("keyword"));
		map.put("SEARCH_MEM", Integer.parseInt(String.valueOf(session.getAttribute("MEM_IDX"))));
		
		searchService.insertKeyword(map);
		
		
		
		return mv;
	}
	
	@RequestMapping(value = "searchDelete.ya")
	@ResponseBody
	public String searchDelete(@RequestParam Map<String, Object> data, HttpSession session) throws Exception{
		
		//ModelAndView mv = new ModelAndView("/search/searchForm");
		
		System.out.println(data);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		int idx = Integer.parseInt(String.valueOf(session.getAttribute("MEM_IDX")));
		
		map.put("SEARCH_KEYWORD", data.get("keyword"));
	    map.put("SEARCH_MEM", idx);
		
		searchService.searchDelete(map);
		
		//String id = data.get(map);
		
		//Map<String, Object> mem = new HashMap<String, Object>();
		//mem.put("SEARCH_MEM", 1);

		
		List<Map<String, Object>> slist = searchService.searchList(idx);
		
		System.out.println(slist);
		
		//mv.addObject("slist", list);
		
		return "search/searchForm";
	}
	

}
