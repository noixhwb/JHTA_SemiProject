<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>리뷰작성확인</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
	<style>
		<%--* { margin: auto; text-align: center; }
		#submitbtn { text-align: center; }--%>
	</style>
</head>
<body>
	<form action="${ pageContext.request.contextPath }/review" style="margin: auto; text-align: center;">
	<div class="container">
	<c:choose>
		<c:when test="${ requestScope.result == 'success' }">
			<div class="row">
				<div class="col-6 offset-3">
			<div class="card border-success bg-light mb-3"  style="margin-top: 10%;">
				<div class="card-header" style="text-align: left;">
					<small class="text-muted">리뷰완료확인 </small> <br> 
				</div>
				<div class="card-body text-danger">
					<img src="images/reviewcheck.png" class="card-img-top" style="width: 300px; height: 300px; margin-top: 50px; margin-bottom: 50px;">
					<h1 class="card-title"><strong>리뷰가 작성되었습니다</strong></h1>
					<p class="card-text">마이페이지에서 리뷰를 확인해보세요!</p>
				</div>
				<div class="card-footer">
					마이페이지에서 리뷰를 확인해보세요!
    			</div>
			</div>
				</div>
			</div>
		</c:when>

		<c:otherwise>
			<div class="row">
				<div class="col-6 offset-3">
			<div class="card text-white bg-danger mb-3" style="margin-top: 10%;">
				<div class="card-header" style="text-align: left;">
					<small class="text-muted">리뷰불가확인 </small> <br> 
				</div>
				<div class="card-body">
					<img src="images/sad-face.png" class="card-img-top" style="width: 300px; height: 300px; margin-top: 50px; margin-bottom: 50px;">
					<h1 class="card-title"><strong>리뷰를 작성하지 못했습니다</strong></h1>
				</div>
				<div class="card-footer">
					오류를 확인해주세요!
    			</div>
			</div>
				</div>
			</div>
		</c:otherwise>
	</c:choose>
	</div>
	<div id="submitbtn" style="margin-bottom: 200px">
		<input type="submit" value="마이리뷰목록으로 가기">
	</div>
	</form>
</body>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</html>