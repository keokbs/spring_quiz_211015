package com.quiz.lesson05;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.quiz.lesson05.bo.WeatherhistoryBO;
import com.quiz.lesson05.model.Member;
import com.quiz.lesson05.model.Weatherhistory;
@RequestMapping("/lesson05/quiz05")
@Controller
public class Lesson05Quiz05Controller {
	
	@Autowired
	private WeatherhistoryBO weatherhistoryBO;
	
	// http:/localhost/lesson05/quiz05/1
	@RequestMapping("/1")
	public String quiz05_1(Model model) {
		// BO로 담아오기
		
		List<Weatherhistory> weatherhistory = new ArrayList<>();
		weatherhistory = weatherhistoryBO.getWeatherhistoryList();
		// model 객체에 담기
		
		model.addAttribute("weatherhistory", weatherhistory);
		// view 페이지로 보내기
		
		return "lesson05/quiz05/template";
	}
	
	@RequestMapping("/input_weather")
	public String quiz05_2() {
		return "lesson05/quiz05/inputWeather";
	}
	
	
	@GetMapping("/add_weather")
	public String quiz05_3(
			@ModelAttribute Weatherhistory weatherhistory
			) {
		// inputWeather 에서 얻은 데이터를 담음
		weatherhistoryBO.addWeaterhistoryDAO();
		
		return "lesson05/quiz05/template";
	}
	
	
}
