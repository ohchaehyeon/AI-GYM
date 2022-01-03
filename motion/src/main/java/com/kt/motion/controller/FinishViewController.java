package com.kt.motion.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class FinishViewController {

	/**
	 * @날짜 : 2022.01.02
	 * @작성자 : 조진선
	 * @기능 : 종료화면에 대한 컨트롤러 구현
	 * @Method : finishView
	 * @return : ModelAndView
	 */
	@RequestMapping("/finish")
	public ModelAndView finishView(
			@RequestParam("data") String data ) {
		
		ModelAndView mav = new ModelAndView("finish");
		System.out.println(data);
		mav.addObject("data", data);
		return mav;
	}
	
}
