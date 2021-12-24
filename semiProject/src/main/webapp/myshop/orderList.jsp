<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
 <link rel="stylesheet" href="/resources/demos/style.css">
 <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
 <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<style>
	 a:link { color: red; text-decoration: none;}
 		a:visited { color: black; text-decoration: none;}
 	a:hover { color: blue; text-decoration: underline;}
	
	h3{
		text-align: center;
	}
	
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
<div id= "wrap">
<c:set var="cp" value="${pageContext.request.contextPath}"></c:set>
	<h3>전체주문내역</h3>
	<div id="days" style="text-align: center;">
		<form action="<%=request.getContextPath()%>/myshop/dayList" method="post">
			<script>
			  $.datepicker.setDefaults({
			    dateFormat: 'yy-mm-dd',
			    prevText: '이전 달',
			    nextText: '다음 달',
			    monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
			    monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
			    dayNames: ['일', '월', '화', '수', '목', '금', '토'],
			    dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
			    dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
			    showMonthAfterYear: true,
			    yearSuffix: '년'
			  });
			
			  $(function() {
			    $("#datepicker1, #datepicker2").datepicker();
			  });
			
		</script>
			조회기간:
			  <input type="text" id="datepicker1" name="date1"> ~
			  <input type="text" id="datepicker2" name="date2">
			
			<input type="submit" value="조회" name="day">
		</form>
	</div>
	
	
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
			  	<td>${vo.dprice }</td>
			  	<td>${vo.odate }</td>
			  	<td>
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
				  	<a href="${cp}/myshop/refund?odnum=${vo.odnum}" onclick="return confirm('정말 환불신청하시겠습니까?');">환불신청</a><br>
				  	<a href="${cp}/myshop/decide?odnum=${vo.odnum}" onclick="return confirm('정말 구매확정하시겠습니까? 환불이 불가합니다.');">구매확정</a>
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
				  	<c:when test="${vo.dstate==7 }">
				  		구매확정<br>
				  		<a href="${cp }/reviewWrite?odNum=${vo.odnum}" onclick="return confirm('리뷰하러 가시겠습니까?');">리뷰하러가기</a>
				  	</c:when>
				  	<c:when test="${vo.dstate==8 }">
				  		구매확정<br>
				  		리뷰작성완료
				  	</c:when>
			  	</c:choose>
			  	</td>
			  </tr>
		 	 </c:forEach>
			
		</c:when>
		
		<c:otherwise>
			
			
			<c:forEach var="vo2" items="${requestScope.list2 }">
		 	<tr>
			 	<td>${vo2.odnum }</td>
			  	<td>${vo2.pname }</td>
			  	<td>${vo2.delocation }</td>
			  	<td>${vo2.dcount }</td>
			  	<td>${vo2.prosize }</td>
			  	<td>${vo2.dprice }</td>
			  	<td>${vo2.odate }</td>
			  	<td>
			  	<c:choose>
				  	<c:when test="${vo2.dstate==1}">
				  		결제완료<br>
				  		<a href="${cp}/myshop/cancel?odnum=${vo2.odnum}" onclick="return confirm('정말 결제취소하시겠습니까?');">결제취소</a>
				  	</c:when>
				  	<c:when test="${vo2.dstate==2}">
				  		배송중
				  	</c:when>
				    <c:when test="${vo2.dstate==3}">
				  		배송완료<br>
				  	<a href="${cp}/myshop/refund?odnum=${vo2.odnum}" onclick="return confirm('정말 환불신청하시겠습니까?');">환불신청</a><br>
				  	<a href="${cp}/myshop/decide?odnum=${vo2.odnum}" onclick="return confirm('정말 구매확정하시겠습니까? 환불이 불가합니다.');">구매확정</a>
				  	</c:when>
				  	 <c:when test="${vo2.dstate==4}">
				  		
				  		환불완료
				  	
				  	</c:when>
				  	 <c:when test="${vo2.dstate==5}">
				  		취소완료
				  	</c:when>
				  	<c:when test="${vo2.dstate==6 }">
				  		환불신청중
				  	</c:when>
				  	<c:when test="${vo2.dstate==7 }">
				  		구매확정
				  		<a href="${cp }/reviewWrite?odNum=${vo2.odnum}" onclick="return confirm('리뷰하러 가시겠습니까?');">리뷰하러가기</a>
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
				 			<a href="${cp}/myshop/orderList?pageNum=${i}">
				 			<span style="color:red">${i}</span></a>
				 		</c:when>
				 		<c:otherwise>
				 			<a href="${cp}/myshop/orderList?pageNum=${i}">
				 			<span style="color:red">${i}</span></a>
				 		</c:otherwise>
				 	</c:choose>
				
				</c:forEach>
			</div>
		</c:otherwise>
	</c:choose>	
	</div>

