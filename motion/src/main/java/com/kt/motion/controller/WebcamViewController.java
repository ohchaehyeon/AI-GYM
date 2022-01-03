package com.kt.motion.controller;

import java.util.HashMap;
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
	/**
	 * @date : 2022.01.03
	 * @author : Oh Chae Hyeon
	 * @function : add gif image
	 */
	@RequestMapping(value="/webcam")
	public ModelAndView webcamView(
			@RequestParam("item") String item,
			@RequestParam("data") String data) {
		ModelAndView mav = new ModelAndView("webcam");
		mav.addObject("item",item);
		mav.addObject("data",data);

		Map<String, String> map = new HashMap<String, String>() {{
			put("pushup", "https://s10.gifyu.com/images/pushup_move.gif");
			put("squat", "https://s10.gifyu.com/images/squat_move.gif");
			put("steam", "https://s10.gifyu.com/images/steamengine_move.gif");
			put("lunge", "https://s10.gifyu.com/images/lunge_move-1.gif");
		}};

		mav.addObject("gif", map.get(item));
		return mav;
	}
}
