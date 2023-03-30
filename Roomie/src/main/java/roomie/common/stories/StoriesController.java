package roomie.common.stories;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.io.FilenameUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import net.bramp.ffmpeg.FFmpeg;
import net.bramp.ffmpeg.FFmpegExecutor;
import net.bramp.ffmpeg.FFprobe;
import net.bramp.ffmpeg.builder.FFmpegBuilder;


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

	// 스토리 업로드 페이지
	@RequestMapping(value = "/storiesUpload.ya")
	public ModelAndView storiesUpload() throws Exception {
		ModelAndView mv = new ModelAndView("/stories/storiesUpload");

		return mv;
	}
	
	// 스토리 업로드
	@RequestMapping(value = "/storiesUploadPro.ya")
	public ModelAndView storiesUploadPro(@RequestParam Map<String, Object> map, @RequestParam("videoInput") MultipartFile multipartFile) throws Exception {
		ModelAndView mv = new ModelAndView("/stories/storiesUpload");
		
		String extension = FilenameUtils.getExtension(multipartFile.getOriginalFilename()); // 확장자명
		String path = "/Users/jeongsuhong/git/Roomie/Roomie/Roomie/src/main/webapp/resources/files/stories/"; // 스토리 저장 절대 경로
		
		Date date = new Date(); // data 객체 생성
		SimpleDateFormat format = new SimpleDateFormat("yyyyMMddHHmmss"); // simpleDateFormat 객체 생성
		        
		String dateString = format.format(date).toString(); // date 타입 문자열로 리턴
		String fileName = dateString + String.valueOf((int)(Math.random() * 1000)) + "." + extension; // 파일명을 현재 날짜 + 랜덤숫자 생성

		if (extension.equals("mp4")) {
			File file = new File(path + fileName + multipartFile.getOriginalFilename()); // file 객체 생성
			multipartFile.transferTo(file); // 업로드한 원본 파일 저장
			
			double start = Double.parseDouble((String) map.get("start")); // 영상 시작 시간
			double end = Double.parseDouble((String) map.get("end")); // 영상 끝난 시간
			double duration = Double.parseDouble((String) map.get("duration")); // 영상 전체 시간
			
			FFmpeg ffmpeg = new FFmpeg("/Users/jeongsuhong/git/Roomie/Roomie/Roomie/src/main/resources/ffmpeg/bin/ffmpeg"); // ffmpeg 파일 절대 경로
			FFprobe ffprobe = new FFprobe("/Users/jeongsuhong/git/Roomie/Roomie/Roomie/src/main/resources/ffmpeg/bin/ffprobe"); // ffprobe 파일 절대 경로

			start = start * 0.01 * duration; // 영상 시작 시간
			end = end * 0.01 * duration; // 영상 끝난 시간
	
	        FFmpegBuilder builder = new FFmpegBuilder()
		        .overrideOutputFiles(true)
		        .addInput(path + fileName + multipartFile.getOriginalFilename()) // 입력 영상 경로
		        .addExtraArgs("-ss", String.valueOf(start)) // 영상 시작 부분
		        .addExtraArgs("-to", String.valueOf(end)) // 영상 끝난 부분
		        .addOutput(path + fileName) // 파일 저장
		        .done(); // 저장
	         
	        FFmpegExecutor excutor = new FFmpegExecutor(ffmpeg, ffprobe);
	        excutor.createJob(builder).run();
	        file.delete(); // 원본 파일 삭제
	        
	        map.put("STORY_IMAGE", fileName);
		} else {
			File file = new File(path + fileName); // file 객체 생성
			multipartFile.transferTo(file); // 업로드한 원본 파일 저장
			map.put("STORY_IMAGE", fileName);
		}

		storiesSerivce.insertStories(map);
		
		return mv;
	}
	
}
