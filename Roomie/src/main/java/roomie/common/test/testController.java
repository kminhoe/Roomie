package roomie.common.test;

import java.io.File;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;



@Controller
public class testController {

	@RequestMapping(value = "/test.ya")
	public ModelAndView updateForm(@RequestParam HashMap<String, Object> param, HttpServletRequest request) throws Exception {

		ModelAndView mv = new ModelAndView("test");

		
		return mv;

	}
	
	@PostMapping(value = "/test1.ya")
	public ModelAndView updateForm2(@RequestParam("camera") MultipartFile file ,HttpServletRequest request) throws Exception {

		ModelAndView mv = new ModelAndView("test");
		
		//System.out.println(param);
		
		MultipartFile profUploadFile = file;
		

		String path = request.getSession().getServletContext().getRealPath("resources/img/");
		
		System.out.println("寃쎈줈 二쇱냼1 : " + path);
		

		if (!profUploadFile.isEmpty()) {
			String logoFileName = profUploadFile.getOriginalFilename(); // ���옣�븷 濡쒓퀬 �씠誘몄� �뙆�씪紐�

			profUploadFile.transferTo(new File(path + logoFileName)); // �뾽濡쒕뱶�븳 �뙆�씪 ���옣
			
			System.out.println(">> 수정할게요 : " + logoFileName);
		}
		


		
		return mv;

	}

}
