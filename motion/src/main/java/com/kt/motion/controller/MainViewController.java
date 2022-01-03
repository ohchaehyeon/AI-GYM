package com.kt.motion.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kt.motion.vo.ExerciseVo;

@Controller
public class MainViewController {

	/**
	 * @날짜 : 2022.01.02
	 * @작성자 : 조진선
	 * @기능 : main화면에 대한 컨트롤러 구현
	 * @Method : mainView()
	 * @return : ModelAndView
	 */	
	@RequestMapping("/main")
	public ModelAndView mainView() {
		ExerciseVo data = new ExerciseVo();
		ModelAndView mav = new ModelAndView("main");
		mav.addObject("data", data.toString());
		return mav;
	}
	
	/**
	 * @날짜 : 2022.01.02
	 * @작성자 : 조진선
	 * @기능 : 웹캠화면에서 뒤로가기 버튼을 눌렀을때에 대한 컨트롤러 구현
	 * @Method : backMainView
	 * @return : ModelAndView
	 */	
	@RequestMapping("/mainBack")
	public ModelAndView bacKMainView(
			@RequestParam("data") String data ) {
		 
		ModelAndView mav = new ModelAndView("main");
		mav.addObject("data", data);
		return mav;
	}
}
