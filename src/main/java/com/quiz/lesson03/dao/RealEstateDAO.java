package com.quiz.lesson03.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.quiz.lesson03.model.RealEstate;

@Repository
public interface RealEstateDAO {
	public RealEstate selectRealEstateById(@Param("id") int id);
	
	public List<RealEstate> selectRealEstateListByRentPrice(@Param("rentPrice") int rentPrice);
	
	public List<RealEstate> selectRealEstateListByAreaPrice(
			@Param("area") int area, 
			@Param("price") int price);
	// @Param 파라미터를 하나의 맵으로 만든다.
	// 변수가 하나면 쓸 필요가 없다
	
	public int insertRealEstate(RealEstate realEstate);
	
	public int insertRealEstateAsField(
			@Param("realtorId") int realtorId,
			@Param("address") String address,
			@Param("area") int area,
		 	@Param("type") String type,
		 	@Param("price") int price,
		 	@Param("rentPrice") int rentPrice);
	
	public int updateRealEstateById(
			@Param("id") int id, 
			@Param("type") String type, 
			@Param("price") int price);
	
	public int deleteRealEstateById(int id);

}