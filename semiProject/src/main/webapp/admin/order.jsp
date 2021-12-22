<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="cp" value="${pageContext.request.contextPath}"></c:set>
<div id=AdminOrder>
<a href="${cp}/admin/refundList">환불요청내역조회</a>
<table border="1">
	<tr>
		<th>주문번호</th>
		<th>제품명</th>
		<th>배송지</th>
		<th>수량</th>
		<th>제품사이즈</th>
		<th>상품구매금액</th>
		<th>주문일자</th>
		<th>주문처리상태</th>
	</tr>
	<c:choose>
	<c:when test="${requestScope.list!=null}">
	<c:forEach var="vo" items="${requestScope.list }">
		 	<tr>
			 	<th>${vo.odnum }</th>
			  	<th>${vo.pname }</th>
			  	<th>${vo.delocation }</th>
			  	<th>${vo.dcount }</th>
			  	<th>${vo.prosize }</th>
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
				  	<c:when test="${vo.dstate==8 }">
				  		리뷰작성완료
				  	</c:when>
			  	</c:choose>
			  	</th>
			  </tr>
		 	 </c:forEach>
		 	 </c:when>
		 	 <c:otherwise>
		 	 	<c:forEach var="vo2" items="${requestScope.list2}">
		 	<tr>
			 	<th>${vo2.odnum }</th>
			  	<th>${vo2.pname }</th>
			  	<th>${vo2.delocation }</th>
			  	<th>${vo2.dcount }</th>
			  	<th>${vo2.prosize }</th>
			  	<th>${vo2.totalsales }</th>
			  	<th>${vo2.odate }</th>
			  	<th>
			  	<c:choose>
				  	
				  	
				  	<c:when test="${vo2.dstate==6 }">
				  		환불신청중<br>
				  		<a href="${cp}/admin/refund?odnum=${vo2.odnum}" onclick="return confirm('정말 환불을 접수하시겠습니까?');">환불신청</a><br>
				  	</c:when>
				  	
			  	</c:choose>
			  	</th>
			  </tr>
		 	 </c:forEach>
		 	 
		 	 </c:otherwise>	
		</c:choose>
	</table>
		<c:choose>
			<c:when test="${list2!=null}">
			<div><!-- 페이징 -->
				
			</div>
		</c:when>
		<c:otherwise>
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
		</c:otherwise>
	</c:choose>	
</div>