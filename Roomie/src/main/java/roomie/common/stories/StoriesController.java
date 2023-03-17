package roomie.common.stories;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class StoriesController {

	@Resource(name = "storiesService")
	private StoriesService storiesSerivce;

	@RequestMapping(value = "/stories.ya")
	public ModelAndView stories(@RequestParam Map<String, Object> map) throws Exception {
		ModelAndView mv = new ModelAndView("/stories/stories");

		System.out.println(storiesSerivce.selectStories(map));

		mv.addObject("STORIES", storiesSerivce.selectStories(map));

		return mv;
	}

	@ResponseBody
	@RequestMapping(value = "/storiesList.ya", method = { RequestMethod.POST })
	public List<Map<String, Object>> storiesList(@RequestParam Map<String, Object> map) throws Exception {

		List<Map<String, Object>> storiesMap = new ArrayList<Map<String, Object>>();

		System.out.println("storiesList > requestParam > " + map);

		storiesMap = storiesSerivce.storiesList(map);

		System.out.println("dao : " + storiesMap);

		return storiesMap;
	}

	@ResponseBody
	@RequestMapping(value = "/storiesCheck.ya", method = { RequestMethod.POST })
	public Map<String, Object> storiesCheck(@RequestParam Map<String, Object> map) throws Exception {

		try {
			System.out.println("requestParam >> " + map);

			if (storiesSerivce.selectStoriesCheck(map) == null) {
				System.out.println("selectStoryCheck >> " + storiesSerivce.selectStoriesCheck(map));
				storiesSerivce.insertStoriesCheck(map);
			}

			map.put("status", "OK");
		} catch (Exception e) {
			e.printStackTrace();
			map.put("status", "FAIL");
		}
		return map;
	}

	// 동영상 API
	@RequestMapping(value = "/test1.ya")
	public ModelAndView api() throws Exception {
		ModelAndView mv = new ModelAndView("/stories/moviemasher");

		return mv;
	}

	// 동영상 API
	@RequestMapping(value = "/test2.ya")
	public ModelAndView api2() throws Exception {
		ModelAndView mv = new ModelAndView("/stories/umd");

		return mv;
	}
}
