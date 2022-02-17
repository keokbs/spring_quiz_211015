<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>즐겨 찾기 목록</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

</head>
<body>
	<div class="container">
		<h1 class="mt-3"><b>즐겨 찾기 목록</b></h1>
		<table class="table mt-3">
			<thead>
				<tr>
					<th class="col-1">No.</th>
					<th class="col-3">이름</th>
					<th class="col-8">주소</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="bookMark" items="${bookMark}" varStatus="status">
					<tr>
						<td>${bookMark.id}</td>
						<td>${bookMark.name}</td>
						<td>${bookMark.url}</td>
						<td>
							<%-- 1) name 속성과 value 속성을 이용해서 삭제버튼 감지 --%>
							<%-- <button type="button" name="delBtn" class="btn btn-danger" value="${bookMark.id}">삭제</button> --%>
							
							<%-- 2) data를 이용해서 태그에 임시 저장해놓기 --%>
							<%-- data-변수명 : 변수명은 카멜케이스는 인식을 못함으로 하이픈(-)으로 연결해 주어야함 --%>
							<button type="button" class="del-btn btn btn-danger" data-book-mark-id="${bookMark.id}">삭제</button>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
<script>
$(document).ready(function() {
	// alert("ok?");
	
	// 1) name 속성과 value 속성을 이용해서 삭제버튼 감지
	/* $('td').on('click', 'button[name=delBtn]', function(e) { // 파라미터 하나 더 추가
		
		// let id = $(this).attr('value');
		// let id = e.target.value;
		
	}); */
	
	// 2) data를 이용해서 태그에 임시 저장해놓기
	// 자바스크립트 : $(this).data('book-mark-id');
	$('.del-btn').on('click', function(e) {
		let id = $(this).data('book-mark-id');
 		$.ajax({
			type: "post"
			, data: {"id" : id}
			, url: "/lesson06/delete_bookMark"
			, success: function(data) {
				alert(data.result);
				if (data.result == 'success'){
					// 새로고침
					location.reload();
				} else {
					alert("삭제 하는데 실패했습니다. 관리자에게 문의해주세요");
				}
			}
			, error: function(e) {
				alert("error" + e);
			}
		}); 
	});
	
});

		
</script>

</html>