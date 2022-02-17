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
				
						
				<section class="store_review">
					<div class="font-size mt-1">${name} - 리뷰</div>
					<c:choose>
						<c:when test="${item.review eq ''}">
							<h1 class="text-center mt-3">작성된 리뷰가 없습니다.</h1>
						</c:when>
						<c:otherwise>
							<c:forEach var="item" items="${review}">
								<div name="name"
									class="w-100 p-3 info-box mt-3 info-text">
									${item.userName}<br>
									${item.point}<br>
									${item.createdAt}<br><%-- 날짜변환 필요 --%>
									${item.review}<br>
									${item.menu}<br>
								</div>
							</c:forEach>		
						</c:otherwise>
					</c:choose>
				</section>					
				<jsp:include page="footer.jsp" />
			</div>
		</div>
	</div>
</body>
</html>