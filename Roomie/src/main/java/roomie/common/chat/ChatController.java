package roomie.common.chat;

import java.util.HashMap;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ChatController {
	
	@RequestMapping(value = "chatForm.ya")
	public ModelAndView chatForm(@RequestParam HashMap<String, Object> param) throws Exception{
		
		ModelAndView mv = new ModelAndView("/chat/chatForm");
		
		return mv;
	}

}
