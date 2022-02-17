package com.quiz.lesson06;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.quiz.lesson06.bo.BookingBO;
import com.quiz.lesson06.model.Booking;

@Controller
public class BookingController {
	
	@Autowired
	private BookingBO bookingBO;
	
	// 예약 리스트 뷰
	// http:localhost/lesson06/booking_list_view
	@RequestMapping("/lesson06/booking_list_view")
	public String booking_list_view(
			Model model
			) {
		// DB에서 `booking` table 정보 가져오기
		List<Booking> booking = bookingBO.getBookingList();
		model.addAttribute("bookingList", booking);
		
		return "lesson06/booking_list_view";
	}
	
	// 예약 삭제 - ajax 호출
	@DeleteMapping("/lesson06/delete_booking")
	@ResponseBody
	public Map<String, String> delete_booking(
			@RequestParam int id) {
		
		int deleteCount = bookingBO.deleteBookingById(id);
		
		Map <String, String> result = new HashMap<>();
		result.put("result", "success");
		
		if (deleteCount < 1) {
			result.put("result", "fail");
		}
		
		return result;
	}
	
	// 예약하기 뷰
	// http:localhost/lesson06/add_booking_view
	@RequestMapping("/lesson06/add_booking_view")
	public String add_booking_view() {
		return "lesson06/add_booking_view";
	}
	
	// 예약 추가
	@PostMapping("/lesson06/add_booking")
	@ResponseBody
	public Map<String, String> add_booking(
			@RequestParam("name") String name,
			@RequestParam("date") String date,
			@RequestParam("day") int day,
			@RequestParam("headcount") int headcount,
			@RequestParam("phoneNumber") String phoneNumber
			) {
		
		int count = bookingBO.addBooking(name, date, day, headcount, phoneNumber);
		
		Map <String, String> result = new HashMap<>();
		result.put("result", "success");
		
		if (count < 1) {
			result.put("result", "fail");
		}
		
		return result;
	}
	
	
	// 예약확인 뷰
	// http:localhost/lesson06/add_booking_view
	@RequestMapping("/lesson06/search_booking_view")
	public String search_booking_view() {
		return "lesson06/search_booking_view";
	}
	
	// 예약 확인
	
	@PostMapping("/lesson06/search_booking")
	@ResponseBody
	public Map<String, Object> search_booking(
			@RequestParam("name") String name,
			@RequestParam("phoneNumber") String phoneNumber
			) {
		
		// DB select by name, phoneNumber
		Booking booking = bookingBO.getBookingByNameAndPhoneNumber(name, phoneNumber);
		
		// 결과 map => json
		Map<String, Object> result = new HashMap<>();
		if (booking != null) {
			// 성공 시
			// {"result":"success",
			// 	"code": 1, 
			//	"booking":{"name":"신보람", "phoneNumber":"010-2222-2222"}}
			result.put("result", "success");
			result.put("code", 1);
			result.put("booking", booking);
		} else {
		// 실패시
		// {"result": "fail", "code":500}
			result.put("result", "fail");
			result.put("code", 500);
		}
		
		return result;
	}
	
	
}
