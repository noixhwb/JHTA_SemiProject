<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Result.jsp</title>
</head>
<body>
	<c:choose>
		<c:when test="${ requestScope.result == 'success' }">
			<h2>요청작업 성공!</h2>
		</c:when>
		<c:otherwise>
			<h2>요청작업 실패!</h2>
		</c:otherwise>
	</c:choose>
	<a href="<%=request.getContextPath() %>/Home">홈으로 가기</a>
</body>
</html>