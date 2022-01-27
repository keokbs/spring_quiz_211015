<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Quiz02 - Core 라이브러리</title>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

  <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

</head>
<body>
	<div class="container">
		<h1>HOT 5</h1>
		<table class="table text-center">
			<thead>
				<tr>
					<th><b>순위</b></th>
					<th><b>제목</b></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="music" items="${music}" varStatus="status">
					<tr>
						<td>${status.count}</td>
						<td>${music}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<br>
		
		<h1>멤버십</h1>
		<table class="table text-center">
			<thead>
				<tr>
					<th><b>순위</b></th>
					<th><b>제목</b></th>
					<th><b>제목</b></th>
					<th><b>제목</b></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="member" items="${member}">
					<tr>
						<td>${member.name}</td>
						<td>${member.phoneNumber}</td>
						<td>
							<c:choose>
								<c:when test="${member.grade eq 'VIP'}">
									<span class="text-danger">${member.grade}</span>
								</c:when>
								<c:when test="${member.grade eq 'GOLD'}">
									<span class="text-warning">${member.grade}</span>
								</c:when>
								<c:otherwise>
									<span>${member.grade}</span>
								</c:otherwise>
							</c:choose>
						</td>
						<td>
							<c:choose>
								<c:when test="${member.point >= 5000}">
									<span class="text-primary">${member.point}P</span>
								</c:when>
								<c:otherwise>
									<span>${member.point}P</span>
								</c:otherwise>
							</c:choose>
						</td>
					</tr>
				</c:forEach>
			</tbody>
			
		</table>
	</div>
</body>
</html>