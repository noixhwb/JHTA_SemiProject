<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/common.css">
</head>
<body>
	<div id="wrap">
		<div id="header">
			<jsp:include page="${requestScope.header }" />
		</div>
		<div id="footer">
			<jsp:include page="${requestScope.footer}" />
		</div>
		<form id="" name action="/product" method="get" target=""
			enctype="application/x-www-form-urlencoded">
			<input id="aa" name="aa" value type="hidden">
		</form>
		<div id="wrap" style="padding-bottom: 500px;" >
			<div id="template_width">
				<div class="path">
					<span>현재 위치</span>
					<ol>
						<li><a href="/">Home</a></li>
						<li title="현재위치"><strong>장바구니</strong></li>
					</ol>
				</div>
				<div class="">
					<div class="titleArea">
						<h2>장바구니</h2>
						<div class="orderStep">
							<span title="현재페이지" class="active fontcolor_print">01장바구니</span>
							<span>02결제</span> <span>03주문완료</span>
						</div>
					</div>
					<fieldset>
					<legend>상품</legend>
					상품1<input type="checkbox" value="상품1" name="product">
					상품2<input type="checkbox" value="상품2" name="product">
					상품3<input type="checkbox" value="상품3" name="product">
					</fieldset>
					<div class="">
						<p>장바구니가 비어 있습니다.</p>
					</div>
					<div class="">
						<a href="#" onclick="allbasket" class=""> <span>전체상품 주문</span>
						</a> <a href="#" onclick="selectbasket"> <span>선택상품 주문</span>
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>