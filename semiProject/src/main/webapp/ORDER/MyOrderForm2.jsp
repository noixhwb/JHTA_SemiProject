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
	<form action="${ cp }/myorderOk">
	<div class="container" >
	<div class="card border-dark mb-3">
	
		<h5 class="card-header">주문하실 상품</h5>
	  	<div class="card-body">
		<table class="table table-hover">
		<caption style="text-align: center; color: red;">총금액+배송비 = ${totPrice }</caption>
		<input type="hidden" name="totPrice" value="${ totPrice }">
		<thead>
			<tr class="table-secondary">
				<th scope="col">상품이미지</th>
				<th scope="col">상품이름</th>
				<th scope="col">상품금액</th>
				<th scope="col">수량</th>
			</tr>
		</thead>
		<tbody>
		<%--<c:forEach var="vo" items="${ list }"> --%>
			<input type="hidden" name="pNum" value="${vo.pNum }">
			<%--<input type="hidden" name="cnt" value="${vo.cnt }"> --%>
			<input type="hidden" name="pName" value="${vo.pName }">			
			<input type="hidden" name="pPrice" value="${vo.pPrice }">
			<tr>
				<td scope="row"><img src="${cp }/imagesPro/${img}"style="width: 120px; height: 120px;"></td>
				<td scope="row">${ vo.pName }</td>
				<td scope="row">${ vo.pPrice }</td>
				<c:forEach var="list" items="${list }">
				<td scope="row">ㅎㅎ${ list.pdNum}</td>
				</c:forEach>
			</tr>

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
				<th>주문자 명</th>
				<td><input type="text" id="name" value="${del.mname }"> </td>
			</tr>
			<tr>
				<th>주문자 번호</th>
				<td><input type="text" id="phone" value="${del.mphone }"></td>
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
					<input type="text" name="whereto" id="whereto" style="width: 400px; text-align: left;" value="${del.maddr}"> <br>
				</td>
			</tr>
			<tr>
				<th>배송메세지</th>
				<td>
					<select>
						<option>요청사항을 직접 입력합니다</option>
						<option>부재시 문 앞에 놔주세요</option>
						<option>부재시 경비실에 놔주세요</option>
						<option>배송 전 연락 바랍니다</option>
					</select>
				</td>
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
	
	<div id="purch" style="margin-bottom:200px;">
		<input type="submit" value="구매하기">
	</div>
	</form>
</body>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>

$(document).ready(function(){
	$("input[name=radioGbn]").change(function() {

		var radioValue = $(this).val();
		var maddr = "${del.maddr}";
		if(radioValue =="0"){
			$("#whereto").val(maddr);
		}else{
			$("#whereto").val("");
		}
	});
});
	function insertOrder() {
		//ajax 호출
	}
</script>
</html>