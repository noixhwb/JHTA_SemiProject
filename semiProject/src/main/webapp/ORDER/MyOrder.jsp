<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>MyOrder.jsp</title>
	<style>
		* { margin: auto; text-align: center; }
		h1 {
		    font-size: 30px;
		 	text-align: center;
		    border-bottom: 2px solid gray;
		    padding: 20px;
		}
				
		h2 {
			font-size: 25px;
			text-align: center;
			padding: 20px;
			background-color: 8b8378;
		}
		#table1, #table2, #table3 {
			border-top: 2px solid #444444;
			border-bottom: 2px solid #444444;
		    border-collapse: collapse;
		    margin-top: 10px;
		    margin-bottom: 10px;
		}
		/*#table1 tr:hover {background-color: #ddd;}*/
		tr, td, th {
		    border-bottom: 1px solid #444444;
		    padding: 10px;
		}
		#table1 th {
		  	background-color: ababab;
		}
		#tak {
			background-color: #4f4f4f;
		 	color: white;
		 }
		#table2 td { text-align: left;}
		fieldset { width: 80%; }
		#purcharse { margin-top: 10px; display: block; }
	</style>
</head>
<body>
	<h1>주문 / 결제</h1>
	<fieldset>
		<legend><h2>주문하실 상품</h2></legend>
		<table id="table1">
			<tr>
				<th colspan="5" id="tak">택배배송</th>
			</tr>
			<tr>
				<th style="bgcolor: #dddddd;">상품명/선택사항</th>
				<th>상품금액</th>
				<th>수량</th>
				<th>주문금액</th>
				<th>배송정보</th>
			</tr>
			<c:choose>
				<c:when test="${fn:length(list) != 0}">
					<c:forEach var="vo" items="${list }">
					<tr>
						<td>
							사진 <br>
							${vo.pName } <br>
							사이즈
						</td>
						<td>
							${vo.pPrice }원
						</td>
						<td>
							0
						</td>
						<td>
							000원
						</td>
						<td>
							무료배송 / 배송비 3000원
						</td>
					</tr>
					</c:forEach>
				</c:when>
			</c:choose>
			<!-- <tr>
				<td>
					사진 <br>
					상품명 <br>
					사이즈
				</td>
				<td>
					000원
				</td>
				<td>
					0
				</td>
				<td>
					000원
				</td>
				<td>
					무료배송 / 배송비 3000원
				</td>
			</tr> -->
		</table>
	</fieldset>
	
	<fieldset>
		<legend><h2>배송 정보</h2></legend>
		<table id="table2">
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
					<input type="text" name="whereto" id="whereto" style="width: 400px; text-align: left;" value="${del.maddr }"> <br>
				</td>
			</tr>
			<tr>
				<th>배송메세지</th>
				<td><textarea cols="55" rows="10"></textarea></td>
			</tr>
			<tr>
				<th>총 배송비</th>
				<td>0원</td>
			</tr>
		</table>
	</fieldset>
	
	<fieldset>
		<legend><h2>결제 수단</h2></legend>
			<input type="radio" name="paying" value="신카" checked="checked">신용카드
			<input type="radio" name="paying" value="무통장">무통장입금
	</fieldset>
	<fieldset style="width: 50%; border: solid 3px firebrick;">
		<legend><h2 style="color: firebrick;">최종 결제 정보</h2></legend>
		<table id="table3">
			<tr>
				<th>상품금액</th>
				<td>000원</td>
			</tr>
			<tr>
				<th>배송비</th>
				<td>000원</td>
			</tr>
			<tr>
				<th>총결제금액</th>
				<td>00원</td>
			</tr>
		</table>
	</fieldset>
	<input type="submit" value="구매하기" id="purchase">
</body>
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