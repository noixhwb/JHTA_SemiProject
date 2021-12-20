<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>주문하기폼.jsp</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
	<style>
	#purch {
		text-align: center;
	}
	</style>
</head>
<body>
	<c:set var="cp" value="${pageContext.request.contextPath}"></c:set>
	<div class="container">
	<div class="card border-dark mb-3">
	
		<h5 class="card-header">주문하실 상품</h5>
	  	<div class="card-body">
		<table class="table table-hover">
		<caption style="text-align: center; color: red;">총금액+배송비</caption>
		<thead>
			<tr class="table-secondary">
				<th scope="col">상품이미지</th>
				<th scope="col">상품상태</th>
				<!-- <th>상품명</th> -->
				<th scope="col">상품금액</th>
				<th scope="col">수량</th>
				<th scope="col">주문금액</th>
			</tr>
		</thead>
		<tbody>
		<!-- <c:forEach var="vo" items="${ list }"> -->
			<tr>
				<td scope="row">이미지 ${ vo.coNum }</td>
				<td scope="row">이름/사이즈 ${ vo.odNum }</td>
				<%-- 상품명없음 --%>
				<td scope="row">금액 ${ vo.cScore }</td>
				<td scope="row">수량 ${ vo.content }</td>
				<td scope="row">주문금액 ${ vo.content }</td>
			</tr>
		<!--</c:forEach>-->
		</tbody>
		</table>
		</div>
	</div>
	<div class="card border-dark mb-3">
		<h5 class="card-header">배송 정보</h5>
	  	<div class="card-body">
		<table class="table table-hover">
		<tbody>
			<tr>
				<th>받으시는 분</th>
				<td>이름 <br> 번호 </td>
			</tr>
			<tr>
				<th>배송지 선택</th>
				<td>
					<input type="radio" name="radio" value="기본배송지" checked="checked">기본 배송지
					<input type="radio" name="radio" value="새로운배송지">새로운 배송지
				</td>
			</tr>
			<tr>
				<th>배송지 정보</th>
				<td>
					<input type="text" name="whereto" style="width: 400px; text-align: left;"> <br>
				</td>
			</tr>
			<tr>
				<th>배송메세지</th>
				<td>@@....@@</td>
			</tr>
		</tbody>
		</table>
		</div>
	</div>	
	
	<div class="card border-dark mb-3">
		<h5 class="card-header">결제 수단</h5>
	  	<div class="card-body">
			<input type="radio" name="paying" value="신카" checked="checked">신용카드
			<input type="radio" name="paying" value="무통장">무통장입금
		</div>
	</div>	
	</div>
	<div id="purch">
		<input type="submit" value="구매하기" id="purchase">
	</div>
</body>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</html>