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
	<c:set var="cp" value="${pageContext.request.contextPath}"></c:set>
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
		<c:forEach var="vo" items="${ list }">
			<tr>
				<td>${ vo.coNum }</td>
				<td>${ vo.odNum }</td>
				<%-- 상품명없음 --%>
				<td>${ vo.cScore }</td>
				<td>${ vo.content }</td>
				<%-- 아이디안보임 --%>
				<td>${ vo.cDate }</td>
				<td><a href="${ cp }/reviewDetail?coNum=${ vo.coNum }">상세보기</a></td>
				<td><a href="${ cp }/reviewUpdate?coNum=${ vo.coNum }">수정</a></td>
				<td><a href="${ cp }/reviewDelete?coNum=${ vo.coNum }">삭제</a></td>
			</tr>
		</c:forEach>
	</table>
	</div>
</body>
</html>