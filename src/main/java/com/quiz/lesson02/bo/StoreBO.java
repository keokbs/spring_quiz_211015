package com.quiz.lesson02.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quiz.lesson02.dao.StoreDAO;
import com.quiz.lesson02.model.Store;
import com.quiz.lesson05.model.NewReview;

@Service
public class StoreBO {
	@Autowired
	private StoreDAO storeDAO;
	
	public List<Store> getStoreList() {
		return storeDAO.selectStoreList();
	}
	
	public int getStoreIdByName(String name) {
		return storeDAO.getStoreIdByName(name);
	}
	
	public NewReview getNewReviewByStoreId(int storeId){
		return storeDAO.getNewReviewByStoreId(storeId);
	}
}