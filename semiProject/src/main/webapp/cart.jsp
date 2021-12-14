<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<style>
#wrap {
	text-align: center;
}

#box1 {
	text-align: center;
	border: 1px solid black;
	border: 1px solid black;
	margin-left: auto;
	margin-right: auto;
	margin-left: auto;
	margin-right: auto;
}

#box1 td, tr {
	border: 1px solid;
}
</style>
<c:set var="cp" value="${pageContext.request.contextPath}"></c:set>
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
		<form id="" action="/product" method="get">
			<input id="" value type="hidden">
		</form>
		<a href="${cp }/Home" id="a1">home</a>
		<div id="wrap" style="padding-bottom: 500px;">
			<div class="">
				<div class="titleArea">
					<h2>장바구니</h2>
					<div class="orderStep">
						<span title="현재페이지" class="active fontcolor_print">1.장바구니</span> <span>2.결제</span>
						<span>3.주문완료</span>
					</div>
				</div>
				<table id="box1">
					<tr>
						<td><input type="checkbox" value="전체선택" id="all" name="all"onclick="checkAll()"></td>
						<br>
						<td>이미지&nbsp;&nbsp;</td>
						<td>가격&nbsp;&nbsp;</td>
						<td>상품이름&nbsp;&nbsp;</td>
						<td>삭제버튼&nbsp;&nbsp;</td>
					</tr>
					<tbody>
						<c:forEach var="vo" items="${list }">
							<tr>
								<td><input type="checkbox" name="product"></td>
								<td><img src="">&nbsp;&nbsp;</td>
								<td>${vo.pPrice }&nbsp;&nbsp;</td>
								<td>${vo.pName }&nbsp;&nbsp;</td>
								<td><a href="<%=request.getContextPath()%>/delete?id=${vo.mId}">삭제</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<br>
				<div class="">
					<p>장바구니가 비어 있습니다.</p>
					<br>
				</div>
				<div class="">
					<a href="#" onclick="allbasket" class="" id="a1"> <span>전체상품
							주문&nbsp;&nbsp;</span>
					</a> <a href="#" onclick="selectbasket"> <span>선택상품 주문</span>
					</a>
				</div>
			</div>
		</div>
	</div>
	<!-- 전체선택 수정중 -->
	<script type="text/javascript">
		function checkAll() {
			if (document.getElementById("all").checked == true) {
				for (var i = 0; i < 10; i++)
					document.getElementsByName("checkBox")[i].checked = true;
			}
			if (document.getElementById("all").checked == false) {
				for (var i = 0; i < 10; i++)
					document.getElementsByName("checkBox")[i].checked = false;
			}
		}
	</script>
</body>
</html>