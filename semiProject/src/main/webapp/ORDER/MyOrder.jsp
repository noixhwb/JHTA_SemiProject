<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	</style>
</head>
<body>
	<h1>주문 / 결제</h1>
	
	<h2 class="box1">주문하실 상품</h2>
	<table id="table1">
		<tr>
			<th colspan="5" id="tak">택배배송(@@총상품갯수넣는곳@@)</th>
		</tr>
		<tr>
			<th style="bgcolor: #dddddd;">상품명/선택사항</th>
			<th>상품금액</th>
			<th>수량</th>
			<th>주문금액</th>
			<th>배송정보</th>
		</tr>
		<tr>
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
		</tr>
	</table>
	<br width="500px" align="center">
	<h2>배송 정보</h2>
	<table id="table2">
		<tr>
			<th>주문하시는 분</th>
			<td>이름 <br> 번호 </td>
		</tr>
		<tr>
			<th>배송지 선택</th>
			<td>
				<input type="radio" name="radio" value="mydeliv">기본 배송지
				<input type="radio" name="radio" value="newdeliv">새로운 배송지
			</td>
		</tr>
		<tr>
			<th>배송지 정보</th>
			<td>
				<textarea rows="1" cols="50" id="deliv"></textarea>
			</td>
		</tr>
		<tr>
			<th>받으시는 분</th>
			<td>이름 <br> 번호 </td>
		</tr>
		<tr>
			<th>배송메세지</th>
			<td>@@....@@</td>
		</tr>
		<tr>
			<th>총 배송비</th>
			<td>0원</td>
		</tr>
	</table>
	
	<h2>결제 수단</h2>
		<input type="radio" name="paying" id="pay1">신용카드
		<input type="radio" name="paying" id="pay2">무통장입금
	
	<br width="500px" align="center" size="10px">
	<h2>최종 결제 정보</h2>
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
	<input type="submit" value="구매하기" id="purchase">
</body>
</html>