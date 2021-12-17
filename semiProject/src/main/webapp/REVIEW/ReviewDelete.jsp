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
	<style>
		#wrap #mypage_category li{
			list-style:none; display: inline-block;
		}
		#wrap #box1 li{
			list-style:none; display: inline-block;
		}
		#wrap #box1 img{
			width:50px; height: 50px; 
		}
		#wrap #box1{
			 width:500px; text-align: center;display: inline-block; padding-bottom: 20px;
		}
		#wrap{
			margin:0px	; padding: 0px; text-align: center;
		}
	</style>
</head>
<body>
	<c:set var="cp" value="${ pageContext.request.contextPath }"/>
	<div id="wrap">
		<div id="mypage_category">
			<ul>
				<li>
				<a href="${cp}/Home">home</a>></li>
				<li><strong>마이페이지</strong></li>
			</ul>
		</div>
		<div id ="box1">
			<ul>
				<li><a href="${cp}/myshop/orderList"><img src="${cp}/images/order.png"><br>주문조회</a></li>
				<li><a href=""><img src="${cp}/images/member.png"><br>회원정보수정</a></li>
				<li><a href=""><img src="${cp}/images/shopping.png"><br>장바구니</a></li>
				<li><a href="${cp}/review"><img src="${cp}/images/board.png"><br>리뷰관리</a></li>
			</ul>
		</div>
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
	</div>
</body>
</html>