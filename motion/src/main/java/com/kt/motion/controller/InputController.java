package com.kt.motion.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class InputController {

	/**
	 * @��¥ : 2022.01.03
	 * @�ۼ��� : ������
	 * @��� : ��������� �Ƚ�� �Է°� ���� ��Ʈ�ѷ� ����
	 * @Method : InputView
	 * @return : ModelAndView
	 */	
	@RequestMapping(value="/input")
	public ModelAndView InputView(
			@RequestParam("item") String item,
			@RequestParam("data") String data) {
		ModelAndView mav = new ModelAndView("input");
		mav.addObject("item",item);
		mav.addObject("data",data);
		return mav;
	}
}
