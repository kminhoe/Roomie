package roomie.common.block;

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


@Controller
public class BlockController {

	@Resource
	private BlockService blockService;
	
	@RequestMapping(value="/block.ya")
	public ModelAndView blockInsert(HttpSession session, @RequestParam Map<String, Object> map)throws Exception{
		
		ModelAndView mv = new ModelAndView("board/boardList");
		
		System.out.println("세션 확인 : " + session.getAttribute("MEM_IDX"));
		
		int mem_idx = Integer.parseInt(String.valueOf(session.getAttribute("MEM_IDX")));
		
		System.out.println(map);
		
		Map<String, Object> block = new HashMap<String, Object>();

		block.put("MEM_IDX", mem_idx);
		block.put("BLOCKM_IDX", map.get("bo_mem"));
		
		blockService.blockInsert(block);
		
        
		return mv; 
	}
	
	
	
	
}
