package roomie.common.board;

import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class BoardController {
	
	@Resource
	private BoardService boardService;
	
	@RequestMapping(value="/register.ya")
	public ModelAndView insertBoard(@RequestParam Map<String,Object> map) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/roomie/boardList.ya");
		
		System.out.println(map);
		boardService.registerBoard(map);
		
		return mv;
	}
	
	@RequestMapping(value="/boardList.ya")
	public ModelAndView boardList()throws Exception{
		ModelAndView mv = new ModelAndView("board/boardList");
		
		return mv;
	}

}
