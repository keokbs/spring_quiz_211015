<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기상청</title>

<!-- jQuery가 datepicker 라이브러리 위에 있어야 한다. (데이터피커가 jquery를 사용하기 때문) -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>        

<!-- datepicker 라이브러리 -->
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<script>

	$("#date").datepicker({
		dateFormat : "yyyy-MM-dd"
	});
</script>

<style>
#warp{width: 1200px;}
aside {background-color: #64a0ff;}
.aside-font {color: white; font-weight: bold; font-size: 20px;}
ul {list-style: none; text-align: start;}
a {color: white;}
li a:hover{color: white; text-decoration: none;}
.logo a:hover{color: white; text-decoration: none;}
.line {border-bottom:0.01px solid #dedede;}

footer{height: 80px;}
small {color: gray; font-weight: bold;}

</style>

</head>
<body>
	<div class="container">
		<div id="warp">
			<div class="d-flex line">	
				<jsp:include page="aside.jsp" />
				<div class="col-10 mt-3 ml-3 mr-3">
					<h3 class="font-weight-bold">날씨 입력</h3><br>
					<form method="get" action="/lesson05/quiz05/add_weather">
						<div>
							<%-- 첫째줄 --%>
							
							<div class="content1 form-group d-flex justify-content-between">
								<div class="d-flex col-4">
									<div class="mt-1 col-2 text-center p-0">날짜</div>
									<input type="text" id="date" class="form-control col-10">
								</div>
								<div class="d-flex col-4">
									<div class="mt-1 col-4 text-center">날씨</div>
									<select class="form-control col-6">
										<option value="sunny">맑음</option>
										<option value="partlyCloudy">구름조금</option>
										<option value="cloudy">흐림</option>
										<option value="rainy">비</option>
									</select>
								</div>
								<div class="d-flex col-3">
									<div class="mt-1 col-6">미세먼지</div>
									<select class="form-control col-6">
										<option value="좋음">좋음</option>
										<option value="보통">보통</option>
										<option value="나쁨">나쁨</option>
										<option value="최악">최악</option>
									</select>
								</div>
							</div>
							<br>
							<%-- 둘째줄 --%>
							<div class="content2 d-flex justify-content-start">
								<div class="input-group ml-3">
									기온
									<input type="text" class="form-control ml-3" aria-describedby="unit-temperature" name="temperature">
									<span class="input-group-text" id="unit-temperature">℃</span>
								</div>
								<div class="input-group ml-3">
									강수량
									<input type="text" class="form-control ml-3" aria-describedby="unit-precipitation" name="precipitation">
									<span class="input-group-text" id="unit-precipitation">mm</span>
								</div>
								<div class="input-group ml-3">
									풍속
									<input type="text" class="form-control ml-3" aria-describedby="unit-wind-speed" name="windSpeed">
									<span class="input-group-text" id="unit-wind-speed">km/h</span>
								</div>
							</div>
						</div>
						<div class="d-flex justify-content-end mt-3 pb-5">
							<input class="btn btn-success col-1" value="저장">
						</div>
					</form>
				</div>
			</div>
			<jsp:include page="footer.jsp" />
		</div>
	</div>
</body>
</html>