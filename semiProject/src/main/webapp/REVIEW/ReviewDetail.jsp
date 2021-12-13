<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Date"%>
<%@page import="db.JdbcUtil"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>리뷰상세보기.jsp</title>
</head>
<body>
	<h1>리뷰 상세보기</h1>
	<%
		int odNum = Integer.parseInt(request.getParameter("odNum"));
	
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql = "SELECT * FROM COMMENTS_S WHERE ODNUM=?";
		
		try {
			con = JdbcUtil.getCon();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, odNum);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				//리뷰글번호	주문번호	상품명	평점	내용	작성자(아이디)	작성일	상세보기	수정	삭제
				int coNum = rs.getInt("coNum");
				String sangpoom = rs.getString("sangpoom"); //상품명
				String qual = rs.getString("qual");
				String content = rs.getString("content");
				String mid = rs.getString("mid");
				Date cDate = rs.getDate("cDate");
			%>
		리뷰글번호 : <%=odNum %> <br>
		주문번호 : <%=coNum %> <br>
		상품명 : <%=sangpoom %> <br>
		평점 : <%=qual %> <br>
		내용 : <%=content %> <br>
		작성자(아이디) : <%=mid%> <br>
		작성일 : <%=cDate %> <br>
			<%
			} else {
				out.print("조회된 데이터가 없습니다");
			}
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			JdbcUtil.close(con, pstmt, rs);
		}
	%>
</body>
</html>