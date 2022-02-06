<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div class="content1 col-10 mt-3 ml-3 mr-3">
	<h3 class="font-weight-bold">과거 날씨</h3>
	<table class="table text-center pt-3">
		<thead>
			<tr>
				<th>날짜</th>
				<th>날씨</th>
				<th>기온</th>
				<th>강수량</th>
				<th>미세먼지</th>
				<th>풍속</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="weatherhistory" items="${weatherhistory}">
				<tr>
					<td>
						<fmt:parseDate var="date" value="${weatherhistory.date}" pattern="yyyy-MM-dd" />
						<fmt:formatDate value="${date}" pattern="yyyy년 MM월 d일" />
					</td>
					<td>
						<c:choose>
							<c:when test="${weatherhistory.weather} eq 'sunny'">
								<img src="https://pixabay.com/ko/photos/%ec%83%88-%ec%9d%b8%eb%8f%84-%ec%b1%84%ed%8c%85-%ec%a1%b0%eb%a5%98%ed%95%99-%ec%a2%85-6983434/" alt="sunny">
							</c:when>
							<c:when test="${weatherhistory.weather} eq 'partlyCloudy'">
								<img src="https://pixabay.com/ko/photos/%ec%83%88-%ec%9d%b8%eb%8f%84-%ec%b1%84%ed%8c%85-%ec%a1%b0%eb%a5%98%ed%95%99-%ec%a2%85-6983434/" alt="partlyCloudy">
							</c:when>
							<c:when test="${weatherhistory.weather} eq 'cloudy'">
								<img src="https://pixabay.com/ko/photos/%ec%83%88-%ec%9d%b8%eb%8f%84-%ec%b1%84%ed%8c%85-%ec%a1%b0%eb%a5%98%ed%95%99-%ec%a2%85-6983434/" alt="cloudy">
							</c:when>
							<c:when test="${weatherhistory.weather} eq 'rainy'">
								<img src="https://pixabay.com/ko/photos/%ec%83%88-%ec%9d%b8%eb%8f%84-%ec%b1%84%ed%8c%85-%ec%a1%b0%eb%a5%98%ed%95%99-%ec%a2%85-6983434/" alt="rainy">
							</c:when>
						</c:choose>
					</td>
					<td>${weatherhistory.temperatures}</td>
					<td>${weatherhistory.precipitation}</td>
					<td>${weatherhistory.microDust}</td>
					<td>${weatherhistory.windSpeed}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>