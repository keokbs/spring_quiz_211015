package com.quiz.lesson01;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@RequestMapping("/lesson01/quiz01") // 공통되는 것을 클래스 위쪽으로 뺀다.
@Controller
public class Quiz01Controller {
	// http://localhost:80/lesson01/quiz01/1
	@RequestMapping("/1")	// 달라지는 주소만 쓰면 된다.
	@ResponseBody
	public String quiz01_1() {
		
		return "<h1>테스트 프로젝트 완성</h1><h3>해당 프로젝트를 통해서 문제를 진행합니다.</h3>";
	}
	
	
	// http://localhost:80/lesson01/quiz01/2
	@RequestMapping("/2")
	@ResponseBody
	public Map<String, Integer> quiz02_2() {
		Map<String, Integer> result = new HashMap<>();
		result.put("국어", 80);
		result.put("수학", 90);
		result.put("영어", 85);
		return result;
	}
}
