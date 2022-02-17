package com.quiz.lesson05;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.quiz.lesson02.bo.StoreBO;
import com.quiz.lesson02.model.Store;
import com.quiz.lesson05.model.NewReview;

@RequestMapping("/lesson05")
@Controller
public class StoreController {
	
	@Autowired
	private StoreBO storeBO;
	
	// http://localhost/lesson05/store_list_view
	@RequestMapping("/store_list_view")
	public String storeListView(Model model) {
		
		List<Store> store = storeBO.getStoreList();
		
		model.addAttribute("store", store);
		
		return "lesson05/quiz06/store_list_view";
	}
	
	@GetMapping("/store_review")
	public String storeReview(
			@RequestParam("name") String name,
			Model model) {
		int storeId = storeBO.getStoreIdByName(name);
		NewReview review = storeBO.getNewReviewByStoreId(storeId);
		model.addAttribute("name", name);
		model.addAttribute("review", review);
		
		return "lesson05/quiz06/store_review";
	}
	
	
	
}
