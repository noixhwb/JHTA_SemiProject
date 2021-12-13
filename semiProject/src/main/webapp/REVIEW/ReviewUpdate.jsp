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
		
		Connection con=null;
		PreparedStatement pstmt=null;
		int n=0;
		String sql = "UPDATE COMMENTS_S SET CSCORE=?, CONTENT=? WHERE CONUM=?";
		
		try {
			con = JdbcUtil.getCon();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, cScore);
			pstmt.setString(2, content);
			pstmt.setInt(3, coNum);
			n = pstmt.executeUpdate();
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			JdbcUtil.close(con, pstmt, null);
		}
		
		if (n > 0) {
			out.print("<h3>리뷰 수정 성공!");
		} else {
			out.print("<h3>리뷰 수정 실패!");
		}
	%>
</body>
</html>