package com.quiz.lesson06.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.quiz.lesson06.model.BookMark;

@Repository
public interface BookMarkDAO {
	
	public void insertBookMark(
			@Param("name") String name,
			@Param("url") String url
			);
	
	public List<BookMark> selectBookMark();
	
	public BookMark selectBookMarkByUrl(String url);
	
	public int deleteBookMarkByid(int id);
	
}
