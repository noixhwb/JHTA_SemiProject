<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

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
	<h1 class="display-3 text-center">주문 / 배송</h1>
	<div class="container">
	
	<div class="row">
        <div class="col-8 offset-2">
	<div class="card border-dark mb-3">
		<h5 class="card-header">주문하실 상품</h5>
	  	<div class="card-body">
		<table class="table table-hover">
		<caption style="text-align: center; color: red;">총금액+배송비</caption>
		<thead>
			<tr class="table-secondary">
				<th scope="col">상품이미지</th>
				<th scope="col">상품정보</th>
				<th scope="col">상품금액</th>
				<th scope="col">수량</th>
				<th scope="col">주문금액</th>
			</tr>
		</thead>
		<tbody>
		<c:choose>
			<c:when test="${fn:length(list) != 0}">
			<c:forEach var="vo" items="${list }">
			<tr>
				<td scope="row"><img src="/imagesPro/${ vo.piFileName }" class="card-img-top"  style="width: 150px; height: 150px;"> </td>
				<td scope="row">상품명 ${ vo.pName } <br> 사이즈 ${ vo.proSize }</td>
				<td scope="row">${ vo.pPrice }원</td>
				<td scope="row">${ vo.proCount }</td>
				<td scope="row">${ vo.pPrice }*${vo.proCount }</td>
			</tr>
			</c:forEach>
			</c:when>
		</c:choose>
		</tbody>
		</table>
		</div>
	</div>
		</div>
	</div>
	
	<div class="row">
        <div class="col-8 offset-2">
	<div class="card border-dark mb-3">
		<h5 class="card-header">배송 정보</h5>
	  	<div class="card-body">
		<table class="table table-hover">
		<tbody>
			<tr>
				<th>받으시는 분</th>
				<td>주문자 명  <input type="text" id="name" value="${del.mname }"> <br>
					주문자 번호  <input type="text" id="phone" value="${del.mphone }"></td>
			</tr>
			<tr>
				<th>배송지 선택</th>
				<td>
					<input type="radio" name="radioGbn" value="0" checked="checked">기본 배송지
					<input type="radio" name="radioGbn" value="1">새로운 배송지
				</td>
			</tr>
			<tr>
				<th>배송지 정보</th>
				<td>
					<input type="text" name="whereto" id="whereto" style="width: 400px; text-align: left;" value="${ del.maddr }"> <br>
				</td>
			</tr>
			<tr>
				<th>배송메세지</th>
				<td>
					<select name="msg">
						<option selected>부재시 문 앞에 놔주세요</option>
						<option>요청사항을 직접 입력합니다</option>
						<option>배송 전 미리 연락바랍니다</option>
						<option>부재시 경비실에 맡겨주세요</option>
						<option>부재시 전화 남겨주세요</option>
					</select>
					<textarea cols="60" rows="1"></textarea>
				</td>
			</tr>
		</tbody>
		</table>
		</div>
	</div>
		</div>
	</div>	
	
	<div class="row">
        <div class="col-8 offset-2">
	<div class="card border-dark mb-3">
		<h5 class="card-header">결제 수단</h5>
	  	<div class="card-body">
			<input type="radio" name="paying" value="신카" checked="checked">신용카드
			<input type="radio" name="paying" value="무통장">무통장입금
			<%--
			<c:choose>
				<c:when test="${ sessionScope.paying }"
			</c:choose>
			 --%>
		</div>
	</div>	
	</div>
	<div id="purch">
		<input type="submit" value="구매하기" id="purchase">
	</div>
		</div>
	</div>
</body>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script>
	
	$(document).ready(function(){
		$("input[name=radioGbn]").change(function() {
	
			var radioValue = $(this).val();
			var maddr = "${del.maddr}";
			console.log(radioValue);
			if(radioValue =="0"){
				$("#whereto").val(maddr);
			}else{
				$("#whereto").val("");
			}
	
	
		});
	});
		function insertOrder() {
		}
	</script>
</html>