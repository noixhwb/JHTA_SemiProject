<%@page import="java.sql.Date"%>
<%@page import="java.sql.SQLException"%>
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
	<title>리뷰목록.jsp</title>
	<link rel="stylesheet" href="REVIEWLIST_STYLE.css">
</head>
<body>
	<h1>리뷰 목록</h1>
	<table border="1">
		<tr>
			<th>리뷰글번호</th>
			<th>주문번호</th>
			<th>상품명</th>
			<th>평점</th>
			<th>내용</th>
			<th>작성자(아이디)</th>
			<th>작성일</th>
			<th>상세보기</th>
			<th>수정</th>
			<th>삭제</th>
		</tr>
		<%
			Connection con=null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			String sql = "SELECT * FROM COMMENTS_S";
			
			try {
				con = JdbcUtil.getCon();
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while (rs.next()) {
					int coNum = rs.getInt("coNum");
					int odNum = rs.getInt("odNum");
					String sangpoom = rs.getString("sangpoom"); //상품명???!
					String cScore = rs.getString("cScore");
					String content = rs.getString("content");
					String mid = rs.getString("mid");
					Date cDate = rs.getDate("cDate");
				%>
		<tr>
			<td><%=coNum %></td>
			<td><%=odNum %></td>
			<td><%=sangpoom %></td>
			<td><%=cScore %></td>
			<td><%=content %></td>
			<td><%=mid %></td>
			<td><%=cDate %></td>
			<td><a href="ReviewDetail.jsp?coNum=<%=coNum %>">상세보기</a></td>
			<td><a href="ReviewUpdateForm.jsp?coNum=<%=coNum %>">수정</a></td>
			<td><a href="ReviewDelete.jsp?coNum=<%=coNum %>">삭제</a></td>
		</tr>
				<%	
				}
			} catch (SQLException se) {
				se.printStackTrace();
			} finally {
				JdbcUtil.close(con, pstmt, rs);
			}
		%>
	</table>
</body>
</html>