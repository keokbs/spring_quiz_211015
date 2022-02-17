<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
</head>
<body>
	<div class="container">
		<div id="wrap">
			<jsp:include page="bookingHeader.jsp"/>
			<jsp:include page="bookingMenu.jsp"/>
			
		<%-- section --%>
			<section>
				<div>
					<img src="/images/test06_banner1.jpg" id="bannerImage" alt="배너" class="w-100">
				</div>
				<div class="d-flex contents1">
					<div class="col-4 d-flex justify-content-center align-items-center bg-color1">
						<div class="text-color-white display-4">실시간<br>예약하기</div>
					</div>
					<div class="col-4 bg-color2">
						<div class="text-color-white mt-3 font-size1 ml-3">예약 확인</div>
						<div>
							<div class="d-flex justify-content-end mt-2">
								<span class="text-color-white">이름 :</span>
								<input type="text" id="name" name="name" class="form-control col-8 ml-3">
							</div>
							<div class="d-flex justify-content-end mt-2">
								<span class="text-color-white">전화번호 :</span>
								<input type="text" id="phoneNumber" name="phoneNumber" class="form-control col-8 ml-3">
							</div>
						</div>
						<div class="d-flex justify-content-end mt-3">
								<button type="button" class="btn btn-success" id="lookUpBtn">조회하기</button>
						</div>
					</div>
					<div class="col-4 d-flex justify-content-center align-items-center bg-color1">
						<div class="text-color-white font-size2 font-weight-bold">예약문의:<br>010-<br>0000-1111</div>
					</div>

				</div>
			</section>
			<jsp:include page="bookingFooter.jsp"/>
			
		</div>
	</div>
<script>
$(document).ready(function() {
	
	var bannerSrcArr = ['/images/test06_banner1.jpg', '/images/test06_banner2.jpg', '/images/test06_banner3.jpg', '/images/test06_banner4.jpg'];
    var currentIndex = 0;
    setInterval(function() {
        $('#bannerImage').attr('src', bannerSrcArr[currentIndex]);
        currentIndex++;

        if (currentIndex > bannerSrcArr.length) { // 인덱스 값이 배열의 크기를 넘으면 0으로(처음 이미지) 세팅
            currentIndex = 0;
        }
    }, 3000);  // 3초에 한번씩 함수 실행
	
    
    // 조회하기 버튼 클릭 이벤트
	$('#lookUpBtn').on('click', function() {
		
		let name = $('input[name=name]').val().trim();
		let phoneNumber = $('input[name=phoneNumber]').val();
		
		if (name == '') {
			alert("이름을 입력하세요.");
			return;
		}
		
		if (phoneNumber == '') {
			alert("전화번호를 입력하세요");
			return;
		}
		
		if (phoneNumber.startsWith("010") == false) {
			alert("010으로 시작하는 번호만 입력할 수 있습니다.");
			return;
		}
		
		$.ajax({
			type: 'post'
			, url: '/lesson06/search_booking'
			, data: {'name': name, 'phoneNumber': phoneNumber}
			, success : function(data) {
				// {"result":"success",
				// 	"code": 1, 
				//	"booking":{"name":"신보람", "phoneNumber":"010-2222-2222"}}
				if (data.code == 1) {
					// 성공
					let booking = data.booking;
					
					// 2022-02-15 0, 10
					let massage = "이름: " + booking.name + "\n날짜: " + booking.date.slice(0, 10) + "\n일수: " + booking.day +
					"\n인원: " + booking.headcount + "\n상태: " + booking.state;
					alert(massage);
				}
				else {
					alert("예약 내역이 없습니다.");
				}
			}
			, error: function(e) {
				alert("서버 통신 실패");
			}
		});
	});
	
});

</script>
	
</body>
</html>