<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <style>
 #box4 img{
 	width:30px; height: 30px;
 }
 #box4 days li{
 	list-style:none; display: inline-block;
 }
 #box4 table{
 	text-align: center;
 }
 </style>
<div id= "box4">
<c:set var="cp" value="${pageContext.request.contextPath}"></c:set>
	<h3>전체주문내역</h3>
	<div id="days">
		<form action="<%=request.getContextPath()%>/myshop/dayList">
			<input type="submit" value="전체조회" name="ALL">
			<input type="submit" value="오늘" name="today">
			<input type="submit" value="3개월" name="m3">
			<input type="submit" value="6개월" name="m6">
		</form>
	</div>
	
	
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
		<c:choose>
		<c:when test="${requestScope.listT!=null}">
			<c:forEach var="voT" items="${requestScope.listT }">
		 	<tr>
			 	<th scope="col">${voT.onum }</th>
			  	<th scope="col"><img src="../images/1.jpg"></th>
			  	<th scope="col">${voT.pdnum }</th>
			  	<th scope="col">${voT.dcount }</th>
			  	<th scope="col">${voT.totalsales }</th>
			  	<th scope="col">
			  	<c:choose>
				  	<c:when test="${voT.dstate==1}">
				  		결제완료<br>
				  		<a href="${cp}/myshop/cancel?odnum=${voT.odnum}" onclick="return confirm('정말 결제취소하시겠습니까?');">결제취소</a>
				  	</c:when>
				  	<c:when test="${voT.dstate==2}">
				  		배송중
				  	</c:when>
				    <c:when test="${voT.dstate==3}">
				  		배송완료<br>
				  	<a href="${cp}/myshop/refund?odnum=${voT.odnum}" onclick="return confirm('정말 환불신청하시겠습니까?');">환불신청</a>
				  	
				  	</c:when>
				  	 <c:when test="${voT.dstate==4}">
				  		
				  		환불완료
				  	
				  	</c:when>
				  	 <c:when test="${voT.dstate==5}">
				  		취소완료
				  	</c:when>
				  	<c:when test="${voT.dstate==6 }">
				  		환불신청중
				  	</c:when>
			  	</c:choose>
			  	</th>
			  </tr>
		 	 </c:forEach>
		</c:when>
		<c:when test="${requestScope.list3!=null}">
			<c:forEach var="vo3" items="${requestScope.list3 }">
		 	<tr>
			 	<th scope="col">${vo3.onum }</th>
			  	<th scope="col"><img src="../images/1.jpg"></th>
			  	<th scope="col">${vo3.pdnum }</th>
			  	<th scope="col">${vo3.dcount }</th>
			  	<th scope="col">${vo3.totalsales }</th>
			  	<th scope="col">
			  	<c:choose>
				  	 <c:when test="${vo3.dstate==1}">
				  		결제완료<br>
				  		<a href="${cp}/myshop/cancel?odnum=${vo3.odnum}" onclick="return confirm('정말 결제취소하시겠습니까?');">결제취소</a>
				  	</c:when>
				  	<c:when test="${vo3.dstate==2}">
				  		배송중
				  	</c:when>
				    <c:when test="${vo3.dstate==3}">
				  		배송완료<br>
				  	<a href="${cp}/myshop/refund?odnum=${vo3.odnum}" onclick="return confirm('정말 환불신청하시겠습니까?');">환불신청</a>
				  	
				  	</c:when>
				  	 <c:when test="${vo3.dstate==4}">
				  		
				  		환불완료
				  	
				  	</c:when>
				  	 <c:when test="${vo3.dstate==5}">
				  		취소완료
				  	</c:when>
				  	<c:when test="${vo3.dstate==6 }">
				  		환불신청중
				  	</c:when>
			  	</c:choose>
			  	</th>
			  </tr>
		 	 </c:forEach>
		</c:when>
		<c:when test="${requestScope.list6!=null}">
			<c:forEach var="vo6" items="${requestScope.list6 }">
		 	<tr>
			 	<th scope="col">${vo6.onum }</th>
			  	<th scope="col"><img src="../images/1.jpg"></th>
			  	<th scope="col">${vo6.pdnum }</th>
			  	<th scope="col">${vo6.dcount }</th>
			  	<th scope="col">${vo6.totalsales }</th>
			  	<th scope="col">
			  	<c:choose>
				  	 <c:when test="${vo6.dstate==1}">
				  		결제완료<br>
				  	<a href="${cp}/myshop/cancel?odnum=${vo6.odnum}" onclick="return confirm('정말 결제취소하시겠습니까?');">결제취소</a>
				  	</c:when>
				  	<c:when test="${vo6.dstate==2}">
				  		배송중
				  	</c:when>
				    <c:when test="${vo6.dstate==3}">
				  		배송완료<br>
				  	<a href="${cp}/myshop/refund?odnum=${vo6.odnum}" onclick="return confirm('정말 환불신청하시겠습니까?');">환불신청</a>
				  	
				  	</c:when>
				  	 <c:when test="${vo6.dstate==4}">
				  		
				  		환불완료
				  	
				  	</c:when>
				  	 <c:when test="${vo6.dstate==5}">
				  		취소완료
				  	</c:when>
				  	<c:when test="${vo6.dstate==6 }">
				  		환불신청중
				  	</c:when>
				  
			  	</c:choose>
			  	</th>
			  </tr>
		 	 </c:forEach>
		</c:when>
		<c:otherwise>
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
				  		결제완료<br>
				  	<a href="${cp}/myshop/cancel?odnum=${vo.odnum}" onclick="return confirm('정말 결제취소하시겠습니까?');">결제취소</a>
				  	</c:when>
				  	<c:when test="${vo.dstate==2}">
				  		배송중
				  	</c:when>
				    <c:when test="${vo.dstate==3}">
				  		배송완료<br>
				  	<a href="${cp}/myshop/refund?odnum=${vo.odnum}" onclick="return confirm('정말 환불신청하시겠습니까?');">환불신청</a>
				  	
				  	</c:when>
				  	 <c:when test="${vo.dstate==4}">
				  		
				  		환불완료
				  	
				  	</c:when>
				  	 <c:when test="${vo.dstate==5}">
				  		취소완료
				  	</c:when>
				  	<c:when test="${vo.dstate==6 }">
				  		환불신청중
				  	</c:when>
			  	</c:choose>
			  	</th>
			  	
		 	</tr>
		 
		 </c:forEach>
		 </c:otherwise>
		 </c:choose>
		</thead>
	</table>
	
	</div>

