package com.kt.motion.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainViewController {

	@RequestMapping("/main")
	public String mainView() {
		return "/main.html";
	}
	
}
