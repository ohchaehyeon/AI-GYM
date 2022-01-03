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
	 * @��¥ : 2022.01.02
	 * @�ۼ��� : ������
	 * @��� : mainȭ�鿡 ���� ��Ʈ�ѷ� ����
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
	 * @��¥ : 2022.01.02
	 * @�ۼ��� : ������
	 * @��� : ��ķȭ�鿡�� �ڷΰ��� ��ư�� ���������� ���� ��Ʈ�ѷ� ����
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
