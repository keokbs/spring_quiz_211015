<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>배탈의 민족</title>


<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<link rel="stylesheet" type="text/css" href="/css/store_style.css">

</head>
<body>
	<div class="container">
		<div class="d-flex justify-content-center">
			<div id="wrap">
				<jsp:include page="header.jsp" />			
				<section class="store_view">
					<div class="font-size mt-1">우리 동네 가게 </div>
					<form method="get" action="/lesson05/store_review">
						<c:forEach var="item" items="${store}">
							<button type="submit"
								class="btn w-100 p-3 info-box mt-3 btn-outline-info" name="name"
								value="${item.name}">
								<div class="info-text">
									<h3 class="font-weight-bold">${item.name}</h3>
									<span class="info-font-size">전화 번호:${item.phoneNumber}</span><br>
									<span class="info-font-size">주소:${item.address}</span><br>
								</div>
							</button>
						</c:forEach>
					</form>
				</section>	
				<jsp:include page="footer.jsp" />
			</div>
		</div>
	</div>
</body>
</html>