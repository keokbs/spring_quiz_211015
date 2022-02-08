package com.quiz.lesson06.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quiz.lesson06.dao.BookMarkDAO;
import com.quiz.lesson06.model.BookMark;

@Service
public class BookMarkBO {
	
	@Autowired
	private BookMarkDAO bookMarkDAO;
	
	public void addBookMark(String name, String url) {
		bookMarkDAO.insertBookMark(name, url);
	}
	
	public List<BookMark> getBookMark() {
		return bookMarkDAO.selectBookMark();
	}
}
