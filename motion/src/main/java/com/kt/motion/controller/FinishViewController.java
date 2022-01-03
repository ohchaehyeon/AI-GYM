package com.kt.motion.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class FinishViewController {

	/**
	 * @��¥ : 2022.01.02
	 * @�ۼ��� : ������
	 * @��� : ����ȭ�鿡 ���� ��Ʈ�ѷ� ����
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
