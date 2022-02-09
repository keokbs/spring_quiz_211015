package com.quiz.lesson06;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.quiz.lesson06.bo.BookMarkBO;
import com.quiz.lesson06.model.BookMark;

@Controller
public class BookMarkController {
	
	@Autowired
	private BookMarkBO bookMarkBO;
	
	// 즐겨찾기 추가 화면
	// http://localhost/lesson06/add_book_mark_veiw
	@RequestMapping("/lesson06/add_book_mark_veiw")
	public String addBookMarkView() {
		return "lesson06/addBookMark";
	}
	
	// 즐겨찾기 추가 기능 - AJAX 호출로 들어오는 요청
	@ResponseBody
	@GetMapping("/lesson06/add_book_mark")
	public Map<String, String> addBookMark(
			@RequestParam("name") String name,
			@RequestParam("url") String url
			) {
		
		// insert DB
		bookMarkBO.addBookMark(name, url);
		
		// return Map 할때 - *** ajax통신 성공 확인하기.
		Map<String, String> result = new HashMap<>();
		result.put("result", "success");
		result.put("code", "1");
		// {"result":"success", "code":1}
		
		return result;
	}
	
	@RequestMapping("/lesson06/book_mark_list_veiw")
	public String getBookMark(Model model) {
		// select DB
		List<BookMark> bookMark = bookMarkBO.getBookMark();
		model.addAttribute("bookMark", bookMark);
		
		return "lesson06/bookMarkListVeiw";
	}
	
	
	
}
