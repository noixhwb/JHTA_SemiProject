<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<style type="text/css">
	li{
		list-style:none; display: inline-block;
	}
	img{
		width:50px; height: 50px;
	}
	.box1{
		border: 1px soild black;
	}
</style>

<div id="wrap">
	<div id="mypage_category">
		<ul>
			<li>
			<a href="<%=request.getContextPath()%>/Home">home</a>></li>
			<li><a href="<%=request.getContextPath()%>/myshop/main"><strong>마이페이지</strong></a></li>
		</ul>
	</div>
	<div id ="box1">
		<ul>
			<li><a href="<%=request.getContextPath()%>/myshop/orderList"><img src="../images/order.png">주문조회</a></li>
			<li><a href=""><img src="../images/member.png">회원정보수정</a></li>
			<li><a href=""><img src="../images/shopping.png">장바구니</a></li>
			<li><a href=""><img src="../images/board.png">리뷰관리</a></li>
		</ul>
	</div>
	<div id="title">
		<h2>마이페이지</h2>
	</div>	
	<div id=>
		<span id ="box2">
			<img src="../images/member.png">
			저희쇼핑몰을 이용해주셔서 감사합니다. 저희 회원이십니다.
		</span>
	</div>
	<div id="box3">
		<h3>나의주문처리 현황</h3>
		<ul>
			<li>입금전</li>
			<li>배송준비중</li>
			<li>배송중 </li>
			<li>배송완료</li>
		</ul>
		<ul>
			<li>취소 교환 반품</li>
		</ul>	
	</div>
	
	
	
</div>	
