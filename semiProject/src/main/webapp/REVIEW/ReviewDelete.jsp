<%@page import="test.dao.ReviewDao"%>
<%@page import="test.vo.ReviewVo"%>
<%@page import="java.sql.SQLException"%>
<%@page import="db.JdbcUtil"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>리뷰삭제하기.jsp</title>
</head>
<body>
	<c:set var="cp" value="${ pageContext.request.contextPath }"/>
	<%
		request.setCharacterEncoding("UTF-8");
		int coNum = Integer.parseInt(request.getParameter("coNum"));
		
		int n =new ReviewDao().delete(coNum);
		
		if (n > 0) {
			out.print("<h1>삭제 완료!</h1>");
			//RequestDispatcher rd = request.getRequestDispatcher("/review");
			//rd.forward(request, response);
			response.sendRedirect("/review");
		} else {
			out.print("<h1>삭제 실패!</h1>");
		%>
	<a href="${ cp }/review">마이리뷰목록 돌아가기</a>
		<%
		}
	%>
</body>
</html>