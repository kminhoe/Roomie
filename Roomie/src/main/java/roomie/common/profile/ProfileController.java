package roomie.common.profile;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class ProfileController {
	
	@Autowired
	ProfileService profileService;

	//아직 안
	@RequestMapping("/userProfile.ya")
	public ModelAndView userProfile(@RequestParam HashMap<String,Object> map, Model model) throws Exception {
		ModelAndView mv = new ModelAndView("profile/userProfile");
		map = (HashMap<String, Object>)profileService.userProfile(map);
		mv.addObject("user", map);
		log.info(map);
		return mv;
	}
	
}
