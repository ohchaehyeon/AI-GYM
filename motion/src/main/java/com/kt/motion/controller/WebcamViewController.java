package com.kt.motion.controller;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class WebcamViewController {
	
	/**
	 * @��¥ : 2022.01.02
	 * @�ۼ��� : ������
	 * @��� : webcam ȭ�� ������ �ϴ� ��Ʈ�ѷ� ����
	 * @Method : webcamView
	 * @return : ModelAndView
	 */	
	@RequestMapping(value="/webcam")
	public ModelAndView webcamView(
			@RequestParam("item") String item,
			@RequestParam("data") String data) {
		ModelAndView mav = new ModelAndView("webcam");
		mav.addObject("item",item);
		mav.addObject("data",data);
		return mav;
	}
}
