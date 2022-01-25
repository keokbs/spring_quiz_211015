package com.quiz.lesson04;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.quiz.lesson04.bo.RealtorBO;
import com.quiz.lesson04.model.Realtor;

@Controller
public class RealtorController {
	
	@Autowired
	private RealtorBO realtorBO;
	
	// http://localhost/lesson04/quiz02/1
	@GetMapping("/lesson04/quiz02/1")
	public String quiz02_1() {
		return "lesson04/addRealtor";
	}
	
	@PostMapping("/lesson04/quiz02/add_realtor")
	public String addRealtor(
			@ModelAttribute Realtor realtor,
			Model model) {
		realtorBO.addRealtor(realtor);
		// insert DB
		Realtor result = realtorBO.getRealtorById(realtor.getId());
		 model.addAttribute("result", result);
		return "lesson04/afterAddRealtor";
	}
	
	
}
