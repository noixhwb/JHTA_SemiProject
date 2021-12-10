<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <style>
 #box4 img{
 	width:30px; height: 30px;
 }
 
 </style>
<div id= "box4">
	<h3>최근주문내역</h3>
	<table border="1" width="1000">
		
		<colgroup>
		<col style="width:135px;">
		<col style="width:93px;">
		<col style="width:auto;">
		<col style="width:61px;">
		<col style="width:111px;">
		<col style="width:111px;">
		
		</colgroup>
		<thead>
		 <tr>
		  	<th scope="col">주문번호</th>
		  	<th scope="col">이미지</th>
		  	<th scope="col">상품정보</th>
		  	<th scope="col">수량</th>
		  	<th scope="col">상품구매금액</th>
		  	<th scope="col">주문처리상태</th>
		  	
		 </tr>
		<c:forEach var="vo" items="${requestScope.list }">
		 	<tr>
			 	<th scope="col">${vo.onum }</th>
			  	<th scope="col"><img src="../images/1.jpg"></th>
			  	<th scope="col">${vo.pdnum }</th>
			  	<th scope="col">${vo.dcount }</th>
			  	<th scope="col">${vo.totalsales }</th>
			  	<th scope="col">
			  	<c:choose>
				  	<c:when test="${vo.dstate==1}">
				  		결제완료
				  	</c:when>
				  	<c:when test="${vo.dstate==2}">
				  		배송중
				  	</c:when>
				    <c:otherwise>
				  		배송완료
				  	</c:otherwise>
			  	</c:choose>
			  	</th>
			  	
		 	</tr>
		 
		 </c:forEach>
		</thead>
	</table>
</div>
