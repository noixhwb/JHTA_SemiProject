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
	<title>리뷰수정하기폼.jsp</title>
	<link rel="stylesheet" href="REVIEW_STYLE.css">
</head>
<body>
	<h1 style="text-align: center">리뷰 수정</h1>
	<%
		int coNum = Integer.parseInt(request.getParameter("coNum"));
	
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql = "SELECT * FROM COMMENTS_S WHERE CONUM=?";
		
		try {
			con = JdbcUtil.getCon();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, coNum);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				String cScore = rs.getString("cScore");
				String content = rs.getString("content");
			
			%>
	<form action="ReviewUpdate.jsp" method="post">
		<div id="product">
			<div id="product_pic">
				<img src="images/hoddy.PNG">
			</div>
			<div id="product_detail">
				<ul>
					<li>제품명</li>
					<li>사이즈</li>
				</ul>
			</div>
		</div>
		<div id="cust_estm">
			<table>
				<tr>
					<th>평점</th>
					<td>
						<input type="radio" name="cScore" value="★★★★★">★★★★★
						<input type="radio" name="cScore" value="★★★★">★★★★
						<input type="radio" name="cScore" value="★★★">★★★
						<input type="radio" name="cScore" value="★★">★★
						<input type="radio" name="cScore" value="★">★
					</td>
				</tr>
				<tr>
					<th>내용</th>
					<td>
						<span>*200자 미만으로 작성해주세요</span> <br>
						<input type="text" name="content" 
							   style="width: 400px; height: 200px; text-align: left;">
					</td>
				</tr>
			</table>
			<input type="submit" value="리뷰수정">
		</div>
	</form>
			<%
			} else {
				out.print("수정 실패!");
			}
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			JdbcUtil.close(con, pstmt, rs);
		}
	%>
</body>
</html>