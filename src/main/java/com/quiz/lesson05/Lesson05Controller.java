package com.quiz.lesson05;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Lesson05Controller {
	
	// http://localhost/lesson05/quiz01
	@RequestMapping("/lesson05/quiz01")
	public String quiz01() {
		return "lesson05/quiz01";
	}
	
	// http://localhost/lesson05/quiz02
		@RequestMapping("/lesson05/quiz02")
		public String quiz02(Model model) {
			List<String> musicRanking = new ArrayList<>();
			musicRanking.add("강남스타일");
			musicRanking.add("벚꽃엔딩");
			musicRanking.add("좋은날");
			musicRanking.add("거짓말");
			musicRanking.add("보고싶다");
			
			List<Map<String, Object>> membership = new ArrayList<>();
			
			Map<String, Object> member = new HashMap<>();
			member.put("name", "손오공");
			member.put("phoneNumber", "010-1234-5678");
			member.put("grade", "VIP");
			member.put("point", 12040);
			membership.add(member);
			
			member = new HashMap<>();
			member.put("name", "저팔계");
			member.put("phoneNumber", "010-4321-1234");
			member.put("grade", "BASIC");
			member.put("point", 3420);
			membership.add(member);
			
			member = new HashMap<>();
			member.put("name", "사오정");
			member.put("phoneNumber", "010-8888-1111");
			member.put("grade", "GOLD");
			member.put("point", 1530);
			membership.add(member);
			
			member = new HashMap<>();
			member.put("name", "삼장");
			member.put("phoneNumber", "010-0000-1234");
			member.put("grade", "GOLD");
			member.put("point", 8450);
			membership.add(member);
			
			member = new HashMap<>();
			member.put("name", "우마왕");
			member.put("phoneNumber", "010-1111-2222");
			member.put("grade", "BASIC");
			member.put("point", 420);
			membership.add(member);
			
			model.addAttribute("music", musicRanking);
			model.addAttribute("member", membership);
			
			return "lesson05/quiz02";
		}
		
		// http://localhost/lesson05/quiz03
		@RequestMapping("/lesson05/quiz03")
		public String quiz03(Model model) {
			
			// 3-1
			List<Integer> candidates = new ArrayList<>();
			candidates.add(263001);
			candidates.add(173942); 
			candidates.add(563057);
			
			// 총 투표수를 구한다 -> Controller보단 BO에서 처리하면 좋다. 
			int totalCount = 0;
			for (Integer candidate : candidates) {
				totalCount += candidate;
			}
			
			// 3-2
			List<Map<String, Object>> cardBills = new ArrayList<>();

			Map<String, Object> cardBill = new HashMap<>();
			cardBill.put("store", "GS48");
			cardBill.put("pay", 7800);
			cardBill.put("date", "2025-09-14");
			cardBill.put("installment", "일시불");
			cardBills.add(cardBill);

			cardBill = new HashMap<>();
			cardBill.put("store", "현태백화점");
			cardBill.put("pay", 2750000);
			cardBill.put("date", "2025-09-18");
			cardBill.put("installment", "3개월");
			cardBills.add(cardBill);

			cardBill = new HashMap<>();
			cardBill.put("store", "요촌치킨");
			cardBill.put("pay", 180000);
			cardBill.put("date", "2025-09-20");
			cardBill.put("installment", "일시불");
			cardBills.add(cardBill);
			
			model.addAttribute("totalCount", totalCount);
			model.addAttribute("candidates", candidates);
			model.addAttribute("cardBills", cardBills);
			
			return "lesson05/quiz03";
		}
	
	
}
