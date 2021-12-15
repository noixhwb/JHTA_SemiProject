<%@page import="test.vo.ReviewVo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="test.dao.ReviewDao"%>
<%@page import="java.sql.Date"%>
<%@page import="java.sql.SQLException"%>
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
	<title>마이리뷰목록.jsp</title>
	<style>
		* { margin:auto; }
		h1 {
		    font-size: 30px;
		 	text-align: center;
		    border-bottom: 2px solid gray;
		    padding: 20px;
		}
		table {
			border-top: 2px solid #444444;
			border-bottom: 2px solid #444444;
		    border-collapse: collapse;
		    margin-top: 50px;
		}
		th, td {
		    border-bottom: 1px solid #444444;
		    padding: 10px;
		}
	</style>
</head>
<body>
	<c:set var="cp" value="${pageContext.request.contextPath}"></c:set>
	
	<h1>마이 리뷰 목록</h1>
	<table border="1">
		<tr>
			<th>리뷰글번호</th>
			<th>주문번호</th>
			<!-- <th>상품명</th> -->
			<th>평점</th>
			<th>내용</th>
			<!-- <th>작성자(아이디)</th> -->
			<th>작성일</th>
			<th>상세보기</th>
			<th>수정</th>
			<th>삭제</th>
		</tr>
		<%
			ReviewDao dao=new ReviewDao();
			ArrayList<ReviewVo> list = dao.selectAll();
			
			for (int i=0; i<list.size(); i++) {
				ReviewVo vo = list.get(i);
		%>
		<tr>
			<td><%=vo.getCoNum() %></td>
			<td><%=vo.getOdNum() %></td>
			<%-- 상품명없음 --%>
			<td><%=vo.getcScore() %></td>
			<td><%=vo.getContent() %></td>
			<%-- 아이디안보임 --%>
			<td><%=vo.getcDate() %></td>
			<td><a href="${ cp }/reviewDetail?coNum=<%=vo.getCoNum() %>">상세보기</a></td>
			<td><a href="${ cp }/reviewUpdate?coNum=<%=vo.getCoNum() %>">수정</a></td>
			<td><a href="${ cp }/reviewDelete?coNum=<%=vo.getCoNum() %> %>">삭제</a></td>
		</tr>
				<%	
			}
			
		%>
	</table>
</body>
</html>