package com.kt.motion.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class WebcamViewController {
	
	@RequestMapping("/webcam")
	public String webcamView() {
		return "/webcam.html";
	}
}
