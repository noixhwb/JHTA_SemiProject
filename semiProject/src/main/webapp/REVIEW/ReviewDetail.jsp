<%@page import="test.vo.ReviewVo"%>
<%@page import="test.dao.ReviewDao"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Date"%>
<%@page import="db.JdbcUtil"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>리뷰상세보기.jsp</title>
</head>
<body>
	<c:set var="cp" value="${pageContext.request.contextPath}"></c:set>
	<h1>리뷰 상세보기</h1>
	<%
		request.setCharacterEncoding("UTF-8");
		int coNum = Integer.parseInt(request.getParameter("coNum"));
		
		ReviewDao dao=new ReviewDao();
		ReviewVo vo = dao.select(coNum);
		
		if (vo == null) {
			out.print("해당 데이터를 조회할 수 없음");
		} else {
		%>
		리뷰글번호 : <%=coNum %> <br>
		주문번호 : <%=vo.getOdNum() %> <br>
		<%-- 상품명 : <%=sangpoom %> <br> --%>
		평점 : <%=vo.getcScore() %> <br>
		내용 : <%=vo.getContent() %> <br>
		작성자(아이디) : <%=vo.getMid() %> <br>
		작성일 : <%=vo.getcDate() %> <br>
		<%
		} 
	%>
</body>
</html>