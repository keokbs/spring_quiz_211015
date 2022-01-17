package com.quiz.lesson01;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RequestMapping("/lesson01/quiz02")
@RestController
public class Quiz02RestController {
	
	// http://localhost/lesson01/quiz02/1
	@RequestMapping("/1")
	public List<Map<String, Object>> quiz02_1() {
		List<Map<String, Object>> result = new ArrayList<>();
		Map map = new HashMap<>();
		map.put("rete", 15);
		map.put("director", "봉준호");
		map.put("time", 131);
		map.put("title", "기생충");
		result.add(map);
		
		map = new HashMap<>();
		map.put("rete", 0);
		map.put("director", "로베르토 베니니");
		map.put("time", 116);
		map.put("title", "인생은 아름다워");
		result.add(map);
		
		map = new HashMap<>();
		map.put("rete", 12);
		map.put("director", "크리스토퍼 놀란");
		map.put("time", 147);
		map.put("title", "인셉션");
		result.add(map);
		
		map = new HashMap<>();
		map.put("rete", 19);
		map.put("director", "윤종빈");
		map.put("time", 133);
		map.put("title", "범죄와의 전쟁 : 나쁜놈들 전성시대");
		result.add(map);
		
		map = new HashMap<>();
		map.put("rete", 15);
		map.put("director", "프란시스 로렌스");
		map.put("time", 137);
		map.put("title", "헝거게임");
		result.add(map);
		
		return result;
	}
	
	// http://localhost/lesson01/quiz02/2
	@RequestMapping("/2")
	public List<Board> quiz02_2() {
		List<Board> resultList = new ArrayList<>();
		
		Board board = new Board();
		board.setTitle("ㅎ2");
		board.setUser("바바");
		board.setContnet("나는 바바야");
		resultList.add(board);
		
		board = new Board();
		board.setTitle("안녕하세요");
		board.setUser("케케");
		board.setContnet("바바 친구 케케입니다.");
		resultList.add(board);
		
		board = new Board();
		board.setTitle("날씨가 좋지요?");
		board.setUser("러브");
		board.setContnet("우산들 다 가져오셨나요?");
		resultList.add(board);
		
		return resultList;
	}
	
	// http://localhost/lesson01/quiz02/2
	@RequestMapping("/3")
	public ResponseEntity<Board> quiz02_3() {
		Board board = new Board();
		board.setTitle("ㅎ2");
		board.setUser("바바");
		board.setContnet("나는 바바야");
		
		return new ResponseEntity<>(board, HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
}
