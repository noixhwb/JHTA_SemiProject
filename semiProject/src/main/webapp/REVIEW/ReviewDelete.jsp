<%@page import="java.sql.SQLException"%>
<%@page import="db.JdbcUtil"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>리뷰삭제하기.jsp</title>
</head>
<body>
	<%
		int coNum = Integer.parseInt(request.getParameter("coNum"));
	
		Connection con=null;
		PreparedStatement pstmt=null;
		int n=0;
		String sql = "DELETE FROM COMMENTS_S WHERE CONUM=?";
		
		try {
			con = JdbcUtil.getCon();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, coNum);
			n = pstmt.executeUpdate();
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			JdbcUtil.close(con, pstmt, null);
		}
		
		if (n > 0) {
			response.sendRedirect("ReviewList.jsp");
		} else {
			out.print("<h2>삭제 실패!</h2>");
		}
	%>
</body>
</html>