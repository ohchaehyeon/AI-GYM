package com.kt.motion.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfig implements WebMvcConfigurer {

	/**
	 * @날짜 : 2022.01.02
	 * @작성자 : 조진선
	 * @기능 : cors처리 구현
	 */
	@Autowired
	Properties properties;
	
	@Override
	public void addCorsMappings(CorsRegistry registry) {
		registry.addMapping("/**").allowedOrigins(properties.getCorsUrl());
	}
}