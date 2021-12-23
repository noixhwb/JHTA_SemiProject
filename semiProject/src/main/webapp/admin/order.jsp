<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
	 a:link { color: red; text-decoration: none;}
 		a:visited { color: black; text-decoration: none;}
 	a:hover { color: blue; text-decoration: underline;}
		
	
	#wrap{
			text-align: center;
		}
		
	.paging{
		text-align: center;
	}
	
	#hor-minimalist-a
	{
		margin:auto;
		font-family: "Lucida Sans Unicode", "Lucida Grande", Sans-Serif;
		font-size: 12px;
		background: #fff;
		
		width: 1000px;
		
		border-collapse: collapse;
		text-align: center;
	}
	#hor-minimalist-a th
	{
		border-collapse: collapse;
		font-size: 14px;
		font-weight: normal;
		color: #039;
		padding: 10px 8px;
		border-bottom: 2px solid #6678b1;
	}
	#hor-minimalist-a td
	{
		color: #669;
		padding: 9px 8px 0px 8px;
		border-collapse: collapse;
	}
	#hor-minimalist-a tbody tr:hover td
	{
		color: #009;
	}
</style>
<c:set var="cp" value="${pageContext.request.contextPath}"></c:set>
<div class="wrap">
<a href="${cp}/admin/refundList">환불요청내역조회</a>
<table id="hor-minimalist-a">
<thead>
	<tr>
		<th scope="col">주문번호</th>
		<th scope="col">제품명</th>
		<th scope="col">배송지</th>
		<th scope="col">수량</th>
		<th scope="col">제품사이즈</th>
		<th scope="col">상품구매금액</th>
		<th scope="col">주문일자</th>
		<th scope="col">주문처리상태</th>
	</tr>
	</thead>
	<tbody>
	<c:choose>
	<c:when test="${requestScope.list!=null}">
	<c:forEach var="vo" items="${requestScope.list }">
		 	<tr>
			 	<td>${vo.odnum }</td>
			  	<td>${vo.pname }</td>
			  	<td>${vo.delocation }</td>
			  	<td>${vo.dcount }</td>
			  	<td>${vo.prosize }</td>
			  	<td>${vo.totalsales }</td>
			  	<td>${vo.odate }</td>
			  	<td>
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
			  	</td>
			  </tr>
		 	 </c:forEach>
		 	 </c:when>
		 	 <c:otherwise>
		 	 	<c:forEach var="vo2" items="${requestScope.list2}">
		 	<tr>
			 	<td>${vo2.odnum }</td>
			  	<td>${vo2.pname }</td>
			  	<td>${vo2.delocation }</td>
			  	<td>${vo2.dcount }</td>
			  	<td>${vo2.prosize }</td>
			  	<td>${vo2.totalsales }</td>
			  	<td>${vo2.odate }</td>
			  	<td>
			  	<c:choose>
				  	
				  	
				  	<c:when test="${vo2.dstate==6 }">
				  		환불신청중<br>
				  		<a href="${cp}/admin/refund?odnum=${vo2.odnum}" onclick="return confirm('정말 환불을 접수하시겠습니까?');">환불신청</a><br>
				  	</c:when>
				  	
			  	</c:choose>
			  	</td>
			  </tr>
		 	 </c:forEach>
		 	 
		 	 </c:otherwise>	
		</c:choose>
		</tbody>
	</table>
		<c:choose>
			<c:when test="${list2!=null}">
			<div><!-- 페이징 -->
				
			</div>
		</c:when>
		<c:otherwise>
			<div class="paging"><!-- 페이징 -->
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