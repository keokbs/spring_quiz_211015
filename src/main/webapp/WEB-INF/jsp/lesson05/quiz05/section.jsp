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
			<c:forEach var="weatherHistory" items="${weatherHistory}">
				<tr>
					<td>
						<fmt:formatDate value="${weatherHistory.date}" pattern="yyyy년 MM월 d일" />
					</td>
					<td>
						<c:choose>
							<c:when test="${weatherHistory.weather eq '맑음'}">
								<img src="/images/sunny.jpg" alt="날씨">
							</c:when>
							<c:when test="${weatherHistory.weather eq '구름조금'}">
								<img src="/images/partlyCloudy.jpg"" alt="날씨">
							</c:when>
							<c:when test="${weatherHistory.weather eq '흐림'}">
								<img src="/images/cloudy.jpg"" alt="날씨">
							</c:when>
							<c:when test="${weatherHistory.weather eq '비'}">
								<img src="/images/rainy.jpg"" alt="날씨">
							</c:when>
						</c:choose>
					</td>
					<td>${weatherHistory.temperatures}℃</td>
					<td>${weatherHistory.precipitation}mm</td>
					<td>${weatherHistory.microDust}</td>
					<td>${weatherHistory.windSpeed}km/h</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>