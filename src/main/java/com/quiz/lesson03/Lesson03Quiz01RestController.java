package com.quiz.lesson03;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.quiz.lesson03.bo.RealEstateBO;
import com.quiz.lesson03.model.RealEstate;

@RestController
public class Lesson03Quiz01RestController {
	@Autowired
	private RealEstateBO realEstateBO;
	
	// http://localhost/lesson03/quiz01/1?id=20
	@RequestMapping("/lesson03/quiz01/1")
	public RealEstate quiz01_1(
			@RequestParam(value = "id") int idParam) { // 필수 파라미터
		return realEstateBO.getRealEstateById(idParam); // jackson 라이브러리로 인해 json으로 변환
	}
	
	// http://localhost/lesson03/quiz01/2?rent_price=90
	@RequestMapping("/lesson03/quiz01/2")
	public List<RealEstate> quiz01_2(
			@RequestParam(value = "rent_price") Integer rentPriceParam) {
		return realEstateBO.getRealEstateListBYRentPrice(rentPriceParam);
	}
	
	// http://localhost/lesson03/quiz01/3?area=90&price=130000
	@RequestMapping("/lesson03/quiz01/3")
	public List<RealEstate> quiz01_3(
			@RequestParam(value = "area", required = true) int area, @RequestParam(value = "price", required = true) int priceParam) {
		return realEstateBO.getRealEstateListByAreaPrice(area, priceParam);
	}
	
}























