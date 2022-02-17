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

</head>
<body>
	<div class="container">
		<div id="wrap">
			<jsp:include page="bookingHeader.jsp"/>
			<jsp:include page="bookingMenu.jsp"/>
			
		<%-- section --%>
			<section>
				<h1 class="font-weight-bold text-center pt-3 mb-4">예약 목록 보기</h1>
				<table class="table mt-3 text-center">
					<thead>
						<tr>
							<th>이름</th>
							<th>예약날짜</th>
							<th>숙박일수</th>
							<th>숙박인원</th>
							<th>전화번호</th>
							<th>예약상태</th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${bookingList}" var="item">
							<tr>
								<td>${item.name}</td>
								<td>
									<fmt:formatDate var="date" value="${item.date}" pattern="yyyy년 MM월 dd일"/>
									${date}
								</td>
								<td>${item.day}</td>
								<td>${item.headcount}</td>
								<td>${item.phoneNumber}</td>
								<td>
									<c:choose>
										<c:when test="${item.state == '확정'}">
											<span class="text-success">${item.state}</span>
										</c:when>
										<c:when test="${item.state == '대기중'}">
											<span class="text-info">${item.state}</span>
										</c:when>
										<c:when test="${item.state == '취소'}">
											<span class="text-danger">${item.state}</span>
										</c:when>
									</c:choose>
								</td>
								<td>
									<button type="button" class="del-btn btn btn-danger" data-booking-id="${item.id}">삭제</button>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</section>
			
			<jsp:include page="bookingFooter.jsp"/>
			
		</div>
	</div>
</body>
<script>
$(document).ready(function() {
	$('.del-btn').on('click', function(e) {
		let id = $(this).data('booking-id');
		$.ajax({
			type: "DELETE"
			, data: {"id": id}
			, url: "/lesson06/delete_booking"
			, success: function(data) {
				// alert(data.result);
				if (data.result == 'success') {
					location.reload();
				}
				if (data.result == 'fail') {
					alret('삭제가 실패되었습니다.');
				}
			}
			, error: function(e) {
				alert(e);
			}
			
		});
	});
	
});
</script>

</html>