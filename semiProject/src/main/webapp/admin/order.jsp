<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:set var="cp" value="${pageContext.request.contextPath}"></c:set>
</head>
<body>
<table border="1">
	<tr>
		<th>주문번호</th>
		<th>배송지</th>
		<th>수량</th>
		<th>상품구매금액</th>
		<th>주문일자</th>
		<th>주문처리상태</th>
	</tr>
	<c:forEach var="vo" items="${requestScope.list }">
		 	<tr>
			 	<th>${vo.odnum }</th>
			  	
			  	<th>${vo.delocation }</th>
			  	<th>${vo.dcount }</th>
			  	<th>${vo.totalsales }</th>
			  	<th>${vo.odate }</th>
			  	<th>
			  	<c:choose>
				  	<c:when test="${vo.dstate==1}">
				  		결제완료<br>
				  		
				  	</c:when>
				  	<c:when test="${vo.dstate==2}">
				  		배송중
				  	</c:when>
				    <c:when test="${vo.dstate==3}">
				  		배송완료<br>
				  
				  	
				  	</c:when>
				  	 <c:when test="${vo.dstate==4}">
				  		
				  		환불완료
				  	
				  	</c:when>
				  	 <c:when test="${vo.dstate==5}">
				  		취소완료
				  	</c:when>
				  	<c:when test="${vo.dstate==6 }">
				  		환불신청중<br>
				  		<a href="${cp}/admin/refund?odnum=${vo.odnum}" onclick="return confirm('정말 환불을 접수하시겠습니까?');">환불신청</a><br>
				  	</c:when>
				  	<c:when test="${vo.dstate==7 }">
				  		구매확정
				  	</c:when>
			  	</c:choose>
			  	</th>
			  </tr>
		 	 </c:forEach>	
</table>
		<div><!-- 페이징 -->
				<c:forEach var="i" begin="${startPage }" end="${endPage}">
				 	<c:choose>
				 		<c:when test="${i==pageNum }">
				 			<a href="${cp}/admin/order?pageNum=${i}">
				 			<span style="color:red">${i}</span></a>
				 		</c:when>
				 		<c:otherwise>
				 			<a href="${cp}/admin/order?pageNum=${i}">
				 			<span style="color:red">${i}</span></a>
				 		</c:otherwise>
				 	</c:choose>
				
				</c:forEach>
			</div>
</body>
</html>