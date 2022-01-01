package com.kt.motion.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class FinishViewController {

	@RequestMapping("/finish")
	public String finishView() {
		return "/finish.html";
	}
	
}
