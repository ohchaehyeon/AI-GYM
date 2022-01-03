package com.kt.motion.controller;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class WebcamViewController {
	
	/**
	 * @date : 2022.01.02
	 * @author : Cho jin seon
	 * @function : A controller that makes the webcam screen come out.
	 * @Method : webcamView
	 * @return : ModelAndView
	 */	
	@RequestMapping(value="/webcam")
	public ModelAndView webcamView(
			@RequestParam("item") String item,
			@RequestParam("inputCount") int inputCount,
			@RequestParam("data") String data) {
		ModelAndView mav = new ModelAndView("webcam");
		mav.addObject("item",item);
		mav.addObject("inputCount",inputCount);
		mav.addObject("data",data);
		return mav;
	}
}
