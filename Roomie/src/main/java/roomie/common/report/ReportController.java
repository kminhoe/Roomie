package roomie.common.report;

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
public class ReportController {
	
	@Resource
	private ReportService reportService;
	
	@RequestMapping(value="/report.ya")
	public ModelAndView reportInsert(HttpSession session, @RequestParam Map<String, Object> map)throws Exception{
		
		ModelAndView mv = new ModelAndView("board/boardList");
		
		System.out.println("세션 확인 : " + session.getAttribute("MEM_IDX"));
		
		int mem_idx = Integer.parseInt(String.valueOf(session.getAttribute("MEM_IDX")));
		
		System.out.println(map);
		
		Map<String, Object> rep = new HashMap<String, Object>();

		
		rep.put("REP_TYPE", map.get("rep"));
		
		
		if(map.get("bo_idx") != null){
			
		rep.put("REP_BOARD", map.get("bo_idx"));
		
		} else {
			
			rep.put("REP_BOARD", "X");
		}
		
		rep.put("REP_MEM", mem_idx);
		rep.put("TARGET_MEM", map.get("bo_mem"));
		rep.put("REP_CONT", map.get("reason"));
		
       reportService.reportInsert(rep);
        
		return mv; 
	}

}
