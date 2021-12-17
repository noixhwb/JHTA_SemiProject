<%@page import="test.vo.ReviewVo"%>
<%@page import="test.dao.ReviewDao"%>
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
	<title>리뷰수정하기폼.jsp</title>
	<style>
		* { margin: auto; }
		h1 {
		    font-size: 30px;
		 	text-align: center;
			border-bottom: 2px solid gray;
		    padding: 20px;
		}
		#product_pic, #product_detail { text-align: center; }
		table {
			border-top: 2px solid #444444;
			border-bottom: 2px solid #444444;
		    border-collapse: collapse;
		}
		th, td {
		    border-bottom: 1px solid #444444;
		    padding: 10px;
		}
		#review_content { border: 2px solid grey; padding: 5px;}
		#review_submit { margin-top: 5px; display:block; }
		ul{ list-style:none; }
		span { font-size: 12px; }
		div { text-align: center; }
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
		[type=radio] {
			position: absolute; opacity: 0; width: 0; height: 0;
		}
		[type=radio]+img {
			cursor:pointer;
		}
		[type=radio]:checked+img{
			outline: 5px solid indigo;
		}
		#score{
			width: 50px; height: 30px;
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
	<h1 style="text-align: center">리뷰 수정</h1>
	<form action="${ cp }/reviewUpdate" method="post">
		<div id="product">
			<div id="product_pic">
				<img src="images/hoddy.PNG" style="width: 150px; height: 150px;">
			</div>
		</div>
		<div id="cust_estm">
			<table>
				<tr>
					<th>제품정보</th>
					<td>
						<input type="text" name="pName" value="${ vo.pName }" readonly="readonly" style="width:30px">
						<input type="text" name="proSize" value="${ vo.proSize }" readonly="readonly" style="width:30px">
						<input type="text" name="pdNum" value="${ vo.pdNum }" readonly="readonly" style="width:30px">
					</td>
				</tr>
				<tr>
					<th>리뷰글번호</th>
					<td>
						<input type="text" name="coNum" value="${ vo.coNum }" readonly="readonly">
					</td>
				</tr>
				<tr>
					<th>주문상세번호</th>
					<td>
						<input type="text" name="odNum" value="${ vo.odNum }" readonly="readonly">
					</td>
				</tr>
				<tr>
					<th>작성자 아이디</th>
					<td>
						<input type="text" name="mid" value="${ vo.mid }" readonly="readonly">
					</td>
				</tr>
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
						<span>*30자 이내로 작성해주세요</span> <br>
						<input type="text" name="content" 
							   style="width: 400px; height: 20px; text-align: left;"
							   value="${ requestScope.vo.content }">
					</td>
				</tr>
				
			</table>
			<input type="submit" value="리뷰수정">
		</div>
	</form>
	</div>
</body>
</html>