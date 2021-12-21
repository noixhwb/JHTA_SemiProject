<%@page import="test.vo.ReviewVo"%>
<%@page import="test.dao.ReviewDao"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Date"%>
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
	<title>리뷰상세보기.jsp</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
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
	<c:set var="cp" value="${pageContext.request.contextPath}"></c:set>
	<%-- 
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
				<li><a href="${cp}/member/update"><img src="${cp}/images/member.png"><br>회원정보수정</a></li>
				<li><a href=""><img src="${cp}/images/shopping.png"><br>장바구니</a></li>
				<li><a href="${cp}/review"><img src="${cp}/images/board.png"><br>리뷰관리</a></li>
			</ul>
		</div>
	</div>
	--%>
	<form action="${ cp }/review" method="post">
	<h1 class="display-6 text-center"><strong>마이리뷰 상세보기</strong></h1>
	<div class="container">
	<div class="row">
		<div class="col-6 offset-3">
	<div class="card border-secondary mb-3">
		
		<h5 class="card-header">주문번호 : ${ vo.odNum }</h5>
		<div class="card-body">
	  		<img src="imagesPro/${ vo.piFileName }" class="card-img-top"  style="width: 150px; height: 150px;">
	    	<h5 class="card-title">${ vo.pName }</h5>
	    	<p class="card-text">${ vo.proSize } 사이즈 <br> 제품상세번호 : ${ vo.pdNum }</p>
	  	</div>
	  	<ul class="list-group list-group-flush">
	    	<li class="list-group-item">리뷰글번호 : ${ vo.coNum }</li>
	    	<li class="list-group-item">평점 : ${ vo.cScore }</li>
	    	<li class="list-group-item">내용 : ${ vo.content }</li>
	    	<li class="list-group-item">작성자(아이디) : ${ vo.mid }</li>
	    	<li class="list-group-item">작성일 : ${ vo.cDate }</li>
	  	</ul>
	</div>
		</div>
	</div>
	</div>
	<div id="cust_estm">
		<input type="submit" value="마이리뷰목록으로 돌아가기">
	</div>
	</form>
</body>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</html>