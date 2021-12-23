<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<c:set var="cp" value="${pageContext.request.contextPath}"></c:set>
<c:set var="total" value="0"/>
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
<div class="wrap">
<c:choose>
<c:when test="${requestScope.list!=null}">
<a href="${cp}/admin/salesDay">기간별조회</a>
<table id="hor-minimalist-a">
<thead>
  <tr>
    <th scope="col">날짜</th>
    <th scope="col">ID</th>
    <th scope="col">품목</th>
    <th scope="col">수량</th>
    <th scope="col">매출금액</th>
   
  </tr>
 
  </thead>
  <tbody>
  	 <c:forEach var="vo" items="${requestScope.list}">
		  <tr>
		    <td>${vo.odate}</td>
		    <td>${vo.mid}</td>
		    <td>${vo.pname}</td>
		    <td>${vo.dcount}</td>
		    <td>${vo.totalsales}원</td>
		    
		  	<c:set var="total"  value="${total+vo.totalsales}"/>
		  	
		  </tr>
		  </c:forEach>
		  <tr>
		  	<td>페이지합계</td>
		  	<td colspan="4">${total}원</td>
		  
		  </tr>
		  	
  
 
  </tbody>
</table>
<div>
	<c:forEach var="i" begin="${startPage }" end="${endPage}">
				<c:choose>
				 <c:when test="${i==pageNum }">
				 		<a href="${cp}/admin/sales?pageNum=${i}">
				 		<span style="color:red">${i}</span></a>
				</c:when>
				 <c:otherwise>
				 		<a href="${cp}/admin/sales?pageNum=${i}">
				 		<span style="color:red">${i}</span></a>
				 </c:otherwise>
				</c:choose>
				
	</c:forEach>
</div>
</c:when>
<c:otherwise>

<a href="${cp}/admin/sales" style="text-align: center;">전체매출조회</a>
	<div id="day">
	<h3>일별 매출조회</h3>
	<table id="hor-minimalist-a">
	<thead>
	<tr>
		<th>일자</th>
		<th>총매출</th>
	</tr>
	</thead>
	<tbody>
	<c:forEach var="vo2" items="${requestScope.list2}">
		<tr>
			<td>${vo2.sdate}</td>
			<td>${vo2.sales}원</td>
		</tr>
	</c:forEach>
	</tbody>
	</table>
	</div>
	<div id="mon">
	<h3>월별 매출조회</h3>
	<table id="hor-minimalist-a">
	<thead>
	<tr>
		<th>일자</th>
		<th>총매출</th>
	</tr>
	</thead>
	<tbody>
	<c:forEach var="vo3" items="${requestScope.list3}">
		<tr>
			<td>${vo3.sdate}</td>
			<td>${vo3.sales}원</td>
		</tr>
	</c:forEach>
	</tbody>
	</table>
	</div>

</c:otherwise>
</c:choose>
</div>