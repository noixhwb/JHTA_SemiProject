<%@page import="test.vo.ReviewVo"%>
<%@page import="test.dao.ReviewDao"%>
<%@page import="java.sql.SQLException"%>
<%@page import="db.JdbcUtil"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>리뷰수정하기.jsp</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
	
		int coNum = Integer.parseInt(request.getParameter("coNum"));
		int odNum = Integer.parseInt(request.getParameter("odNum"));
		String cScore = request.getParameter("cScore");
		String content = request.getParameter("content");
		String mid = request.getParameter("mid");
		
		ReviewDao dao=new ReviewDao();
		ReviewVo vo=new ReviewVo(coNum, odNum, cScore, content, mid, null);
		int n = dao.update(vo);
		
		if (n>0) {
			out.print("<h1>리뷰 수정 성공!</h1>");
		} else {
			out.print("<h1>리뷰 수정 실패!</h1>");
		}
	%>
	<a href="${ cp }/review">마이리뷰목록으로 돌아가기</a>
</body>
</html>