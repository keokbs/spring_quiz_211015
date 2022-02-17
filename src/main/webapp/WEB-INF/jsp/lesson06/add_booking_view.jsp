<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>통나무 팬션</title>
<link rel="stylesheet" type="text/css" href="/css/booking_style.css">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</head>
<body>
	<div class="container">
		<div id="wrap">
			<jsp:include page="bookingHeader.jsp"/>
			<jsp:include page="bookingMenu.jsp"/>
			
			<section>
				<h1 class="font-weight-bold text-center pt-3 mb-4">예약하기</h1>
				<div class="d-flex justify-content-center">
					<div class="w-50">
						<div class="form-group">
							<div class="mb-2 font-weight-bold">이름</div>
							<input type="text" name="name" class="form-control">
						</div>
						<div class="form-group">
							<div class="mb-2 font-weight-bold"">예약날짜</div>
							<input type="text"  name="date" id="date" class="form-control">
						</div>
						<div class="form-group">
							<div class="mb-2 font-weight-bold"">숙박일수</div>
							<input type="text" name="day" class="form-control">
						</div>
						<div class="form-group">
							<div class="mb-2 font-weight-bold"">숙박인원</div>
							<input type="text" name="headcount" class="form-control">
						</div>
						<div class="form-group">
							<div class="mb-2 font-weight-bold"">전화번호</div>
							<input type="text" name="phoneNumber" class="form-control">
						</div>
						<button type="button" class="addBtn btn btn-warning mb-4 w-100">예약하기</button>
		
					</div>
				</div>
			</section>
			
			<jsp:include page="bookingFooter.jsp"/>
		</div>
	</div>
	
<script>
$(document).ready(function() {
	$('input[name=date]').datepicker({
		 minDate: 0
		 , dateFormat: 'yy-mm-dd'
	});
	
	$('.addBtn').on('click', function() {
		let name = $('input[name=name]').val().trim();
		let date = $('input[name=date]').val();
		let day = $('input[name=day]').val().trim();
		let headcount = $('input[name=headcount]').val().trim();
		let phoneNumber = $('input[name=phoneNumber]').val().trim();
		
		// validation
		if (name == '') {
			alert("이름을 입력하세요.");
			return;
		}
		if (date == '') {
			alert("날짜를 선택하세요.");
			return;
		}
		if (day == '') {
			alert("숙박일을 입력하세요.");
			return;
		}
		
		if (isNaN(day)) { // 숫자가 아닌경우
			alert("숙박일은 숫자만 입력 가능합니다.");
			return;
		}
		
		if (headcount == '') {
			alert("숙박인원을 입력하세요");
			return;
		}
			
		if (isNaN(headcount)) { // 숫자가 아닌경우
			alert("숙박인원은 숫자만 입력 가능합니다.");
			return;
		}
		
		if (phoneNumber == '') {
			alert("전화번호를 입력하세요");
			return;
		}
		
		$.ajax({
			type: "Post"
			, url: "/lesson06/add_booking"
			, data: {"name": name, "date": date, "day": day, "headcount": headcount, "phoneNumber": phoneNumber}
			, success: function(data) {
				let result = data.result;
				if (result == 'success') {
					alert("예약 되었습니다.");
					location.href = "/lesson06/booking_list_view";
				}
				if (result == 'fail') {
					alert("다시 예약해 주세요.");
				}
			}
			, error: function(e) {
				alert("error");
			}
		});
		
	});
	
});
</script>

</body>
</html>