package com.kt.motion.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

@Service
public class Properties {
	
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
