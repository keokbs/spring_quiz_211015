package com.quiz.lesson05;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.quiz.lesson05.bo.WeatherHistoryBO;
import com.quiz.lesson05.model.WeatherHistory;
@RequestMapping("/lesson05/quiz05")
@Controller
public class Lesson05Quiz05Controller {
	
	@Autowired
	private WeatherHistoryBO weatherHistoryBO;
	
	// request -> response 
	// 식당에서 음식을 주문하면(get request) -> 식당(서버) -> 음식(response)
	// 식당의 음식을 써서 주문 -> 사장님께 넘김(post request) -> 식당(서버) -> 음식(response)
	
	
	// 날씨 정보 목록 페이지
	// http:/localhost/lesson05/quiz05/weather_history_view
	@RequestMapping("/weather_history_view")
	public String weatherHistoryView(Model model) {
		// BO로 담아오기
		List<WeatherHistory> weatherHistory = weatherHistoryBO.getWeatherHistoryList();
		
		// model 객체에 담기
		model.addAttribute("weatherHistory", weatherHistory);
		
		// view 페이지로 보내기
		return "lesson05/quiz05/template";
	}
	
	// 날씨 입력 페이지
	@RequestMapping("/input_weather")
	public String inputWeatherHistoryView() {
		return "lesson05/quiz05/inputWeather";
	}
	
	
	@PostMapping("/add_weather")
	public String addWeatherHistoryView(
			@RequestParam("date") String date,
			@RequestParam("weather") String weather,
			@RequestParam("microDust") String microDust,
			@RequestParam("temperatures") double temperatures,
			@RequestParam("precipitation") double precipitation,
			@RequestParam("windSpeed") double windSpeed,
			HttpServletResponse response
			) {
		// inputWeather 에서 얻은 데이터를 db에 담음
		weatherHistoryBO.addWeaterHistoryDAO(date, weather, microDust, temperatures, precipitation, windSpeed);
		
		// return response.sendRedirect("/weather_history_view");
		return "redirect:/lesson05/quiz05/weather_history_view";
	}
	
	
}
