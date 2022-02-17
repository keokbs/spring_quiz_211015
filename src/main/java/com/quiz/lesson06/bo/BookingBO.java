package com.quiz.lesson06.bo;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import com.quiz.lesson06.dao.BookingDAO;
import com.quiz.lesson06.model.Booking;

@Service
public class BookingBO {
	
	@Autowired
	private BookingDAO bookingDAO;
	
	public List<Booking> getBookingList(){
		return bookingDAO.selectBookingList();
	}
	
	public int deleteBookingById(int id) {
		return bookingDAO.deleteBookingById(id);
	}
	
	public int addBooking(String name, String date, int day, int headcount, String phoneNumber) {
		return bookingDAO.insertBooking(name, date, day, headcount, phoneNumber);
	}
	
	public Booking getBookingByNameAndPhoneNumber(String name, String phoneNumber) {
		List<Booking> bookingList = bookingDAO.selectBookingByNameAndPhoneNumber(name, phoneNumber);
		
		Booking booking = null;
		
		// 첫번째꺼 하나만 꺼내기 bookingList.get(0);
		// 마지막꺼 하나만 꺼내기 
		if (bookingList.isEmpty() == false) { // 데이터가 있을때
			booking = bookingList.get(bookingList.size()-1); // 마지막 것만 채운다.
		}
		
		return booking;
	}

}
