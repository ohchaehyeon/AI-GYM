package com.kt.motion.controller;

import java.io.FileReader;
import java.io.Reader;
import java.util.HashMap;
import java.util.Map;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.kt.motion.config.Properties;

@RestController
@RequestMapping("/model")
public class ModelController {
	
	@Autowired
	Properties properties;
	
	/**
	 * @날짜 : 2022.01.02
	 * @작성자 : 조진선
	 * @기능 : 모델 로드 컨트롤러 구현
	 * @Method : loadModel
	 * @return : result
	 */
	@RequestMapping("/load")
	public Map loadModel() {
		Map result = new HashMap<String, Object>();
		try {
			JSONParser parser = new JSONParser();
			Reader reader = new FileReader(properties.getModelPath()+"/"+properties.getModelName()+".json");
			JSONObject jsonObject = (JSONObject) parser.parse(reader);
			
			result = convertJSONstringToMap(jsonObject.toString());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
	
	public static Map<String,Object> convertJSONstringToMap(String json) throws Exception {
        ObjectMapper mapper = new ObjectMapper();
        Map<String, Object> map = new HashMap<String, Object>();
        
        map = mapper.readValue(json, new TypeReference<Map<String, Object>>() {});
        
        return map;
    }	
}