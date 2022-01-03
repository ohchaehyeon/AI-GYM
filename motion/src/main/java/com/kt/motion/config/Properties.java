package com.kt.motion.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

@Service
public class Properties {
	/**
	 * @날짜 : 2022.01.02
	 * @작성자 : 조진선
	 * @기능 : 설정파일 세팅
	 */
	@Value("${model.upload.path}")
	String modelPath;
	
	@Value("${model.upload.fileName}")
	String modelName;

	@Value("${cors.url}")
	String corsUrl;

	public String getModelPath() {
		return modelPath;
	}

	public String getModelName() {
		return modelName;
	}

	public String getCorsUrl() {
		return corsUrl;
	}
	
}
