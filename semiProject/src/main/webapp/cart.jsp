<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<style>
a {
	text-decoration-line: none;
	color: black;
}

td {
	border-bottom: solid 1px #dedede;
}

#wrap {
	box-sizing: border-box;
	text-align: center;
	/* display: flex; */
	/* justify-content: center; */
}

.main_box {
	/* background-color: saddlebrown; */
	padding-left: 5%;
	padding-right: 5%;
}

.titleArea {
	font-weight: bold;
	font-size: 18px;
}

.box1 {
	border-top: solid 1px black;
	/* border-bottom: solid 1px gray; */
	width: 100%;
	text-align: center;
	/* border: 1px solid black; */
	/* border: 1px solid black; */
	/* margin-left: auto; */
	/* margin-right: auto; */
	/* margin-left: auto; */
	/* margin-right: auto; */
}

.titleArea {
	display: flex;
	flex-direction: row;
	justify-content: space-between;
}

.titlebox {
	height: 50px;
	/* background-color: black; */
}

.infobox {
	height: 105px;
	/* background-color: red; */
}

.check {
	width: 25px;
}

.img {
	width: 100px;
}

.price {
	width: 100px;
}

.p_name {
	width: 460px;
}

.bt {
	width: 110px;
}

.p_all_bt {
	width: 120px;
	height: 50px;
	background-color: black;
	color: white;
	margin-right: 5px;
	font-weight: bold;
	display: flex;
	align-items: center;
	justify-content: center;
}

.p_bt {
	width: 120px;
	height: 50px;
	background-color: #8c8c8c;
	color: white;
	margin-left: 5px;
	font-weight: bold;
	display: flex;
	align-items: center;
	justify-content: center;
}

.button_box {
	display: flex;
	justify-content: center;
}

.aa {
	color: white;
}

/*  반응형 (모바일 사이즈) */
@media screen and (max-width:767px) {
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
		<div id="wrap" style="padding-bottom: 500px;">
			<div class="main_box">
				<div class="titleArea">
					<div>
						<a href="${cp }/Home" id="a1">home</a> <span>></span> <span>장바구니</span>
					</div>
					<div class="orderStep">
						<span title="현재페이지" class="active fontcolor_print">1.장바구니</span> <span>2.결제</span>
						<span>3.주문완료</span>
					</div>
				</div>
				<table class="box1" cellspacing="0" cellpadding="0">
					<c:choose>
						<c:when test="${fn:length(list) != 0}">
							<thead>
								<tr class="titlebox">
									<td class="check"><input type="checkbox" value="전체선택"
										id="all" onclick="checkAll()"></td>
									<br>
									<td class="img">이미지&nbsp;&nbsp;</td>
									<td class="price">가격&nbsp;&nbsp;</td>
									<td class="p_name">상품이름&nbsp;&nbsp;</td>
									<td class="bt">삭제버튼&nbsp;&nbsp;</td>
								</tr>
							</thead>
							<tbody class="infobox">
								<c:forEach var="vo" items="${list }">
									<tr>
										<td class="check"></td>
										<input type="checkbox" name="product">
										</td>
										<td class="img"></td>
										<img src="">&nbsp;&nbsp;</td>
										<td class="price"></td>${vo.pPrice }&nbsp;&nbsp;</td>
										<td class="p_name"></td>${vo.pName }&nbsp;&nbsp;</td>
										<td class="bt"><a
											href="<%=request.getContextPath()%>/delete?id=${vo.cCartNum}">삭제</td>
									</tr>
								</c:forEach>
							</tbody>
				</table>
				</c:when>
				<c:otherwise>
					<div class="">
						<p>장바구니가 비어 있습니다.</p>
						<br>
					</div>
				</c:otherwise>
				</c:choose>
				<br>
				<div class="button_box">
					<div class="p_all_bt">
						<a class="aa" href="#" onclick="allbasket" id="a1"
							style="margin: 0 auto"> <span>전체상품 주문</span>
						</a>
					</div>
					<div class="p_bt">
						<a class="aa" href="#" onclick="selectbasket"
							style="margin: 0 auto"> <span>선택상품 주문</span>
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		function checkAll() {
			if (document.getElementById("all").checked == true) {
				for (var i = 0; i < 10; i++)
					document.getElementsByName("product")[i].checked = true;
			}
			if (document.getElementById("all").checked == false) {
				for (var i = 0; i < 10; i++)
					document.getElementsByName("product")[i].checked = false;
			}
		}
	</script>
</body>
</html>