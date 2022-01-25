package com.quiz.lesson04;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.quiz.lesson04.bo.SellerBO;
import com.quiz.lesson04.model.Seller;

@Controller
@RequestMapping("/lesson04/quiz01")
public class SellerController {
	
	@Autowired
	private SellerBO sellerBO;
	
	// http://localhost/lesson04/quiz01/1
	@RequestMapping(path = "/1", method = RequestMethod.GET)
	public String addSellerView() {
		// 판매자를 등록하는 페이지 view
		return "lesson04/addSeller";
	}
	
	// http://localhost/lesson04/quiz01/add_seller
	@PostMapping("/add_seller")
	public String addSeller(
			// 입력받은 정보
			@RequestParam("nickname") String nickname,
			@RequestParam(value ="profileImageUrl", required = false) String profileImageUrl,
			@RequestParam(value ="temperature") double temperature
			) {
		// DB에 insert
		sellerBO.addSeller(nickname, profileImageUrl, temperature);
		// 입력 확인용 출력 view
		return "lesson04/afterAddSeller";
	}
	
	// http://localhost/lesson04/quiz01/seller_info
	// http://localhost/lesson04/quiz01/seller_info?id=1
	@GetMapping("/seller_info")
	public String Seller(Model model, 
			@RequestParam(value = "id", required = false) Integer id
			) {
		Seller seller = null;
		if (id == null) {
			seller = sellerBO.getLsatSeller();			
			model.addAttribute("result", seller);
		} else {
			seller = sellerBO.getSellerById(id);
			model.addAttribute("result", seller);
		}
		return "lesson04/getLastSeller";
	}
	
}
