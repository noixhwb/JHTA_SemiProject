<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>주문확인</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
	<style>
		* { margin: auto; text-align: center; }
		<%--#submitbtn { text-align: center; }--%>
	</style>
</head>
<body>
	<form action="${ pageContext.request.contextPath }/Home">
	<div class="container">
	<c:choose>
		<c:when test="${ requestScope.result == 'success' }">
			<div class="row">
				<div class="col-6 offset-3">
			<div class="card border-danger mb-3">
				<!-- <div class="card-header">Header</div> -->
				<div class="card-body text-danger" style="margin-top: 250px;">
					<img src="images/checked.png" class="card-img-top" style="width: 300px; height: 300px;">
					<h1 class="card-title"><strong>주문이 완료되었습니다</strong></h1>
					<p class="card-text">@@orders, orderdetail에서 가져오기@@ <br> 주문번호 <br> 주문일자 <br>주문된리스트 @@</p>
				</div>
			</div>
				</div>
			</div>
		</c:when>

		<c:otherwise>
			<div class="row">
				<div class="col-6 offset-3">
			<div class="card text-white bg-danger mb-3" style="margin-top: 30%;">
				<div class="card-body">
					<img src="images/sad.png" class="card-img-top" style="width: 300px; height: 300px;">
					<h1 class="card-title"><strong>주문을 완료하지 못했습니다</strong></h1>
					<p class="card-text">오류를 확인해주세요!</p>
				</div>
			</div>
				</div>
			</div>
		</c:otherwise>
	</c:choose>
	</div>
	<div id="submitbtn">
		<input type="submit" value="홈으로 가기">
	</div>
	</form>
</body>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</html>