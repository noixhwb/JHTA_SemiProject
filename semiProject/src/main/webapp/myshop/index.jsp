<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style type="text/css">
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
	#mypage_category{
	
	}
	#wrap #title #box2{
		 text-align: center; width:500px; height:200px;
	}
	#wrap #title{
		padding-bottom: 20px;
	}
	
	#wrap #box3{
		 width:500px; text-align: center; height:200px;
		display: inline-block; border: 1px thin black;
	}
	#wrap #box3 li{
		list-style:none; display: inline-block; 
	}
</style>
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
	<div id="title">
		<h4>마이페이지</h4>
		
	
		<span id ="box2">
			<img src="${cp}/images/member.png">
			저희쇼핑몰을 이용해주셔서 감사합니다. 저희 회원이십니다.
		</span>
	</div>
	<div id="box3">
		<h3>최근주문 현황</h3>
		<table border="1" width="500">
			<tr>
				<th>주문번호</th>
				<th>주문금액</th>
				<th>배송지</th>
				<th>주문일자</th>
			</tr>
			<c:choose>
				<c:when test="${requestScope.list==null}">
					<h3>주문내역이 없습니다.</h3>
				
				</c:when>
				<c:otherwise>
				
				<c:forEach var="vo" items="${requestScope.list}">
					<tr>
						<td>${vo.onum}</td>
						<td>${vo.totalsales}</td>
						<td>${vo.delocation}</td>
						<td>${vo.odate}</td>
					</tr>
				
				</c:forEach>
				</c:otherwise>
			</c:choose>
		</table>
		
	</div>
	
	
	
</div>	
