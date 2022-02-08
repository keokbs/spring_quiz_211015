package com.quiz.lesson06;

import java.util.List;

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
	
	// http://localhost/lesson06/add_book_mark_veiw
	@RequestMapping("/lesson06/add_book_mark_veiw")
	public String addBookMarkView() {
		return "lesson06/addBookMark";
	}
	
	@ResponseBody
	@GetMapping("/lesson06/add_book_mark")
	public String addBookMark(
			@RequestParam("name") String name,
			@RequestParam("url") String url
			) {
		
		// insert DB
		bookMarkBO.addBookMark(name, url);
		return "성공!";
	}
	
	@RequestMapping("/lesson06/book_mark_list_veiw")
	public String getBookMark(Model model) {
		// select DB
		List<BookMark> bookMark = bookMarkBO.getBookMark();
		model.addAttribute("bookMark", bookMark);
		
		return "lesson06/bookMarkListVeiw";
	}
}
